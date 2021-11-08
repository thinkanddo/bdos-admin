

数据库：
```
事务级别:  
    读未提交  读已提交  可重复读（MVCC没个数据记录携带两个额外的数据）  串行
    脏读:一个事务处理过程里读取了另一个未提交的事务中的数据 
    不可重复读: 一个事务范围内多次查询却返回了不同的数据值，这是由于在查询间隔，被另一个事务修改并提交  
    幻读: 读取了提交的新事物   事务T1对一个表中所有的行的某个数据项做了从“1”修改为“2”的操作，
    事务T2又对这个表中插入了一行数据项，而这个数据项的数值还是为“1”，
    而操作事务T1的用户如果再查看刚刚修改的数据，会发现还有一行没有修改，其实这行是从事务T2中添加的。出现了幻觉，这种操作感觉要锁表，串行去做
    
    

数据库的乐观锁和悲观锁
    悲观锁：for update,事务修改数据都需要上锁
    乐观锁：所有修改操作的依赖数据做追踪，当事务被commit时，当前事务会检查这个“写前提”是否被其他事务修改过，如果是，则回滚掉当前事务。可以使用version去操作，判断一下访问期间有没有其他人修改数据
    
索引

索引的原理是索引提供指向存储在表的指定列中的数据值的'指针'，
然后根据您指定的排序顺序对这些'指针排序'。
数据库使用索引以找到特定值，然后顺指针找到包含该值的行。

    like查询的时候，索引还有用吗
    测试&Explain分析
    Case#1：两边都是%
    EXPLAIN SELECT * FROM staff WHERE name LIKE '%Alice%';
    结果：type=all，全表扫描
    Case#2：左边是%
    EXPLAIN SELECT * FROM staff WHERE name LIKE '%Alice';
    结果：type=all，全表扫描
    Case#3：右边是%
    EXPLAIN SELECT * FROM staff WHERE name LIKE 'Alice%';
    结果：type=range，效果还可以。
```

数据结构
```
堆（树）：
    堆分为最大堆和最小堆
        最大堆：父节点每个值都比子节点要大
        最小堆：父节点每个值都比子节点要小
    堆可以当作优先队列使用，可以快速访问到“最重要”的元素
    堆排序顺序，只是针对每个分叉使用，
        最大堆时最大值一定是第一个元素，但最小值未必时最后一个元素
        同理最小堆也是这样 最小值为第一个元素，最大值未必为最后一个
    
B树  B+树
https://www.cnblogs.com/vincently/p/4526560.html
B树：（B树是2-3树的一种扩展）
    允许每个节点有多于2个的元素
    B树允许每个节点都有M-1个子节点；
    每个子节点有M-1个key，并且升序排列；
    相对于 M-1子节点的值，位于M-1和M的key 对应的value之间 
    最左侧要小于父节点元素值，最右侧大于，正常的是包含元素值之间
B+树是对B树的一种变形树
    有k个子节点的节点必然有K个关键码
    非叶节点仅具有索引作用，和记录相关的信息均存放在叶节点中
    B+树的非叶子结点只包含导航信息，不包含实际的值，所有的叶子结点和相连的节点使用链表相连，便于区间查找和遍历
```

网络
```
https://www.zhihu.com/people/chexiaopang
简单说一下网络
tcp
    四层网络 可以拆包分包
    源地址端口，目标地址端口
    3次握手，四次挥手
    确认应答，收到最后一条请求的应答，保证之前发送的包没问题
    数据一致性，32为序列号和校验码，保证数据顺序一致
    超时重传和去重，32位序列号和校验码，多则删除，少则重传
    流量控制，设置窗口大小

tcp 于 http 的关系
https://www.zhihu.com/question/38648948?sort=created
ip
有了IP为何还需要TCP？后来理解了IP就是一机器人，
只会根据目的地找人，但在找人的过程中随时抖可能夭折，
所以需要TCP时刻监控IP的行踪，如何监控？
其实就是依靠自身的定时器与对方的消息配合。

ping命令 的原理
    ping首先是基于icmp协议三层网络的请求。
    一.相同网段主机拿到这个ip请求，判断这个ip是否为自己的ip，
    如果是判断目标节点的ip和当前主机ip是否在同一网段；
    如果是，查找ARP缓存，是否有相应的mac地址映射。
    如果缓存中不存在，则以广播的形式进行ARP发送，目的主机应答后，
    当前主机收到应答后，将MAC地址填入缓存中，发送数据到目标主机
    二。不同网段：IP协议发现主机B与自己不在同一网段，直接交给路由处理，
    将路由的MAC取过来，先在ARP缓存表中查找，找不到则利用广播。
    路由得到回复（数据帧）之后，再跟主机B联系，找不到返回超时
```

```
云计算，像在每个不同地区开设不同的自来水公司，没有地域限制，优秀的云软件服务商，
向世界每个角落提供软件服务——就像天空上的云一样，不论你身处何方，只要你抬头，就能看见！
```

