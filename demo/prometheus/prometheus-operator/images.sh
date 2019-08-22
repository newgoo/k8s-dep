#!/usr/bin/env bash

alermanager=
alermanager_version=v0.18.0

configmap_reload=
configmap_reload_version=


docker pull $alermanager
docker tag  $alermanager quay.io/prometheus/alertmanager:$alermanager_version
docker rmi $alermanager


docker pull $configmap_reload
docker tag  $configmap_reload_version quay.io/coreos/configmap-reload:$configmap_reload_version
docker rmi $configmap_reload

docker pull grafana/grafana:6.2.2

grafana/grafana:6.2.2
docker.io/grafana/grafana:6.2.2
docker.io/carlosedp/prometheus-operator:v0.31.1

docker pull quay.io/prometheus/alertmanager:v0.18.0
docker pull quay.io/coreos/configmap-reload:v0.0.1
docker pull quay.io/coreos/kube-rbac-proxy:v0.4.1
docker pull quay.io/coreos/kube-state-metrics:v1.7.2
docker pull k8s.gcr.io/addon-resizer:1.8.4
docker pull quay.io/prometheus/node-exporter:v0.18.1
docker pull quay.io/coreos/k8s-prometheus-adapter-amd64:v0.4.1
docker pull quay.io/prometheus/prometheus:v2.11.0
docker pull quay.io/coreos/prometheus-config-reloader:v0.31.1
docker pull quay.io/coreos/prometheus-operator:v0.31.1

docker tag quay.io/prometheus/alertmanager:v0.18.0 registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_prometheus_alertmanager:v0.18.0
docker push  registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_prometheus_alertmanager:v0.18.0

docker tag quay.io/coreos/configmap-reload:v0.0.1 registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_coreos_configmap-reload:v0.0.1
docker push registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_coreos_configmap-reload:v0.0.1

src_image=quay.io/coreos/kube-state-metrics:v1.7.2
t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_coreos_kube-state-metrics:v1.7.2

src_image=quay.io/coreos/kube-rbac-proxy:v0.4.1
t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_coreos_kube-rbac-proxy:v0.4.1

#src_image=k8s.gcr.io/addon-resizer:1.8.4
#t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/k8s.gcr.io_addon-resizer:1.8.4
#
#src_image=quay.io/prometheus/node-exporter:v0.18.1
#t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_prometheus_node-exporter:v0.18.1
#
#src_image=quay.io/coreos/k8s-prometheus-adapter-amd64:v0.4.1
#t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_coreos_k8s-prometheus-adapter-amd64:v0.4.1
#
#src_image=quay.io/prometheus/prometheus:v2.11.0
#t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_prometheus_prometheus:v2.11.0
#
#src_image=quay.io/coreos/prometheus-operator:v0.31.1
#t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_coreos_prometheus-operator:v0.31.1
#
#src_image=quay.io/coreos/prometheus-config-reloader:v0.31.1
#t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_coreos_prometheus-config-reloader:v0.31.1


docker tag $src_image $t_image
docker push $t_image
docker rmi $src_image $t_image

quay.io/coreos/configmap-reload:v0.0.1
quay.io/coreos/kube-rbac-proxy:v0.4.1
quay.io/coreos/kube-state-metrics:v1.7.2
k8s.gcr.io/addon-resizer:1.8.4
quay.io/coreos/kube-state-metrics:v1.7.2
quay.io/prometheus/node-exporter:v0.18.1
quay.io/coreos/k8s-prometheus-adapter-amd64:v0.4.1
quay.io/prometheus/prometheus:v2.11.0
quay.io/coreos/prometheus-config-reloader:v0.31.1
quay.io/coreos/prometheus-operator:v0.31.1