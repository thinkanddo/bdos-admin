#!/bin/bash

# 获取变量  $1:临时工作目录  $2:ceph_fsid  $3:osd_fsid  $4:journal_uuid
work_dir=$1
ceph_fsid=$2
osd_fsid=$3
journal_uuid=$4

# 设置目录的安全上下文
restorecon $work_dir

# 创建所需临时文件
cat > $work_dir/ceph_fsid.112932.tmp <<EOF
$ceph_fsid
EOF
cat > $work_dir/fsid.112932.tmp <<EOF
$osd_fsid
EOF
cat > $work_dir/magic.112932.tmp <<EOF
ceph osd volume v026
EOF
cat > $work_dir/journal_uuid.112932.tmp <<EOF
$journal_uuid
EOF


# 设置临时文件的安全上下文，并重命名
restorecon -R $work_dir/ceph_fsid.112932.tmp
chown -R ceph:ceph $work_dir/ceph_fsid.112932.tmp
mv $work_dir/ceph_fsid.112932.tmp $work_dir/ceph_fsid

restorecon -R $work_dir/fsid.112932.tmp
chown -R ceph:ceph $work_dir/fsid.112932.tmp
mv $work_dir/fsid.112932.tmp $work_dir/fsid

restorecon -R $work_dir/magic.112932.tmp
chown -R ceph:ceph $work_dir/magic.112932.tmp
mv $work_dir/magic.112932.tmp $work_dir/magic

restorecon -R $work_dir/journal_uuid.112932.tmp
chown -R ceph:ceph $work_dir/journal_uuid.112932.tmp
mv $work_dir/journal_uuid.112932.tmp $work_dir/journal_uuid

ln -s /dev/disk/by-partuuid/$journal_uuid $work_dir/journal
chown -R ceph:ceph $work_dir/journal_uuid

restorecon -R $work_dir
chown -R ceph:ceph $work_dir