k8s:
```

pod访问的数据流转  nginx->nginx->coredns->kube-proxy->cancal->docker
tcp三次握手四次挥手的 访问状态
https://blog.51cto.com/jinlong/2065461
查看端口的访问状态
查看 进程打开的文件 lsof
calico 的 netproxy
http://www.ichenfu.com/2019/03/14/proxy-arp-in-calico/
vxlan的数据网络，以及数据流转画图
dns的 cache

k8s-service

svc headless :
> 有时候我们创建的服务不想走负载均衡，想直接通过pod-ip链接后端，怎么办呢，使用headless service接可以解决。headless service 是将service的发布文件中的clusterip=none ，不让其获取clusterip ， DNS解析的时候直接走pod。
无头服务，service name解析出来的是pod的id。可直接根据ip+端口访问

pod ip   （CIDR   2的n次方  n=32-24)
是由calico或者flannel创建，同etcd（数据有一部分存储到crd中）维护一张节点路由表，不同节点的pod同属一个内网中

K8s的调度流程
    pod的创建：服务先通过认证，授权，以及controler-mannager的准入控制（多种）,请求api-server的api，通过etcd写入pod的创建信息，然后通过scheudled
    根据相应的规则，把pod调度到相应的节点上，kubelet获取到请求之后，
    通过docker启动一个pause服务，初始化容器的运行环境（命令空间和cgroup）


    ① kubectl 发送部署请求到 API Server。
    ② API Server 通知 Controller Manager 创建一个 deployment 资源。
    ③ Scheduler 执行调度任务，将两个副本 Pod 分发到 k8s-node1 和 k8s-node2。
    ④ k8s-node1 和 k8s-node2 上的 kubectl 在各自的节点上创建并运行 Pod。
    补充两点：
    应用的配置和当前状态信息保存在 etcd 中，执行kubectl get pod 时 API Server 会从 etcd 中读取这些数据。
    flannel 会为每个 Pod 都分配 IP。因为没有创建 service，目前 kube-proxy 还没参与进来。

    https://blog.csdn.net/weixin_45413603/article/details/107217076
    
    命名空间:主机名、进程id、文件系统、网络接口、进程间通信IPC
    cgroup:限制了容器所使用的资源，包括cpu、RAM、块I/O、网络I/O

Pod创建流程：
https://www.kubernetes.org.cn/6766.html    
https://www.yuque.com/baxiaoshi/tyado3

nginx是Kubernetes中的一个pod，网关或我们的其他服务也同样是pod，那么无论是通过nginx配置backend或ingress配置路由，
都是pod和pod之间的请求转发（通信），通过Kubernetes的网络实现

量化数据，申请资源需要评估报告，申请2c 4c 应用需要cpu 内存多少等。
弹性能力和基于监控指标弹性(CPU/Memory等),轻松应对流量变化,提升了我们业务的稳定性,此外,SAE的按需自动弹、按分钟计费功能,极大的提升了我们对闲置资源的利用率

容器在 Host 操作系统的用户空间中运行，与操作系统的其他进程隔离。这一点显著区别于的虚拟机。

集群内服务通信：
```
https://blog.csdn.net/weixin_42305433/article/details/99414350
pod A向pod B发送，先为pod B创建Service
Service B创建完成后，会自动关联pod B并为其创建Endpoint B
kube-proxy通过轮询api-server发现Service B并为其修改所有node上的iptables
kube-dns通过轮询api-server发现Service B并为其增加DNS记录
Service-Controller、Endpoint-Controller通过轮询api-server发现Service B，及时更新他们的变化
此时请求从pod A发出，pod A中通过resolve.conf配置的nameService查询kube-dns，获取B的Service IP
向B的Service IP发出请求，经过kubernetes网络（基于CNI），首先转发到Service B对应物理节点，对应物理节点通过iptables规则，经请求转发到pod B所在节点

