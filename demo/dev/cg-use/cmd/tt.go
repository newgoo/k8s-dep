package main

import (
	"encoding/json"
	"flag"
	"os"
	"path/filepath"

	"github.com/astaxie/beego"
	matev1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/tools/clientcmd"
)

func main() {
	var kubeconfig *string
	if home := homeDir(); home != "" {
		kubeconfig = flag.String("kubeconfig", filepath.Join(home, ".kube", "config"), "(optional) absolute path to the kubeconfig file")
	} else {
		kubeconfig = flag.String("kubeconfig", "", "absolute path to the kubeconfig file")
	}
	beego.Info(*kubeconfig)

	flag.Parse()

	config, err := clientcmd.BuildConfigFromFlags("", *kubeconfig)
	if err != nil {
		panic(err)
	}

	clientset, err := kubernetes.NewForConfig(config)
	if err != nil {
		panic(err)
	}

	d := clientset.AppsV1().Deployments("kube-system")
	w, err := d.Watch(matev1.ListOptions{})
	if err != nil {
		panic(err)
	}
	beego.Info(<-w.ResultChan())
	dd, err := d.Get("coredns", matev1.GetOptions{})
	if err != nil {
		panic(err)
	}

	jd, _ := json.Marshal(dd)

	beego.Info(string(jd))
}

func homeDir() string {
	if h := os.Getenv("HOME"); h != "" {
		return h
	}
	return os.Getenv("USERPROFILE") // windows
}
