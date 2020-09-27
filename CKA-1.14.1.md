

# zCKA认证-1.14.1【考纲】

相关教程：

- kubernetes官网
- 别人总结的知识点1：https://kubectl.docs.kubernetes.io/pages/app_management/labels_and_annotations.html
- 别人总结的知识点2：https://www.cnblogs.com/zhenyuyaodidiao/p/6502171.html
- 别人总结的知识点3：https://jimmysong.io/kubernetes-handbook/cloud-native/cloud-native-definition.html
- 别人总结的知识点4：https://lentil1016.cn/
- 别人总结的cka1：https://jamesstrong.dev/post/passcka/
- 别人总结的cka2：https://github.com/walidshaari/Kubernetes-Certified-Administrator
- 别人总结的cka3：https://github.com/David-VTUK/CKA-StudyGuide
- 别人总结的cka4：https://github.com/dgkanatsios/CKAD-exercises
- 别人总结的cka5：https://www.cnblogs.com/haoprogrammer/p/11134134.html
- cka练习题1：https://github.com/dgkanatsios/CKAD-exercises
- cka练习题2：https://github.com/stretchcloud/cka-lab-practice
- cka练习题3：https://blog.csdn.net/deerjoe/article/details/86300826
- cka练习题4：https://blog.spider.im/post/cka-exam/
- cka练习题5：http://ljchen.net/2018/11/07/CKA%E8%80%83%E8%AF%95%E7%9F%A5%E8%AF%86%E6%80%BB%E7%BB%93/
- 部署prometheus-operator监控：http://www.rhce.cc/1645.html


练习的步骤：

1. 明确提纲，`好好看本文档就可以了`
2. 熟悉官方文档，`能根据问题在文档上找到答案`
3. 至少手动安装3遍集群，掌握kubkeadm命令，详细了解集群架构，详细了解集群的认证授权
   - kubernetes游乐场(可自由练习命令的网页)：https://www.katacoda.com/courses/kubernetes/networking-introduction
   - Minikube练习kubectl命令：https://github.com/kubernetes/minikube/
   - GKE谷歌云：https://cloud.google.com/kubernetes-engine/docs/quickstart
   - k8s集群搭建1(最权威)：https://github.com/kelseyhightower/kubernetes-the-hard-way
   - k8s集群搭建2：https://github.com/opsnull/follow-me-install-kubernetes-cluster
4. 熟练掌握kubectl所有命令，掌握yaml结构，多手动起些服务练习。
   - kubectl命令备忘单：https://kubernetes.io/docs/reference/kubectl/cheatsheet/
5. 对照知识点仔细学习，并仔细想想可能出的考题。
6. 网上找例题，不看解答去做题
7. 再熟悉一下官网文档内容和考纲
8. 上述过程中会涉及到很多英文，好好熟悉常用英文单词

考试信息：

- 考试环境：
  - 3小时
  - 24个问题
  - 远程监管
  - Chrome浏览器和扩展程序
  - 政府签发的未过期身份证
  - 网络摄像头和麦克风
  - 很可能是ubuntu系统

小技巧：

- 在考试中使用最多的命令就是`kubectl run`，使用如下的参数后就可以生成pod的基础模板。注意`--restart=Never`，如果不加这个选项或者`--restart=Always`就会生成deployment的模板，`--restart=OnFailure`则生成job模板。如：`kubectl run nginx --image=nginx --restart=Never --dry-run -oyaml`
- 使用`kubectl explain`去查找yaml中的关键词及其值，比如先查找spec，然后再去看volumes的解释，就可以知道如何在yaml中定义volumes。如：`kubectl explain pod.spec`，`kubectl explain pod.spec.volumes`
- 考试中有多个集群，每道题都会提示切换context的命令，一多半题是在一个集群中完成了，但最好还是在每题开始时跑一下切换context的命令，养成习惯，不然可能会出现有些题目中的资源就是找不到，花了不少时间发现原来是在错误的集群中。有一些题要去集群中的节点排查问题，完成后注意退出，否则也会出现资源找不到的情况。

