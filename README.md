#环境要求：
1.  集群机器需要有可用的centos7.4 base源
2.  集群ntp 时钟同步保持一致
3.  集群timezone 时区保持一致
4.  具备sudo 权限的安装用户
5.  操作系统内核版本3.10.0-947.5.1.el7.x86_64 或以上版本

#  支持信息
    此分支用于支持centos内核系统下的安装，
    内核版本： 3.10.0-957.5.1.el7.x86_64
    
    
    目前使用的组件版本如下
    1. docker：  
        Version: 18.09.3
        ApiVersion: 1.39 
    2. harbor: 
        Version:
        ImgVersion:
    3. Etcd:
        Version:
        ImgVersion:
    4. K8S:
        Version: 1.9.11-0
    5. Calico:
        ImgVersion: calico/typha:v3.3.2
    6. Ingress:
        ImgVersion: ibrary/nginx-ingress-controller:0.16.2
    7. Ceph
        Version: 10.2.9

# 分模块设计

###  一、控制机初始化【install.sh】

  1. 安装ansible
  2. 初始化控制机 `install_controller.yml`

### 二、主机校验

  `host_check.yml`
  
  - 多次校验满足幂等性

### 三、一键安装

  1. `host_init.yml` 主机初始化(所有节点)
  2. `host_ssh.yml` 配置控制机免密登录远程主机
  3. `install_docker.yml` 安装docker(所有节点)
  4. `install_harbor.yml` 安装harbor
  5. `install_etcd.yml`安装etcd
  6. `install_master.yml`安装k8s master
  7. `install_node.yml`安装k8s node
  8. `install_plugin.yml`安装k8s的辅助组件(calico内部网络，ingress外部访问)
  9. `install_operator.yml`安装operator(所有k8s node节点)
  10. `install_ceph_client.yml`安装ceph的rpm包(所有节点)
  11. `install.ceph.yml`安装ceph集群

### 四、节点扩展

  1. `host_init.yml` 主机初始化(所有节点)
  2. `host_ssh.yml` 配置控制机免密登录远程主机
  3. `install_docker.yml` 安装docker(所有节点)
  4. `install_node.yml`安装k8s node
  5. `install_operator.yml`安装operator(所有k8s node节点)
  6. `install_ceph_client.yml`安装ceph的rpm包(所有节点)

### 五、节点卸载

  1. `unstall_node.yml` 卸载节点上的所有安装

### extra

1. 弹性存储
2. 角色分配不关心主机存储空间大小
3. 优先分配角色占用最少的主机
4. 前端角色展示可动态调控
5. 策略推荐逻辑配置化
6. 集群全部停止和启动
7. 集群清理
8. 集群升级
9. 主机环境一键导出
10. 云化存储分配
11. Harbor 安装在控制机整改