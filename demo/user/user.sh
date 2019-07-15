#!/usr/bin/env bash

# 首先需要为此用户创建一个私钥
openssl genrsa -out newgoo.key 2048

# 接着用此私钥创建一个csr(证书签名请求)文件，其中我们需要在subject里带上用户信息(CN为用户名，O为用户组)
openssl req -new -key newgoo.key -out newgoo.csr -subj "/CN=newgoo/O=dev"

# 通过集群的CA证书和之前创建的csr文件，来为用户颁发证书
openssl x509 -req -in newgoo.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out newgoo.crt -days 365

# 通过命令将用户的验证信息添加进kubectl的配置
kubectl config set-credentials newgoo \
    --client-certificate=/root/.kube/user/newgoo.crt \
    --client-key=/root/.kube/user/newgoo.key

# 此命令添加了一个context配置——设定使用aliyun集群，默认使用a-1命名空间，使用用户tom进行验证
kubectl config set-context newgoo@dev --cluster=kubernetes --namespace=newgoo --user=newgoo

#在命令中带上 kubectl --context=newgoo@dev ... 参数即可指定kubectl使用之前添加的名为tom@aliyun的context操作集群
#也可以通过命令 kubectl config use-context newgoo@dev 来设置当前激活的context
