# 初始化控制部署信息

### core服务模块
  1. 根据参数判断是否安装数据库
  2. 初始化数据库 (先删除库，再创建库)
  3. 安装JDK
  4. 部署tomcat bdos 服务，替换SQL脚本，启动服务
  5. 部署ansible驱动
  6. 安装entry

### repo源模块
  1. 安装ftp服务
  2. 安装repo源
  3. 创建repo源

### shera 服务模块

  1. 初始化shera数据库
  2. 部署并启动shera容器(启动命令需要变量替换)
  3. copy文件并启动shell Shera.sh(替换模板文件)
  4. 初始化数据