> 只需要在网址前加上`v1-14.docs.`就可以查看1.14版本的文档，如：`https://v1-14.docs.kubernetes.io/zh/docs/concepts/workloads/controllers/daemonset/`
>
> 在`kubernetes.io`后面加上`zh`，就可以查看中文文档，如：`https://kubernetes.io/zh/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/`
>
> 每定位到一片文章后，最好把同级目录的其他文档都看一下

## 1 Scheduling【调度】- 5%

1. Use label selectors to schedule Pods.

   - **使用标签选择器 调度POD**
   - 知识点
     - `标签和标签选择器`：https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/
     - `schedule`https://kubernetes.io/docs/concepts/scheduling/kube-scheduler/

2. Understand the role of DaemonSets.

   - **理解ds的role(权限/角色/如何调度)**
   - 知识点
     - `schedule`https://kubernetes.io/docs/concepts/scheduling/kube-scheduler/
     - `DaemonSets`：https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/

3. Understand how resource limits can affect Pod scheduling.

   - **理解资源限制是如何影响pod调度的**
   - 知识点
     - `调度框架`：https://kubernetes.io/docs/concepts/configuration/scheduling-framework/
     - `schedule`https://kubernetes.io/docs/concepts/scheduling/kube-scheduler/
     - `资源限制`：https://kubernetes.io/docs/concepts/policy/limit-range/
     - `资源管理`：https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/
     - `配置资源限制`：https://kubernetes.io/docs/tasks/administer-cluster/manage-resources/memory-default-namespace/
     - `资源限制与调度`：https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/

4. Understand how to run `multiple schedulers` and how to configure Pods to use them.

   - **理解如何运行多套调度器(自定义调度器/默认调度器)，如何给pod配置指定调度器**
   - 知识点
     - `配置多个调度程序`：https://kubernetes.io/docs/tasks/administer-cluster/configure-multiple-schedulers/
     - `高级调度`：https://kubernetes.io/blog/2017/03/advanced-scheduling-in-kubernetes/

5. Manually schedule a pod without a `scheduler`

   - **不通过默认调度器 使用自定义调度器调度一个pod**
   - **不使用任何调度器指定pod所落节点**
   - 知识点
     - `高级调度`：https://kubernetes.io/blog/2017/03/advanced-scheduling-in-kubernetes/
     - `调度配置`：https://kubernetes.io/docs/concepts/configuration/assign-pod-node/

6. Display `scheduler` events.

   - **查看调度器的事件**
   - 知识点
     - `kubectl命令`：https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
     - `event`：https://v1-14.docs.kubernetes.io/docs/reference/generated/kubernetes-api/v1.14/#event-v1-core

7. Know how to configure the Kubernetes `scheduler`.

   - **理解如何配置k8s的调度器**
   - 知识点
     - `调度框架`：https://kubernetes.io/docs/concepts/configuration/scheduling-framework/
     - `schedule`https://kubernetes.io/docs/concepts/scheduling/kube-scheduler/
     - `kube-scheduler参数`：https://v1-14.docs.kubernetes.io/docs/reference/command-line-tools-reference/kube-scheduler/
     - `调度配置`：https://kubernetes.io/docs/concepts/configuration/assign-pod-node/
     - `调度Tuning`：https://kubernetes.io/docs/concepts/scheduling/scheduler-perf-tuning/
     - `add-on组件的调度配置`：https://kubernetes.io/docs/tasks/administer-cluster/guaranteed-scheduling-critical-addon-pods/

## 2 Logging/Monitoring 【日志/监控】- 5%

1. Understand how to monitor all `cluster components`.

   - **如何监控所有的集群组件**

2. Understand how to monitor `applications`.

   - **如何监控应用**

3. Manage `cluster component` logs.

   - **管理集群组件日志**

4. Manage application logs.

   - **管理应用日志**

知识点

- `监控指南`：https://kubernetes.io/blog/2017/05/kubernetes-monitoring-guide/
- `监控和日志`：https://kubernetes.io/zh/docs/tasks/debug-application-cluster/

