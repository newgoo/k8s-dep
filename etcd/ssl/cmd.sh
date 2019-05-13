#!/usr/bin/env bash

# 生成etcd ca证书和私钥 初始化ca
cfssl gencert -initca ca-csr.json | cfssljson -bare ca

# 生成server证书
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=etcd server-csr.json | cfssljson -bare server
