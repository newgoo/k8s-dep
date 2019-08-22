#!/usr/bin/env bash

src_image=quay.io/prometheus/alertmanager:v0.18.0
t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_prometheus_alertmanager:v0.18.0
docker pull $t_image
docker tag $t_image $src_image
docker rmi $t_image

src_image=quay.io/coreos/configmap-reload:v0.0.1
t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_coreos_configmap-reload:v0.0.1
docker pull $t_image
docker tag $t_image $src_image
docker rmi $t_image

src_image=quay.io/coreos/kube-state-metrics:v1.7.2
t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_coreos_kube-state-metrics:v1.7.2
docker pull $t_image
docker tag $t_image $src_image
docker rmi $t_image

src_image=quay.io/coreos/kube-rbac-proxy:v0.4.1
t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_coreos_kube-rbac-proxy:v0.4.1
docker pull $t_image
docker tag $t_image $src_image
docker rmi $t_image

src_image=k8s.gcr.io/addon-resizer:1.8.4
t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/k8s.gcr.io_addon-resizer:1.8.4
docker pull $t_image
docker tag $t_image $src_image
docker rmi $t_image

src_image=quay.io/prometheus/node-exporter:v0.18.1
t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_prometheus_node-exporter:v0.18.1
docker pull $t_image
docker tag $t_image $src_image
docker rmi $t_image

src_image=quay.io/coreos/k8s-prometheus-adapter-amd64:v0.4.1
t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_coreos_k8s-prometheus-adapter-amd64:v0.4.1
docker pull $t_image
docker tag $t_image $src_image
docker rmi $t_image

src_image=quay.io/prometheus/prometheus:v2.11.0
t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_prometheus_prometheus:v2.11.0
docker pull $t_image
docker tag $t_image $src_image
docker rmi $t_image

src_image=quay.io/coreos/prometheus-operator:v0.31.1
t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_coreos_prometheus-operator:v0.31.1
docker pull $t_image
docker tag $t_image $src_image
docker rmi $t_image

src_image=quay.io/coreos/prometheus-config-reloader:v0.31.1
t_image=registry.cn-shenzhen.aliyuncs.com/newgoo/quay.io_coreos_prometheus-config-reloader:v0.31.1
docker pull $t_image
docker tag $t_image $src_image
docker rmi $t_image