## 3 Application Lifecycle Management 【应用生命周期管理】- 8%

我认为应用就是你打算用k8s集群管理的服务。

1. Understand Deployments and how to perform rolling updates and rollbacks

   - **理解deploy 是 如何 执行 滚动升级和回滚**
   - 知识点
     - `deploy概念`：https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
     - `滚动升级概念`：https://kubernetes.io/docs/tutorials/kubernetes-basics/update/update-intro/
     - `通过rc进行滚动升级`：https://kubernetes.io/docs/tutorials/kubernetes-basics/update/update-intro/
     - `ds的滚动升级(可以参考)`：https://kubernetes.io/docs/tasks/manage-daemon/update-daemon-set/
     - `ds的回滚(可以参考)`：https://kubernetes.io/docs/tasks/manage-daemon/rollback-daemon-set/
     - `pod的生命周期`：https://kubernetes.io/zh/docs/concepts/workloads/pods/pod-lifecycle/

2. Know various ways to configure applications

   - **通过不同的方式去配置应用(controller：deploy/ds/rc...)**

   - **通过不同的方式去配置应用(kubectl：yaml/edit/explain...)**

   - 知识点

     - `ReplicaSet`：https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/
- `rc`：https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/
     - `daemonset`：https://kubernetes.io/zh/docs/concepts/workloads/controllers/daemonset/
- `deployments`：https://kubernetes.io/zh/docs/concepts/workloads/controllers/deployment/
     - `jobs`：https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/
- `corn job`：https://kubernetes.io/zh/docs/concepts/workloads/controllers/cron-jobs/
     - `StatefulSets`：https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/
- `kubectl`：https://kubernetes.io/docs/reference/kubectl/kubectl/
  
3. Know how to scale applications

   - **手动伸缩应用(调整副本数：deploy，rs，rc，Job)**
   - 知识点
     - `statefulset的伸缩`：https://kubernetes.io/docs/tasks/run-application/scale-stateful-set/
     - `scale命令`：https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#scale

4. Understand the primitives necessary to create a self-healing application.

   - **如何创建自愈应用(应该是应用级别的高可用)**
   - **auto-placement, auto-restart, auto-replication, auto-scaling**
   - 知识点
     - `和pod生命周期同级的最好都看`
     - `pod的生命周期(包括restart策略)`：https://kubernetes.io/zh/docs/concepts/workloads/pods/pod-lifecycle/
     - `水平自动伸缩`：https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/
     - `水平自动伸缩例子`：https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

## 4 Cluster 【集群】- 10%

1. Understand Kubernetes cluster upgrade process.

   - **理解k8s集群的升级历史**
   - 知识点
     - `kubeadm升级`：https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/
     - `kubeadm upgrade phase命令`：https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-upgrade-phase/

2. Facilitate operating system upgrades.

   - **如何使集群升级变得简单(或者是)**
   - 知识点
     - `集群管理`：https://kubernetes.io/docs/tasks/administer-cluster/cluster-management/
     - `kubeadm upgrade命令`：https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-upgrade/
     - `kubeadm upgrade phase命令`：https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-upgrade-phase/

3. Implement backup and restore methodologies. 

   - 备份和恢复策略 ETCD  
   - 知识点
     - `etcd集群管理`：https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/
     - `etcd备份恢复`：https://v1-14.docs.kubernetes.io/zh/docs/getting-started-guides/ubuntu/backups/

## 5 Security 【安全】- 12%

