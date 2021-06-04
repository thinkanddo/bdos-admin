网络:
```
tcp和ip的关系

tcp和udp的差异

http和https

tcp 于 http 的关系
https://www.zhihu.com/question/38648948?sort=created
ip
有了IP为何还需要TCP？后来理解了IP就是一机器人，
只会根据目的地找人，但在找人的过程中随时抖可能夭折，
所以需要TCP时刻监控IP的行踪，如何监控？
其实就是依靠自身的定时器与对方的消息配合。

tcp的三次握手，四次挥手
https://blog.51cto.com/jinlong/2065461
客户端发送syn包到服务器，进入syn send状态，等待服务器确认
服务器收到syn请求，发送给客户端 syn+ack 包。进入 syn recv状态
客户端收到 sysn+ack包，向服务端发送ack包，进入established确认状态
(1)客户端发送连接释放报文
(2)服务端收到连接释放报文，发出确认报文，然后一直close-wait
(3)客户端收到请求，进入fin-wait中,等待确认服务端数据已经发送完毕
(4)服务端将数据发送完毕之后，发送给客户端，连接释放报文，进入last-ack最后确认状态
(5)客户端收到连接释放报文，发送给服务端确认报文，进入time-wait状态，等待连接释放
(6)服务端收到确认报文之后，立即进入close状态，结束连接

ping命令 的原理
    ping首先是基于icmp协议三层网络的请求。

arp
```

