1.线程池
	1.1 线程的创建方式
	
	1.2 对Future了解吗
	
	1.3 线程池中提交一个任务的工作流程？ https://zhuanlan.zhihu.com/p/346255858       https://blog.csdn.net/c10WTiybQ1Ye3/article/details/109684791
	
	1.4 线程池的7种参数？
	
	1.5 实际工作场景中使用过哪种线程池？（四种线程池，newFixedThreadPool定长、newCachedThreadPool缓存、newSingleThreadExecutor单线程、newScheduledThreadPool定长定时周期）http://blog.sina.com.cn/s/blog_4d3559c70102v9z3.html
	
    https://blog.csdn.net/weixin_39613089/article/details/111800882
    
	1.6 你是怎么使用的，为什么？
	
	1.7 对 newFixedThreadPool 的使用，假如有这样一个场景，定长=5，最大=10，当任务执行结束过后，当前线程池中还有线程吗？有几个？为什么？
    newFixedThreadPool的 核心线程与最大线程数相等，只能是定长5最大5，只能创建等长的，如果任务执行结束最终会有5个核心线程存活
    
    https://baijiahao.baidu.com/s?id=1716723780904911669&wfr=spider&for=pc
    
	1.8 线程池的线程执行结束后是怎么关闭退出的？   
	
	1.9 四种拒绝策略了解吗？使用过哪几种？为什么？
	
	1.10 假如使用拒绝策略CallerRunsPolicy（由调用线程（提交任务的线程）处理该任务），线程池定长=1，如果一直不断的提交线程，总共会出现多少个线程？（n+1）
    此拒绝策略由调用线程（提交任务的线程）直接执行被丢弃的任务的 线程数满，阻塞队列满，让调用线程（提交任务的线程）直接执行此任务          =最大线程数+主线程
   
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
	
	3.4 rdis锁setNX底层怎么实现的？    SETNX KEY_NAME VALUE
	
    local ok = redis.call('setnx', key, value)
    if ok == 1 then
        redis.call('expire', key, ttl)
    end
    
    redissonlock 
    redlock红锁（多个实例   实例独立部署 没有主从关系 防止在redis集群各个节点加锁（顺序加锁）的时候，最终加完时出现锁失效的情况）
    
	3.5 为什么要使用redison？
	
	3.6 setNX和redison的区别？
	
	3.7 redis的主从复制原理？
	

4.kafka

	4.1 消息队列的名词介绍
	
	4.2 kafka消息丢失？怎么处理的？
	4.3 kafka的消息重复消费？
		 怎么保证消息的幂等性？
         生成全局唯一的id，生产者判断是否接收过，消费者判断是否消费过
	4.4 消息的可靠性怎么保证？
    https://zhuanlan.zhihu.com/p/59759422

    kafka防止消息丢失：
        生产者：多副本 ，先读到内存中，在写到磁盘中，同步到其他的副本上，同步副本完毕之后才会认为写入成功（可以通过参数设置写入规则和同步副本成功最小数），
        一个副本挂了其他副本工作，
        消费者：记录offset，topic的一个分区的消息时出现异常，会记录当前失败的offset，进行重试，可以配置重试次数和重试频次；如果重试失败会把当前消息放入到异常队列中，
        不影响其他的消息正常消费




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


事务
https://zhuanlan.zhihu.com/p/133409146


synchronized和volatile的区别
volatile不需要加锁，比synchronized更轻量级，不会阻塞线程；
从内存可见性角度，volatile读相当于加锁，volatile写相当于解锁；
synchronized既能够保证可见性，又能保证原子性，而volatile只能保证可见性，无法保证原子性

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


CountDownLatch:计数器，当计数器上的值变为0时，在CountDownLatch上的await()线程会被唤醒执行

redission：
底层加锁：判断锁是否存在，如果锁已经存在了，对比一下当前线程，如果线程数同一个，则证明可以重入，更新过期时间；如果不是当前线程，则证明锁没有释放，返回锁到期时间，加锁失败。









