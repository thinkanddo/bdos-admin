#!/bin/bash
osd_id=$1
# 将osd移除集群
if [[ $osd_id != "" ]]; then
  ceph osd out $osd_id
  # 停止osd服务
  systemctl stop ceph-osd@$osd_id.service
  systemctl disable ceph-osd@$osd_id.service
  ceph osd down $osd_id
  # 移除crushmap
  ceph osd crush remove osd.$osd_id
  # 删除密钥
  ceph auth del osd.$osd_id
  # 删除osd
  ceph osd rm osd.$osd_id
  # 如果这个节点没有其他osd的话，删除节点的crushmap
  ceph osd crush remove $(hostname)
  # 删数据，清挂载
  rm -rf /var/lib/ceph/osd/ceph-$osd_id/*
  umount /var/lib/ceph/osd/ceph-$osd_id
  rm -rf /var/lib/ceph/osd/ceph-$osd_id
fi
# 清理有可能残留的临时数据
umount /var/lib/ceph/tmp/* || true
rm -rf /var/lib/ceph/tmp/*
# extra
systemctl reset-failed
