flanneld 安装
---

* 安装
* 注意事项
    安装完成后，有与centos7 系统防火墙iptable 需要执行如下命令需要才能ping通容器ip
```bash
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F
iptables -L -n
```