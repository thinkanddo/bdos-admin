#!/bin/bash

# 这个shell脚本将会在每台机器上执行,将集群的所有hostname 加入域名映射文件

hasHostname=`cat /etc/hosts | grep "$1 $2"`
# 通过判断是否存在hostname的域名映射完成幂等操作
if [ "$hasHostname" == "" ];then
    echo $1 $2 >> /etc/hosts
fi