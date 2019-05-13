#!/usr/bin/env bash

# 向 etcd 注册flanneld 网段
/k8s/etcd/bin/etcdctl \
--ca-file=/k8s/etcd/ssl/ca.pem \
--cert-file=/k8s/etcd/ssl/server.pem \
--key-file=/k8s/etcd/ssl/server-key.pem \
--endpoints="https://10.211.55.101:2379,https://10.211.55.102:2379,https://10.211.55.103:2379"  \
set /k8s/network/config  \
'{ "Network": "10.1.0.0/16", "Backend": {"Type": "vxlan"}}'