k8s
```

pod访问的数据流转  
nginx->ingress->cancal->docker
coredns->kube-proxy->calico

calico-flannel
基于隧道
基于路由
1. calico的bgp flannel的host-gw
bgp模式，每台机器会启动一个bird（BGP client）,
它将集群中calico分配给node的ip段，通知给主机。直接走主机上的网卡路由转发
适用场景：集群中的主机二层网络需要互通，官网建议集群规模100以内
通信： 容器内eth0->veth->路由规则(iptables)->物理机eth0->交换机->对方

vxlan的数据网络，以及数据流转画图
通信： 容器内eth0->veth->cni birdge网桥->iptables dnat路由->flannel.1 vtep
-> udp 封包 ->物理网卡
->对方物理网卡->udp解包->...

iptables:
http://www.zsythink.net/archives/1199

K8s的调度流程:
1. apiserver 获取到创建pod的请求后，先经过认证授权，把pod数据存储到etcd，创建新的deployment并初始化
2.controler通过list-watch机制，检测发现新的deploy，并将deploy加入到工作队列
判断deploy是否已经创建rs和pod，如果没有则调用deploy controller创建rs,
再通过rs controller 创建pod。等所有的资源都创建好，将该资源信息同步到etcd
3.scheduler通过list-watch机制，检测发现是否有新的pod，通过一些策略
（节点绑定 节点亲和 加污点）等，将pod分配到node上，分配成功后，
将信息写入etcd中
4.kubelet每隔20s,默认10s，请求apiserver获取需要运行的pod清单（比较缓存），
增加pod，启动pod，然后将pod的信息写入etcd



监控：
Prometheus怎么监控，监控流程
https://www.cnblogs.com/yiweiblog/p/10559481.html
kube-state-metrics 采集的各种k8s资源对象，如pod deployment ds job 等资源对象 状态的图表
node-exporter  收集节点,例如cpu,内存,硬盘空间等基本信息
grafana 界面化展示，展示的为上面收集到的元数据
prometheus 监控 日志采集 日志分析
operator 复制生成采集指标的配置 生成 config.yaml


pod ip   （CIDR   2的n次方  n=32-24)
是由calico或者flannel创建，同etcd（数据有一部分存储到crd中）维护一张节点路由表，不同节点的pod同属一个内网中


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


etcd的优势
https://blog.csdn.net/cudaer/article/details/90145057?utm_medium=distribute.pc_aggpage_search_result.none-task-blog-2~all~first_rank_v2~rank_v25-1-90145057.nonecase&utm_term=etcd%E5%86%99%E5%85%A5%E4%B8%80%E8%87%B4%E6%80%A7

etcd 分布式的高可靠的kv存储系统
http://thesecretlivesofdata.com/raft/
强一致性: raft算法
etcd中的角色： leader  flowwer   candidate
数据提交:
1. 写日志
leader先写日志，然后告诉其他的flowwer准备写入数据，先写入日志。
如果半数以上的flowwer成功写入了日志，返回success给leader，则往下走
2. 写数据
leader先写数据，然后告诉flowwer写入数据，半数以上写入数据，
并返回success给leader。leader持久化并同步数据

选举：
1. 初始时，每个flowwer都有一个timer，timer到了之后，没有别的节点联系它，
他就会变成candidate,发起投票
（选举策略是，没有flowwer一轮只能投票一次，票多者胜出）
2. leader会定期往flowwer发送心跳检测，如果flowwer没有收到心跳，
则证明leader已经凉了，则触发选举


raft是实施分布式共识的协议
节点有三个状态：  flowwer  candidate   leader
选举
初始时都是flowwer,flowwer会随机生成一个选举周期timer,
周期到了之后会自动变为candidate,候选人从其他节点获取投票，
大多数的节点同意之后，candidate会变为leader。
集群所有的改变都是通过leader触发的。

每一次的数据改变都是先写入日志，节点日志没有同步，则数据不会更新
要保存数据，leader节点首先将日志复制到其他节点,
leader等待大多数的节点写入成功
然后leader先写数据，通知其他的flowwer更新数据，持久化。

leader选举：
在raft中有两个超时控制选举。
（1）选举超时 选举超时是flowwer成功候选人所等待的时间（时间为150ms-300ms）
选举超时后，flowwer变为候选人，开始新的选举，自己先给自己投票
然后把选举请求发送给其他的节点。如果节点在这个周期还未投过票，
它可以投票给候选人，然后重置选举超时。
候选人获取了半数以上的投票之后，则会变为leader。
变为leader之后，开始向flowwer发送发生的信息。
这些信息在心跳超时时间间隔内发送。flowwer响应信息。
这个任期直到，flowwer停止接收心跳变为候选人。

两个候选人同时出现：
两个候选人同时出现，在相同的选举超时中，如果他们获取的投票相同，
则触发选举超时，谁先选举超时结束，则触发投票。

同步数据：
leader选举成功后，会往flowwer同步所有更改，
使用与心跳相同的同步信息完成这个操作
客户端有连接进入时，leader接收信息，然后通过下一次心跳把消息发生给flowwer
有半数以上的flowwer接受信息之后，响应发回给客户端，
客户端接收到响应之后 开始发生信息给leader,leader同步给flowwer

集群出现网络隔离时:
会出现两个leader在不同的任期内，客户端发送数据给其中一个leader,
leader同步数据时，发送没有半数以上的flowwer同意，则数据不会更新。
只有发送半数以上的flowwer同意时才会更新数据。
网络隔离打开之后，任期短的将会将为flowwer。
降级leader侧的flowwer将会回滚之前未提交的数据，并匹配新leader的日志。



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
    

pause初始化了什么
pause: 1.初始化namespace    
       2.启用PID命名空间，它在每个pod中都作为PID为1进程，并回收僵尸进程

每个节点包含多少pod：
    kubernetes 为每个节点分配一个IP地址范围，即CIDR地址块。默认情况下，每个节点上pod不超过110个
    每个节点默认为110个pod，k8s为每个节点分配一个 /24 CIDR 地址块（256个地址  计算逻辑： 32-24=8 2的8次方=256）
    该地址块始终包含至少两倍于每个节点的最大pod的地址数量
    

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

mysql


主键和索引的区别
https://mp.weixin.qq.com/s/RemJcqPIvLArmfWIhoaZ1g

只有通过索引条件检索数据，InnoDB才使用行级锁，否则，InnoDB将使用表锁,行级锁都是基于索引的



```
