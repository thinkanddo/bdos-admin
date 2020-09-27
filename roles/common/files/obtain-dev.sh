#!/bin/bash
# 去掉设备大小变量的单位 向下取整(结果量级是GB,只支持KB,MB,GB)
sizeFormatGB() {
  origSize=$(echo $1 | tr [a-z] [A-Z])
  unit=${origSize:0-2}
  size=${origSize:0:0-2}
  case $unit in
  "TB")
    size=$(awk -v size=$size 'BEGIN{print size*1000}')
    ;;
  "GB")
    ;;
  "MB")
    size=$(awk -v size=$size 'BEGIN{print size/1000}')
    ;;
  "KB")
    size=$(awk -v size=$size 'BEGIN{print size/1000/1000}')
    ;;
  *)
    echo $2"变量格式错误">&2 && exit 1
    ;;
  esac
  eval $2=$size
}

# 获取设备已使用量
setDevUsed() {
  # disk是否有挂载
  diskMountFlag=$(lsblk -l  ${devName} 2>/dev/null| grep -wE "^${devName##*/}\s.*$" | awk '{print $7}' )
  if [[ $diskMountFlag != '' ]]; then
    devSizeUsed=$devSize
  else
    maxSize=0
    devSize_array=$(parted $devName print 2>/dev/null | sed -n '/^Number/,$p' | grep -v Number | grep -v extended | awk '{if($0!="")print $3}')
    if [[ devSize_array != '' ]]; then
      # parted命令获取该磁盘最后一个被使用的分区
      for tmpEndSize in $devSize_array
      do
        sizeFormatGB $tmpEndSize "tmpEndSize"
        maxSize=$(awk -v a=$tmpEndSize -v b=$maxSize 'BEGIN{if(a>b){print a}else{print b}}')
      done
    fi
    devSizeUsed=$maxSize
  fi
}


# main
# # $1:devName $2:devUseFlag 1查使用量  0不查 $3:rejectFlag: 系统盘工作盘标识，0：非特殊盘  1：特殊盘
# 声明变量
devSize=0
name=""
status="0"
bootFlag=0
workFlag=0
[[ $2 == 0 || $2 == 1 ]] && devUseFlag=$2 || exit 1
[[ $3 == 0 || $3 == 1 ]] && rejectFlag=$3 || exit 1

## devName
devName=$1
## devSize，以G为单位，结果不加单位  c为continue缩写，和parted进行交互
devSize=$(echo c | parted $devName print 2>/dev/null | sed -n '2p' | awk '{print $3}')
sizeFormatGB $devSize "devSize"
devSize=${devSize//.*/} #向下取整
## devSizeUsed
devSizeUsed=0
if [[ !($rejectFlag == 0 && $devUseFlag == 0) ]];then
  setDevUsed
fi
devSizeUsed=$(echo $devSizeUsed | awk '{print int($1)==$1?int($1):int($1)+1}')  # 向上取整
if [[ $devSizeUsed -gt $devSize ]];then
  devSizeUsed=$devSize
fi
# partType
if [[ $rejectFlag != 0 ]];then
partType=$(parted $devName print 2>/dev/null | grep Partition\ Table | awk '{print $3}')
else
partType=gpt
fi
# 特殊情况
[[ $partType == "unknown" ]] && devSizeUsed=$devSize || true
# 输出结果
echo \{\"devName\":\"$devName\",\"devSize\":$devSize,\"devSizeUsed\":$devSizeUsed,\"name\":\"$name\",\"status\":\"0\"\,\"partType\":\"$partType\"\}