(就是svc、endpoints、kube-proxy在一次请求的运行态过程中其实没有直接参与，
都是通过iptables进行实际请求转发的；
而kube-dns在一次请求的运行态过程中是直接参与的（根据svc名称找到svc的cluster ip）)
```

kube-dns为Kubernetes集群提供命名服务，主要用来解析集群服务名和Pod的hostname。
目的是让pod可以通过名字访问到集群内服务。它通过添加A记录的方式实现名字和service的解析。
普通的service会解析到service-ip。headless service会解析到pod列表。

kube-proxy：每台工作节点上都应该运行一个kube-proxy服务，它监听API server中service和endpoint的变化情况，
并通过iptables等来为服务配置负载均衡，是让我们的服务在集群外可以被访问到的重要方式。

k8s的各个组件及功能：
api-server: 各类资源的api接口，数据中心
controller-manager: 集群管理控制中心
schedule: 集群调度中心 pod调度
kubelet: 管理pod，像master汇报节点资源的使用情况
kube-proxy: 服务访问，负载均衡
http://www.zeusro.com/2019/05/17/kubernetes-iptables/
https://juejin.im/entry/5b7e409ce51d4538b35c03df
    1.UserSpace 
    2.IPtables cluster_ip ping不通，Cluster IP 只是 IPtables中的规则，
    并不对应到一个任何网络设备
    3.IPVS 监听Service和 Endpoints ，创建 IPVS 规则并定期与Service 和 Endpoints 同步 IPVS 规则
    
    ipvs和iptables: IPVS模式与iptables同样基于Netfilter,但采用的是hash表
    svc数量上来，查询速度快
    
    nodeport: kube-proxy再主机上创建了一个nodeport的监听端口，然后根据相应的端口创建iptables规则，直接通过node:port-->访问pod的ip:port
    
当应用有多个后端容器的时候，怎么做负载均衡，会话保持怎么做，某个容器迁了之后 IP 跟着变怎么办，还有对应的健康检查怎么配，如果想用域名来做访问入口要怎么处理


keepalived+haproxy
haproxy: 负载均衡，如果其中一个api-server的访问不通，流量全都转到另外一个节点上
keepalived: 监听haproxy的健康状态，状态不对，把vip切换到另外haproxy节点上去


prometheus

elk

etcd的优势
https://blog.csdn.net/cudaer/article/details/90145057?utm_medium=distribute.pc_aggpage_search_result.none-task-blog-2~all~first_rank_v2~rank_v25-1-90145057.nonecase&utm_term=etcd%E5%86%99%E5%85%A5%E4%B8%80%E8%87%B4%E6%80%A7

https://zhuanlan.zhihu.com/p/31050303
leader选择
https://www.cnblogs.com/huaweiyuncce/p/10130522.html

leader到期后，会立即失效吗
etcd服务发现，数据存储，分布式
etcd使用什么算法
    Raft: 1.leader选举
          2.日志服务，leader强制复制日志到其他备选节点上
          3.安全性
    数据提交：每次有数据更新得时候，
    1.leader写log 同步log 生成对应得log，然后把生成log的请求广播给所有的follower
    （1）听从learder的命令，写入log，返回success
    （2）follower不听命令，返回false
    半数follower成功写入log
    2.leader开始第二阶段提交：正式写入数据，然后同步广播给follower
    follower根据自身要求选择写入数据，并返回结果给leader
    leader持久化并同步数据
    数据一致：多少派返回success，操作成功，数据强制同步
    同步log 和 同步数据任意一个操作有超过半数的follower返回false或者没有返回
    这个操作就是失败的。由于数据不会真正在多数节点上提交，
    所以会在之后的过程中被覆盖掉。
    
    选举机制： 每个follower内部都维护一个随机的timer，timer时间到了之后
    还没有人主动联系它的话，那它就要变成candidate，同时发起投票请求，
    每个follower一轮只能投票一次，投票规则采取先来先投票的规则，半数以上同意，
    则leader产生。leader通过心跳机制管理follower
    
    选举时，follower遇到candidate候选人时，可以不予理睬
    保证数据只从leader流向follower
    
    任期：term
    每个任期只有一个leader
    每一个服务会维护当前的任期值，每一个请求都会携带term，如果有一个peer拥有老的term，则更新为term状态变为follower
    
    
    
    主和从都只将客户端的请求存入本地log，未做持久化存储。返回给客户端失败或超时的响应。
    其他从节点将进行多数派的leader选举，此时如果客户端有新的请求，则将发给新的leader，新leader和follower完成多数派的写入工作
    老leader和一个follower的数据与新leader组成的多数派不一致，通过心跳和term等机制判断更新老leader为follower，未持久化的数据将丢失。
    新leader将自己已存储但follower没有的数据再次发送一遍，保证从节点与主节点的数据一致性。
    
    
calico有哪些组件组成，各自是干什么的
calico划分了24位或者16位网段之后，可以继续划分子网吗，
每个节点上的ip 池应该怎么规划，配置多少个ip
cni接口，kubelet调用cni创建的网络
docker的cgroup是干什么的  cgroupfs systemd

calico+flannel
网络虚拟化方案分为两种：基于隧道  基于路由
基于隧道 calico的ipip flannel的vxlan
calico的ipip模式，容器间访问时目标地址和源地址都是容器ip，通过ip封包
目标地址和源地址变为了两端宿主机的物理ip
flannel的vxlan: vxlan创建在原来的网络上，只有ip能互相通信（三层网络互通）就能部署vxlan。  
flannel的vxlan模式: 容器内的IP包经过容器内的路由表，以及veth设备对的规则，
发送到cni0，在经过路由和网桥数据包流向flannel.1的网卡，根据VTEP的配置
进行封包。通过etcd得知目的ip属于哪个节点，根据ip找到目的节点的mac映射
vxlan包到达目的网卡，通过udp端口到达VETP设备flannal.1的网卡进行解包
解完包后根据路由把ip包转发给cni0的网桥删，然后cni0将ip包通过vteh设备对
传到目标容器
         vxlan使用udp封装了一层ip包，udp的目的端口就是接收方VTEP设备使用的端口，VTEP是VXLAN网络的边缘设备，用于VXLAN的封包与解包。VXLAN网络可以看作一个隧道
calico的bgp 不需要封包，通过路由规则转发，
需要保证双方网络处于同一个交换机上，可以基于mac之间通信

drone比jenkins的优势
drone的执行模式
traefik比ingress的优势


ingress
蓝绿发布
蓝绿部署是不停老版本，部署新版本然后进行测试，确认OK后将流量逐步切到新版本。蓝绿部署无需停机，并且风险较小，需要部署两套集群
灰度发布：平滑升级，让一部分用户继续用A，一部分用户开始用B，如果用户对B没有什么反对意见，那么逐步扩大范围，把所有用户都迁移到B上 面来。

k8s管理多个集群
https://blog.51cto.com/dangzhiqiang/2173267?source=dra

外部访问集群应用的方式
https://www.cnblogs.com/hongdada/p/11328082.html

loadbalance 和ingress的区别
https://juejin.im/post/5dac46226fb9a04e09261a22#heading-5

pod没有被调度的原因
    节点的node资源信息；
    在该节点上的pod请求和可分配的资源总和，包括cpu、内存、gpu、容许的pod总数、存储等；
    内存、磁盘压力情况；
    节点上的占用端口；
    Pod的亲和性；
    节点taints容忍性；
    pod的资源信息
    pod的qos等级
    pod的资源请求详细信息，包括cpu、内存、gpu、容许的pod总数、存储等
    pod的host ports
    pod的亲和性
    
pod调度到某个节点，可以通过什么方式
    nodeName
    nodeSelector
    
nodeselector nodeAffinity
https://www.linuxea.com/2079.html
    节点选择器，如nodeSelector
    节点亲和性调度，nodeAffinity
    nodeSelector： node打标签 pod中nodeSelector加标签
    nodeAffinity:
        requiredDuringSchedulingIgnoredDuringExecution硬亲和
        preferredDuringSchedulingIgnoredDuringExecution倾向
        
container是什么，初始化了什么
https://blog.csdn.net/u010822828/article/details/44488227
    通过Image创建的，在imager只读层上，建立了一个读写层，负责运行服务
    构建container的dns，挂载文件系统，初始化网络，卷准备，创建容器进程环境，创建mount点

init contanier：
    在启动应用容器前进行初始化，完成应用容器的准备条件，先于普通容器启动，Init Container执行完成后，普通容器才被启动

怎么做可以让k8s集群更安全
https://yq.aliyun.com/articles/753530
https://blog.csdn.net/watermelonbig/article/details/90050622
    networkpolicy
    
持久化存储有几种模式

静态存储和动态存储
https://blog.51cto.com/xiaorenwutest/2481666

pod资源限制
    cpu m或者'1'
    mem Mi或者Gi
    
taints和tolerations
https://blog.csdn.net/weixin_30919919/article/details/95464194

Controller Manager 几种模式
operator和sc的区别
svc为什么不适合做外部访问
vxlan模式，podA访问podB

crd
https://www.jianshu.com/p/cc7eea6dd1fb
https://www.kubernetes.org.cn/tags/crd

k8s集群升级都升级什么组件
https://blog.51cto.com/newfly/2440901?source=dra
    先升级kubeadm版本
    升级第一个主控制平面节点Master组件。
    升级第一个主控制平面节点上的kubelet及kubectl。
    升级其它控制平面节点。
    升级Node节点

k8s集群删除一个节点的操作

每个节点包含多少pod：
    kubernetes 为每个节点分配一个IP地址范围，即CIDR地址块。默认情况下，每个节点上pod不超过110个
    每个节点默认为110个pod，k8s为每个节点分配一个 /24 CIDR 地址块（256个地址  计算逻辑： 32-24=8 2的8次方=256）
    该地址块始终包含至少两倍于每个节点的最大pod的地址数量

Prometheus怎么监控，监控流程
https://www.cnblogs.com/yiweiblog/p/10559481.html
kube-state-metrics 采集的各种k8s资源对象，如pod deployment ds job 等资源对象 状态的图表
node-exporter  收集节点,例如cpu,内存,硬盘空间等基本信息
grafana 界面化展示，展示的为上面收集到的元数据
prometheus 监控 日志采集 日志分析
operator 复制生成采集指标的配置 生成 config.yaml


kubectl logs -f 报错error: unexpected EOF 解决

pod之间的通信，跨租户之间的pod访问 dns udp 53端口
qos 级别
节点强制亲和
rbac  role clusterrole

Sheduler 是作为单独的程序运行的，启动之后会一直监听 API Server，获取 PodSpec.NodeName 为空的 pod

Controller Manager 集群内管理控制中心，集群Node、Pod副本、
服务端点（Endpoint）、命名空间（Namespace）
、服务账号（ServiceAccount）、资源定额（ResourceQuota）的管理

pause: 1.初始化namespace    
       2.启用PID命名空间，它在每个pod中都作为PID为1进程，并回收僵尸进程
       
node oom : kubelet每过多少秒watch一下数据，
kubelet驱逐pod回收内存之前发生内存激增的情况，
可能触发内核oom，这是删除容器的权利就由kubelet转给了oom killer手中。  
根据配置qos级别，oom killer会删掉优先级最低的容器

drone : 部署方式:基于k8s部署
任务执行：执行pipeline任务，任务执行的时候，pod会随机落到集群
节点中执行，多个任务同时执行，可以做到节点解耦合
镜像，利用的是集群中的镜像操作，与k8s强绑定，依赖k8s环境
jenkins : 部署方式:单机部署，一些工作环境会安装到节点上，
任务执行：多任务执行的时候，压力会瞬间给到机器上
单机docker

k8s endpoints丢失(一会显示，一会不显示，node可能被判定notready):
1.查看ep 资源发现 yaml显示 addressnotready
2. ep 根据pod中的status重点状态类型判断
3. pod中这个状态是由 controller-manager 修改的
4. 查看日志发现 controller-manager 判断node节点的心跳上报超时
因为kubelet 上报信息需要收集容器镜像等信息，kubelet默认上报时间是10s
但实际是20-50s,controller-manager判断节点上报的超时是40s。所以又一定几率超时


cluster_ip 可以通，首先k8s中的svc资源会有相应的配置，与ep进行绑定，
kubelet中的ip-idam会根据上面的配置 生成iptables规则
```

