#!/bin/bash

# 初始化控制机信息（初始化默认值或上次执行脚本保存下来的值到变量里）
init_controller_info() {
  # 判断是否存在缓存,如果不存在就创建并将配置数组的信息同步进去
  if [[ ! -d ${work_dir_ansible}/cache ]]; then
    mkdir ${work_dir_ansible}/cache
  fi
  if [[ ! -f $file_path ]]; then
    touch $file_path
    echo "boots_global:" >> $file_path
    # 遍历配置数组名
    for config_name in ${config_array[@]}
    do
      for config_key in $( eval echo \${!$config_name[@]} )
      do
        echo "  $config_key: $( eval echo \${$config_name["$config_key"]} )" >> $file_path
      done
    done
  else # 如果存在，同步配置文件的信息到数组中
    for config_name in ${config_array[@]}
    do
      for config_key in $( eval echo \${!$config_name[@]} )
      do
        tmp_value=$(cat $file_path | grep -E '^  '$config_key: )
        if [[ $tmp_value == '' ]]; then
          echo "  $config_key: $( eval echo \${$config_name["$config_key"]} )" >> $file_path
        else
          value=$(echo ${tmp_value#*:})
          eval $config_name["$config_key"]=$value
        fi
      done
    done
  fi
}

# 菜单操作入口
# menus_main "菜单关联数组名"
menus_main() {
  # 更新展示菜单
  [[ -n $1 ]] && menus=$1
  # 循环显示菜单
  while true; do
    menus_show
    read -p "请输入操作项：" key
    options_parse $key
  done
}

# 操作提示
top_tip() {
  echo "                    <<!!!!!!安装前重要提示!!!!!!>>"
  echo ""
  echo "1.执行此脚本前请先确认当前用户为该脚本所在根目录的归属目录 否则脚本执行失败"
  echo "2.执行此脚本前请先确认当前用户具有sudo权限 和 sudo免密权限  否则脚本会执行失败"
  echo "3.目前只支持msdos和gpt两种类型的磁盘分区表格式"
  echo "4.每台机器必须手动配置ntp时间同步"
  echo ""
}

# 操作项展示
menus_show() {
  clear
  top_tip
  if [[ -n $message ]]; then
    echo "========================================================="
    echo "提示： "$message
    echo "========================================================="
  fi
  message=""
  configs=${menus##MENUS_}_CONFIG
  echo "操作项："
  for menu in $( eval "echo \${!$menus[@]} | tr ' ' '\n' | grep -E '[0-9]{1,2}' | sort -n" )
  do
    key=$( echo $( eval echo \${$menus["$menu"]} ) | awk '{print $1}' )
    value=$( echo $( eval echo \${$menus["$menu"]} ) | awk '{for(i=2;i<NF;i++) printf $i" ";print $i}' )
    if [[ "$menus" == "MENUS_OPT" ]];then
      default=""
    else
      default="默认值：[$( eval echo \${$configs["$key"]} )]"
    fi
    echo "    $menu: ${value} ${default}"
  done
  echo "    q: 退出"
}

# 操作项解析
# options_parse "下标"
# 解析类型： 1：跳转到子级菜单，2跳转到父级菜单或退出脚本，3：设置变量，4：保存变量，5：查看变量，6：开始安装，7：参数不是给定变量
options_parse() {
  # 如果没传值,提示重新输入
  if [[ ! -n $1 ]]; then
    message="请选择操作选项"
  else
    # 数组 给定下标对应的值
    tmp=$( eval echo \${$menus["$1"]} )
    # 如果超出给定选项范围，提示重新输入
    [[ ! -n $tmp ]] && message="请输入给定的操作项" && continue
    # 可解析出操作行为
    tmp1=$( echo $tmp | awk '{print $1}' )
    # 操作提示
    tmp2=$( echo $tmp | awk '{print $2}' )
    case $tmp1 in
    install_main)# 执行控制机安装
      install_main
      ;;
    get_info)# 查看配置信息
      get_info
      ;;
    save_info)# 保存配置信息
      save_info
      ;;
    MENUS_*)# 跳转子级目录
      menus_main $tmp1
      ;;
    quit_*)# 退出
      # 获取上级菜单，更新当前菜单
      menus=${tmp1#quit_}
      break
      ;;
    *)# 配置变量
      set_config $tmp1 $tmp2
      ;;
    esac
  fi
  
}