java锁：
    1.分类：
    (1)乐观锁：cas机制（比较并交换swap） 或者 加版本号  认为一个线程去拿数据的时候不会有其他线程对数据进行更改
        悲观所：认为一个线程去拿数据的时候一定会有其他线程对数据进行更改 synchronized
    (2)独享锁 共享锁 通过AQS（抽象队列同步器）实现
    独享锁：Reentrantlock（可重入锁） 一个线程独有   writelock是独享  synchronized
    共享锁：ReentrantReadWritelock readlock是共享锁
    AQS：如果被请求的共享资源空闲，则把当前请求共享资源的线程设置为有效线程，共享资源设置为锁定状态
    如果被请求的共享资源被占用，那么就需要一套线程阻塞以及唤醒时锁分配的机制，将获取不到锁的线程放入到阻塞队列中。由 volatile in state共享资源 + fifo等待队列组成
    (3)互斥锁 读写锁
    互斥锁：一个线程修改变量时加锁，其他线程等待   synchronized  reentrantlock
    读写锁：ReadWriteLock
    (4)可重入锁  reentrantlock synchronized
    同一个线程可以多次获取锁，state累加，获取多少次就需要释放多少次 state--
    (5)公平锁 非公平锁 https://www.zhihu.com/question/36964449
    公平锁：多个线程按照申请锁的顺序去获取锁，线程会直接进入队列去排队，永远是队列的第一位获取锁
    非公平锁：多个线程获取锁的时候，会直接尝试抢占，获取不到，会进入等待队列，如果能抢占到就直接获取锁
    公平锁和非公平锁，底层都是使用AQS来进行排队，线程被加入了等待队列之后，两者就没有区别
    区别在于新晋获取锁的线程，如果是非公平锁会有很多机会去抢占锁
    (6)分段锁
    ConcurrentHashMap 中的分段锁称为Segment，类似于HashMap（JDK7与JDK8中HashMap的实现）的结构，即内部拥有一个Entry数组，数组中的每个元素又是一个链表；同时又是一个ReentrantLock（Segment继承了ReentrantLock)。
    当需要put元素的时候，并不是对整个hashmap进行加锁，而是先通过hashcode来知道他要放在哪一个分段中，然后对这个分段进行加锁，所以当多线程put的时候，只要不是放在一个分段中，就实现了真正的并行的插入。



jvm：
    生命周期：加载、连接、初始化、使用、卸载
    类加载原理：1.将类的.class文件中的二进制读入到内存中
              2.然后将其放在运行时数据区的方法区中
              3.然后在堆中生成一个java.lang.Class对象，用来封装类在方法区内的数据结构

            类的加载机制包含加载、验证、准备、解析、初始化
            其中加载：将.class文件加载到对象中
            验证：确保加载的类符合JVM规范
            准备：正式为类变量分配内存并设置初始值
            解析：JVM常量池的符号引用转换为直接引用
            初始化：执行类的构造方法
            jvm的运行时数据区分为本地方法栈、程序计数器、元空间、堆、虚拟机栈、等

    https://www.sohu.com/a/254731966_465221
    https://zhuanlan.zhihu.com/p/99205555
    https://baijiahao.baidu.com/s?id=1717450810529278505&wfr=spider&for=pc
    https://blog.csdn.net/weixin_38569499/article/details/103735948

    jvm内存：
        线程私有：
            程序计数器：指向虚拟机字节码指令的位置 
            栈内存：栈内存和线程的生命周期相同
            本地方法栈：本地方法调用jni
        线程共享
            方法区：永久代 运行时常量池
            堆内存：存储对象或者数组 
                新生代 1/3（eden survivor0 s1 比例是8:1:1）     响应时间优先的应用，减少系统的响应时间，减少到达年老代的对象；吞吐量优先的应用大年轻代，较小的年老代
                老年代 2/3
        直接内存：不受 jvm gc 管理

        GC：
            Minor GC：eden区满触发 复制算法（eden区和survivor from区的对象复制到survicor to上，如果有对象年龄达到了老年标准则直接放入到老年代；放入survivor to时会把这些对象的年龄+1，空间不足直接放入老年代；清空eden和survivor from,随后from和to互换空间）
            Major GC：当老年代空间不足时触发 标记-清除算法（扫描老年代所有对象，标记存活对象，回收未标记的对象）
            Full  GC：系统gc 老年代空间不足 方法区空间不足

redis mysql数据一致性的思考
https://www.zhihu.com/question/319817091

多线程：
    多线程的状态：新建 就绪 运行 阻塞 死亡
        新建：线程对象创建（）
        就绪：调用线程的start方法启动，等待cpu调度执行
        运行：线程执行中
        阻塞：执行到某个地方需要获取资源时，但是被其他人抢走锁定了，放弃了对cpu的使用权，等待锁释放继续执行
        死亡：执行完或者异常退出
    任务提交到线程，怎么执行：
        1.判断线程池的核心线程是否已满，不满开启核心线程工作
        2.判断工作队列是否已满，不满则加入到工作队列中 （4种工作队列）
        3.判断最大线程是否已满，不满新建线程执行，满了则执行饱和策略（4种饱和策略）












