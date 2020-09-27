#!/bin/bash
# 获取系统盘和工作盘
## $1:work_dir  $2:controller_ip
work_dir=$1
controller_ip=$2
tmp_sys_dev=$(df  / /boot /home /opt /usr /var | awk 'NR>1' | awk '{print $1}')
tmp_work_dev=""
if [[ $work_dir != '' && $controller_ip != '' ]]; then
  if [[ $(ip a | grep -w $controller_ip | wc -l) > 0 ]]; then
    tmp_work_dev=$(df $work_dir | awk 'NR>1' | awk '{print $1}')
  fi
fi
# 获取真实磁盘
dev_list=""
for i in $(echo $tmp_sys_dev $tmp_work_dev | awk '{for(i=1;i<=NF;i++) print $i}' | sort -u)
do
  if [[ $i =~ "-"  ]]; then # 逻辑卷
    tmp=${i##*/}
    dev_list=$dev_list" $(pvs | grep ${tmp%-*} | awk '{print $1}')"
  else  # 磁盘
    dev_list=$dev_list" ${i}"
  fi
done
echo $dev_list