docker
```
docker
cgroup  namespace
docker的网络模式


image  container是谁控制的，怎么控制的
怎么限制a容器的资源，比如限制只能使用几号CPU
cgroup的层次

网络:
ping命令
arp   路由网关

tcp   中 TIME_WAIT  TIME_WAIT状态的形成只发生在主动关闭连接的一方
存在大量的TIME_WAIT 连接，需要调整内核参数
vi /etc/sysctl.conf
编辑文件，加入以下内容：
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_tw_recycle = 1
net.ipv4.tcp_fin_timeout = 30
然后执行 /sbin/sysctl -p 让参数生效。
查询服务器的tcp链路状态
netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'

https:1.浏览器发起443请求
2.服务器接收到请求，选择浏览器支持的加密算法等然后将数字证书返回给浏览器
3.浏览器获取到数字证书进行认证（证书列表中查找）
4.浏览器生成随机数R并使用公钥对R加密
5.浏览器将加密的R传给服务器
6.服务器使用自己的私钥解密得到R
7.服务器以R为密钥把内容传给浏览器
8.浏览器通过R密钥解密

```

go
```

go 中 锁的类型  channel  go的调度

go锁机制分为: 读写锁 和 互斥锁
互斥锁是对某一个操作加锁，同一时间没读写进程只能有一个协程可以执行，
其他均为卡住，只有解锁后其他协程才可继续操作，串行操作
读写锁是 写锁定是，读和写均不能操作。 写锁定是，读可以操作，写操作互斥。
channel  协程之间通信
MPG
go初始内存4k
chanel＋goroutinue
互斥锁
go反射

docker
cgroup  namespace
image  container是谁控制的，怎么控制的
怎么限制a容器的资源，比如限制只能使用几号CPU
cgroup的层次

网络:
ping命令
arp   路由网关


byte转int怎么保证数据一致性
两个go携程，怎么输出AaBbCc…
encoding/json包使用
函数编写，字符串转换为int,不能则输出0
字符串中的空格全部转换为%25
timer


ansible不打印某块输出
ansible输出主机函数


shell  1,2,3输出  1  2  3

goroutine基于线程池的P:M:G协程模型
channel基于生产者消费者模型的无锁队列
net. conn基于epoll的异步io同步阻塞模型
syscall基于操作系统的原生syscall能力
gosched基于阻塞的协程调度
gc基于三色标记法的并发gc模型
io. reader/writer unix文件哲学升级版
net/http基于goroutine的http服务器
开箱即用error基于c风格的if(erron ! = 0)错误处理机制
panic传统的exception异常机制可配合coredumprecover可用于恢复异常的堆栈，
以进行排错map传统的hashmap
并发安全的hashmapslice
基于内存复用和读优化设计的数据结构
defer函数返回前清理各种垃圾，防止内存泄露
go tool asm go专用汇编，
可选性能优化手段cgo非并发安全的c调用能力，
可选性能优化手段unsafe非并发安全的指针调用，
可选性能优化手段reflect提供反射能力，
以实现有限的动态性atomic基于cpu原子操作的包装，
可实现cascontext基于channel的goroutine流程控制能力
interface提供高级语言的抽象和多态能力闭包提供主流编程语言的闭包设计
逃逸分析提供主流编程语言的逃逸优化能力指针提供并发安全的指针
非并发安全的指针pprof自带的性能分析工具用于调优和查错

slice的扩容: 如果 slice 的容量小于1024个元素，那么扩容的时候 slice 的 cap 就翻番，乘以2；
一旦元素个数超过1024个元素，增长因子就变成1.25，即每次增加原来容量的四分之一


channel 的 nil 模式
switch 可以代替 select 接收channel信号吗

go select 的底层实现
select用于channel接收和发送的专用语句，在运行期间是阻塞的，select没有case语句会阻塞goroutine. 
channel等待读或者等待写，当接收到数据根据注册的事件做出相应的回应。

map的实现，有序map怎么实现

数组和slice

defer，如果程序中间有报错，后面程序怎么执行  先进后出，进栈出栈

go 调度的时候，如果有协程长时间不动(夯住，就是执行了很长时间)
1.用户调用卡住,G会被放入到wait队列中，然后G的状态也会改变为waitting，
M也会跳过G获取其他的G执行，等该G被唤醒之后，会尝试加入队列进行执行。
2.系统调用阻塞，M和G改变为其他的状态，M与P进行解绑，系统调用完，
会尝试获取其他的P进行执行，如果没有获取到P，G会被丢掉全局队列中。
（P被丢掉之后，且P私有队列中有G需要执行，则会创建一个新的M）

闭包的作用  缩小变量作用域，减少对全局变量的污染

func testSlice(){
	s1 := make([]int,5,5)
	s1[0] = 1
	s1[0] = 2

	s1 = append(s1,1)
	fmt.Println(s1)
}
结果为  [2 0 0 0 0 1]

限制goroutine的并发数   channel+sync
https://studygolang.com/articles/17811?fr=sidebar
// 3. channel+sync
var swg  sync.WaitGroup
func testChSync(ch chan bool)  {
	for i:=0;i<100 ;i++  {
		go readChSync(ch,i)
	}
	swg.Wait()
}
func readChSync(ch chan bool,i int)  {
	defer swg.Done()
	swg.Add(1)
	ch <- true
	fmt.Printf("go func: %d, time: %d\n", i, time.Now().Unix())
	time.Sleep(time.Second)
	<- ch
}


goroutine的初衷就是轻量级的线程，为的就是让你随用随起，结果你又搞个池子来，这不是脱裤子放屁么？
你需要的是限制并发，而协程池是一种违背了初衷的方法。
池化要解决的问题一个是频繁创建的开销，另一个是在等待时占用的资源。
goroutine 和普通线程相比，创建和调度都不需要进入内核，也就是创建的开销已经解决了。
同时相比系统线程，内存占用也是轻量的。
所以池化技术要解决的问题goroutine 都不存在，为什么要创建 goroutine pool 呢？
如果因为 goroutine 持有资源而要去创建goroutine pool，那只能说明代码的耦合度较高，
应该为这类资源创建一个goroutine-safe的对象池，而不是把goroutine本身池化。
Goroutine非常轻量，默认2kb

代码中channel数据结构为什么定义struct，而不定义成bool这种类型呢
因为空结构体变量的内存占用大小为0，而bool类型内存占用大小为1

sql优化


java和go的区别  内存上   go面向方法
Java的GC更好，Go这方面还不够。
Go的并发更好，Java要同样效果，回调写死了。
真想知道，就自己测。自己设计的测试，更可能体现你想要的指标。
java和go在线程上的区别
goroutine是用户态的线程切换，java采用的是系统线程切换
容器类型的goroutine,虽然resource那块的request给了1G，但宿主机上有40核，
go中的goroutine也是会同时启动40个协程
Go默认情况下只用单线程。这就是说，你即使开了几百个goroutine，
系统中同一时间在跑的只有一个线程，也就是一个协程。那是因为没有设置并发度。
（runtime.GOMAXPROCS()    //这个函数设置的是Go语言跑几个线程
                         //如果不主动设置，Golang默认使用所有的cpu核。
runtime.NumCPU()       //这个函数返回当前有的CPU数。）
A-c B-d...Z-b 算法实现，位运算
func covert(s string)  string {
	num := s[0]
	// s string 转换为数字
	if s != "Z" && s != "Y" {
		num = s[0] + 2 + 32
	}
	fmt.Println(string(num))
	return string(num)
}

```
mysql