1. Know how to configure authentication and authorization.

   - **理解如何配置认证和授权**
   - 知识点
     - `集群安全`：https://kubernetes.io/docs/tasks/administer-cluster/securing-a-cluster/
     - `api访问控制`：https://kubernetes.io/docs/reference/access-authn-authz/controlling-access/
     - `authentication 认证`  `authorization 授权`
     - `认证`：https://kubernetes.io/docs/reference/access-authn-authz/authentication/
     - `认证(bootstrap token)`：https://kubernetes.io/docs/reference/access-authn-authz/bootstrap-tokens/
     - `授权概述`：https://kubernetes.io/docs/reference/access-authn-authz/authorization/
     - `RBAC授权(基于role)`：https://kubernetes.io/docs/reference/access-authn-authz/rbac/
     - `ABAC授权(基于attribute)`：https://kubernetes.io/docs/reference/access-authn-authz/abac/
     - `节点授权`：https://kubernetes.io/docs/reference/access-authn-authz/node/
     - `kubelet认证授权`：https://kubernetes.io/docs/reference/command-line-tools-reference/kubelet-authentication-authorization/
     - `准入控制`：https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/
     - `准入控制器指南`：https://blog.csdn.net/weixin_44100234/article/details/88793214
     - `webhook(了解下没坏处)`：https://kubernetes.io/docs/reference/access-authn-authz/webhook/

2. Understand Kubernetes security primitives.

   - **理解k8s 内部安全机制**
   - 知识点
     - `安全介绍`：https://kubernetes.io/docs/concepts/security/
     - `pod安全策略`：https://kubernetes.io/docs/concepts/policy/pod-security-policy/
     - `pod安全策略RBAC示例`：https://github.com/kubernetes/examples/blob/master/staging/podsecuritypolicy/rbac/README.md
     - `安全策略实践`：https://kubernetes.io/blog/2016/08/security-best-practices-kubernetes-deployment/
     - `service account`：https://kubernetes.io/docs/reference/access-authn-authz/service-accounts-admin/
     - `secret`：https://kubernetes.io/zh/docs/concepts/configuration/secret/

3. Know to configure network policies.

   - **如何配置网络策略**
   - 知识点
     - `网络策略`：https://kubernetes.io/docs/concepts/services-networking/network-policies/
     - `网络插件`：https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins/
     - `集群网络`：https://kubernetes.io/docs/concepts/cluster-administration/networking/
     - `安装网络策略提供者(如：calico)`：https://kubernetes.io/zh/docs/tasks/administer-cluster/network-policy-provider/
     - `免费网上练习网络策略`：https://www.katacoda.com/courses/kubernetes/networking-introduction

4. Create and manage TLS certificates for cluster components.

   - **为集群组件创建和管理 TLS 证书**
   - 知识点
     - `管理tls证书`：https://kubernetes.io/docs/tasks/tls/managing-tls-in-a-cluster/

5. Work with images securely

   - **镜像安全策略**
   - 知识点
     - `secret`：https://kubernetes.io/docs/concepts/configuration/secret/
     - `imagePullSecrets`：https://kubernetes.io/docs/concepts/containers/images/#specifying-imagepullsecrets-on-a-pod
     - `添加imagePullSecrets到service account`：https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/#add-imagepullsecrets-to-a-service-account

6. Define `security contexts`.

   - **定义安全的上下文(pod&container的访问控制)**

   - 知识点
     - `给pod和container设置securityContext`：https://kubernetes.io/docs/tasks/configure-pod-container/security-context/
     - `PodSecurityPolicy&sysctl`：https://kubernetes.io/zh/docs/tasks/administer-cluster/sysctl-cluster/

7. Secure persistent key value store

   - **安全持久的键值对存储**
   - 知识点
     - `secrets`：https://kubernetes.io/docs/concepts/configuration/secret/
     - `通过rest方式加密secret数据`：https://kubernetes.io/docs/tasks/administer-cluster/encrypt-data/

## 6 Storage 【存储】- 7%

1. Understand persistent volumes and know how to create them

   - **理解并创建持久卷**
   - 知识点
     - `持久化存储`：https://kubernetes.io/docs/concepts/storage/persistent-volumes/
     - `给pod配置持久化存储`：https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/
     - `本地持久卷(与hostpath不同)`：https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/
     - `用持久卷搭建mysql和wordpress`：https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/

2. Understand `access modes` for volumes

   - **理解卷的访问模式(可读可写只读)**
   - 知识点
     - `accessMode`：`ReadWriteOnce(RWO：单节点读写挂载)`，`ReadOnlyMany(ROX：单节点只读挂载)`，`ReadWriteMany(RWX：多节点读写挂载)`
     - `持久卷(里面有Access Modes的定义)`：https://kubernetes.io/docs/concepts/storage/persistent-volumes/


