#!/bin/bash

# 这个shell脚本将会在每台机器上执行,对集群的所有主机实现互信操作
if [ ! -e ~/.ssh/id_rsa.pub ]
then
  echo "公/私密钥对未找到，初始化中..."
  expect -c "
      spawn ssh-keygen
      expect {
          \"ssh/id_rsa):\" {send \"\r\";exp_continue}
          \"Over\" {send \"n\r\";exp_continue}
          \"passphrase):\" {send \"\r\";exp_continue}
          \"again:\" {send \"\r\";exp_continue}
      }
  " >/dev/null 2>&1
  if [ -e ~/.ssh/id_rsa.pub ]
  then
      echo "成功创建公/私密钥对"
  else
      echo "公/私密钥对创建失败"
      exit 1
  fi
fi