```

主键和索引的区别
https://mp.weixin.qq.com/s/RemJcqPIvLArmfWIhoaZ1g

只有通过索引条件检索数据，InnoDB才使用行级锁，否则，InnoDB将使用表锁,行级锁都是基于索引的


```

linux
```

匹配 第二行等于0的行，并删掉
kubectl  get rs -ndscloud  | awk '{if ($2==0) print $1 }' | xargs kubectl delete rs -ndscloud
匹配nginx 的errors中的第7行和第9行 并匹配状态码为404的，去重输出

```

java:
```
hashmap 遍历方式 扩容 负载因子
锁
jvm 类加载原理
https://baijiahao.baidu.com/s?id=1632503816780923946&wfr=spider&for=pc
多线程 状态
https://blog.csdn.net/xiaosheng900523/article/details/82964768
线程池满了，有线程在进入
cas：Compare and Swap，即比较再交换。
https://www.jianshu.com/p/ab2c8fce878b


sprintboot的优点
springboot的启动流程
多线程  种类
hashmap是否为线程安全
hashmap出现hash重复
jvm

Ioc,Aop
多线程遇到的问题
nio


```

框架
```
springmvc  简单说一下springmvc的流程

```


java锁、AQS、线程和线程池、集合、JVM、垃圾回收、缓存、消息队列、mysql索引、隔离级别、spring、springboot基本就这些

