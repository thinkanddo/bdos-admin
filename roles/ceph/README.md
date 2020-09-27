# ceph相关操作

### 环境准备（调用common的yml文件）

`除了client，每个非检查模块都要调用`

- 时间同步（时区，ntp）
- 关闭防火墙，禁用selinux
- 保证/etc/hosts里有整个ceph集群所有机器的映射
- 20-nproc.conf：配置最大进程数限制为不限制
- limits.conf：配置打开文件最大数量限制
- sysctl.conf：配置最大线程数限制

### ceph-mon

1. 检查模块
2. 安装所需rpm包
   - yum install -y ceph ceph-deploy xfs*
3. 在mon1上模板生成配置文件,keyring和monmap
4. 将mon1上的配置文件同步到控制机上
5. 同步控制机上的配置文件到所有mon上
6. 初始化mon db
7. 初始化完成
8. notify handler 启动mon

### ceph-osd

1. 检查模块
2. 调用common模块分区数据盘和日志盘
3. 安装所需rpm包
   - yum install -y ceph ceph-deploy xfs*
4. 执行初始化osd脚本
5. notify handler 启动osd

### ceph-mds

1. 检查模块
2. 安装所需rpm包
   - yum install -y ceph ceph-deploy xfs*
3. 创建keyring
4. 同步数据到控制机
5. notify handler 启动mds
6. 创建ceph fs
7. 在控制机上挂载ceph文件系统

### ceph-rgw

1. 检查模块
2. 安装所需rpm包
   - yum install -y ceph ceph-deploy xfs* ceph-radosgw
3. 修改ceph.conf配置文件
4. notify handler 启动rgw

### ceph-client

1. 安装所需rpm包
   - yum install -y ceph xfs*
2. 创建数据目录并在里创建keyring