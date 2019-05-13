etcd 集群安装(带证书)
---

* 手动启动服务
`/k8s/etcd/bin/etcd --name=etcd01 \
 --data-dir=/k8s/etcd/data --listen-client-urls=https://10.211.55.101:2379 \
 --initial-advertise-peer-urls=https://10.211.55.101:2380 \
 --listen-peer-urls=https://10.211.55.101:2380 \
 --advertise-client-urls=https://10.211.55.101:2380 \
 --initial-cluster-token=etcd-cluster \
 --initial-cluster=etcd01=https://10.211.55.101:2380,etcd02=https://10.211.55.102:2380,etcd03=https://10.211.55.103:2380 \
 --initial-cluster-state=new \
 --cert-file=/k8s/etcd/ssl/server.pem \
 --key-file=/k8s/etcd/ssl/server-key.pem \
 --trusted-ca-file=/k8s/etcd/ssl/ca.pem \
 --client-cert-auth=true \
 --peer-cert-file=/k8s/etcd/ssl/server.pem \
 --peer-key-file=/k8s/etcd/ssl/server-key.pem \
 --peer-trusted-ca-file=/k8s/etcd/ssl/ca.pem \
 --peer-client-cert-auth=true`

* 检查etcd 服务是否正常
`/k8s/etcd/bin/etcdctl \
--ca-file=/k8s/etcd/ssl/ca.pem \
--cert-file=/k8s/etcd/ssl/server.pem \
--key-file=/k8s/etcd/ssl/server-key.pem \
--endpoints="https://10.211.55.101:2379,https://10.211.55.102:2379,https://10.211.55.103:2379" \
cluster-health`