3. Understand `persistent volume claims` primitive.

   - **理解 pvc 的机制**
   - 知识点
     - `持久卷(里面有p v claims的定义)`：https://kubernetes.io/docs/concepts/storage/persistent-volumes/
     - `用pvc调整持久卷大小`：https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/

4. Understand Kubernetes storage objects.

   - **理解k8s 内部有几种存储对象(configmap/secert)**
   - 知识点
     - `volumes`：https://kubernetes.io/docs/concepts/storage/volumes/#storageos
     - `pv`：https://kubernetes.io/docs/concepts/storage/persistent-volumes/
     - `storage class`：https://v1-12.docs.kubernetes.io/docs/concepts/storage/storage-classes/

5. Know how to configure applications with persistent storage.

   - **如何给应用配置持久化存储**
   - 知识点
     - `给pod配置持久化存储`：https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/
     - `持久化存储&非持久化存储`：https://www.hi-linux.com/posts/14136.html

## 7 Troubleshooting 【故障排除】- 10%

1. Troubleshoot application failure.

   - **排除应用故障**
   - 知识点
     - `应用故障`：https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application/
     - `调试初始化容器`：https://kubernetes.io/docs/tasks/debug-application-cluster/debug-init-containers/
     - `调试pod和rc`：https://kubernetes.io/docs/tasks/debug-application-cluster/debug-pod-replication-controller/

2. Troubleshoot control plane failure.

   - **排除核心组件的故障**
   - 知识点
     - ``集群故障``：https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/
     - ``kubernetes故障排除``：https://linkerd.io/2/tasks/troubleshooting/

3. Troubleshoot worker node failure.

   - **排除工作节点的故障**
   - 知识点
     - ``集群故障``：https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/
     - ``用crictl调试节点``：https://kubernetes.io/docs/tasks/debug-application-cluster/crictl/

4. Troubleshoot networking.

   - **排除网络故障**
   - 知识点
     - ``集群网络``：https://kubernetes.io/docs/concepts/cluster-administration/networking/
     - ``调试dns``：https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/
     - ``验证ipv4/ipv6``：https://kubernetes.io/docs/tasks/network/validate-dual-stack/
     - ``网络故障排除1``：https://blog.appoptics.com/how-to-troubleshoot-kubernetes-network-issues/
     - ``网络故障排除2``：https://gravitational.com/blog/troubleshooting-kubernetes-networking/
     - ``检查kubernetes网络``：https://www.digitalocean.com/community/tutorials/how-to-inspect-kubernetes-networking

## 8 Core Concepts 【核心概念】- 19%

https://kubernetes.io/docs/concepts/

1. Understand the Kubernetes API primitives

   - **理解 Kubernetes 原生API**
   - 知识点
     - `kubernetes api概述`：https://kubernetes.io/docs/reference/using-api/api-overview/
     - `kubernetes对象`：https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/
     - `kubernetes api`：https://kubernetes.io/docs/concepts/overview/kubernetes-api/#api-groups
     - `访问api`：https://kubernetes.io/docs/reference/access-authn-authz/controlling-access/

2. Understand the Kubernetes cluster architecture

   - **理解 k8s 集群架构**
   - 知识点
     - `kubernetes组件`：https://kubernetes.io/docs/concepts/overview/components/
     - `nodes`：https://kubernetes.io/docs/concepts/architecture/
     - `master&node通信`：https://kubernetes.io/docs/concepts/architecture/master-node-communication/
     - `控制器`：https://kubernetes.io/docs/concepts/architecture/controller/
     - `CCM`：https://kubernetes.io/docs/concepts/architecture/controller/

