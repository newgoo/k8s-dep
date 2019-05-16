#!/usr/bin/env bash

# kube-apiserver 启动命令
/k8s/kubernetes/bin/kube-apiserver \
--logtostderr=true \
--v=4 \
--etcd-servers=https://10.211.55.101:2379,https://10.211.55.102:2379,https://10.211.55.103:2379 \
--bind-address=10.211.55.101 \
--secure-port=6443 \
--advertise-address=10.211.55.101 \
--allow-privileged=true \
--service-cluster-ip-range=10.254.0.0/16 \
--enable-admission-plugins=NamespaceLifecycle,LimitRanger,ServiceAccount,ResourceQuota,NodeRestriction \
--authorization-mode=RBAC,Node \
--enable-bootstrap-token-auth \
--token-auth-file=/k8s/kubernetes/cfg/token.csv \
--service-node-port-range=30000-50000 \
--tls-cert-file=/k8s/kubernetes/ssl/server.pem \
--tls-private-key-file=/k8s/kubernetes/ssl/server-key.pem \
--client-ca-file=/k8s/kubernetes/ssl/ca.pem \
--service-account-key-file=/k8s/kubernetes/ssl/ca-key.pem \
--etcd-cafile=/k8s/etcd/ssl/ca.pem --etcd-certfile=/k8s/etcd/ssl/server.pem \
--etcd-keyfile=/k8s/etcd/ssl/server-key.pem


# kube-api-scheduler 启动命令
/k8s/kubernetes/bin/kube-scheduler \
--logtostderr=true \
--v=4 \
--master=127.0.0.1:8080 \
--leader-elect

# kube-controller-manager 启动命令
/k8s/kubernetes/bin/kube-controller-manager \
--logtostderr=true \
--v=4 \
--master=127.0.0.1:8080 \
--leader-elect=true \
--address=127.0.0.1 \
--service-cluster-ip-range=10.254.0.0/16 \
--cluster-name=kubernetes \
--cluster-signing-cert-file=/k8s/kubernetes/ssl/ca.pem \
--cluster-signing-key-file=/k8s/kubernetes/ssl/ca-key.pem \
--root-ca-file=/k8s/kubernetes/ssl/ca.pem \
--service-account-private-key-file=/k8s/kubernetes/ssl/ca-key.pem