# 设置配置入口
# set_main "配置数组的key" "提示输入"
set_config() {
  # 可以连续3次输入格式错误
  #for ((i=1;i<=3;i++));
  #do
   # 输入配置提示
   config_key=$1
   old_config_value=$( eval echo \${${menus#MENUS_}_CONFIG["$config_key"]} )
   # 输入配置
   read -p "$2(当前值为:$old_config_value)：" new_config_value
   # 校验输入格式
   #check_main "set" $config_key $config_value
   #if [[ $? == 0 ]]; then
   #  # 将配置写到tmp_config数组中
   #  tmp_config["$config_key"]=$config_value
   #  message="配置修改成功！在退出前请选择保存配置，否则退出后配置将失效！"
   #  break
   #elif [[ $? == 2 ]]; then
   #  message="配置没修改！"
   #  break
   #else
   #  #message="输入格式有误，请重新输入！"
   #  continue
   #fi
   #message="连续3次输入错误，请重新选择操作项！"
   [[ ${new_config_value} == '' ]] && message="你没有做任何修改" && return
   # 将配置同步到数组中
   config_name=${menus#MENUS_}_CONFIG
   eval $config_name["$config_key"]=$new_config_value
   # 将配置同步到文件中
   sed -i "s/^  $config_key:.*$/  $config_key: $new_config_value/" $file_path
}

# 配置校验
# check_main "校验类型" "key(设置配置时需要)" "value(设置配置时需要)"
# 0：校验成功，3：格式有问题，4：无法安装
check_main() {
  case $1 in
    yml)# 格式校验
      check_yml
    ;;
    set)# 格式校验
      check_set $2 $3
    ;;
    install)# 可用性校验
      check_install
    ;;
  esac
}

# 校验文件格式，如果格式有误，删了重新初始化
check_yml() {
  # 这里就简单的做一下,等以后有时间再做
  rm -rf $file_path
  init_controller_info
}

# 校验设置变量时的输入
# check_set "key" "value"
check_set() {
  # 没有值
  if [[ ! -n $2 ]]; then
     read -p "要将这项配置 设置为空吗？[y/n]" input
     if [[ $input == "n" ]]; then
       return 2
     elif [[ input == "s" ]]; then
       return 0
     else
       echo "输入有误，默认选n"
       sleep 3
       return 2
     fi
    return 0
  fi
  # 格式校验
  case $1 in
    *FLAG)# true/false
      [[ $2 != "true" || $2 != "false" ]] && message="必须输入true/false" && return 
      ;;
    *IP|SYSTEM_NTP_SERVER_IP)# ip
      ;;
    *PORT)# 必须是数字
      ;;
    SYSTEM_TIMEZONE)# [Asia/Shanghai]
      ;;
    *)# 开头不能是数字
      ;;
  esac
}

# 校验配置是否可用于安装
check_install() {
  # mysql如果指定的话，ip端口能否访问  等等
  echo ""
}