cephfs致力于文件系统接口，cephfs选择以目录树的形式内存管理和使用元数据信息
mds每次针对目录树的操作都是先写日志，再修改内存目录树结构，最后将修改的结果落盘
目录树的三个关键数据结构  inode dentry 和 dir
    inode: 存储具体文件和目录的元信息，inode是用来在metapool或datapool中查找对应的对象 （dir 或 文件）
    dentry：存储的是文件或目录的名字，用来连接inode和dir
    dir：通过items map记录自己管理的目录项dentry，且拥有一个和自己相连接的inode，通过inode可以继续向上回溯目录树

CephFS为什么需要部署MDS以及MDS的作用：
        1.1.启用CephFS接口需要在基础的Rados-Cluster存储集群之上需要额外运行一个MDS（Metadata-Server元数据服务器）的守护进程，由于Rados-Cluster本身就是一个对象存储服务，Rados-Cluster是没办法分开管理上面所说的传统文件系统中的数据和元数据的功能；
        1.2.因此MDS是专用于模拟传统文件系统所应该具有的将数据和元数据分离存储的方式而专门提供的一个守护进程服务。而且MDS只用来管理元数据；CephFS依赖于专用的MDS（MetaData-Server）组件管理元数据信息并向客户端输出一个倒置的树状层级结构： 
            1.将元数据先缓存于MDS的内存中然后再同步到Metadatapool,可以加快元数据的访问
            2.将cephfs的元数据的更新日志journal流式化后存储在RADOS集群上，journal日志是用来恢复mds里的元数据缓存。
            3.重启mds的时候会通过replay的方式从osd上加载之前缓存的元数据
            4.保存了文件系统的元数据(对象里保存了子目录和子文件的名称和inode编号)
        1.3.客户端(ceph.ko)-->MDS-->Rados-Cluster
            客户端要想使用ceph文件系统接口，内核级必须有对应的文件系统模块与之支持也就是ceph.ko模块，ceph.ko作为客户端每一次访问文件时必须基于套接字先连入到MDS来获取、返回文件的inode元数据信息，然后ceph.ko再到Rados-Cluster上以对象的方式把对象模拟成传统文件系统的"块"来加载文件的数据完成文件存取操作。



CephFS需要元数据存储池(metadatapool)和数据存储池(datapool)
        1.不管是RBD、CephFS、RadosGW，在Ceph（Rados-Cluster）上所有数据都应该先放在存储池pool中再映射到OSD上，而CephFS文件系统管理其数据和元数据时是分别放置在不同的存储池中进行的；
        2.Metadata Pool
            1.所有的元数据都是由MDS守护进程管理的，可以理解为：MDS作为客户端连入Rados-Cluster的CephFS的metadata-pool存储池存储元数据；
            2.而元数据是一类很密集的IO访问，需要占用的空间不大，但是对于性能的要求比较高，所以Metadata-Server会在本地使用内存当做高速缓存，所有操作都先在内存中完成，一段时间后再同步到MetadataPool当中实现元数据存储的.
        3.datapool
            数据直接写入datapool存储池
        4.需要注意的是：CephFS的Matadatapool一定只能被MDS访问（客户端是不能直接访问的），客户端对元数据的访问必须经由MDS来实现：
            当客户端打开一个数据时，它首先会向MDS请求此数据的inode,inode信息会告诉客户端此数据所有对象存放datapool中的位置和编号，然后客户端基于编号就可以加载到所有对象并访问到数据了。


大家好，我叫xxx，2017年毕业于山东师范大学
2016年11月份开始实习，正式工作于2017年到至今
其中2016年-2018年参与联通存量营销项目的开发
2018年开始接触云相关知识，为了解决公司云计算产品交付和实施遇到的一些问题，规范设计了k8s部署架构，开发了一套自动化部署集群的系统boots
2019-2020年基于k8s-dashboard、harbor等开源产品的了解和调研，集成相关产品开发的一套方便研发人员快速构建镜像，发布服务的私有云平台。
2020年至现在，负责仓储自动化运维平台的开发和问题处理。同时目前还在参与告警平台的开发。