java锁有几种，有啥区别，synchronized的原理及优化？
集合一般问map  ConcurrentHashMap的原理和扩容 hash冲突出现以及解决 hashmap 红黑树、list、set
线程有几种，线程池参数、新提交一个任务线程池的原理 新的任务提交到线程池，线程池是怎样处理
子线程读取主线程的变量
AQS 及 其 实现类
7种垃圾回收器   gc算法多少种  oom什么情况下触发
JVM内存模型；JVM调优； 类加载原理 ；哪些JVM性能调优 ；Minor GC与Full GC分别在什么时候发生 ；判断一个对象应该被回收；JVM的永久代中会发生垃圾回收么？
SpringBoot starter原理 ；Spring Boot 还提供了其它的哪些 Starter Project Options；Spring常用设计模式，分别在哪里用到
mysql数据结构、mysql如何保证隔离级别、mysql索引的本质、什么情况下索引不生效、数据库的乐观锁和悲观锁、为什么自增主键建索引、多少种索引
什么是缓存穿透？如何避免？什么是缓存雪崩？何如避免？
Redis分布式锁
一致性哈希算法

退税服务器被挤爆，知道怎么应付这种大量突发流量的冲击吗？用什么技术栈可以实现？你会不会慌？ 
需要有高并发+调优的能力，比如向解决上面的方案。

