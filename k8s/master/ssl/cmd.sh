#!/usr/bin/env bash

# 制作apiserver证书
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=kubernetes server-csr.json | cfssljson -bare server

#制作kube-proxy证书
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=kubernetes kube-proxy-csr.json | cfssljson -bare kube-proxy

#部署kube-apiserver组件 创建TLS Bootstrapping Token
head -c 16 /dev/urandom | od -An -t x | tr -d ' '