3. Understand Services and other network primitives.

   - **理解 svc，loadbalancing和networking**
   - 知识点
     - `service`：https://kubernetes.io/zh/docs/concepts/services-networking/service/
     - `endpoint`：https://kubernetes.io/zh/docs/concepts/services-networking/endpoint-slices/
     - `dns`：https://kubernetes.io/zh/docs/concepts/services-networking/dns-pod-service/
     - `ingress`：https://kubernetes.io/zh/docs/concepts/services-networking/ingress/
     - `NetworkPolicy`：https://kubernetes.io/zh/docs/concepts/services-networking/network-policies/
     - `service`：https://kubernetes.io/docs/concepts/services-networking/service/

## 9 Networking 【网络】- 11%

1. Understand the networking configuration on the cluster nodes.

   - **理解集群节点的网络配置**
   - 知识点
     - `集群网络`：https://kubernetes.io/docs/concepts/cluster-administration/networking/
     - `kubelet配置，kube-proxy配置`
     - `理解和设置网络`：https://dzone.com/articles/how-to-understand-and-setup-kubernetes-networking
     - https://kubernetes.io/docs/concepts/architecture/nodes/

2. Understand Pod networking concepts.

   - **理解POD 的网络概念**
   - 知识点
     - `pods`：https://kubernetes.io/docs/concepts/workloads/pods/pod/
     - `pod和svc的dns`：https://kubernetes.io/zh/docs/concepts/services-networking/dns-pod-service/
     - `pod与(sandbox，svc的endpoint)？`

3. Understand service networking.

   - **理解svc 的网络**
   - 知识点
     - `svc`：https://kubernetes.io/zh/docs/concepts/services-networking/service/
     - `pod和svc的dns`：https://kubernetes.io/zh/docs/concepts/services-networking/dns-pod-service/
     - https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies

4. Deploy and configure network load balancer.

   - **安装配置网络负载均衡器**
   - 知识点
     - `创建loadbalancer`：https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/
     - `提供loadbalancer访问pod`：https://kubernetes.io/zh/docs/tasks/access-application-cluster/load-balance-access-application-cluster/

5. Know how to use Ingress rules.

   - **如何使用ingress 规则 配置**
   - 知识点
     - `ingress`：https://kubernetes.io/zh/docs/concepts/services-networking/ingress/
     - `ingress控制器`：https://kubernetes.io/zh/docs/concepts/services-networking/ingress-controllers/
     - https://kubernetes.io/docs/concepts/services-networking/ingress/

6. Know how to configure and use the cluster DNS.

   - **如何配置和使用集群的集群dns**
   - 知识点
     - `pod和svc的dns`：https://kubernetes.io/zh/docs/concepts/services-networking/dns-pod-service/
     - `dns自动伸缩`：https://v1-14.docs.kubernetes.io/zh/docs/tasks/administer-cluster/dns-horizontal-autoscaling/
     - `core-dns介绍`：https://kubernetes.io/docs/tasks/administer-cluster/coredns/
     - `core-dns配置`：https://kubernetes.io/docs/tasks/federation/set-up-coredns-provider-federation/
     - `kube-dns`：https://kubernetes.io/zh/docs/tasks/administer-cluster/dns-custom-nameservers/
     - https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/

7. Understand CNI.

   - **理解CNI网络插件**
   - 知识点
     - `cni的概念`：https://github.com/containernetworking/cni
     - `了解cni`：http://www.dasblinkenlichten.com/understanding-cni-container-networking-interface/
     - `网络插件`：https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins/
     - `calico`：https://kubernetes.io/docs/tasks/administer-cluster/network-policy-provider/calico-network-policy/

## 10 Installation,Configuration&Validation 【安装，配置和验证】- 12%

强烈推荐的安装教程：https://github.com/kelseyhightower/kubernetes-the-hard-way

1. Design a Kubernetes cluster.

   - **设计一个k8s 集群**
   - 知识点
     - `搭建自定义集群(1.9)`：https://k8smeetup.github.io/docs/getting-started-guides/scratch/
     - https://kubernetes.io/docs/concepts/cluster-administration/cluster-administration-overview/#planning-a-cluster

