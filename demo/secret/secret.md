secret的创建使用
---
#### 创建
##### 创建docker私有镜像仓库拉取使用的key的secret
* 生成  
```bash
kubectl create secret generic registrykey \
    --from-file=.dockerconfigjson=/root/.docker/config.json \
    --type=kubernetes.io/dockerconfigjson \
    -n deno=namespace
```
* 生成的yaml
```yaml
apiVersion: v1
data:
  .dockerconfigjson: ewoJImF1dG...
kind: Secret
metadata:
  creationTimestamp: "2019-07-02T03:03:51Z"
  name: registrykey
  namespace: demo-namespace
  resourceVersion: "71154"
  selfLink: /api/v1/namespaces/demo-namespace/secrets/registrykey
  uid: 85acf329-f2f7-4b44-ba2d-ff795927a538
type: kubernetes.io/dockerconfigjson
```

#####  Opaque 类型 通常用于挂载到node的某一个host
* 命令行自动生成  
```bash
kubectl create secret generic prod-db-secret \
    --from-literal=username=produser \ 
    --from-literal=password=lives \
    -n demo-namespace
```
* 生成的yaml文件
```yaml
apiVersion: v1
data:
  password: bGl2ZXM=
  username: cHJvZHVzZXI=
kind: Secret
metadata:
  creationTimestamp: "2019-07-02T08:13:25Z"
  name: prod-db-secret
  namespace: demo-namespace
  resourceVersion: "86490"
  selfLink: /api/v1/namespaces/demo-namespace/secrets/prod-db-secret
  uid: ae0a7443-fb98-40f5-b352-25239ab42661
type: Opaque
```

#### 使用示例
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  namespace: demo-namespace
  name: api-privite
spec:
  template:
    spec:
      containers:
        - name: api-privite
          image: registry.cn-shenzhen.aliyuncs.com/ymzy/ymzy-api:1.1.11
          command: ["/bin/sh","-c","ls /etc/config"]
          volumeMounts:
            - mountPath: /etc/config
              name: secret-volume
              readOnly: true
      restartPolicy: Never
      imagePullSecrets:
        - name: registrykey
      volumes:
        - name: secret-volume
          secret:
            secretName: prod-db-secret
  backoffLimit: 4
```

#### 常用的四种type
* `type=Opaque` 普通secret文件
* `type=kubernetes.io/service-accout-token`  身份认证使用的
* `type=kubernetes.io/dockerconfigjson`  docker私有进项仓库
* `type=bootstrap.kubernetes.io/token`   节点接入集群使用

#### 注意事项
* 文件大小限制1MB
* 由于使用的base64编码，需要考虑安全性，可以考虑采用secret+vault实现
