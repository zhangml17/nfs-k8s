#! /bin/bash

export NODE_IPS=(192.168.100.31 192.168.100.32 192.168.100.33)

# 安装nfs客户端工具
for node_ip in ${NODE_IPS[@]}
  do
    echo ">>>${node_ip}"
    ssh root@${node_ip} "yum install nfs-utils"
  done