# 查看配置信息入口
get_info() {
  clear
  for config in ${config_array[@]}
  do
    if [[ ${config%_CONFIG} == ${menus#MENUS_} || ${menus} == "MENUS_OPT" ]]; then
      get_single_info ${config}
    fi
  done
  read -p "按回车键继续。。。"
}

# 获取单个配置组的信息
# get_single_info "配置数字"
get_single_info() {
config=$1
echo "${config%_CONFIG}配置信息："
for con in $( eval echo \${!$config[@]} ); do
    echo "  $con: $( eval echo \${$config["$con"]} )"
done
}

install_repo() {
cd ${work_dir_ansible}

for rpm_name in vsftpd-3.0.2-21.el7.x86_64.rpm libxml2-2.9.1-6.el7_2.3.x86_64.rpm libxml2-python-2.9.1-6.el7_2.3.x86_64.rpm deltarpm-3.6-3.el7.x86_64.rpm python-deltarpm-3.6-3.el7.x86_64.rpm python2-cryptography-1.7.2-2.el7.x86_64.rpm createrepo-0.9.9-26.el7.noarch.rpm;do
  sudo yum install -y pub/${rpm_name}
done
sudo systemctl restart vsftpd
sudo  systemctl enable vsftpd

sudo cp -rn pub /var/ftp
cd /var/ftp/pub; sudo createrepo .

cd ${work_dir_ansible}/cache

#设置repo 文件
cat > Ftp.repo << EOF
[bcos_ftp]
name=bcos_ftp
baseurl=ftp://${SYSTEM_CONFIG[SYSTEM_CONTROL_IP]}/pub
enabled=1
priority=1
gpgcheck=0
EOF

sudo rm -rf /etc/yum.repos.d/Ftp.repo
sudo cp Ftp.repo /etc/yum.repos.d/
sudo chmod -R 755 /var/ftp
sudo yum clean all
sudo yum makecache
}

# 安装入口
install_main() {
#echo 检查 bcos_ftp repo源是否安装
#if [[ ! -n `yum repolist | grep ftp` ]];then
echo bcos_ftp repo源开始安装
install_repo
echo bcos_ftp repo源安装成功
#else
#    echo bcos_ftp repo源已经安装
#fi

echo 安装ansible-2.6.3-1.el7 和 rsync
sudo yum install -y ansible-2.6.3-1.el7 rsync

if [[ $? == 0 ]];then
    # 修改ansible指纹验证、 默认不获取 gather_facts、延长gather_facts时间，skip日志不打印
    sudo sed -i 's/#host_key_checking/host_key_checking/' /etc/ansible/ansible.cfg
    sudo sed -i 's/#gathering = implicit/gathering = explicit/' /etc/ansible/ansible.cfg
    sudo sed -i 's/# gather_timeout = 10/gather_timeout = 100/' /etc/ansible/ansible.cfg
    #    sudo sed -i 's/#display_skipped_hosts/display_skipped_hosts/' /etc/ansible/ansible.cfg
    echo ansible 和 rsync安装成功
else
    echo ansible 和 rsync安装失败
fi

# 初始化控制机
cd ${work_dir_ansible}
mv *.repo cache
echo 开始初始化控制机
ansible-playbook install_control.yml -e @${file_path}
if [[ $? == 0 ]];then
    read -p "请打开浏览器访问 http://${SYSTEM_CONFIG['SYSTEM_CONTROL_IP']}:${BOOTS_CONFIG['PORT_BOOTS_HTTP']}/boots"
else
    read -p "安装失败！请确认环境再次安装"
fi
}

valid_ip()
{
  local ip=$1
  local ret=1

  if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    ip=(${ip//\./ }) # 按.分割，转成数组，方便下面的判断
    [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
    ret=$?
  fi

  return $ret
}

# main
{
# 全局变量
menus="MENUS_OPT" # menus的初始值为menus_opt
message="" # 失败提示信息
work_dir_ansible=$( pwd )
work_dir=${work_dir_ansible%/*}
username=$( pn=$(pwd);ls -ld ${pn} | awk '{print $4}' )
file_path=${work_dir_ansible}/cache/controller.yml # 缓存信息路径
set_array=("MENUS_BOOTS" "MENUS_SYSTEM" "MENUS_COMPOSE" "MENUS_PORT") # 设置菜单数组名 组成的数组
config_array=("IMMUTABLE_CONFIG" "BOOTS_CONFIG" "SYSTEM_CONFIG" "COMPOSE_CONFIG" "PORT_CONFIG" ) # 配置数组名 组成的数组

ipv4=`ip a | grep 'state UP' -A2 | grep inet | grep -v inet6 | awk '{print $2}' | cut -d "/" -f 1 | sed -n '1p'`
read -p "当输入当前主机的内部IP 默认[ ${ipv4} ]: " ip_add

while [[ true ]]; do
  if [ "${ip_add}" == "q" ];then
    exit 0;
  fi

  if [ "${ip_add}" != ""  ]; then
    if valid_ip ${ip_add}; then
      if [ "$(ip a | grep 'state UP' -A2 | grep inet| grep ${ip_add})" == "" ];then
        read -p "不存在IP 地址: ${ip_add} 默认[ ${ipv4} ], 请重新输入: " ip_add
        continue
      else
        ipv4=${ip_add}
        break
      fi
    else
      read -p "IP 地址校验错误: ${ip_add} 默认[ ${ipv4} ], 请重新输入: " ip_add
      continue
    fi
  else
    break
  fi
done

echo 当前机器的IP 地址设置为: ${ipv4}

# 声明操作菜单选项
declare -A MENUS_OPT=(
    ["1"]="MENUS_BOOTS 配置引导服务"
    ["2"]="install_main 安装引导服务"
    ["q"]="quit_zero 退出"
)

# 声明系統菜单选项
declare -A MENUS_BOOTS=(
    ["1"]="COMPOSE_MYSQL_INSTALL_FLAG 是否安装MYSQL[true/false]"
    ["2"]="COMPOSE_MYSQL_IP MYSQL IP地址"
    ["3"]="COMPOSE_MYSQL_USERNAME MYSQL 用户名"
    ["4"]="COMPOSE_MYSQL_PASSWORD MYSQL 免密"
    ["5"]="PORT_MYSQL MYSQL 连接端口"
    ["6"]="PORT_BOOTS_HTTP BOOTS访问的 HTTP端口"
    ["7"]="SYSTEM_NTP_SERVER_IP 集群主机的NTP服务器"
    ["s"]="get_info 查看系统配置信息"
    ["q"]="quit_MENUS_OPT 退出"
)

# 声明系統菜单选项
declare -A MENUS_SYSTEM=(
    ["1"]="SYSTEM_HOSTNAME_FLAG 是否允许修改集群主机的hostname[true/false]"
    ["2"]="SYSTEM_TIMEZONE 是否允许设置集群时区[有值表示修改，如[Asia/Shanghai]/空表示不设置]"
#    ["3"]="SYSTEM_NTP_SERVER_IP 集群主机的NTP服务器"
    ["4"]="SYSTEM_REPO_FLAG 是否禁用已有repo源[true/false]"
    ["5"]="SYSTEM_CONTROL_IP 当前主机的IPV4地址"
    ["6"]="SYSTEM_ROOT_DOMAIN 系统集群根域名"
    ["7"]="SYSTEM_LOG_LEVEL 系统日志級別"
    ["s"]="get_info 查看系统配置信息"
    ["q"]="quit_MENUS_OPT 退出"
)

# 声明组件菜单选项
declare -A MENUS_COMPOSE=(
#    ["1"]="COMPOSE_MYSQL_INSTALL_FLAG 是否安装MYSQL[true/false]"
#    ["2"]="COMPOSE_MYSQL_IP MYSQL IP地址"
#    ["3"]="COMPOSE_MYSQL_USERNAME MYSQL 用户名"
#    ["4"]="COMPOSE_MYSQL_PASSWORD MYSQL 免密"
    ["5"]="COMPOSE_HARBOR_ADMIN_PASSWORD HARBOR admin 用户密码"
    ["6"]="COMPOSE_HARBOR_WORK_DIR HARBOR 工作目录"
    ["7"]="COMPOSE_K8S_SERVICE_SUBNET K8S ClusterIp 网段"
    ["8"]="COMPOSE_K8S_POD_SUBNET K8S的容器Pod 网段"
    ["9"]="COMPOSE_FTP_INSTALL_FLAG 是否安装FTP[true/false]"
    ["10"]="COMPOSE_FTP_IP FTP IP地址"
    ["11"]="COMPOSE_FTP_USERNAME FTP的用户名"
    ["12"]="COMPOSE_FTP_PASSWORD FTP的密码"
    ["13"]="COMPOSE_SONAR_URL SONAR地址"
    ["s"]="get_info 查看配置"
    ["q"]="quit_MENUS_OPT 退出"
)

# 声明端口菜单选项
declare -A MENUS_PORT=(
#    ["1"]="PORT_MYSQL MYSQL 连接端口"
#    ["2"]="PORT_BOOTS_HTTP TOMCAT HTTP端口"
    ["3"]="PORT_HARBOR_HTTP HARBOR HTTP端口"
    ["4"]="PORT_HARBOR_HTTPS HARBOR HTTPS端口"
    ["5"]="PORT_HARBOR_NOTARY HARBOR 校验端口"
    ["6"]="PORT_HARBOR_LOG HARBOR 日志端口"
    ["7"]="PORT_JENKINS JENKINS 连接端口"
    ["8"]="PORT_K8S_SECURE API_SERVER 安全端口"
    ["9"]="PORT_K8S_SECURE_HA API_SERVER 高可用安全端口(空的话，表示不用)"
    ["10"]="PORT_K8S_INSECURE API_SERVER 非安全端口"
    ["11"]="PORT_K8S_INSECURE_HA API_SERVER 高可用非安全端口(空的话，表示不用)"
    ["12"]="PORT_K8S_STATS HAPROXY 状态检查端口"
    ["13"]="PORT_K8S_SERVICE_NODE_MIN k8s服务映射的物理机最小端口"
    ["14"]="PORT_K8S_SERVICE_NODE_MAX k8s服务映射的物理机最大端口"
    ["15"]="PORT_FTP_DATA FTP 主动数据端口"
    ["16"]="PORT_FTP_CONTROL FTP 控制端口"
    ["17"]="PORT_FTP_MIN FTP 被动最小端口"
    ["18"]="PORT_FTP_MAX FTP 被动最大端口"
    ["s"]="get_info 查看控制机配置信息"
    ["q"]="quit_MENUS_OPT 退出"
)

# 不可改的配置项
declare -A IMMUTABLE_CONFIG=(
    ["WORK_DIR_ANSIBLE"]="$work_dir_ansible"
    ["WORK_DIR"]="$work_dir"
    ["USERNAME"]="$username"
)

# 系统默认配置
declare -A SYSTEM_CONFIG=(
    ["SYSTEM_HOSTNAME_FLAG"]="true"
    ["SYSTEM_REPO_FLAG"]="false"
    ["SYSTEM_TIMEZONE"]=""
#    ["SYSTEM_NTP_SERVER_IP"]="${ipv4}"
    ["SYSTEM_CONTROL_IP"]="${ipv4}"
    ["SYSTEM_ROOT_DOMAIN"]="cop.local"
    ["SYSTEM_LOG_LEVEL"]="info"
)

# 组件默认配置
declare -A COMPOSE_CONFIG=(
#    ["COMPOSE_MYSQL_INSTALL_FLAG"]="true"
#    ["COMPOSE_MYSQL_IP"]="${ipv4}"
#    ["COMPOSE_MYSQL_USERNAME"]="root"
#    ["COMPOSE_MYSQL_PASSWORD"]="123456"
    ["COMPOSE_HARBOR_ADMIN_PASSWORD"]="Harbor12345"
    ["COMPOSE_HARBOR_WORK_DIR"]="/harbor_data"
    ["COMPOSE_K8S_SERVICE_SUBNET"]="10.244.0.0/16"
    ["COMPOSE_K8S_POD_SUBNET"]="192.168.0.0/16"
    ["COMPOSE_FTP_INSTALL_FLAG"]="true"
    ["COMPOSE_FTP_IP"]="${ipv4}"
    ["COMPOSE_FTP_USERNAME"]="bdosimg"
    ["COMPOSE_FTP_PASSWORD"]="bonc.123"
    ["COMPOSE_SONAR_URL"]="http://172.16.3.25:8788/she-ra"
    ["COMPOSE_ES_CLUSTER_NAME"]="blogic-es-cluster"
)

# 端口默认配置
declare -A PORT_CONFIG=(
#    ["PORT_MYSQL"]="3306"
#    ["PORT_BOOTS_HTTP"]="8888"
    ["PORT_HARBOR_HTTP"]="8889"
    ["PORT_HARBOR_HTTPS"]="8443"
    ["PORT_HARBOR_NOTARY"]="4443"
    ["PORT_HARBOR_LOG"]="1514"
    ["PORT_JENKINS"]="8899"
    ["PORT_K8S_INSECURE"]="23333"
    ["PORT_K8S_SECURE"]="6443"
    ["PORT_K8S_SECURE_HA"]=""
    ["PORT_K8S_INSECURE_HA"]=""
    ["PORT_K8S_STATS"]="8099"
    ["PORT_K8S_SERVICE_NODE_MIN"]="30020"
    ["PORT_K8S_SERVICE_NODE_MAX"]="30500"
    ["PORT_FTP_DATA"]="21020"
    ["PORT_FTP_CONTROL"]="21021"
    ["PORT_FTP_MIN"]="21022"
    ["PORT_FTP_MAX"]="21119"
    ["PORT_ES_HTTP"]="9200"
    ["PORT_ES_TCP"]="9300"
)

# 系统默认配置
declare -A BOOTS_CONFIG=(
    ["COMPOSE_MYSQL_INSTALL_FLAG"]="true"
    ["COMPOSE_MYSQL_IP"]="${ipv4}"
    ["COMPOSE_MYSQL_USERNAME"]="root"
    ["COMPOSE_MYSQL_PASSWORD"]="123456"
    ["PORT_MYSQL"]="3306"
    ["PORT_BOOTS_HTTP"]="8888"
    ["SYSTEM_NTP_SERVER_IP"]="${ipv4}"
)


# 初始化配置
init_controller_info

# 菜单操作
menus_main
}
