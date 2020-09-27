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
-- Table structure for sys_cluster_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_cluster_role`;
CREATE TABLE `sys_cluster_role` (
  `id` int(11) NOT NULL,
  `role_code` varchar(32) NOT NULL,
  `role_type` char(1) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `role_desc` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_cluster_role
-- ----------------------------
INSERT INTO `sys_cluster_role` VALUES ('1', 'master', '1', 'fa-cogs', 'master', b'1');
INSERT INTO `sys_cluster_role` VALUES ('2', 'harbor', '1', 'fa-cogs', 'harbor', b'1');
INSERT INTO `sys_cluster_role` VALUES ('3', 'etcd', '2', 'fa-cogs', 'etcd', b'1');
INSERT INTO `sys_cluster_role` VALUES ('4', 'devops', '1', 'fa-cogs', 'ops', b'1');
INSERT INTO `sys_cluster_role` VALUES ('5', 'ceph_osd', '2', 'fa-cogs', 'osd', b'1');
INSERT INTO `sys_cluster_role` VALUES ('6', 'ceph_mon', '2', 'fa-cogs', 'mon', b'1');
INSERT INTO `sys_cluster_role` VALUES ('7', 'docker', '0', 'fa-cogs', 'docker', b'1');
INSERT INTO `sys_cluster_role` VALUES ('8', 'node', '0', 'fa-cogs', 'node', b'1');
INSERT INTO `sys_cluster_role` VALUES ('9', 'operator', '2', 'fa-cogs', 'opera', b'1');
INSERT INTO `sys_cluster_role` VALUES ('10', 'ceph_mds', '0', 'fa-cogs', 'mds', b'1');
INSERT INTO `sys_cluster_role` VALUES ('11', 'ceph_rgw', '0', 'fa-cogs', 'rgw', b'1');
INSERT INTO `sys_cluster_role` VALUES ('12', 'ceph_client', '0', 'fa-cogs', 'client', b'1');
INSERT INTO `sys_cluster_role` VALUES ('13', 'es_master', '2', 'fa-cogs', 'es_m', b'1');
INSERT INTO `sys_cluster_role` VALUES ('14', 'es_data', '2', 'fa-cogs', 'es_d', b'1');
INSERT INTO `sys_cluster_role` VALUES ('15', 'prometheus', '2', 'fa-cogs', 'prome', b'1');

-- ----------------------------
-- Table structure for sys_cluster_role_num
-- ----------------------------
DROP TABLE IF EXISTS `sys_cluster_role_num`;
CREATE TABLE `sys_cluster_role_num` (
  `id` int(11) NOT NULL,
  `role_code` varchar(32) DEFAULT NULL,
  `ref` varchar(32) DEFAULT NULL,
  `ref_num` int(11) DEFAULT NULL,
  `ref_type` char(1) DEFAULT NULL,
  `role_num` int(11) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_cluster_role_num
-- ----------------------------
INSERT INTO `sys_cluster_role_num` VALUES ('1', 'master', 'default', '1', '1', '1', '所有主机中选择1台个节点');
INSERT INTO `sys_cluster_role_num` VALUES ('2', 'harbor', 'default', '1', '1', '1', '所有主机中选择1台个节点');
INSERT INTO `sys_cluster_role_num` VALUES ('3', 'etcd', 'default', '1', '1', '1', '当机器数量超过0台的时候安装1个节点');
INSERT INTO `sys_cluster_role_num` VALUES ('4', 'etcd', 'default', '3', '1', '3', '当机器数量超过3台的时候安装3个节点');
INSERT INTO `sys_cluster_role_num` VALUES ('5', 'etcd', 'default', '32', '1', '5', '当机器数量超过32台的时候安装5个节点');
INSERT INTO `sys_cluster_role_num` VALUES ('6', 'ceph_osd', 'default', '1', '1', '3', '当机器数量超过0台的时候安装3个节点');
INSERT INTO `sys_cluster_role_num` VALUES ('7', 'ceph_osd', 'default', '6', '2', '50', '当机器数量超过10台的时候安装节点数量是总机器数的50%');
INSERT INTO `sys_cluster_role_num` VALUES ('8', 'ceph_mon', 'ceph_osd', '1', '1', '1', '当osd数量超过0台的时候安装1个节点');
INSERT INTO `sys_cluster_role_num` VALUES ('9', 'ceph_mon', 'ceph_osd', '3', '1', '3', '当osd数量超过10台的时候安装3个节点');
INSERT INTO `sys_cluster_role_num` VALUES ('10', 'ceph_mon', 'ceph_osd', '50', '1', '5', '当osd数量超过50台的时候安装5个节点');
INSERT INTO `sys_cluster_role_num` VALUES ('11', 'es_master', 'default', '1', '1', '1', '当机器数量超过0台的时候安装1个节点');
INSERT INTO `sys_cluster_role_num` VALUES ('12', 'es_master', 'default', '3', '1', '3', '当机器数量超过3台的时候安装3个节点');
INSERT INTO `sys_cluster_role_num` VALUES ('13', 'es_data', 'default', '1', '1', '1', '当机器数量超过0台的时候安装1个节点');
INSERT INTO `sys_cluster_role_num` VALUES ('14', 'es_data', 'default', '5', '1', '3', '当机器数量超过5台的时候安装3个节点');
INSERT INTO `sys_cluster_role_num` VALUES ('15', 'devops', 'default', '1', '1', '1', '所有主机中选择1台个节点');
INSERT INTO `sys_cluster_role_num` VALUES ('16', 'ceph_mds', 'ceph_mon', '1', '1', '1', '当mon数量超过0台的时候安装1个节点');
INSERT INTO `sys_cluster_role_num` VALUES ('17', 'ceph_mds', 'ceph_mon', '3', '1', '2', '当mon数量超过3台的时候安装2个节点');
INSERT INTO `sys_cluster_role_num` VALUES ('18', 'ceph_rgw', 'ceph_mon', '1', '1', '1', '当mon数量超过0台的时候安装1个节点');
INSERT INTO `sys_cluster_role_num` VALUES ('19', 'prometheus', 'master', '1', '1', '1', '所有主机中选择1台个节点');

-- ----------------------------
-- Table structure for sys_cluster_role_policy
-- ----------------------------
DROP TABLE IF EXISTS `sys_cluster_role_policy`;
CREATE TABLE `sys_cluster_role_policy` (
  `id` int(11) NOT NULL,
  `role_code` varchar(32) DEFAULT NULL,
  `affine` bit(1) DEFAULT NULL,
  `force` char(1) DEFAULT NULL,
  `ref` varchar(32) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_cluster_role_policy
-- ----------------------------
INSERT INTO `sys_cluster_role_policy` VALUES ('1', 'harbor', b'0', '1', 'master', 'harbor 尽量不在  master 节点上');
INSERT INTO `sys_cluster_role_policy` VALUES ('2', 'etcd', b'1', '0', 'master', 'etcd 尽量在 master 节点上');
INSERT INTO `sys_cluster_role_policy` VALUES ('3', 'ceph_osd', b'0', '0', 'master', 'osd 尽量不在 master 节点上');
INSERT INTO `sys_cluster_role_policy` VALUES ('4', 'docker', b'1', '2', 'default', 'docker 安装在所有 default 节点上');
INSERT INTO `sys_cluster_role_policy` VALUES ('5', 'node', b'0', '2', 'master', 'node 安装在所有 没有master的节点上');
INSERT INTO `sys_cluster_role_policy` VALUES ('6', 'operator', b'1', '2', 'node', 'operator 安装在所有node 节点上');
INSERT INTO `sys_cluster_role_policy` VALUES ('7', 'ceph_mds', b'1', '1', 'ceph_mon', 'mds 安装在所有 mon节点上');
INSERT INTO `sys_cluster_role_policy` VALUES ('8', 'ceph_rgw', b'1', '1', 'ceph_mon', 'rgw 安装在所有 mon节点上');
INSERT INTO `sys_cluster_role_policy` VALUES ('9', 'ceph_client', b'1', '2', 'default', 'clent 安装在所有 default 节点上');
INSERT INTO `sys_cluster_role_policy` VALUES ('10', 'es_master', b'0', '0', 'master', 'es_master从 default 中选择节点');
INSERT INTO `sys_cluster_role_policy` VALUES ('11', 'es_data', b'0', '0', 'master', 'es_data从 default 中选择节点');
INSERT INTO `sys_cluster_role_policy` VALUES ('12', 'devops', b'1', '0', 'master', 'devops从default 中选择节点');
INSERT INTO `sys_cluster_role_policy` VALUES ('13', 'prometheus', b'1', '0', 'node', 'prometheus从node中选择节点');
INSERT INTO `sys_cluster_role_policy` VALUES ('14', 'operator', b'1', '2', 'master', 'operator 安装在所有master 节点上');

-- ----------------------------
-- Table structure for sys_cluster_store_cfg
-- ----------------------------
DROP TABLE IF EXISTS `sys_cluster_store_cfg`;
CREATE TABLE `sys_cluster_store_cfg` (
  `id` int(11) NOT NULL,
  `role_code` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `store_type` char(1) DEFAULT NULL,
  `level` char(1) DEFAULT NULL,
  `max_size` int(11) DEFAULT NULL,
  `min_size` int(11) DEFAULT NULL,
  `extend` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_cluster_store_cfg
-- ----------------------------
INSERT INTO `sys_cluster_store_cfg` VALUES ('1', 'docker', 'dockerlib', '1', '1', '512', '40', '20');
INSERT INTO `sys_cluster_store_cfg` VALUES ('2', 'docker', 'dockervg', '3', '1', '512', '40', '20');
INSERT INTO `sys_cluster_store_cfg` VALUES ('3', 'harbor', 'harbor', '1', '1', '1024', '40', '20');
INSERT INTO `sys_cluster_store_cfg` VALUES ('4', 'operator', 'operatorvg', '3', '1', '512', '40', '20');
INSERT INTO `sys_cluster_store_cfg` VALUES ('5', 'ceph_osd', 'osddata', '2', '1', '1024', '40', '100');
INSERT INTO `sys_cluster_store_cfg` VALUES ('6', 'ceph_osd', 'osdjournel', '2', '1', '50', '10', '100');
INSERT INTO `sys_cluster_store_cfg` VALUES ('7', 'devops', 'devops', '1', '1', '512', '40', '20');
INSERT INTO `sys_cluster_store_cfg` VALUES ('8', 'es_data', 'esdata', '1', '1', '2048', '40', '20');
INSERT INTO `sys_cluster_store_cfg` VALUES ('9', 'es_master', 'esdata', '1', '1', '50', '10', '20');
INSERT INTO `sys_cluster_store_cfg` VALUES ('10', 'prometheus', 'prometheus', '1', '1', '2048', '40', '20');

-- ----------------------------
-- Table structure for sys_install_log_label
-- ----------------------------
DROP TABLE IF EXISTS `sys_install_log_label`;
CREATE TABLE `sys_install_log_label` (
  `id` bigint(20) NOT NULL,
  `playbook` varchar(32) NOT NULL,
  `label_handle` varchar(64) NOT NULL,
  `group_order` varchar(255) DEFAULT NULL,
  `label_regex` varchar(255) NOT NULL,
  `label_type` char(1) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_install_log_label
-- ----------------------------
INSERT INTO `sys_install_log_label` VALUES ('1', 'playbook', '<div style=\"color: purple\">%s</div>', '0', '^\\[DEPRECATION\\sWARNING\\].*$', '1', '任务开始紫色');
INSERT INTO `sys_install_log_label` VALUES ('2', 'playbook', '<div style=\"color: green\">%s</div>', '0', '^ok:.*$', '1', '任务执行成功,绿色');
INSERT INTO `sys_install_log_label` VALUES ('3', 'playbook', '<div style=\"color: green\">%s</div>', '0', '^changed:.*$', '1', '主机发生改变,黄色');
INSERT INTO `sys_install_log_label` VALUES ('4', 'playbook', '<div style=\"color: #008080\">%s</div>', '0', '^skipping:.*$', '1', '主机执行跳过,蓝色');
INSERT INTO `sys_install_log_label` VALUES ('5', 'playbook', '<div style=\"color: darkred \">%s</div>', '0', '^failed:.*$', '1', '主机执行失败,深红');
INSERT INTO `sys_install_log_label` VALUES ('6', 'playbook', '<div style=\"color: green\">%s</div>', '0', '^included:.*$', '1', '主机发生改变,黄色');
INSERT INTO `sys_install_log_label` VALUES ('7', 'playbook', '<div style=\"color: darkred \">%s</div>', '0', '^fatal:.*$', '1', '主机执行失败,深红');
INSERT INTO `sys_install_log_label` VALUES ('8', 'playbook', '<br/>', '0', '^s*$', '1', '空数据,换行');
INSERT INTO `sys_install_log_label` VALUES ('9', 'host_check.yml', '{\"ip\": \"%s\",\"message\":\"主机不可达\"}', '1', '^fatal: \\[(.*)]: UNREACHABLE(.*)No route to host(.*)', '0', '主机不可达');
INSERT INTO `sys_install_log_label` VALUES ('10', 'host_check.yml', '{\"ip\": \"%s\",\"message\":\"主机连接超时\"}', '1', '^fatal: \\[(.*)]: UNREACHABLE(.*)Connection timed out(.*)', '0', '主机连接超时');
INSERT INTO `sys_install_log_label` VALUES ('11', 'host_check.yml', '{\"ip\": \"%s\",\"message\":\"用户密码不对\"}', '1', '^fatal: \\[(.*)]: UNREACHABLE(.*)Authentication failure(.*)', '0', '用户密码不对');
INSERT INTO `sys_install_log_label` VALUES ('12', 'host_check.yml', '{\"ip\": \"%s\",\"message\":\"主机sudo密码不对\"}', '1', '^fatal: \\[(.*)]: UNREACHABLE(.*)Permission denied(.*)', '0', '主机sudo密码不对');
INSERT INTO `sys_install_log_label` VALUES ('13', 'host_check.yml', '{\"ip\": \"%s\",\"message\":\"主机没有sudo权限\"}', '1', '^fatal: \\[(.*)]: UNREACHABLE(.*)is not in the sudoers file(.*)', '0', '主机没有sudo权限');
INSERT INTO `sys_install_log_label` VALUES ('14', 'host_check.yml', '{\"ip\": \"%s\",\"message\":\"系统内核匹配失败\"}', '1', '.*内核匹配失败BEGIN(.*)END内核匹配失败.*', '0', '系统内核匹配失败');
INSERT INTO `sys_install_log_label` VALUES ('15', 'host_check.yml', '{\"ip\": \"%s\",\"message\":\"磁盘存储空间不足\"}', '1', '.*设备存储空间不足BEGIN(.*)END设备存储空间不足.*', '0', '磁盘存储空间不足');
INSERT INTO `sys_install_log_label` VALUES ('16', 'host_check.yml', '{\"ip\": \"%s\",\"message\":\"该主机没有默认路由\"}', '1', '.*没有默认路由BEGIN(.*)END没有默认路由.*', '0', '该主机没有默认路由');
INSERT INTO `sys_install_log_label` VALUES ('17', 'host_check.yml', '{\"ip\": \"%s\",\"message\":\"与控制机时间差大于2ms\"}', '1', '.*与控制机时间差大于2msBEGIN(.*)END与控制机时间差大于2ms.*', '0', '与控制机时间差大于2ms');

-- ----------------------------
-- Table structure for sys_install_play
-- ----------------------------
DROP TABLE IF EXISTS `sys_install_play`;
CREATE TABLE `sys_install_play` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `play_code` varchar(32) DEFAULT NULL,
  `play_desc` varchar(255) DEFAULT NULL,
  `play_name` varchar(32) DEFAULT NULL,
  `play_type` int(11) DEFAULT NULL,
  `lock_type` bit(1) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_install_playbook
-- ----------------------------
DROP TABLE IF EXISTS `sys_install_playbook`;
CREATE TABLE `sys_install_playbook` (
  `id` bigint(20) NOT NULL,
  `index` int(11) DEFAULT NULL,
  `play_code` varchar(32) DEFAULT NULL,
  `playbook` varchar(32) DEFAULT NULL,
  `playbook_name` varchar(32) DEFAULT NULL,
  `filename` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for sys_install_host_control
-- ----------------------------
DROP TABLE IF EXISTS `sys_install_host_control`;
CREATE TABLE `sys_install_host_control` (
  `id` int(11) NOT NULL,
  `group` varchar(32) DEFAULT NULL,
  `role_code` varchar(32) DEFAULT NULL,
  `target_enable` bit(1) DEFAULT NULL,
  `control` varchar(32) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `playbook` varchar(32) DEFAULT NULL,
  `memo` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


-- ----------------------------
-- Records of sys_install_play  一级工具 ID 区域 [0, 9] 菜单目录 ID 区域 [10, 99]   菜单工具 ID区域 [100, 999]
-- 菜单目录:  不可执行，仅用于构建菜单关系
-- 一级工具:  展示在页面头部的任务工具栏
-- 菜单工具:  用于构建菜单树的 任务

-- 每个菜单目录 下面只能挂载 10 个任务，任务的ID 编码方式范围 [$menu_id0, $menu_id9]
-- 一个 play 对应 最多 100个 playbook  id 编码方式范围  [$play_id00, $play_id99]
-- 一个 play 对应 最多 100个 host_control  编码方式范围  [$play_id00, $play_id99]
-- ----------------------------


-- -----------------------
--  菜单目录 START  10
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('10', 'tools', '集群工具', '集群工具', '0', b'0', 'fa-tools', 'btn-warning', '2', '1800');
INSERT INTO `sys_install_play` VALUES ('11', 'tools_host', '主机操作', '主机操作', '1', b'0', 'fa-desktop', 'text-info', '2', '1800');
INSERT INTO `sys_install_play` VALUES ('12', 'tools_service', '启停服务', '启停服务', '1', b'0', 'fa-power-off', 'text-success', '2', '1800');
INSERT INTO `sys_install_play` VALUES ('13', 'tools_upgrade', '系统升级', '系统升级', '1', b'0', 'fa-arrow-alt-circle-up', 'text-success', '2', '1800');
INSERT INTO `sys_install_play` VALUES ('14', 'tools_restart', '重启组件', '重启组件', '1', b'0', 'fa-power-off', 'text-success', '2', '1800');
INSERT INTO `sys_install_play` VALUES ('15', 'tools_repair', '系統修复', '系統修复', '1', b'0', 'fa-hammer', 'text-success', '2', '1800');
-- -----------------------
--  菜单目录 END     99
-- -----------------------

-- -----------------------
--  一级工具 START  0
-- -----------------------
-- CLUSTER 上传升级包 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('1', 'cluster_upgrade', '上传升级包', '上传升级包', '0', b'1', 'fa-arrow-alt-circle-up', 'btn-primary', '3', '1800');
INSERT INTO `sys_install_playbook` VALUES ('100', '1', 'cluster_upgrade', 'upgrade_package', '初始化升級包', 'upgrade_pack.yml');
INSERT INTO `sys_install_host_control` VALUES ('100', 'harbor', 'harbor', b'0', '0', '2', 'upgrade_package', '目标机：已安装的全部harbor主机');
-- -----------------------
-- CLUSTER 上传升级包 END
-- -----------------------

-- -----------------------
-- CLUSTER 同步版本 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('2', 'pack_pull_code', '同步版本', '同步版本', '0', b'1', 'fa-anchor', 'btn-info', '4', '1800');
INSERT INTO `sys_install_playbook` VALUES ('200', '1', 'pack_pull_code', 'pack_pull_code', '同步版本', 'update_code.yml');
-- -----------------------
-- CLUSTER 同步版本 END
-- -----------------------

-- -----------------------
-- CLUSTER 制作安装包 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('3', 'pack_make_install', '制作安装包', '制作安装包', '0', b'1', 'fa-cube', 'btn-info', '4', '3600');
INSERT INTO `sys_install_playbook` VALUES ('300', '1', 'pack_make_install', 'pack_make_install', '制作安装包', 'make_install_pack.yml');
-- -----------------------
-- CLUSTER 制作安装包 END
-- -----------------------

-- -----------------------
-- CLUSTER 制作升级包 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('4', 'pack_make_update', '制作升级包', '制作升级包', '0', b'1', 'fa-chart-line', 'btn-info', '4', '1800');
INSERT INTO `sys_install_playbook` VALUES ('400', '1', 'pack_make_update', 'pack_make_update', '制作升级包', 'make_upgrade_pack.yml');
-- -----------------------
-- CLUSTER 制作升级包 START
-- -----------------------

-- -----------------------
-- CLUSTER 安裝集群START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('5', 'cluster_install', '集群安装', '集群安装', '0', b'1', 'fa-power-off', 'btn-danger', '3', '1800');
INSERT INTO `sys_install_playbook` VALUES ('501', '1', 'cluster_install', 'install_cluster_init', '主机初始化', 'host_base.yml');
INSERT INTO `sys_install_playbook` VALUES ('502', '2', 'cluster_install', 'install_cluster_docker', '安装docker', 'install_docker.yml');
INSERT INTO `sys_install_playbook` VALUES ('503', '3', 'cluster_install', 'install_cluster_harbor', '安装harbor', 'install_harbor.yml');
INSERT INTO `sys_install_playbook` VALUES ('504', '4', 'cluster_install', 'install_cluster_crt', '添加harbor的密钥', 'install_harbor_crt.yml');
INSERT INTO `sys_install_playbook` VALUES ('505', '5', 'cluster_install', 'install_cluster_devops', '安装jenkins', 'install_devops.yml');
INSERT INTO `sys_install_playbook` VALUES ('506', '6', 'cluster_install', 'install_cluster_etcd', '安装etcd', 'install_etcd.yml');
INSERT INTO `sys_install_playbook` VALUES ('507', '7', 'cluster_install', 'install_cluster_k8s', '安装k8s', 'install_k8s.yml');
INSERT INTO `sys_install_playbook` VALUES ('508', '8', 'cluster_install', 'install_cluster_plugin', '安装插件', 'install_plugin.yml');
INSERT INTO `sys_install_playbook` VALUES ('509', '9', 'cluster_install', 'install_cluster_opt', '安装operator', 'install_operator.yml');
INSERT INTO `sys_install_playbook` VALUES ('510', '10', 'cluster_install', 'install_cluster_mon', '安装ceph_mon', 'install_ceph_mon.yml');
INSERT INTO `sys_install_playbook` VALUES ('511', '11', 'cluster_install', 'install_cluster_osd', '安装ceph_osd', 'install_ceph_osd.yml');
INSERT INTO `sys_install_playbook` VALUES ('512', '12', 'cluster_install', 'install_cluster_mds', '安装ceph_mds', 'install_ceph_mds.yml');
INSERT INTO `sys_install_playbook` VALUES ('513', '14', 'cluster_install', 'install_cluster_client', '安装ceph客户端', 'install_ceph_client.yml');
INSERT INTO `sys_install_playbook` VALUES ('515', '13', 'cluster_install', 'install_cluster_rgw', '安装ceph_rgw', 'install_ceph_rgw.yml');
INSERT INTO `sys_install_playbook` VALUES ('514', '15', 'cluster_install', 'install_cluster_es', '安装es 节点', 'install_es.yml');
INSERT INTO `sys_install_playbook` VALUES ('516', '16', 'cluster_install', 'install_cluster_bcos', '初始化bcos的数据', 'install_bcos_db.yml');
INSERT INTO `sys_install_host_control` VALUES ('501', 'default', 'default', b'0', '2', '*', 'install_cluster_init', '目标机：任意状态的全部主机');
INSERT INTO `sys_install_host_control` VALUES ('502', 'docker', 'docker', b'0', '1', '1', 'install_cluster_docker', '目标机：未安装的全部docker主机');
INSERT INTO `sys_install_host_control` VALUES ('503', 'harbor', 'harbor', b'0', '1', '1', 'install_cluster_harbor', '目标机：未安装的全部harbor主机');
INSERT INTO `sys_install_host_control` VALUES ('505', 'docker', 'docker', b'0', '2', '*', 'install_cluster_crt', '目标机：任意状态的全部docker主机');
INSERT INTO `sys_install_host_control` VALUES ('506', 'etcd', 'etcd', b'0', '2', '*', 'install_cluster_etcd', '目标机：任意状态的全部etcd主机');
INSERT INTO `sys_install_host_control` VALUES ('507', 'devops', 'devops', b'0', '2', '*', 'install_cluster_devops', '目标机：任意状态的全部devops主机');
INSERT INTO `sys_install_host_control` VALUES ('508', 'master', 'master', b'0', '2', '*', 'install_cluster_k8s', '目标机：任意状态的全部master主机');
INSERT INTO `sys_install_host_control` VALUES ('509', 'etcd', 'etcd', b'0', '2', '*', 'install_cluster_k8s', '目标机：任意状态的全部etcd主机');
INSERT INTO `sys_install_host_control` VALUES ('510', 'node', 'node', b'0', '2', '*', 'install_cluster_k8s', '目标机：任意状态的全部node主机');
INSERT INTO `sys_install_host_control` VALUES ('511', 'master', 'master', b'0', '2', '*', 'install_cluster_plugin', '目标机：任意状态的全部master主机');
INSERT INTO `sys_install_host_control` VALUES ('512', 'prometheus', 'prometheus', b'0', '2', '*', 'install_cluster_plugin', '目标机：未安装的Prometheus机器');
INSERT INTO `sys_install_host_control` VALUES ('513', 'default', 'default', b'0', '2', '*', 'install_cluster_plugin', '目标机：监控所有的主机节点');
INSERT INTO `sys_install_host_control` VALUES ('514', 'operator', 'operator', b'0', '1', '1', 'install_cluster_opt', '目标机：未安装的全部operator主机');
INSERT INTO `sys_install_host_control` VALUES ('515', 'master', 'master', b'0', '2', '*', 'install_cluster_opt', '目标机：任意状态的全部master主机');
INSERT INTO `sys_install_host_control` VALUES ('516', 'ceph_mon', 'ceph_mon', b'0', '1', '1', 'install_cluster_mon', '目标机：未安装的全部mon主机');
INSERT INTO `sys_install_host_control` VALUES ('517', 'ceph_osd', 'ceph_osd', b'0', '1', '1', 'install_cluster_mon', '目标机：未安装的全部osd主机');
INSERT INTO `sys_install_host_control` VALUES ('518', 'ceph_mds', 'ceph_mds', b'0', '1', '1', 'install_cluster_mon', '目标机：未安装的全部mds主机');
INSERT INTO `sys_install_host_control` VALUES ('519', 'ceph_rgw', 'ceph_rgw', b'0', '1', '1', 'install_cluster_mon', '目标机：未安装的全部rgw主机');
INSERT INTO `sys_install_host_control` VALUES ('520', 'ceph_osd', 'ceph_osd', b'0', '1', '1', 'install_cluster_osd', '目标机：未安装的全部osd主机');
INSERT INTO `sys_install_host_control` VALUES ('521', 'ceph_mds', 'ceph_mds', b'0', '1', '1', 'install_cluster_mds', '目标机：未安装的全部mds主机');
INSERT INTO `sys_install_host_control` VALUES ('522', 'ceph_mds_all', 'ceph_mds', b'0', '2', '*', 'install_cluster_mds', '目标机：任意状态的全部mds主机');
INSERT INTO `sys_install_host_control` VALUES ('523', 'ceph_rgw', 'ceph_rgw', b'0', '2', '*', 'install_cluster_rgw', '目标机：任意状态的全部rgw主机');
INSERT INTO `sys_install_host_control` VALUES ('524', 'ceph_client', 'ceph_client', b'0', '1', '1', 'install_cluster_client', '目标机：未安装的全部ceph_client主机');
INSERT INTO `sys_install_host_control` VALUES ('525', 'es_master', 'es_master', b'0', '2', '*', 'install_cluster_es', '目标机：未安装的全部es master主机');
INSERT INTO `sys_install_host_control` VALUES ('526', 'es_data', 'es_data', b'0', '1', '1', 'install_cluster_es', '目标机：未安装的全部es data主机');
INSERT INTO `sys_install_host_control` VALUES ('527', 'master', 'master', b'0', '2', '*', 'install_cluster_bcos', '目标机：任意状态的全部master主机');
-- -----------------------
-- CLUSTER 安裝集群 END
-- -----------------------

-- -----------------------
-- CLUSTER 拓展集群 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('6', 'cluster_extend', '集群拓展', '集群拓展', '0', b'0', 'fa-power-off', 'btn-danger', '3', '1800');
INSERT INTO `sys_install_playbook` VALUES ('601', '1', 'cluster_extend', 'extend_node_init', '主机初始化', 'host_base.yml');
INSERT INTO `sys_install_playbook` VALUES ('602', '2', 'cluster_extend', 'extend_node_docker', '拓展docker', 'extend_docker.yml');
INSERT INTO `sys_install_playbook` VALUES ('603', '3', 'cluster_extend', 'extend_node_etcd', '拓展etcd', 'extend_etcd.yml');
INSERT INTO `sys_install_playbook` VALUES ('604', '4', 'cluster_extend', 'extend_node_k8s', '拓展node', 'extend_k8s.yml');
INSERT INTO `sys_install_playbook` VALUES ('605', '5', 'cluster_extend', 'extend_node_mon', '拓展ceph_mon', 'install_ceph_mon.yml');
INSERT INTO `sys_install_playbook` VALUES ('606', '6', 'cluster_extend', 'extend_node_osd', '拓展ceph_osd', 'install_ceph_osd.yml');
INSERT INTO `sys_install_playbook` VALUES ('607', '7', 'cluster_extend', 'extend_node_mds', '拓展ceph_mds', 'install_ceph_mds.yml');
INSERT INTO `sys_install_playbook` VALUES ('608', '8', 'cluster_extend', 'extend_node_rgw', '拓展ceph_rgw', 'install_ceph_rgw.yml');
INSERT INTO `sys_install_playbook` VALUES ('609', '9', 'cluster_extend', 'extend_node_client', '拓展ceph客户端', 'install_ceph_client.yml');
INSERT INTO `sys_install_playbook` VALUES ('610', '10', 'cluster_extend', 'extend_node_es', '拓展es 节点', 'install_es.yml');
INSERT INTO `sys_install_host_control` VALUES ('601', 'default', 'default', b'1', '2', '*', 'extend_node_init', '目标机：任意状态的目标主机');
INSERT INTO `sys_install_host_control` VALUES ('602', 'docker', 'docker', b'1', '1', '1', 'extend_node_docker', '目标机：未安装的目标docker主机');
INSERT INTO `sys_install_host_control` VALUES ('603', 'harbor', 'harbor', b'1', '1', '1', 'extend_node_docker', '目标机：未安装的harbor 主机');
INSERT INTO `sys_install_host_control` VALUES ('604', 'docker_all', 'docker', b'0', '2', '*', 'extend_node_docker', '目标机：任意状态的目标docker主机');
INSERT INTO `sys_install_host_control` VALUES ('605', 'devops', 'devops', b'0', '1', '2', 'extend_node_docker', '目标机：已安装的devops 机器');
INSERT INTO `sys_install_host_control` VALUES ('606', 'etcd_new', 'etcd', b'0', '1', '1', 'extend_node_etcd', '目标机：未安装的etcd 主机');
INSERT INTO `sys_install_host_control` VALUES ('607', 'etcd_old', 'etcd', b'0', '1', '2', 'extend_node_etcd', '目标机：已安装的etcd 主机');
INSERT INTO `sys_install_host_control` VALUES ('608', 'default', 'default', b'0', '2', '*', 'extend_node_k8s', '目标机：监控所有的主机节点');
INSERT INTO `sys_install_host_control` VALUES ('609', 'node_old', 'node', b'1', '1', '2', 'extend_node_k8s', '目标机：已经安装的node 节点');
INSERT INTO `sys_install_host_control` VALUES ('610', 'node', 'node', b'1', '1', '1', 'extend_node_k8s', '目标机：未安装的目标node主机');
INSERT INTO `sys_install_host_control` VALUES ('611', 'master_old', 'master', b'0', '1', '2', 'extend_node_k8s', '目标机：任意状态的全部master主机');
INSERT INTO `sys_install_host_control` VALUES ('612', 'master', 'master', b'1', '1', '1', 'extend_node_k8s', '目标机：未安装的master 主机');
INSERT INTO `sys_install_host_control` VALUES ('613', 'operator', 'operator', b'1', '1', '1', 'extend_node_k8s', '目标机：未安装的目标operator主机');
INSERT INTO `sys_install_host_control` VALUES ('614', 'ceph_mon', 'ceph_mon', b'1', '1', '1', 'extend_node_mon', '目标机：未安装的目标ceph_mon主机');
INSERT INTO `sys_install_host_control` VALUES ('615', 'ceph_mon_all', 'ceph_mon', b'0', '2', '*', 'extend_node_mon', '目标机：任意状态的ceph_mon主机');
INSERT INTO `sys_install_host_control` VALUES ('616', 'ceph_osd_all', 'ceph_osd', b'0', '2', '*', 'extend_node_mon', '目标机：任意状态的ceph_osd主机');
INSERT INTO `sys_install_host_control` VALUES ('617', 'ceph_mds_all', 'ceph_mds', b'0', '2', '*', 'extend_node_mon', '目标机：任意状态的ceph_mds主机');
INSERT INTO `sys_install_host_control` VALUES ('618', 'ceph_rgw_all', 'ceph_rgw', b'0', '2', '*', 'extend_node_mon', '目标机：任意状态的ceph_rgw主机');
INSERT INTO `sys_install_host_control` VALUES ('619', 'ceph_client_all', 'ceph_client', b'0', '2', '*', 'extend_node_mon', '目标机：任意状态的ceph_client主机');
INSERT INTO `sys_install_host_control` VALUES ('620', 'ceph_osd', 'ceph_osd', b'1', '1', '1', 'extend_node_osd', '目标机：未安装的目标ceph_osd主机');
INSERT INTO `sys_install_host_control` VALUES ('621', 'ceph_osd_all', 'ceph_osd', b'0', '2', '*', 'extend_node_osd', '目标机：任意状态的ceph_osd主机');
INSERT INTO `sys_install_host_control` VALUES ('622', 'ceph_mon_all', 'ceph_mon', b'0', '2', '*', 'extend_node_osd', '目标机：任意状态的ceph_mon主机');
INSERT INTO `sys_install_host_control` VALUES ('623', 'ceph_mds', 'ceph_mds', b'1', '1', '1', 'extend_node_mds', '目标机：未安装的目标ceph_mds主机');
INSERT INTO `sys_install_host_control` VALUES ('624', 'ceph_mds_all', 'ceph_mds', b'0', '2', '*', 'extend_node_mds', '目标机：任意状态的ceph_mds主机');
INSERT INTO `sys_install_host_control` VALUES ('625', 'ceph_rgw', 'ceph_rgw', b'1', '1', '1', 'extend_node_rgw', '目标机：未安装的目标ceph_rgw主机');
INSERT INTO `sys_install_host_control` VALUES ('626', 'ceph_client', 'ceph_client', b'1', '1', '1', 'extend_node_client', '目标机：未安装的目标ceph_client主机');
INSERT INTO `sys_install_host_control` VALUES ('627', 'es_master', 'es_master', b'0', '2', '*', 'extend_node_es', '目标机：未安装的全部es master主机');
INSERT INTO `sys_install_host_control` VALUES ('628', 'es_data', 'es_data', b'1', '1', '1', 'extend_node_es', '目标机：未安装的全部es data主机');
-- -----------------------
-- CLUSTER 拓展集群 END
-- -----------------------

-- -----------------------
-- CLUSTER 制作工具包 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('7', 'pack_make_tools', '制作工具包', '制作工具包', '0', b'1', 'fa-tools', 'btn-info', '4', '1800');
INSERT INTO `sys_install_playbook` VALUES ('500', '1', 'pack_make_tools', 'pack_make_tools', '制作升级包', 'make_tools_pack.yml');
-- -----------------------
-- CLUSTER 制作工具包 START
-- -----------------------
--  一级工具 END  9
-- -----------------------


-- -----------------------
--  菜单工具 START  100
-- -----------------------
-- CLUSTER 主机检查 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('100', 'tools_cluster_check', '主机检查', '主机检查', '1', b'0', 'fa-sync', 'text-info', '1', '1800');
INSERT INTO `sys_install_playbook` VALUES ('10000', '1', 'tools_cluster_check', 'host_check_init', '主机检查', 'host_check.yml');
INSERT INTO `sys_install_host_control` VALUES ('10000', 'default', 'default', b'1', '2', '*', 'host_check_init', '目标机：任意状态的目标主机');
-- -----------------------
-- CLUSTER 主机检查 END
-- -----------------------

-- -----------------------
-- CLUSTER 主机清理 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('110', 'tools_host_clean', '主机清理', '主机清理', '2', b'0', 'fa-shekel-sign', 'text-info', '3', '1800');
INSERT INTO `sys_install_playbook` VALUES ('11000', '1', 'tools_host_clean', 'host_clean_init', '初始化主机', 'host_clean.yml');
INSERT INTO `sys_install_host_control` VALUES ('11000', 'default', 'default', b'1', '2', '*', 'host_clean_init', '目标机：任意状态的目标主机');
-- -----------------------
-- CLUSTER 主机清理 END
-- -----------------------

-- -----------------------
-- CLUSTER 卸載节点 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('111', 'tools_host_delete', '节点删除', '节点删除', '2', b'0', 'fa-trash', 'text-info', '1', '1800');
INSERT INTO `sys_install_playbook` VALUES ('11100', '1', 'tools_host_delete', 'delete_node_k8s', '卸载节点', 'uninstall_node.yml');
INSERT INTO `sys_install_host_control` VALUES ('11100', 'default', 'default', b'0', '2', '*', 'delete_node_k8s', '目标机：监控所有的主机节点');
INSERT INTO `sys_install_host_control` VALUES ('11101', 'node', 'node', b'1', '2', '*', 'delete_node_k8s', '目标机：任意状态的目标node主机');
INSERT INTO `sys_install_host_control` VALUES ('11102', 'master', 'master', b'0', '0', '2', 'delete_node_k8s', '目标机：已安装的全部master主机');
-- -----------------------
-- CLUSTER 卸載节点 END
-- -----------------------

-- -----------------------
-- CLUSTER 扩展存储 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('112', 'tools_host_storage', '扩展存储', '扩展存储', '2', b'0', 'fa-hdd', 'text-info', '3', '1800');
INSERT INTO `sys_install_playbook` VALUES ('11200', '1', 'tools_host_storage', 'extend_storage', '扩展存储', 'extend_storage.yml');
INSERT INTO `sys_install_host_control` VALUES ('11200', 'docker', 'docker', b'1', '1', '2', 'extend_storage', '目标机：指定的安装好docker的主机');
INSERT INTO `sys_install_host_control` VALUES ('11201', 'harbor', 'harbor', b'1', '1', '2', 'extend_storage', '目标机：指定的安装好harbor的主机');
INSERT INTO `sys_install_host_control` VALUES ('11202', 'operator', 'operator', b'1', '1', '2', 'extend_storage', '目标机：指定的安装好operator的主机');
INSERT INTO `sys_install_host_control` VALUES ('11203', 'devops', 'devops', b'1', '1', '2', 'extend_storage', '目标机：指定的安装好devops的主机');
INSERT INTO `sys_install_host_control` VALUES ('11204', 'es_master', 'es_master', b'1', '1', '2', 'extend_storage', '目标机：指定的安装好es_master的主机');
INSERT INTO `sys_install_host_control` VALUES ('11205', 'es_data', 'es_data', b'1', '1', '2', 'extend_storage', '目标机：指定的安装好es_data的主机');
-- -----------------------
-- CLUSTER 扩展存储 END
-- -----------------------

-- -----------------------
-- GPU 功能配置START
-- -----------------------
INSERT INTO `boots`.`sys_install_play` VALUES ('113', 'tools_host_gpu', '扩展GPU', '扩展GPU', '2', b'0', 'fa-microchip', 'text-info', '3', '1800');
INSERT INTO `boots`.`sys_install_playbook`  VALUES ('11300', '1', 'tools_host_gpu', 'add_gpu', '拓展gpu', 'extend_gpu.yml');
INSERT INTO `boots`.`sys_install_host_control`  VALUES ('11300', 'docker', 'docker', b'1', '2', '2', 'add_gpu', '目标机：指定的已安装好的docker主机');
INSERT INTO `boots`.`sys_install_host_control`  VALUES ('11301', 'master', 'master', b'0', '0', '2', 'add_gpu', '目标机：已安装的全部master主机');
-- -----------------------
-- GPU 功能配置 END
-- -----------------------

-- -----------------------
-- NTP 功能配置START
-- -----------------------
INSERT INTO `boots`.`sys_install_play` VALUES ('114', 'tools_host_ntp', '扩展NTP', '扩展NTP', '2', b'0', 'fa-clock', 'text-info', '3', '1800');
INSERT INTO `boots`.`sys_install_playbook`  VALUES ('11400', '1', 'tools_host_ntp', 'add_ntp', '拓展ntp', 'extend_ntpd.yml');
INSERT INTO `boots`.`sys_install_host_control`  VALUES ('11400', 'default', 'default', b'0', '2', '*', 'add_ntp', '目标机：任意状态的全部主机');
-- -----------------------
-- NTP 功能配置 END
-- -----------------------

-- -----------------------
-- CLUSTER 主机清理 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('115', 'tools_host_reset', '清理集群', '清理集群', '2', b'1', 'fa-redo-alt', 'text-info', '3', '1800');
INSERT INTO `sys_install_playbook` VALUES ('11500', '1', 'tools_host_reset', 'host_clean_reset', '清理集群所有主机', 'host_reset.yml');
INSERT INTO `sys_install_host_control` VALUES ('11500', 'default', 'default', b'0', '2', '*', 'host_clean_reset', '目标机：任意状态的目标主机');
-- -----------------------
-- CLUSTER 主机清理 END
-- -----------------------

-- -----------------------
-- CLUSTER 拓展ETCD START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('116', 'tools_host_etcd', '扩展etcd', '扩展etcd', '2', b'1', 'fa-database', 'text-info', '3', '1800');
INSERT INTO `sys_install_playbook` VALUES ('11600', '1', 'tools_host_etcd', 'host_extend_etcd', '拓展etcd', 'extend_etcd.yml');
INSERT INTO `sys_install_host_control` VALUES ('11600', 'etcd_new', 'etcd', b'0', '1', '0', 'host_extend_etcd', '目标机：未安装的etcd 主机');
INSERT INTO `sys_install_host_control` VALUES ('11601', 'etcd_old', 'etcd', b'0', '1', '2', 'host_extend_etcd', '目标机：已安装的etcd 主机');
-- -----------------------
-- CLUSTER 拓展ETCD END
-- -----------------------

-- -----------------------
-- CLUSTER 启动服务 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('120', 'tools_service_start', '启动服务', '启动服务', '2', b'0', 'fa-power-off', 'text-success', '3', '1800');
INSERT INTO `sys_install_playbook` VALUES ('12000', '1', 'tools_service_start', 'service_start', '启动所有服务', 'service_start.yml');
INSERT INTO `sys_install_host_control` VALUES ('12000', 'docker', 'docker', b'1', '1', '2', 'service_start', '目标机：指定的安装好docker的主机');
INSERT INTO `sys_install_host_control` VALUES ('12001', 'harbor', 'harbor', b'1', '1', '2', 'service_start', '目标机：指定的安装好harbor的主机');
INSERT INTO `sys_install_host_control` VALUES ('12002', 'node', 'node', b'1', '1', '2', 'service_start', '目标机：指定的安装好node的主机');
INSERT INTO `sys_install_host_control` VALUES ('12003', 'master', 'master', b'1', '1', '2', 'service_start', '目标机：指定的安装好master的主机');
INSERT INTO `sys_install_host_control` VALUES ('12004', 'es_master', 'es_master', b'1', '1', '2', 'service_start', '目标机：指定的安装好es_master的主机');
INSERT INTO `sys_install_host_control` VALUES ('12005', 'es_data', 'es_data', b'1', '1', '2', 'service_start', '目标机：指定的安装好es_data的主机');
INSERT INTO `sys_install_host_control` VALUES ('12006', 'ceph_mon', 'ceph_mon', b'1', '1', '2', 'service_start', '目标机：指定的安装好ceph-mon的主机');
INSERT INTO `sys_install_host_control` VALUES ('12007', 'ceph_osd', 'ceph_osd', b'1', '1', '2', 'service_start', '目标机：指定的安装好ceph-osd的主机');
INSERT INTO `sys_install_host_control` VALUES ('12008', 'ceph_mds', 'ceph_mds', b'1', '1', '2', 'service_start', '目标机：指定的安装好ceph-mds的主机');
INSERT INTO `sys_install_host_control` VALUES ('12009', 'ceph_rgw', 'ceph_rgw', b'1', '1', '2', 'service_start', '目标机：指定的安装好ceph-rgw的主机');
-- -----------------------
-- CLUSTER 启动服务 END
-- -----------------------

-- -----------------------
-- CLUSTER 停止服务 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('121', 'tools_service_stop', '停止服务', '停止服务', '2', b'0', 'fa-power-off', 'text-danger', '3', '1800');
INSERT INTO `sys_install_playbook` VALUES ('12100', '1', 'tools_service_stop', 'service_stop', '停止所有服务', 'service_stop.yml');
INSERT INTO `sys_install_host_control` VALUES ('12100', 'docker', 'docker', b'1', '1', '2', 'service_stop', '目标机：指定的安装好docker的主机');
INSERT INTO `sys_install_host_control` VALUES ('12101', 'harbor', 'harbor', b'1', '1', '2', 'service_stop', '目标机：指定的安装好harbor的主机');
INSERT INTO `sys_install_host_control` VALUES ('12102', 'node', 'node', b'1', '1', '2', 'service_stop', '目标机：指定的安装好node的主机');
INSERT INTO `sys_install_host_control` VALUES ('12103', 'master', 'master', b'1', '1', '2', 'service_stop', '目标机：指定的安装好master的主机');
INSERT INTO `sys_install_host_control` VALUES ('12104', 'es_master', 'es_master', b'1', '1', '2', 'service_stop', '目标机：指定的安装好es_master的主机');
INSERT INTO `sys_install_host_control` VALUES ('12105', 'es_data', 'es_data', b'1', '1', '2', 'service_stop', '目标机：指定的安装好es_data的主机');
INSERT INTO `sys_install_host_control` VALUES ('12106', 'ceph_mon', 'ceph_mon', b'1', '1', '2', 'service_stop', '目标机：指定的安装好ceph-mon的主机');
INSERT INTO `sys_install_host_control` VALUES ('12107', 'ceph_osd', 'ceph_osd', b'1', '1', '2', 'service_stop', '目标机：指定的安装好ceph-osd的主机');
INSERT INTO `sys_install_host_control` VALUES ('12108', 'ceph_mds', 'ceph_mds', b'1', '1', '2', 'service_stop', '目标机：指定的安装好ceph-mds的主机');
INSERT INTO `sys_install_host_control` VALUES ('12109', 'ceph_rgw', 'ceph_rgw', b'1', '1', '2', 'service_stop', '目标机：指定的安装好ceph-rgw的主机');
-- -----------------------
-- CLUSTER 停止服务 END
-- -----------------------

-- -----------------------
-- CLUSTER 重启服务 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('122', 'tools_service_restart', '重启服务', '重启服务', '2', b'0', 'fa-power-off', 'text-info', '3', '1800');
INSERT INTO `sys_install_playbook` VALUES ('12200', '1', 'tools_service_restart', 'service_stop', '停止所有服务', 'service_stop.yml');
INSERT INTO `sys_install_playbook` VALUES ('12201', '2', 'tools_service_restart', 'service_start', '启动所有服务', 'service_start.yml');
-- -----------------------
-- CLUSTER 重启服务 END
-- -----------------------

-- -----------------------
-- CLUSTER 服务状态 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('123', 'tools_service_status', '服务状态', '服务状态', '2', b'0', 'fa-power-off', 'text-info', '3', '1800');
INSERT INTO `sys_install_playbook` VALUES ('12300', '1', 'tools_service_status', 'service_status', '查询服务状态', 'service_status.yml');
INSERT INTO `sys_install_host_control` VALUES ('12300', 'docker', 'docker', b'1', '1', '2', 'service_status', '目标机：指定的安装好docker的主机');
INSERT INTO `sys_install_host_control` VALUES ('12301', 'harbor', 'harbor', b'1', '1', '2', 'service_status', '目标机：指定的安装好harbor的主机');
INSERT INTO `sys_install_host_control` VALUES ('12302', 'node', 'node', b'1', '1', '2', 'service_status', '目标机：指定的安装好node的主机');
INSERT INTO `sys_install_host_control` VALUES ('12303', 'master', 'master', b'0', '1', '2', 'service_status', '目标机：指定的安装好master的主机');
INSERT INTO `sys_install_host_control` VALUES ('12304', 'es_master', 'es_master', b'1', '1', '2', 'service_status', '目标机：指定的安装好es_master的主机');
INSERT INTO `sys_install_host_control` VALUES ('12305', 'es_data', 'es_data', b'1', '1', '2', 'service_status', '目标机：指定的安装好es_data的主机');
INSERT INTO `sys_install_host_control` VALUES ('12306', 'ceph_mon', 'ceph_mon', b'1', '1', '2', 'service_status', '目标机：指定的安装好ceph-mon的主机');
INSERT INTO `sys_install_host_control` VALUES ('12307', 'ceph_osd', 'ceph_osd', b'1', '1', '2', 'service_status', '目标机：指定的安装好ceph-osd的主机');
INSERT INTO `sys_install_host_control` VALUES ('12308', 'ceph_mds', 'ceph_mds', b'1', '1', '2', 'service_status', '目标机：指定的安装好ceph-mds的主机');
INSERT INTO `sys_install_host_control` VALUES ('12309', 'ceph_rgw', 'ceph_rgw', b'1', '1', '2', 'service_status', '目标机：指定的安装好ceph-rgw的主机');
-- -----------------------
-- CLUSTER 服务状态 END
-- -----------------------

-- -----------------------
-- DOCKER 重启kubelet START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('124', 'tools_service_kubelet', '重启kubelet', '重启kubelet', '2', b'0', 'fa-power-off', 'text-info', '3', '1800');
INSERT INTO `boots`.`sys_install_playbook`  VALUES ('12400', '1', 'tools_service_kubelet', 'service_kubelet', '重启kubelet', 'service_kubelet.yml');
INSERT INTO `boots`.`sys_install_host_control`  VALUES ('12400', 'master', 'master', b'1', '1', '2', 'service_kubelet', '目标机：选择已安装的master 节点');
INSERT INTO `boots`.`sys_install_host_control`  VALUES ('12401', 'node', 'node', b'1', '1', '2', 'service_kubelet', '目标机：选择已安装的node 节点');
-- -----------------------
-- DOCKER 重启kubelet END
-- -----------------------

-- -----------------------
-- DOCKER 重启kubelet START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('125', 'tools_service_plane', '重启plane', '重启plane', '2', b'0', 'fa-power-off', 'text-info', '3', '1800');
INSERT INTO `boots`.`sys_install_playbook`  VALUES ('12500', '1', 'tools_service_plane', 'service_plane', '重启plane', 'service_plane.yml');
INSERT INTO `boots`.`sys_install_host_control`  VALUES ('12500', 'master', 'master', b'1', '1', '2', 'service_plane', '目标机：选择已安装的master 节点');
-- -----------------------
-- DOCKER 重启kubelet END
-- -----------------------

-- -----------------------
-- CLUSTER 升级boots START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('130', 'tools_upgrade_boots', '升级boots', '升级boots', '2', b'1', 'fa-arrow-alt-circle-up', 'text-success', '3', '1800');
INSERT INTO `sys_install_playbook` VALUES ('13000', '1', 'tools_upgrade_boots', 'upgrade_boots', '升级boots', 'upgrade_boots.yml');
-- -----------------------
-- CLUSTER 升级boots END
-- -----------------------

-- -----------------------
-- CLUSTER 升级bcos START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('131', 'tools_upgrade_bcos', '升级bcos', '升级bcos', '2', b'1', 'fa-arrow-alt-circle-up', 'text-success', '3', '1800');
INSERT INTO `sys_install_playbook` VALUES ('13100', '1', 'tools_upgrade_bcos', 'upgrade_bcos', '升级bcos', 'upgrade_bcos.yml');
INSERT INTO `sys_install_host_control` VALUES ('13100', 'master', 'master', b'0', '0', '2', 'upgrade_bcos', '目标机：已安装的全部master主机');
INSERT INTO `sys_install_host_control` VALUES ('13101', 'devops', 'devops', b'0', '0', '2', 'upgrade_bcos', '目标机：已安装的全部devops主机');
-- -----------------------
-- CLUSTER 升级bcos END
-- -----------------------

-- -----------------------
-- CLUSTER 升级docker START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('132', 'tools_upgrade_docker', '升级docker', '升级docker', '2', b'1', 'fa-arrow-alt-circle-up', 'text-success', '3', '1800');
-- -----------------------
-- CLUSTER 升级docker END
-- -----------------------

-- -----------------------
-- CLUSTER 升级k8s START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('133', 'tools_upgrade_k8s', '升级k8s', '升级k8s', '2', b'1', 'fa-arrow-alt-circle-up', 'text-success', '3', '1800');
INSERT INTO `sys_install_playbook` VALUES ('13300', '1', 'tools_upgrade_k8s', 'upgrade_k8s', '升级k8s', 'upgrade_k8s.yml');
INSERT INTO `sys_install_host_control` VALUES ('13300', 'node', 'node', b'0', '0', '2', 'upgrade_k8s', '目标机：已安装的全部node主机');
INSERT INTO `sys_install_host_control` VALUES ('13301', 'etcd', 'etcd', b'0', '0', '2', 'upgrade_k8s', '目标机：已安装的全部etcd主机');
INSERT INTO `sys_install_host_control` VALUES ('13302', 'master', 'master', b'0', '0', '2', 'upgrade_k8s', '目标机：已安装的全部master主机');
INSERT INTO `sys_install_host_control` VALUES ('13303', 'default', 'default', b'0', '2', '*', 'upgrade_k8s', '目标机：监控所有的主机节点');
-- -----------------------
-- CLUSTER 升级k8s END
-- -----------------------

-- -----------------------
-- CLUSTER 升级插件 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('134', 'tools_upgrade_plugins', '升级插件', '升级plugins', '2', b'1', 'fa-arrow-alt-circle-up', 'text-success', '3', '1800');
INSERT INTO `sys_install_playbook` VALUES ('13400', '1', 'tools_upgrade_plugins', 'upgrade_plugins', '升级插件', 'upgrade_plugins.yml');
INSERT INTO `sys_install_host_control` VALUES ('13400', 'master', 'master', b'0', '0', '2', 'upgrade_plugins', '目标机：已安装的全部master主机');
INSERT INTO `sys_install_host_control` VALUES ('13401', 'prometheus', 'prometheus', b'0', '2', '*', 'upgrade_plugins', '目标机：未安装的Prometheus机器');
INSERT INTO `sys_install_host_control` VALUES ('13402', 'default', 'default', b'0', '0', '2', 'upgrade_plugins', '目标机：未安装的Prometheus机器');
-- -----------------------
-- CLUSTER 升级插件 END
-- -----------------------

-- -----------------------
-- CLUSTER 回退bcos START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('135', 'tools_upgrade_roll_bcos', '回退bcos', '回退bcos', '2', b'1', 'fa-arrow-alt-circle-down', 'text-danger', '3', '1800');
-- -----------------------
-- CLUSTER 回退bcos END
-- -----------------------

-- -----------------------
-- CLUSTER 重启组件 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('140', 'tools_restart_all', '重启全部', '重启全部', '2', b'1', 'fa-power-off', 'text-success', '3', '1800');
INSERT INTO `sys_install_play` VALUES ('141', 'tools_restart_blogic', '重启blogic', '重启blogic', '2', b'1', 'fa-power-off', 'text-success', '3', '1800');
INSERT INTO `sys_install_play` VALUES ('142', 'tools_restart_pinpoint', '重启pinpoint', '重启pinpoint', '2', b'1', 'fa-power-off', 'text-success', '3', '1800');
INSERT INTO `sys_install_play` VALUES ('143', 'tools_restart_bdos', '重启bdos', '重启bdos', '2', b'1', 'fa-power-off', 'text-success', '3', '1800');
INSERT INTO `sys_install_play` VALUES ('144', 'tools_restart_bconsole', '重启bconsole', '重启bconsole', '2', b'1', 'fa-power-off', 'text-success', '3', '1800');
INSERT INTO `sys_install_play` VALUES ('145', 'tools_restart_portal', '重启portal', '重启portal', '2', b'1', 'fa-power-off', 'text-success', '3', '1800');
INSERT INTO `sys_install_play` VALUES ('146', 'tools_restart_cas', '重启cas', '重启cas', '2', b'1', 'fa-power-off', 'text-success', '3', '1800');
INSERT INTO `sys_install_play` VALUES ('147', 'tools_restart_bpm', '重启bpm', '重启bpm', '2', b'1', 'fa-power-off', 'text-success', '3', '1800');
INSERT INTO `sys_install_play` VALUES ('148', 'tools_restart_security', '重启security', '重启security', '2', b'1', 'fa-power-off', 'text-success', '3', '1800');
INSERT INTO `sys_install_playbook` VALUES ('14000', '1', 'tools_restart_all', 'restart_all', '重启全部', 'install_bcos.yml');
INSERT INTO `sys_install_playbook` VALUES ('14100', '1', 'tools_restart_blogic', 'restart_blogic', '重启blogic', 'restart_blogic.yml');
INSERT INTO `sys_install_playbook` VALUES ('14200', '1', 'tools_restart_pinpoint', 'restart_pinpoint', '重启pinpoint', 'restart_pinpoint.yml');
INSERT INTO `sys_install_playbook` VALUES ('14300', '1', 'tools_restart_bdos', 'restart_bdos', '重启bdos', 'restart_bdos.yml');
INSERT INTO `sys_install_playbook` VALUES ('14400', '1', 'tools_restart_bconsole', 'restart_bconsole', '重启bconsole', 'restart_bconsole.yml');
INSERT INTO `sys_install_playbook` VALUES ('14500', '1', 'tools_restart_portal', 'restart_portal', '重启portal', 'restart_portal.yml');
INSERT INTO `sys_install_playbook` VALUES ('14600', '1', 'tools_restart_cas', 'restart_cas', '重启cas', 'restart_cas.yml');
INSERT INTO `sys_install_playbook` VALUES ('14700', '1', 'tools_restart_bpm', 'restart_bpm', '重启bpm', 'restart_bpm.yml');
INSERT INTO `sys_install_playbook` VALUES ('14800', '1', 'tools_restart_security', 'restart_security', '重启security', 'restart_security.yml');
INSERT INTO `sys_install_host_control` VALUES ('14000', 'master', 'master', b'0', '0', '2', 'restart_all', '目标机：已安装的全部master主机');
INSERT INTO `sys_install_host_control` VALUES ('14100', 'master', 'master', b'0', '0', '2', 'restart_blogic', '目标机：已安装的全部master主机');
INSERT INTO `sys_install_host_control` VALUES ('14200', 'master', 'master', b'0', '0', '2', 'restart_pinpoint', '目标机：已安装的全部master主机');
INSERT INTO `sys_install_host_control` VALUES ('14300', 'master', 'master', b'0', '0', '2', 'restart_bdos', '目标机：已安装的全部master主机');
INSERT INTO `sys_install_host_control` VALUES ('14400', 'master', 'master', b'0', '0', '2', 'restart_bconsole', '目标机：已安装的全部master主机');
INSERT INTO `sys_install_host_control` VALUES ('14500', 'master', 'master', b'0', '0', '2', 'restart_portal', '目标机：已安装的全部master主机');
INSERT INTO `sys_install_host_control` VALUES ('14600', 'master', 'master', b'0', '0', '2', 'restart_cas', '目标机：已安装的全部master主机');
INSERT INTO `sys_install_host_control` VALUES ('14700', 'master', 'master', b'0', '0', '2', 'restart_bpm', '目标机：已安装的全部master主机');
INSERT INTO `sys_install_host_control` VALUES ('14800', 'master', 'master', b'0', '0', '2', 'restart_security', '目标机：已安装的全部master主机');
-- -----------------------
-- CLUSTER 重启组件 END
-- -----------------------


-- -----------------------
-- POD 系统修复 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('150', 'tools_repair_orphaned', '孤儿POD', '孤儿POD', '2', b'0', 'fa-cog', 'text-success', '3', '1800');
INSERT INTO `boots`.`sys_install_playbook`  VALUES ('15000', '1', 'tools_repair_orphaned', 'repair_orphaned_pod', '修复孤儿pod', 'repair_orphaned.yml');
INSERT INTO `boots`.`sys_install_host_control`  VALUES ('15000', 'master', 'master', b'0', '1', '2', 'repair_orphaned_pod', '目标机：所有已安装的master 节点');
INSERT INTO `boots`.`sys_install_host_control`  VALUES ('15001', 'node', 'node', b'0', '1', '2', 'repair_orphaned_pod', '目标机：所有已安装的node 节点');
-- -----------------------
-- POD 系统修复 END
-- -----------------------

-- -----------------------
-- DEVOPS 系统修复 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('151', 'tools_repair_devops', '修复devops', '修复devops', '2', b'0', 'fa-cog', 'text-success', '3', '1800');
INSERT INTO `boots`.`sys_install_playbook`  VALUES ('15100', '1', 'tools_repair_devops', 'repair_devops', '修复devops', 'repair_devops.yml');
INSERT INTO `boots`.`sys_install_host_control`  VALUES ('15100', 'devops', 'devops', b'1', '1', '2', 'repair_devops', '目标机：所有已安装的master 节点');
-- -----------------------
-- DEVOPS 系统修复 END
-- -----------------------

-- -----------------------
-- DOCKER 系统修复 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('152', 'tools_repair_docker', '修复docker', '修复docker', '2', b'0', 'fa-cog', 'text-success', '3', '1800');
INSERT INTO `boots`.`sys_install_playbook`  VALUES ('15200', '1', 'tools_repair_docker', 'repair_docker', '修复docker', 'repair_docker.yml');
INSERT INTO `boots`.`sys_install_host_control`  VALUES ('15200', 'docker', 'docker', b'1', '1', '2', 'repair_docker', '目标机：所有已安装的docker 节点');
INSERT INTO `boots`.`sys_install_host_control`  VALUES ('15201', 'harbor', 'harbor', b'1', '1', '2', 'repair_docker', '目标机：所有已安装的harbor 节点');
INSERT INTO `boots`.`sys_install_host_control`  VALUES ('15202', 'devops', 'devops', b'1', '1', '2', 'repair_docker', '目标机：所有已安装的devops 节点');
INSERT INTO `boots`.`sys_install_host_control`  VALUES ('15203', 'etcd', 'etcd', b'1', '1', '2', 'repair_docker', '目标机：所有已安装的etcd 节点');
-- -----------------------
-- DOCKER 系统修复 END
-- -----------------------

-- -----------------------
-- ETCD 系统修复 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('153', 'tools_repair_etcd', '修复etcd', '修复etcd', '2', b'0', 'fa-cog', 'text-success', '3', '1800');
INSERT INTO `boots`.`sys_install_playbook`  VALUES ('15300', '1', 'tools_repair_etcd', 'repair_etcd', '修复etcd', 'repair_etcd.yml');
INSERT INTO `boots`.`sys_install_host_control`  VALUES ('15300', 'etcd', 'etcd', b'0', '1', '2', 'repair_etcd', '目标机：所有已安装的etcd 节点');
-- -----------------------
-- ETCD 系统修复 END
-- -----------------------

-- -----------------------
-- ETCD 系统修复 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('154', 'tools_repair_harbor', '修复harbor', '修复harbor', '2', b'0', 'fa-cog', 'text-success', '3', '1800');
INSERT INTO `boots`.`sys_install_playbook`  VALUES ('15400', '1', 'tools_repair_harbor', 'repair_harbor', '修复etcd', 'repair_harbor.yml');
INSERT INTO `boots`.`sys_install_host_control`  VALUES ('15400', 'harbor', 'harbor', b'1', '1', '2', 'repair_harbor', '目标机：所有已安装的etcd 节点');
-- -----------------------
-- ETCD 系统修复 END
-- -----------------------

-- -----------------------
-- DOCKER 系统修复 START
-- -----------------------
INSERT INTO `sys_install_play` VALUES ('155', 'tools_repair_storage', '存储驱动', '存储驱动', '2', b'0', 'fa-cog', 'text-success', '3', '1800');
INSERT INTO `boots`.`sys_install_playbook`  VALUES ('15500', '1', 'tools_repair_storage', 'repair_docker', '存储驱动', 'repair_storage.yml');
-- -----------------------
-- DOCKER 系统修复 END
-- -----------------------

-- -----------------------
--  一级工具 END  999
-- -----------------------
