# nfs-k8s
利用NFS动态提供kubernetes后端存储卷

# 准备
+ 先在打算作为NFS服务器的机器上执行install_nfs_server.sh脚本，安装nfs服务器

+ 在集群机器上执行install_nfs_utils.sh脚本，安装utils

+ 然后再在kubernetes集群节点上执行make，部署nfs客户端

存在的问题：

+ 利用自己创建的clusterrole，创建pvc的时候报错：waiting for a volume to be created, either by external provisioner "fuseim.pri/ifs" or manually created by system administrator

+ 然后绑定集群的cluster-admin，可以成功动态创建pv