2. Install Kubernetes masters and nodes.

   - **安装master 和 node**
   - 知识点
     - `配置kubelet`：https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/kubelet-integration/
     - `kubeadm创建单master`：https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/kubelet-integration/
     - `kubeadm引导安装集群`：https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
     - `TLS BOOTSTRAP`：https://kubernetes.io/docs/reference/command-line-tools-reference/kubelet-tls-bootstrapping/

3. Configure secure cluster communications.

   - **配置安全的集群通信**
   - 知识点
     - `节点通信`：https://kubernetes.io/docs/concepts/architecture/master-node-communication/
     - `管理集群的TLS证书`：https://kubernetes.io/docs/tasks/tls/managing-tls-in-a-cluster/

4. Configure a Highly-Available Kubernetes cluster.

   - **配置高可用的集群**
   - 知识点
     - `kubeadm创建高可用集群`：https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/high-availability/
     - `高可用etcd`：https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/setup-ha-etcd-with-kubeadm/

5. Know where to get the Kubernetes release binaries.

   - **知道在哪儿找k8s 二进制发布版本**
   - 知识点
     - `从kubernetes.io下二进制`：https://kubernetes.io/docs/setup/release/notes/#downloads-for-v1-16-0
     - `最好把getting started都看看`

6. Provision underlying infrastructure to deploy a Kubernetes cluster.

   - **提供底层的基础设施去部署一个k8s 集群**
   - 知识点
     - `gcp谷歌云平台`：https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/f9486b081f8f54dd63a891463f0b0e783d084307/docs/01-infrastructure-gcp.md
     - https://kubernetes.io/docs/setup/learning-environment/minikube/
     - https://kubernetes.io/fr/docs/setup/

7. Choose a network solution.

   - **选择一个网络解决方案**
   - 知识点
     - `集群网络`：https://kubernetes.io/docs/concepts/cluster-administration/networking/
     - `安装add-on`：https://kubernetes.io/docs/concepts/cluster-administration/addons/

8. Choose your Kubernetes infrastructure configuration.

   - **选择你的k8s 架构配置**
     - 知识点
       - `control-plane 3组件 的配置`
       - https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/#instructions

9. Run end-to-end tests on your cluster.
   - **在集群上运行一个端到端的测试**
   - 知识点
     - `端到端`：https://kubernetes.io/blog/2019/03/22/kubernetes-end-to-end-testing-for-everyone/
     - https://blog.csdn.net/weixin_44100234/article/details/88841137
     - https://v1-12.docs.kubernetes.io/docs/getting-started-guides/ubuntu/validation/
     - https://jaas.ai/kubernetes
     - https://github.com/kubernetes/kubernetes/tree/master/hack/e2e-internal
     - 简单的测试命令：
       ```shell
       kubectl cluster-info
       kubectl get nodes
       kubectl get cs
       kubectl get pods -o wide --show-labels --all-namespaces
       kubectl get svc  -o wide --show-labels --all-namespaces
       ```

10. Analyse end-to-end tests results.

    - **分析端到端的测试结果**
    - 知识点
      - `验证端到端`：https://k8smeetup.github.io/docs/getting-started-guides/ubuntu/validation/
      - https://v1-12.docs.kubernetes.io/docs/getting-started-guides/ubuntu/validation/#end-to-end-testing
      - https://kubernetes.io/blog/2019/03/22/kubernetes-end-to-end-testing-for-everyone/

11. Run Node end-to-end tests.

    - **在节点上运行端到端测试**
    - 知识点
      - `端到端`：https://kubernetes.io/blog/2019/03/22/kubernetes-end-to-end-testing-for-everyone/
      - `端到端测试`：https://kubernetes.io/blog/2016/06/bringing-end-to-end-testing-to-azure/
      - `e2e`：https://github.com/kubernetes/kubernetes/tree/master/test/e2e

12. Install and use kubeadm to install, configure, and manage Kubernetes clusters.

    - **使用kubeadm 安装配置管理集群**
    - 知识点
      - `kubeadm系列命令`：https://kubernetes.io/zh/docs/reference/setup-tools/kubeadm/kubeadm/