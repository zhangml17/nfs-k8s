#! /bin/bash

# 安装nfs服务端
yum install nfs-utils rpcbind

# 创建存储文件夹
mkdir -p /data/nfs

# 写入
echo "/data/nfs   *(no_root_squash,rw,sync,no_subtree_check)" > /etc/exports

# 启动nfs服务
systemctl start nfs-server.service

# 检验是否开启
showmount -e
