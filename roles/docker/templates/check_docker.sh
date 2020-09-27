#!/bin/bash

stderr=$(systemctl status docker -l)

{% for item in check_list %}

match=$(echo ${stderr} {{item.match}})
if [ "$match" != "" ];then
  echo memo: {{item.memo}}
  echo name: {{item.name}}
  echo flag: true
  exit 0
fi

{% endfor %}

echo flag: false
echo name: default
echo memo: 未检测到异常