# nfs-k8s
deploy nfs on k8s

现在有个问题是：

+ 创建pvc的时候报错：waiting for a volume to be created, either by external provisioner "fuseim.pri/ifs" or manually created by system administrator

我的分析是 外部存储分配器 fuseim.pri/ifs 并没有 动态创建pv，因此一直在等待创建pv volume
