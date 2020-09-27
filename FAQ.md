## 目录


*   [注意事项](#101)
*   [网络问题](#102)
    1.  [查询默认路由](#10201)
    2.  [添加默认路由](#10202)
    3.  [添加域名解析](#10203)
    4.  [清理iptables](#10204)
    5.  [清理网卡设置](#10205)
*   [设备操作](#103)
    1.  [LVM创建](#10301)
    2.  [LVM拓展](#10302)
    3.  [清理分区](#10303)
    4.  [thinpool](#10304)
    5.  [LVM扩容](#10305)
    6.  [pv迁移](#10306)
*   [代理方案](#104)
    1.  [NG代理](#10401)
*   [常用命令](#105)
    1.  [k8s相关](#10501)
    2.  [docker相关](#10502)
    3.  [harbor相关](#10503)
*   [数据处理](#106)
    1.  [数据清理](#10601)
*   [其他]()
    1.  [README.md](?README.md)
    2.  [CKA-1.14.1.md](?CKA-1.14.1.md)
    3.  [安装手册](v1/env/faqs/安装手册.pdf)
    4.  [使用手册](v1/env/faqs/使用手册.pdf)

* * *


## 注意事项
    
1. 节点的IP 为静态IP
2. 节点需要配置NTP
3. 关闭防火墙和iptables服务
4. centos7.6 base源
5. 具有sudo权限的安装用户
6. 3.10.0-957.5.1.el7.x86_64 或者以上系统内核
7. /etc/resolv.conf  内部最多有三个可用的nameserver
8. 节点必须配置默认路由
9. python 版本: 2.7.x  [ceph 依赖]


## 网络问题


### 查询默认路由

1. 例：你的ip为 `192.168.3.1`，以下则为查询默认路由的命令


    [root@docker19 ~]# ip a | grep 192.168.3.1 | awk '{print $NF}'
    bond0
    [root@xxx ~]# ip route show | grep bond0 | grep default
    default via 192.168.3.254 dev bond0 


2. 查询默认路由也可通过  `route -n` 查看


### 添加默认路由

1. 添加默认路由命令为：[网关地址: `x.x.x.x`]
    
    
    route add -net 0.0.0.0 netmask 0.0.0.0 gw x.x.x.x   
   
### 添加域名解析

1. 修改ConfigMap `coredns`  根域名: `cop.com`  


    Corefile: |
      .:53 {
          errors
          health
          log
          kubernetes cluster.local in-addr.arpa ip6.arpa {
             pods insecure
             upstream
             fallthrough in-addr.arpa ip6.arpa
          }
          file /etc/coredns/zones/cop.com cop.com
          prometheus :9153
          forward . /etc/resolv.conf
          cache 30
          loop
          reload 6s
          loadbalance
      }
          
    Ingressfile: |
      $ORIGIN cop.com.
      @   3600 IN	SOA sns.dns.icann.org. noc.dns.icann.org. (
                      2017042745 ; serial
                      7200       ; refresh (2 hours)
                      3600       ; retry (1 hour)
                      1209600    ; expire (2 weeks)
                      3600       ; minimum (1 hour)
                      )
      
      *       IN A     ingress-controller IP1
              IN A     ingress-controller IP2
              IN A     ingress-controller IP3

2. 添加挂载 deploy `coredns`


        volumeMounts:
        - mountPath: /etc/coredns/Corefile
          name: config-volume
          subPath: Corefile
        - mountPath: /etc/coredns/zones/cop.com
          name: config-volume
          subPath: cop.com


      - configMap:
          defaultMode: 420
          items:
          - key: Corefile
            path: Corefile
          - key: Ingressfile
            path: cop.com
          name: coredns
        name: config-volume

3. 验证 dns 解析


    kubectl exec -i -n bcos `kubectl get po -n bcos -ojsonpath={.items[0].metadata.name}` ping bcos.cop.com
        

### 清理iptables


    iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X
    
    
### 清理网卡设置


    ip link show | grep -E 'br-|flannel|cali' | awk '{print $2}' | cut -d: -f1 | while read line; do ip link delete $line; done
    
## 设备操作


### LVM创建
    
1. 创建pv [设备: `/dev/sdb1`]


    pvcreate  /dev/sdb1      
2. 创建vg [VG名: `vgname`]


    vgcreate vgname /dev/sda5
3. 创建lv [LVM名: `lvname`]
    

    lvcreate -l 100%VG vgname -n lvname
4. 创建文件系统 [文件系统: `xfs`]


    mkfs.xfs -f /dev/mapper/vgname-lvname
5. 挂载lv [挂载路径: `/mnt_path`]


    mount /mnt_path /dev/mapper/vgname-lvname


### LVM拓展

1. 创建pv [设备: `/dev/sdb2`]


    pvcreate /dev/sdb2
2. 拓展vg [VG名: `vgname`]


    vgextend vgname /dev/sdb2
3. 拓展lv [LVM名: `lvname`]


    lvextend -L +300G /dev/vgname/lvname
4. 挂载生效 [挂载路径: `/mnt_path`]


    xfs_growfs /mnt_path


### 清理分区



1. 停掉使用分区上的服务,并设置设备变量 例如：`/dev/sdc1`

    
    dev_name='/dev/sdc1'

2. 取消挂载   `mount 需要清理的分区`


    mounts=`lsblk -bln ${dev_name}  | awk '{ print $7 }' | sort | uniq`;
    
    for mount in $mounts; do \
        echo "umount $mount"; \
        umount $mount; \
        sed -i 's|^.*"'${mount}'".*$|#&|g' /etc/fstab; \
    done
    
3. 清理设备块


    blocks=`lsblk -bln ${dev_name} | awk '{ print $1}' | sort | uniq`;

    for block in $blocks; do \
        if [ "/dev/$block" != "${dev_name}" ];then \
            echo "dmsetup remove $block"; \
            dmsetup remove $block; \
        fi; \
    done

4. 清理vg


    vgs=`lsblk -bln ${dev_name} | grep lvm | awk '{print $1}' | cut -d - -f 1 | sort | uniq`;

    for vg in $vgs; do \
        echo "vgremove -y $vg "; \
        vgremove -y $vg; \
    done

5. 清理pv 


    pvremove ${dev_name}

6. 格式化分区


    dd if=/dev/zero of=${dev_name} count=1 bs=4M

7. partprobe

    `将磁盘分区表变化信息通知内核,请求操作系统重新加载分区表`


    partprobe ${dev_name}
    
8. 删除分区


    parted /dev/sdc rm 1
    
### thinpool

1. 创建 thinpool 


    lvcreate --wipesignatures y -n thinpool dockervg -l 90%VG

2. 创建 meta 


    lvcreate --wipesignatures y -n thinpoolmeta dockervg -l 5%VG

3. 转换 thinpool  


    lvconvert -y --zero n -c 1024K --thinpool dockervg/thinpool --poolmetadata dockervg/thinpoolmeta

4. 使能配置文件


    lvchange --metadataprofile dockervg-thinpool dockervg/thinpool

### LVM扩容/缩容

> 注意, xfs文件系统不能缩容, resize2fs或xfs_growfs出问题整个文件系统就凉了

1. 创建pv
   

    pvcreate /dev/sdb1

2. vg扩容


    vgextend vgname /dev/sdb1

3. lvm扩容
    

    lvextend -L +100G /dev/centos/root

4. 磁盘扩容(xfs)
    
    
    xfs_growfs /dev/mapper/centos-root

5. 磁盘扩容(ext4)
    

    resize2fs /dev/mapper/centos-root

6. lvm缩容
    

    lvreduce -L -10G /dev/centos/root
    
7. 磁盘缩容(ext4)
   

     resize2fs /dev/mapper/centos-root

### pv迁移

1. 如果vg没有额外的pv做迁移,需要添加pv
    

    pvcreate /dev/sda5
    vgextend yjxtest /dev/sda5

2. 迁移pv
    
    
    pvmove /dev/sdb7 /dev/sda5

3. 删除不用的pv
    

    vgreduce yjxtest /dev/sdb7


## 代理方案


### NG代理

1.   80全域名代理


    upstream bcos-service {
        keepalive 32;
    
        server 172.19.252.14:80 max_fails=0 fail_timeout=0;
        server 172.19.252.13:80 max_fails=0 fail_timeout=0;
    }
    
    server {
        listen 80;
        server_name *.cop.com;

        location / {
            set $proxy_upstream_name "bcos-service";
            proxy_set_header X-Forwarded-Host $host;
            proxy_set_header X-Forwarded-Server $host;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Host $http_host; 
            proxy_next_upstream error timeout;
            proxy_next_upstream_tries 3;
    
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
    
            client_max_body_size "3G";
            proxy_connect_timeout 120s;
            proxy_send_timeout 1200s;
            proxy_read_timeout 1200s;
    
            proxy_pass http://bcos-service;
        }
    }
    

2. 非80全域名代理


    upstream bcos-service {
        ip_hash;
        keepalive 32;
    
        server 172.19.252.14:80 max_fails=0 fail_timeout=0;
        server 172.19.252.13:80 max_fails=0 fail_timeout=0;
    }

    server {
        listen 6080;
        server_name *.cop.bcos;

        location / {
            set $proxy_upstream_name "bcos-service";
            proxy_set_header X-Forwarded-Host $host;
            proxy_set_header X-Forwarded-Server $host;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Host $http_host; 
            proxy_next_upstream error timeout;
            proxy_next_upstream_tries 3;
    
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
    
            client_max_body_size "3G";
            proxy_connect_timeout 120s;
            proxy_send_timeout 1200s;
            proxy_read_timeout 1200s;
    
            proxy_redirect  ~*http://(.*.cop.com)/(.*)   http://$1:6080/$2;
    
            proxy_pass http://bcos-service;
        }
    }

3. IP 代理方案


    upstream bcos-service {
        ip_hash;
        keepalive 32;
    
        server 172.19.252.14:80 max_fails=0 fail_timeout=0;
        server 172.19.252.13:80 max_fails=0 fail_timeout=0;
    }
    
    server {
        listen 80;
        server_name 192.168.1.1;
    
        location / {
            set $proxy_upstream_name "bcos-service";
            proxy_set_header X-Forwarded-Host $host;
            proxy_set_header X-Forwarded-Server $host;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Host "bcos.cop.com"; 
            proxy_next_upstream error timeout;
            proxy_next_upstream_tries 3;
    
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
    
            client_max_body_size "3G";
            proxy_connect_timeout 120s;
            proxy_send_timeout 1200s;
            proxy_read_timeout 1200s;
    
            proxy_redirect  ~*http://bcos.cop.com/(.*)   http://192.168.1.1/$1;
            proxy_pass http://bcos-service;
        }
    }

4. 更换根域名 代理方案


    upstream bcos-service {
        ip_hash;
        keepalive 32;
    
        server 172.19.252.14:80 max_fails=0 fail_timeout=0;
        server 172.19.252.13:80 max_fails=0 fail_timeout=0;
    }
    
    server {
        listen 80;
        server_name *.turingtopia.com;
    
        location / {
            if ( $host ~* (.*).turingtopia.com ) {
               set $project $1;
            }
            set $proxy_upstream_name "bcos-service";
            proxy_set_header X-Forwarded-Host $host;
            proxy_set_header X-Forwarded-Server $host;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Host $project.cop.com; 
            proxy_next_upstream error timeout;
            proxy_next_upstream_tries 3;
    
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
    
            client_max_body_size "3G";
            proxy_connect_timeout 120s;
            proxy_send_timeout 1200s;
            proxy_read_timeout 1200s;
    
            proxy_redirect  ~*http://(.*).cop.com/(.*)   http://$1.turingtopia.com/$2;
            proxy_pass http://bcos-service;
        }
    }

## 组件相关

### k8s相关

1.  强制删除


    --grace-period=0 --force
    
2.  批量删除

    
    kubectl get po --all-namespaces -owide | grep Terminating
    awk '{print "kubectl delete po -n "$1" "$2}' | while read line ;do  $line --grace-period=0 --force;done
    
3.  创建k8s 访问代理

    
    nohup kubectl proxy --address='0.0.0.0' --accept-hosts='^*$' -p 23333 &

4.  初始化master

    
    kubeadm init --config /opt/config.yaml
    kubeadm init --config /opt/config.yaml --ignore-preflight-errors=all
    
5. 生成 manifests 文件


    kubeadm init phase control-plane all --config /opt/config.yaml 
    
6. 添加 work 节点


    kubeadm join --token ${master_token} ${k8s_endpoint} --ignore-preflight-errors=all --discovery-token-unsafe-skip-ca-verification

7. 授权普通用戶


    mkdir -p $HOME/.kube;
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config;
    sudo chown $(id -u):$(id -g) $HOME/.kube/config

8. init高可用节点


    apiVersion: kubeadm.k8s.io/v1beta1
    kind: ClusterConfiguration
    kubernetesVersion: stable
    controlPlaneEndpoint: "LOAD_BALANCER_DNS:LOAD_BALANCER_PORT"
    
    kubeadm init --config=kubeadm-config.yaml --experimental-upload-certs  
    
9. 生成 certificate-key


    kubeadm init phase upload-certs --config /opt/config.yaml --experimental-upload-certs
    
10. 添加 master 节点


    kubeadm join 192.168.0.200:6443 --token 9vr73a.a8uxyaju799qwdjv --discovery-token-ca-cert-hash sha256:7c2e69131a36ae2a042a339b33381c6d0d43887e2de83720eff5359e26aec866  \
        --experimental-control-plane --certificate-key f8902e114ef118304e561c3ecd4d0b543adc226b7a07f675f56564185ffe0c07

11. join sha256 生成


    openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'


12. 根据字段筛选目标数据


    kubectl get po,svc,deploy -n kube-system --field-selector metadata.name==cas
    
    
13. 根据标签筛选数据 ` --selector: -l ` 


    kubectl get po,svc,deploy -n kube-system -l  app=cas

14. 添加master 污点


    kubectl taint nodes --all node-role.kubernetes.io/master-
    
### docker相关

1.  创建thinpool

    
    lvcreate --wipesignatures y -n thinpool dockervg -l 90%VG
    lvcreate --wipesignatures y -n thinpoolmeta dockervg -l 5%VG
    lvconvert -y --zero n -c 1024K --thinpool dockervg/thinpool --poolmetadata dockervg/thinpoolmeta
    
2.  删除所有推出的容器


    docker rm $(docker ps -q -f status=exited)
    docker ps -aqf status=exited | xargs docker rm
    
3.  修改容器重启策略


    docker container update --restart=always etcd 
    docker container update --restart=no etcd 
    
4.  查询docker 详细信息

    
    docker ps  --no-trunc  
    
5.  修改容器名称

    
    docker rename etcd etcd_bak
    
    
### harbor相关
    
1. 重装harbor [harbor安装包目录: `/bcos_mnt/harbor_data` ]
    

    cd /bcos_mnt/harbor_data/harbor/data
    rm -rf {ca_download,ca_download,defaultalias,log,psc,redis,secretkey}
    
    cd /bcos_mnt/harbor_data/harbor/common
    rm -rf config
    
    cd /bcos_mnt/harbor_data/harbor
    ./install.sh --with-notary --with-clair --with-chartmuseum

## 数据处理

### 清理数据

1. 清理项目 [项目编码: `yanshi`, 租户编码 `yanshi` ]


    DELETE FROM `bconsole`.`pro_project` WHERE project_code='yanshi';
    DELETE FROM `bconsole`.`pro_project` WHERE project_code IN ('yanshi');
    DELETE FROM `bconsole`.`pro_project` WHERE tenant_id='yanshi';
    DELETE FROM `bconsole`.`pro_project` WHERE tenant_id IN ('yanshi');
