#!/bin/bash

devName=$1

#获取设备下其他设备
blocks=`lsblk -bln ${devName} | awk '{ print $1}' | sort | uniq | grep -v ${devName##*/}`
mounts=`lsblk -bln ${devName}  | awk '{ print $7 }' | sort | uniq | sed '/^$/d'`
vgs=`lsblk -bln ${devName} | grep lvm | awk '{print $1}' | cut -d - -f 1 | sort | uniq`
pvs=`pvs | grep ${devName} | awk '{print $1}'`

# clean mount
for mount in ${mounts}
do
  umount –lf ${mount}
  sed -i 's|^.*'"${mount}"'.*$|#&|g' /etc/fstab
done

#clean block
#如果有进程占用：grep -rnw ${blocks} /proc/*/mountinfo | awk '{print $1}' | cut -d / -f 3 | xargs sudo kill -9
for block in ${blocks}
do
  dmsetup remove ${block}
done

# clean lvm vg
for vg in ${vgs}
do
  vgremove ${vg} -y
done


# clean pv
for pv in ${pvs}
do
  pvremove ${pv} -y
done

pvremove ${devName}


echo "p
g
w
" | fdisk ${devName}


# partprobe:将磁盘分区表变化信息通知内核,请求操作系统重新加载分区表
partprobe ${devName}