ThreadLocal底层实现
JDK动态代理和CGLIB动态代理的实现

SpringBoot + SpringCloud + Dubbo + Redis + Mq + Hystrix就可以实现高并发，再加上JVM调优、分库分表那就堪称完美了


go k8s 共享存储 http tcp/ip  内核协议栈 系统调优cpu/内存/磁盘/网络   容器隔离/网络/存储/镜像管理/安全

k8s devops 监控 jenkins ci/cd ansible tcp/ip 

java,go？  http tcp/ip mysql restful

k8s docker go vxlan overlay devops ci/cd  



mysql索引种类，数据结构
mysql锁
事务隔离级别
什么情况下索引不生效
不加索引的话，mysql会有默认吗
mysql锁怎么优化
说几个sql优化的方案








jdls面试整理
	
1.线程池
	1.1 线程的创建方式
	1.2 对Future了解吗
	1.3 线程池中提交一个任务的工作流程？ https://zhuanlan.zhihu.com/p/346255858       https://blog.csdn.net/c10WTiybQ1Ye3/article/details/109684791
	1.4 线程池的7种参数？
	1.5 实际工作场景中使用过哪种线程池？（四种线程池，newFixedThreadPool定长、newCachedThreadPool缓存、newSingleThreadExecutor单线程、newScheduledThreadPool定长定时周期）
    https://blog.csdn.net/weixin_39613089/article/details/111800882
	1.6 你是怎么使用的，为什么？
	1.7 对newFixedThreadPool的使用，假如有这样一个场景，定长=5，最大=10，当任务执行结束过后，当前线程池中还有线程吗？有几个？为什么？
	1.8 线程池的线程执行结束后是怎么关闭退出的？
	1.9 四种拒绝策略了解吗？使用过哪几种？为什么？
	1.10 假如使用拒绝策略CallerRunsPolicy（由调用线程（提交任务的线程）处理该任务），线程池定长=1，如果一直不断的提交线程，总共会出现多少个线程？（n+1）
    线程数满，阻塞队列满，让调用线程（提交任务的线程）直接执行此任务          =最大线程数+主线程
    https://blog.csdn.net/qq_22253853/article/details/107050972
    https://blog.csdn.net/suifeng629/article/details/98884972

2.java锁
	2.1 java锁的分类，可以详细说一下吗？
	2.2 你是怎么写出一个自旋锁的？while(ture)
	2.3 自旋锁的ABA问题了解么？怎么解决的？   https://www.cnblogs.com/lvcai/p/13565839.html
	2.4 公平锁和非公平锁的底层是怎么运行的？
		公平锁：cpu顺序从队头调度线程
		非公平锁：cpu随机调度队列中的线程
	2.5 synchronized锁升级过程，详细说明各种优化是怎么实现的？
		偏向锁为什么升级到轻量级锁，详细说明怎么实现的？
		轻量级锁为什么升级到重量级锁，详细说明怎么实现的？
	2.6 轻量级锁和重量级锁的区别？轻量级锁为什么轻量级？重为什么重？
		轻量级代码层面实现（自旋），重量级cpu指令实现，笨重浪费资源
        轻量级竞争的时候不会阻塞，不断循环cas获取锁
	2.7 synchronized和Lock的区别？        https://zhuanlan.zhihu.com/p/83494101

3.redis
	3.1 redis的各种数据结构，以及底层实现？
	3.2 项目中redis是怎么使用的？集群还是一主两从还是单例
	3.3 redis锁了解吗？
	3.4 rdis锁setNX底层怎么实现的？
	3.5 为什么要使用redison？
	3.6 setNX和redison的区别？
	3.7 redis的主从复制原理？

4.kafka
	4.1 消息队列的名词介绍
	4.2 kafka消息丢失？怎么处理的？
	4.3 kafka的消息重复消费？
		 怎么保证消息的幂等性？
	4.4 消息的可靠性怎么保证？

5.mysql
	5.1 explain的使用，explain执行后的每个列的含义？
	5.2 mysql索引？
	5.3 二叉树、完全二叉树、平衡二叉树、红黑树、B-Tree、B+Tree
		挨个介绍，以及为什么不使用这种树、为什么使用B+-Tree
	5.4 主键索引和非主键索引的区别？
	5.5 什么时候索引会失效？为什么会失效？like %...  最左匹配原则
	5.6 联合索引了解吗？
	5.7 联合索引(abcd) 语句where a=1 and b=2 and c > 3 and d = 6
		该条语句查询索引都使用上了吗？为什么？最左匹配原则
6.es
	6.1 es怎么部署的？几个分片，为什么？
	6.2 es怎么扩容的？
	6.3 es的倒排索引原理？
	6.4 es深度分页你们项目中怎么解决的？scrollapi，不允许跳跃分页

7.项目
	7.1 详细介绍一下你的项目？
	7.2 你认为哪个项目有难度？难度在哪儿？项目背景？
	7.3 数据量多少？为什么这么设计？





