/*
Navicat MySQL Data Transfer

Source Server         : 172.16.11.106
Source Server Version : 50560
Source Host           : 172.16.11.106:3306
Source Database       : boots

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2019-07-12 10:14:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_cluster_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_cluster_info`;
CREATE TABLE `sys_cluster_info` (
  `code` varchar(32) NOT NULL,
  `cfg_key` varchar(64) NOT NULL,
  `cfg_type` char(1) DEFAULT NULL,
  `cfg_value` varchar(255) DEFAULT NULL,
  `regular` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`,`cfg_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_cluster_info
-- ----------------------------
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_BCONSOLE_INSTALL_FLAG', '2', 'true', '', 'fa-cog', '是否安装bconsole');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_BDOS_INSTALL_FLAG', '2', 'true', '', 'fa-cog', '是否安装bdos');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_BLOGIC_INSTALL_FLAG', '2', 'true', '', 'fa-cog', '是否安装blogic');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_CEPH_ADMIN_KEY', '1', '', '', 'fa-cog', 'CEPH ADMIN密钥');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_CEPH_DIR', '0', '/etc/ceph/', '', 'fa-cog', 'CEPH 配置目录');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_CEPH_MON_ENDPOINTS', '1', '', '', 'fa-cog', 'ceph mon 集群endpoint');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_CEPH_MDS_MOUNT_POINT', '0', '/mnt/mycephfs', '', 'fa-cog', 'CEPH MDS 挂载地址');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_CEPH_MON_IP', '1', '', '', 'fa-cog', 'CEPH MON 地址');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_CEPH_RGW_ACCESS_KEY', '1', '', '', 'fa-cog', 'CEPH RGW 访问密钥');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_CEPH_RGW_IP', '1', '', '', 'fa-cog', 'CEPH RGW地址');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_CEPH_RGW_SECRET_KEY', '1', '', '', 'fa-cog', 'CEPH RGW安全密钥');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_ES_CLUSTER_NAME', '2', 'blogic-es-cluster', '', 'fa-cog', 'es 集群名称');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_ES_MASTER_IPS', '1', '', '', 'fa-cog', 'es master ip');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_ETCD_IP', '1', '', '', 'fa-cog', 'ETCD 链接串地址');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_ETCD_LINKED', '1', '', '', 'fa-cog', 'ETCD 链接串地址');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_FTP_INSTALL_FLAG', '2', 'true', '', 'fa-cog', '是否安装FTP');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_FTP_IP', '2', '', '', 'fa-cog', 'FTP的地址');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_FTP_PASSWORD', '2', 'bonc.123', '', 'fa-cog', 'FTP用户密码');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_FTP_USERNAME', '2', 'bdosimg', '', 'fa-cog', 'FTP用户名');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_HARBOR_ADMIN_PASSWORD', '2', 'Harbor12345', '', 'fa-cog', 'HARBOR密码');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_HARBOR_DNS', '2', 'harbor.cop.com', '', 'fa-cog', 'HARBOR 主机地址');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_HARBOR_IP', '1', '', '', 'fa-cog', 'HARBOR 主机地址');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_HARBOR_WORK_DIR', '1', '', '', 'fa-cog', 'HARBOR镜像目录');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_JENKINS_IP', '1', '', '', 'fa-cog', 'JENKINS 安装地址');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_K8S_GRANT_COMMAND', '0', 'mkdir -p $HOME/.kube;sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config;sudo chown $(id -u):$(id -g) $HOME/.kube/config', '', 'fa-cog', 'kubeadm init 生成的给普通用户授权的命令');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_K8S_INSTALL_FLAG', '2', 'false', '', 'fa-cog', 'k8s安装标识');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_K8S_POD_SUBNET', '2', '192.168.0.0/16', '', 'fa-cog', 'K8S POD ID 的 CIDR');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_K8S_SERVICE_SUBNET', '2', '10.244.0.0/16', '', 'fa-cog', 'K8S SERVICE IP 的 CIDR');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_K8S_VIRTUAL_IP', '2', '', '', 'fa-cog', 'k8s虚拟IP');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_MYSQL_IP', '2', '{{boots_global.COMPOSE_MYSQL_IP}}', '', 'fa-cog', 'BCOS服务的MYSQL主机地址');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_MYSQL_PASSWORD', '2', '{{boots_global.COMPOSE_MYSQL_PASSWORD}}', '', 'fa-cog', 'BCOS服务的MYSQL密码');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_MYSQL_USERNAME', '2', '{{boots_global.COMPOSE_MYSQL_USERNAME}}', '', 'fa-cog', 'BCOS服务的MYSQL用户名');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_NETWORK_PLUGIN', '2', 'calico', '', 'fa-cog', 'k8s网络插件calico/flannel');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_OPERATOR_INSTALL_FLAG', '2', 'true', '', 'fa-cog', '是否安装operator');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_OPERATOR_VG_NAME', '0', 'operatorvg', '', 'fa-cog', 'OPERATOR VG名 需要和存儲配置表保持一致');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'COMPOSE_PINPOINT_SERVER_IP', '1', '', '', 'fa-cog', 'PINPOINT 服务地址');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_BOOTS_HTTP', '2', '8888', '', 'fa-cog', 'BOOTS HTTP端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_CEPH_MON', '2', '6789', '', 'fa-cog', 'CEPH MON监听端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_CEPH_RGW', '2', '7480', '', 'fa-cog', 'CEPH RGW监听端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_DOCKER', '2', '28015', '', 'fa-cog', 'DOCKER 链接SERVER监听端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_ES_HTTP', '2', '9200', '', 'fa-cog', 'es http端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_ES_TCP', '2', '9300', '', 'fa-cog', 'es tcp端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_ETCD_CLIENT', '2', '2379', '', 'fa-cog', 'ETCD HTTP端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_ETCD_PEER', '2', '2380', '', 'fa-cog', 'ETCD HTTPS端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_FTP_CONTROL', '2', '21021', '', 'fa-cog', 'FTP 控制端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_FTP_DATA', '2', '21020', '', 'fa-cog', 'FTP 数据端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_FTP_MAX', '2', '21119', '', 'fa-cog', 'FTP 数据最小端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_FTP_MIN', '2', '21022', '', 'fa-cog', 'FTP 数据最小端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_HARBOR_HTTP', '2', '8889', '', 'fa-cog', 'HARBOR HTTP端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_HARBOR_HTTPS', '2', '8443', '', 'fa-cog', 'HARBOR HTTPS端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_HARBOR_LOG', '2', '1514', '', 'fa-cog', 'HARBOR LOGS端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_HARBOR_NOTARY', '2', '4443', '', 'fa-cog', 'HARBOR NOTARY端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_JENKINS', '2', '8899', '', 'fa-cog', 'JENKINS 链接端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_SONAR', '2', '9000', '', 'fa-cog', 'SONAR 链接端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_K8S_INSECURE', '2', '23333', '', 'fa-cog', 'K8S 非安全端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_K8S_INSECURE_HA', '2', '23343', '', 'fa-cog', 'K8S 非安全代理端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_K8S_SECURE', '2', '6443', '', 'fa-cog', 'K8S 安全端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_K8S_SECURE_HA', '2', '6543', '', 'fa-cog', 'K8S 安全代理端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_K8S_SERVICE_NODE_MAX', '2', '30500', '', 'fa-cog', 'K8S 物理映射最大端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_K8S_SERVICE_NODE_MIN', '2', '30020', '', 'fa-cog', 'K8S 物理映射最小端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_K8S_STATS', '2', '8099', '', 'fa-cog', 'K8S 状态端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_MYSQL', '2', '3306', '', 'fa-cog', 'BCOS服务的MYSQL访问端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_NODE_EXPORT', '2', '30019', '', 'fa-cog', 'node_export 节点端口占用');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_PINPOINT_SPAN', '2', '9996', '', 'fa-cog', 'PINPOINT 采集数据上报端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_PINPOINT_STAT', '2', '9995', '', 'fa-cog', 'PINPOINT 状态信息上报端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_PINPOINT_TCP', '2', '9994', '', 'fa-cog', 'PINPOINT 元数据上报端口');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'PORT_PROCESS_EXPORT', '2', '30018', '', 'fa-cog', 'process_export 节点端口占用');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'SYSTEM_CALLBACK_URL', '0', 'http://{{boots_global.SYSTEM_CONTROL_IP}}:{{boots_global.PORT_BOOTS_HTTP}}/boots/v1/callback', '', 'fa-cog', '主机状态回调地址');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'SYSTEM_CONTROL_IP', '2', '{{boots_global.SYSTEM_CONTROL_IP}}', '', 'fa-cog', '控制机IP');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'SYSTEM_CUR_VERSION', '0', '{{version.bcos}}', '', 'fa-cog', '系统当前版本');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'SYSTEM_ENV_CODE', '1', '000000', '', 'fa-cog', '系统环境编码');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'SYSTEM_HOSTNAME_FLAG', '2', 'false', '', 'fa-cog', '是否修改hostname');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'SYSTEM_INSTALL_FLAG', '1', 'false', '', 'fa-cog', '集群安装标识');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'SYSTEM_LOG_LEVEL', '2', 'info', '', 'fa-cog', '日志級別');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'SYSTEM_NAMESPACE', '2', 'bcos', '', 'fa-cog', '租户编码');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'SYSTEM_NTP_SERVER_IP', '2', '{{boots_global.SYSTEM_NTP_SERVER_IP}}', '', 'fa-cog', 'NTP服务地址');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'SYSTEM_REPO_FLAG', '2', 'false', '', 'fa-cog', '是否备份repo源');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'SYSTEM_ROOT_DOMAIN', '2', 'cop.com', '', 'fa-cog', '平台根域名');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'SYSTEM_TARGET_VERSION', '0', '{{version.bcos}}', '', 'fa-cog', '系统升级的目标版本');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'SYSTEM_TIMEZONE', '2', '', '', 'fa-cog', '设置时区');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'SYSTEM_USERNAME', '0', '{{boots_global.USERNAME}}', '', 'fa-cog', '安装用户');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'SYSTEM_WORK_DIR', '0', '{{boots_global.WORK_DIR}}', '', 'fa-cog', '系統工作目录');
INSERT INTO `sys_cluster_info` VALUES ('000000', 'SYSTEM_WORK_DIR_ANSIBLE', '0', '{{boots_global.WORK_DIR_ANSIBLE}}', '', 'fa-cog', '系統安装包目录');






