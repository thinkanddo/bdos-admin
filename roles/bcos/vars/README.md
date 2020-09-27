    namespace: "bcos"   // bcos 部署的租户
    root_domain: "cop.local"  // bcos系统根域名
    ingress_domain: "bcos.cop.local"  // bcos服务暴露的域名
    log_level: "info"
    harbor:				// harbor 访问信息
      username: "admin"		
      password: "Harbor12345"	
      email: "admin@example.com"	
      crt_path: "/data01/ca.crt"	
      ip: "127.0.0.1"	
      dns: "harbor.cop.com"
      port: "8443"
    mysql:				// mysql 链接信息
      ip: "127.0.0.1"		
      port: "3306"			
      username: "bcos"		
      password: "123456"	
      databases:
        bconsole: "bconsole_dev"	// bconsole 数据库库名
        bdos: "bdos_dev"			// bdos 数据库库名
        bpm: "bpm_dev"				// bpm 数据库库名
        portal: "portal_dev"		// portal 数据库库名
    ftp:				// 文件上传，mysql备份ftp信息
      ip: "127.0.0.1"			
      port: "21"
      username: "bcos"
      password: "bcos.123"
    pinpoint:			// pinpoint 链接信息
      switch: "off"
      server_ip: "127.0.0.1"
      tcp_port: "9994"
      span_port: "9996"
      stat_port: "9995"
    ceph:				// ceph 客户端密钥
      ceph_dir: "/etc/ceph/"
      mon:
        ip: "172.16.3.30"
        port: "6789"
        eps: "172.16.3.30:6789,172.16.3.31:6789,172.16.3.55:6789"
        admin_key: "QVFCb2lLTmNKRnR3RUJBQUtKanVOVlk3alZ6WUhBYitQaHJXemc9PQo="
      rgw:
        access_key: "E2C05H9EQODIBBJSR927"
        secret_key: "9fV7YuID99p3RH1spE8zkocUsrCP7olONWqq6TSr"
        ip: "172.16.3.26"
        port: "7480"
      mds: 
        mount_point: "/mnt/mycephfs/"
    jenkins:
      ip: "172.16.11.133"
      port: "9002"
    docker:
      ip: "172.16.11.133"
      port: "28015"
    etcd:
      ip: "172.16.3.25"
      client_port: "2379"
      peer_port: "2380"
      linked: "http://172.16.3.25:2379,http://172.16.3.26:2379,http://172.16.3.27:2379"
    master:
      vip: "172.16.3.25"
      secure_port: "6443"
      insecure_port: "23333"
    operator:
      vgname: "operatorvg"
    sonar:
      url: "https://code.bonc.com.cn/sonar"
     es:
       host_name: "172.16.3.25"
       cluster_name: "blogic_es_cluster"
       host_port: "9300"
       http_port: "9200"