AQS:
抽象队列同步器。如果被请求的共享资源空闲，则将当前请求资源的线程设置为有效的工作线程，并且将共享资源设置为锁定状态。
如果被请求的共享资源被占用，那么就需要一套线程阻塞等待以及唤醒时锁分配的机制，将获取不到锁的线程放入队列中
由共享资源（volatile in state）+fifo等待队列组成。
分为独占（只有一个线程可以执行 如ReentrantLock）和共享（多个线程同时执行 Semaphore/CountDownLatch）；
独占: state初始化为0，A线程lock时会独占锁并且state+1,其他线程获取锁时（try）失败，直到A线程释放锁，
释放锁之前A线程可以重复获取锁（state累加），这就是可重入，获取多少次锁就需要释放多少。
独占又分公平锁（按照线程在队列中的排序）和非公平锁（无视队列去抢锁）
共享：任务分N个线程执行，state会初始化为N（与线程数一致），每个线程执行完之后，会countDown()一次，
同时state会CAS减一，所有线程执行完，state=0
AQS中阻塞队列和条件队列：当多个线程调用 lock.lock()方法时，只有一个线程可以获得锁，其他的线程放入阻塞队列中，cas自选获取锁
当获取锁的线程对应的条件变量await()方法被调用的时候，该线程就会释放锁，把当前线程转为node节点放入条件变量对应的条件队列中

锁升级:
偏向锁：只有一个线程进入临界区      01
轻量级锁：多个线程交替进入临界区    00
重量级锁：多个线程同时进入临界区    10
偏向锁 -> 轻量级锁：当一个线程访问同步代码块时，会判断锁标志位是否为01；如果是01则判断是否为偏向锁；
如果是偏向锁，则判断当前锁对象头是否存储了当前线程id；如果存储了则直接获得锁。
如果对象头存储的不是当前线程id，则通过cas尝试存储自己的线程id进当前锁对象的对象头，来获取锁。
对象头替换线程id成功后，则继续执行同步代码块
替换失败后，等待安全点到来撤销原线程的偏向锁，撤销时暂停原持有偏向锁的线程；
判断线程状态，如果已经退出，则唤醒新线程获取偏向锁，否则开始锁竞争进行锁升级，升级为轻量级锁

轻量级锁 -> 重量级锁：升级为轻量级锁之前，jvm会先把对象头用来标记锁信息的相关内容封装成一个java对象，
放入线程的栈帧中，这个对象称为LockRecord；然后线程尝试通过cas将对象头的标记信息替换为锁记录（LockRecord），
自旋就是通过不断的循环进行cas操作直到成功替换。轻量级锁又称自旋锁。
LockRecord实现了锁重入，每当同一个线程获取同一个锁时，会在当前栈帧放入一个LockRecord，
但是重入和放入LockRecord关于锁信息的内容为null，代表锁重入。每次解锁会弹出一个LockRecord，直到为0.
通过cas自旋获取轻量级锁达到一定次数，jvm会发生锁膨胀升级为重量级锁（不断的自旋在高并发下会消耗大量的cpu）

重量级锁：将LockRecord对象替换为monitor对象实现。主要通过monitorenter和monitorexit两个指令实现
重量级锁重入，每次获取锁会对monitor对象中的计数器+1，锁退出会-1，直到为0.


https://mp.weixin.qq.com/s/YTmeJxxv9eSfBuKIorfuaA
线程的7种参数：
1.核心线程数
2.总线程数
3.存活时间
4.存活时间单位
5.线程存储队列
     5.1.有限队列-SynchronousQueue（在newCachedThreadPool()方法中使用）
                这是一个内部没有任何容量的阻塞队列，任何一次插入操作的元素都要等待相对的删除/读取操作，否则进行插入操作的线程就要一直等待，反之亦然
                public static ExecutorService newCachedThreadPool() {
                        return new ThreadPoolExecutor(0, Integer.MAX_VALUE,
                                                      60L, TimeUnit.SECONDS,
                                                      new SynchronousQueue<Runnable>());
                }
         有限队列-ArrayBlockingQueue
                是一个由数组支持的有界阻塞队列（先进先出），假设初始队列长度为2，当添加第三个元素时线程会进行阻塞。同样的，当元素为空的时候，进行获取也会进行阻塞。
     5.2 无限队列-LinkedBlockingQueue
                创建ThreadPoolExecutor常用的队列。
                当不设置队列初始长度，则为无界队列。
                当设置队列初始长度则类似于ArrayBlockingQueue即插入与读取都会为空进行堵塞。
 6.ThreadFactory给一组线程用来命名，阿里巴巴规范建议使用，方便以后的错误查找。
 7.默认拒绝策略
     7.1 AbortPolicy(抛出一个异常，默认的)
     7.2 DiscardPolicy(直接丢弃任务)
     7.3 DiscardOldestPolicy（丢弃队列里最老的任务，将当前这个任务继续提交给线程池）
     7.4 CallerRunsPolicy（交给线程池调用所在的线程进行处理)



switch重写（重写器  5个以上的case使用二分法查找）

service 初始化出来后是单例的，每次调用不是重新new出来的，所有里面定义的全局变量一次赋值之后就不变了
