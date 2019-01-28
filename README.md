# nfs-k8s
利用NFS动态提供kubernetes后端存储卷

# 准备
先在打算作为NFS服务器的机器上执行install_nfs_server.sh脚本，安装nfs服务器

然后再在kubernetes集群节点上执行make，部署nfs客户端

现在有个问题是：

+ 创建pvc的时候报错：waiting for a volume to be created, either by external provisioner "fuseim.pri/ifs" or manually created by system administrator

我的分析是 外部存储分配器 fuseim.pri/ifs 并没有 动态创建pv，因此一直在等待创建pv volume
