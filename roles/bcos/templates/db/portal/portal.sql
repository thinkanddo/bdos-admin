/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : portal

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2019-07-03 17:28:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accountinfo
-- ----------------------------
DROP TABLE IF EXISTS `accountinfo`;
CREATE TABLE `accountinfo` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LOGIN_ID` varchar(20) COLLATE utf8_bin NOT NULL,
  `PWD_RECORD` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `CHANGE_DATE` datetime DEFAULT NULL,
  `LINK_OUT_DATE` datetime DEFAULT NULL,
  `VALIDATA_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_NORAML` bigint(1) DEFAULT NULL,
  `ABNORMAL_MESSAGE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `IS_MESSAGE_CHECKED` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of accountinfo
-- ----------------------------

-- ----------------------------
-- Table structure for addressinfo
-- ----------------------------
DROP TABLE IF EXISTS `addressinfo`;
CREATE TABLE `addressinfo` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ADDRESS_TYPE` varchar(19) DEFAULT NULL,
  `ADDRESS` varchar(200) NOT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addressinfo
-- ----------------------------

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `START_TIME` datetime DEFAULT NULL,
  `ANNOUNCE_AUTHOR` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `ANNOUNCE_TITLE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ANNOUNCE_TIME` datetime DEFAULT NULL,
  `ANNOUNCE_STATUS` bigint(10) DEFAULT NULL,
  `ANNOUNCE_CONTENT` varchar(5000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of announcement
-- ----------------------------

-- ----------------------------
-- Table structure for announcement_loginid_rel
-- ----------------------------
DROP TABLE IF EXISTS `announcement_loginid_rel`;
CREATE TABLE `announcement_loginid_rel` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `LOGIN_ID` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ANNOUNCEMENT_ID` bigint(19) DEFAULT NULL,
  `READ_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of announcement_loginid_rel
-- ----------------------------

-- ----------------------------
-- Table structure for app_tenant_data_source
-- ----------------------------
DROP TABLE IF EXISTS `app_tenant_data_source`;
CREATE TABLE `app_tenant_data_source` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `APP_CODE` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `TENANTINFO_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RULE_TABLE_DATA_SOURCE_ID` bigint(19) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK5274493941FCECD6` (`TENANTINFO_ID`) USING BTREE,
  KEY `FK52744939913CFCF9` (`RULE_TABLE_DATA_SOURCE_ID`) USING BTREE,
  CONSTRAINT `app_tenant_data_source_ibfk_1` FOREIGN KEY (`TENANTINFO_ID`) REFERENCES `tenantinfo` (`TENANT_ID`),
  CONSTRAINT `app_tenant_data_source_ibfk_2` FOREIGN KEY (`RULE_TABLE_DATA_SOURCE_ID`) REFERENCES `rule_table_data_source` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of app_tenant_data_source
-- ----------------------------

-- ----------------------------
-- Table structure for authentication
-- ----------------------------
DROP TABLE IF EXISTS `authentication`;
CREATE TABLE `authentication` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LOGIN_ID` varchar(255) NOT NULL,
  `AUTHENTICATION_TENANT` varchar(60) DEFAULT NULL,
  `BRANCH` varchar(40) DEFAULT NULL,
  `POSITION` varchar(40) DEFAULT NULL,
  `COMPANY_CATEGORY` varchar(40) DEFAULT NULL,
  `PROJEC_TTEAM` varchar(40) DEFAULT NULL,
  `DEPARTMENT` varchar(40) DEFAULT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `COMPANY_MAILBOX` varchar(50) DEFAULT NULL,
  `COMPANY_SEAT` varchar(20) DEFAULT NULL,
  `AUTHENTICATION_TYPE` varchar(40) DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authentication
-- ----------------------------

-- ----------------------------
-- Table structure for c3p0_test
-- ----------------------------
DROP TABLE IF EXISTS `c3p0_test`;
CREATE TABLE `c3p0_test` (
  `a` char(1) DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c3p0_test
-- ----------------------------

-- ----------------------------
-- Table structure for cas_properties
-- ----------------------------
DROP TABLE IF EXISTS `cas_properties`;
CREATE TABLE `cas_properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pkey` varchar(255) DEFAULT NULL,
  `pvalue` varchar(255) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cas_properties
-- ----------------------------
INSERT INTO `cas_properties` VALUES ('21', 'cas.title', '云控制台', '登录系统名称', 'tenant_system');
INSERT INTO `cas_properties` VALUES ('22', 'cas.logo', 'industry.png', '登录系统logo', 'tenant_system');
INSERT INTO `cas_properties` VALUES ('23', 'cas.enableAuthCode', 'false', '是否启用验证码功能', 'tenant_system');
INSERT INTO `cas_properties` VALUES ('24', 'cas.enableFindPassword', 'true', '是否启用找回密码功能', 'tenant_system');
INSERT INTO `cas_properties` VALUES ('25', 'cas.enableRememberPassword', 'false', '是否启用记住密码功能', 'tenant_system');
INSERT INTO `cas_properties` VALUES ('26', 'cas.enableClientEncryption', 'false', '是否启用客户端密码加密功能', 'tenant_system');
INSERT INTO `cas_properties` VALUES ('27', 'cas.theme', 'bonc', '登录界面主题', 'tenant_system');
INSERT INTO `cas_properties` VALUES ('28', 'cas.enableSmsAuthCode', 'false', '是否开启短信验证', 'tenant_system');
INSERT INTO `cas_properties` VALUES ('29', 'cas.enableMutitimesLogin', 'true', '是否开启允许重复登录', 'tenant_system');

-- ----------------------------
-- Table structure for data_res_reg_rule
-- ----------------------------
DROP TABLE IF EXISTS `data_res_reg_rule`;
CREATE TABLE `data_res_reg_rule` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_bin NOT NULL,
  `NAME` varchar(50) COLLATE utf8_bin NOT NULL,
  `FIELD_CODE` varchar(50) COLLATE utf8_bin NOT NULL,
  `IS_TABLE` bigint(1) NOT NULL,
  `TABLE_INFO_ID` bigint(19) DEFAULT NULL COMMENT '主表ID',
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `DATA_SHOW_STYLE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `IS_ASYNC` bigint(1) DEFAULT NULL,
  `ASSO_PARENT` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ASSO_SON` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `MATCH_WAY` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `APP_CODE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `REL_STRATEGY` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `REL_TABLE_NAME` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `MAIN_TABLE_FK` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `SECOND_TABLE_FK` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `SECOND_TABLE_ID` bigint(19) DEFAULT NULL,
  `RULE_TYPE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `OPERATOR` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `FIRST_RULE_ID` bigint(19) DEFAULT NULL,
  `SECOND_RULE_ID` bigint(19) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKE38E7F3B1570FA97` (`SECOND_TABLE_ID`) USING BTREE,
  KEY `FKE38E7F3B3B088305` (`FIRST_RULE_ID`) USING BTREE,
  KEY `FKE38E7F3B5D6D2ADB` (`TABLE_INFO_ID`) USING BTREE,
  KEY `FKE38E7F3BCC98F0C9` (`SECOND_RULE_ID`) USING BTREE,
  CONSTRAINT `data_res_reg_rule_ibfk_1` FOREIGN KEY (`SECOND_TABLE_ID`) REFERENCES `table_info` (`ID`),
  CONSTRAINT `data_res_reg_rule_ibfk_2` FOREIGN KEY (`FIRST_RULE_ID`) REFERENCES `data_res_reg_rule` (`ID`),
  CONSTRAINT `data_res_reg_rule_ibfk_3` FOREIGN KEY (`TABLE_INFO_ID`) REFERENCES `table_info` (`ID`),
  CONSTRAINT `data_res_reg_rule_ibfk_4` FOREIGN KEY (`SECOND_RULE_ID`) REFERENCES `data_res_reg_rule` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=538 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of data_res_reg_rule
-- ----------------------------
INSERT INTO `data_res_reg_rule` VALUES ('2', 'MENUINFO_CODE', '首页菜单控制', 'MENU_CODE', '0', '2', 'tenant_system', 'tree', null, 'p', 's', 'equal', null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `data_res_reg_rule` VALUES ('259', 'USERINFO_按ORGINFO', 'USERINFO_按ORGINFO', 'PATH', '1', '1', 'tenant_system', 'tree', '1', null, null, 'likeR', 'security', 'n', 'USERINFO_ORGINFO_REL', 'USERINFO_ID', 'ORGINFO_ID', '9', '0', null, null, null);
INSERT INTO `data_res_reg_rule` VALUES ('431', 'ROLE_create_user', '角色by创建人', 'CREATE_USER', '0', '15', 'tenant_system', 'userDefined', null, null, null, 'equal', 'security', null, '', '', '', null, '0', 'or', null, null);
INSERT INTO `data_res_reg_rule` VALUES ('433', 'ROLE', '角色（控制＋创建人）', ' ', '0', '15', 'tenant_system', 'list', null, null, null, 'equal', 'security', null, null, null, null, null, '1', 'or', '445', '431');
INSERT INTO `data_res_reg_rule` VALUES ('445', 'ROLE_CONTROL', '角色控制(控制不同用户能看到的角色)', 'ID', '0', '15', 'tenant_system', 'tree', null, null, 's', 'equal', 'security', null, '', '', '', null, '0', 'or', null, null);
INSERT INTO `data_res_reg_rule` VALUES ('530', 'ORGINFO_CONTROL', '组织机构控制', 'PATH', '0', '9', 'tenant_system', 'tree', '1', null, null, 'likeR', null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `data_res_reg_rule` VALUES ('531', 'USERINFO_BY_USER', '用户列表by创建人', 'CREATE_USER', '0', '1', 'tenant_system', 'list', null, null, null, 'equal', 'bconsole', null, '', '', '', null, '0', 'or', null, null);
INSERT INTO `data_res_reg_rule` VALUES ('534', 'meuuBycreator', '菜单创建人', 'BY_USER', '0', '2', 'tenant_system', 'userDefined', null, 'p', 's', 'equal', 'portal', null, '', '', '', null, '0', 'or', null, null);
INSERT INTO `data_res_reg_rule` VALUES ('535', 'menuController', '菜单控制+创建人', 'ID', '0', '2', 'tenant_system', 'list', null, null, null, 'equal', 'portal', null, '', '', '', null, '1', 'or', '2', '534');
INSERT INTO `data_res_reg_rule` VALUES ('536', 'portal_page', '门户页面控制', 'ID', '0', '28', 'tenant_system', 'list', null, null, null, 'equal', 'portal', null, '', '', '', null, '0', 'or', null, null);
INSERT INTO `data_res_reg_rule` VALUES ('537', '1', 'test', 'ID', '0', null, 'tenant_system', 'tree', null, null, null, 'like', 'Blogic', null, '', '', '', null, '0', 'or', null, null);

-- ----------------------------
-- Table structure for define_auth_code_table
-- ----------------------------
DROP TABLE IF EXISTS `define_auth_code_table`;
CREATE TABLE `define_auth_code_table` (
  `DEFINE_CODE` varchar(100) COLLATE utf8_bin NOT NULL,
  `DEFINE_NAME` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`DEFINE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of define_auth_code_table
-- ----------------------------

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `ID` varchar(255) NOT NULL,
  `DICT_NAME` varchar(255) DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for dictionary_data
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_data`;
CREATE TABLE `dictionary_data` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DICT_VALUE` varchar(255) DEFAULT NULL,
  `DICTIONARY_ID` varchar(255) DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK2CFBB1B3B48C1C16` (`DICTIONARY_ID`) USING BTREE,
  CONSTRAINT `dictionary_data_ibfk_1` FOREIGN KEY (`DICTIONARY_ID`) REFERENCES `dictionary` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary_data
-- ----------------------------

-- ----------------------------
-- Table structure for email
-- ----------------------------
DROP TABLE IF EXISTS `email`;
CREATE TABLE `email` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) NOT NULL,
  `MAIL_HOST` varchar(255) NOT NULL,
  `MAIL_FROM` varchar(255) NOT NULL,
  `MAIL_PASSWD` varchar(255) NOT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of email
-- ----------------------------
INSERT INTO `email` VALUES ('1', 'activeUser', '172.16.10.3', 'wangqi1@bonc.com.cn', 'bonccomcn446,', 'tenant_system');

-- ----------------------------
-- Table structure for ext_property_define
-- ----------------------------
DROP TABLE IF EXISTS `ext_property_define`;
CREATE TABLE `ext_property_define` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `PROP_NAME` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PROP_CODE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PROP_DATA_TYPE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `SHOW_MODE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `CODE_TABLE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `CODE_KEY` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `CODE_DESC` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `CODE_ORD` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `MULTI` bigint(1) DEFAULT NULL,
  `IS_NULL` bigint(1) DEFAULT NULL,
  `EXT_ORD` bigint(19) DEFAULT NULL,
  `EXT_TYPE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `RULE_ID` bigint(19) DEFAULT NULL,
  `PARENT_CODE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ext_property_define
-- ----------------------------
INSERT INTO `ext_property_define` VALUES ('3', '测试', 'telephomeNumber', 'String', 'TEXTINPUT', '', '', '', '', '0', '1', null, '1', 'tenant_system', null, '');

-- ----------------------------
-- Table structure for ext_property_value
-- ----------------------------
DROP TABLE IF EXISTS `ext_property_value`;
CREATE TABLE `ext_property_value` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `PROPERTY_CODE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `EXT_NAME` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `PROPERTY_VALUE` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `ORD` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `EXT_PROPERTY_VALUE_ID` bigint(19) DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `RELATION_CODE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK6B2BD465769CB84C` (`EXT_PROPERTY_VALUE_ID`) USING BTREE,
  CONSTRAINT `ext_property_value_ibfk_1` FOREIGN KEY (`EXT_PROPERTY_VALUE_ID`) REFERENCES `ext_property_value` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ext_property_value
-- ----------------------------

-- ----------------------------
-- Table structure for help_info
-- ----------------------------
DROP TABLE IF EXISTS `help_info`;
CREATE TABLE `help_info` (
  `ID` bigint(20) NOT NULL,
  `ORD` int(11) DEFAULT NULL,
  `PATH` varchar(255) DEFAULT NULL,
  `FILE_TYPE` varchar(20) DEFAULT NULL,
  `FILE_NAME` varchar(255) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `CONCATPATH` varchar(255) DEFAULT NULL,
  `HELP_INFO_ID` bigint(20) DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKF52AAEEC7E0ABBF9` (`HELP_INFO_ID`) USING BTREE,
  CONSTRAINT `help_info_ibfk_1` FOREIGN KEY (`HELP_INFO_ID`) REFERENCES `help_info` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of help_info
-- ----------------------------

-- ----------------------------
-- Table structure for image_files
-- ----------------------------
DROP TABLE IF EXISTS `image_files`;
CREATE TABLE `image_files` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FILE_NAME` longtext,
  `FILE_PATH` longtext,
  `CREATE_DATE` datetime DEFAULT NULL,
  `USER_IMAGE` bigint(20) DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK4C48BE53443677FC` (`USER_IMAGE`) USING BTREE,
  CONSTRAINT `image_files_ibfk_1` FOREIGN KEY (`USER_IMAGE`) REFERENCES `userinfo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image_files
-- ----------------------------

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `LOG_RESOURCE_NAME` varchar(20) COLLATE utf8_bin NOT NULL,
  `LOGIN_ID` varchar(20) COLLATE utf8_bin NOT NULL,
  `OPER_DATE` datetime NOT NULL,
  `SYS_NAME` varchar(20) COLLATE utf8_bin NOT NULL,
  `MESSAGE` varchar(5000) COLLATE utf8_bin NOT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clientip` varchar(255) DEFAULT NULL,
  `login_id` varchar(255) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `success` bit(1) DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_log
-- ----------------------------

-- ----------------------------
-- Table structure for log_rule
-- ----------------------------
DROP TABLE IF EXISTS `log_rule`;
CREATE TABLE `log_rule` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `IS_RECORD` bigint(1) DEFAULT NULL,
  `RESOURCES_ID` bigint(19) DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `LOG_RULE_CODE` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `URL_EXPRESSION` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `LOG_RULE_NAME` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `MODULE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SYSTEM_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKA86EF737BB2F55FE` (`RESOURCES_ID`) USING BTREE,
  CONSTRAINT `log_rule_ibfk_1` FOREIGN KEY (`RESOURCES_ID`) REFERENCES `resources` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of log_rule
-- ----------------------------
INSERT INTO `log_rule` VALUES ('1', null, '10', 'tenant_system', 'menuinfo', '.*menuinfo!list.action.*', '菜单监控', '门户系统', 'portal');
INSERT INTO `log_rule` VALUES ('2', null, null, 'tenant_system', 'userinfo', '.*/userinfo!.*', '门户', '安全系统', 'security');

-- ----------------------------
-- Table structure for master_type
-- ----------------------------
DROP TABLE IF EXISTS `master_type`;
CREATE TABLE `master_type` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `MASTER_CODE` varchar(20) COLLATE utf8_bin NOT NULL,
  `MASTER_NAME` varchar(20) COLLATE utf8_bin NOT NULL,
  `ORD` bigint(10) DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=90543 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of master_type
-- ----------------------------
INSERT INTO `master_type` VALUES ('90540', 'USER', '用户', '1', 'tenant_system');
INSERT INTO `master_type` VALUES ('90541', 'ROLE', '角色', '2', 'tenant_system');
INSERT INTO `master_type` VALUES ('90542', 'ORG', '组织机构', '4', 'tenant_system');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `MSG_TITLE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `MSG_STATUS` bigint(10) DEFAULT NULL,
  `MSG_SENDER` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `SEND_TIME` datetime DEFAULT NULL,
  `MSG_COTENT` varchar(5000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for online_user_info_history
-- ----------------------------
DROP TABLE IF EXISTS `online_user_info_history`;
CREATE TABLE `online_user_info_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_code` varchar(255) DEFAULT NULL,
  `clientip` varchar(255) DEFAULT NULL,
  `client_type` varchar(255) DEFAULT NULL,
  `login_id` varchar(255) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of online_user_info_history
-- ----------------------------

-- ----------------------------
-- Table structure for online_user_info_t
-- ----------------------------
DROP TABLE IF EXISTS `online_user_info_t`;
CREATE TABLE `online_user_info_t` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clientip` varchar(255) DEFAULT NULL,
  `login_id` varchar(255) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `online` bit(1) DEFAULT NULL,
  `tgt` varchar(255) DEFAULT NULL,
  `app_code` varchar(255) DEFAULT NULL,
  `online1` bit(1) DEFAULT NULL,
  `client_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of online_user_info_t
-- ----------------------------

-- ----------------------------
-- Table structure for orginfo
-- ----------------------------
DROP TABLE IF EXISTS `orginfo`;
CREATE TABLE `orginfo` (
  `ID` varchar(255) COLLATE utf8_bin NOT NULL,
  `ORG_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ORGTYPE_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ORGINFO_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PATH` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `MEMO` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `ORD` bigint(19) DEFAULT NULL,
  `STATUS` bigint(19) DEFAULT NULL,
  `RESERVE1` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESERVE2` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ORG_CLASS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESERVE3` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESERVE4` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESERVE5` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESERVE6` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESERVE7` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESERVE8` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESERVE9` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESERVE10` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKE3048D7294D8247E` (`ORGTYPE_ID`) USING BTREE,
  KEY `FKE3048D72AA710A6D` (`ORG_CLASS`) USING BTREE,
  KEY `FKE3048D725FFA38F8` (`ORGINFO_ID`) USING BTREE,
  CONSTRAINT `orginfo_ibfk_1` FOREIGN KEY (`ORGINFO_ID`) REFERENCES `orginfo` (`ID`),
  CONSTRAINT `orginfo_ibfk_2` FOREIGN KEY (`ORGTYPE_ID`) REFERENCES `orgtype` (`ID`),
  CONSTRAINT `orginfo_ibfk_3` FOREIGN KEY (`ORG_CLASS`) REFERENCES `org_class` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of orginfo
-- ----------------------------
INSERT INTO `orginfo` VALUES ('1001', '测试', '111', null, 'tenant_system', '/1001', '', '2018-07-27 11:45:28', '1', null, '1', '', '', null, '', '', '', '', '', '', '', '');
INSERT INTO `orginfo` VALUES ('1002', '测试公司类型', 'companyType', null, 'tenant_system', '/1002', '', '2018-11-14 11:01:24', '1', null, '1', '', '', null, '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for orgtype
-- ----------------------------
DROP TABLE IF EXISTS `orgtype`;
CREATE TABLE `orgtype` (
  `ID` varchar(255) COLLATE utf8_bin NOT NULL,
  `ORGTYPE_NAME` varchar(20) COLLATE utf8_bin NOT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `IS_SHOW` bigint(20) DEFAULT '0',
  `IS_NULL` bigint(20) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of orgtype
-- ----------------------------
INSERT INTO `orgtype` VALUES ('1', 'testV', 'tenant_system', '1', '0');
INSERT INTO `orgtype` VALUES ('111', '行政机构', 'tenant_system', '1', '0');
INSERT INTO `orgtype` VALUES ('companyType', '公司类型', 'tenant_system', '0', '0');

-- ----------------------------
-- Table structure for org_class
-- ----------------------------
DROP TABLE IF EXISTS `org_class`;
CREATE TABLE `org_class` (
  `ID` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME` varchar(20) COLLATE utf8_bin NOT NULL,
  `CLASS_LEVEL` varchar(20) COLLATE utf8_bin NOT NULL,
  `PARENT_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK5909241DA981BAE0` (`PARENT_ID`) USING BTREE,
  CONSTRAINT `org_class_ibfk_1` FOREIGN KEY (`PARENT_ID`) REFERENCES `org_class` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of org_class
-- ----------------------------

-- ----------------------------
-- Table structure for org_ext_property_value
-- ----------------------------
DROP TABLE IF EXISTS `org_ext_property_value`;
CREATE TABLE `org_ext_property_value` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `PROPERTY_VALUE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `EXT_PROPERTY_DEFINE_ID` bigint(19) DEFAULT NULL,
  `ORGINFO_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PROPERTY_NAME` varchar(3000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK878BC9C01FCF51E8` (`EXT_PROPERTY_DEFINE_ID`) USING BTREE,
  KEY `FK878BC9C03BAF4BDE` (`ORGINFO_ID`) USING BTREE,
  CONSTRAINT `org_ext_property_value_ibfk_1` FOREIGN KEY (`EXT_PROPERTY_DEFINE_ID`) REFERENCES `ext_property_define` (`ID`),
  CONSTRAINT `org_ext_property_value_ibfk_2` FOREIGN KEY (`ORGINFO_ID`) REFERENCES `orginfo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of org_ext_property_value
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `MASTER_VALUE` varchar(200) COLLATE utf8_bin NOT NULL,
  `PRIVILEGE_ID` bigint(19) DEFAULT NULL,
  `MASTER_TYPE_ID` bigint(19) DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKFE0FB1CF7E9DD63B` (`MASTER_TYPE_ID`) USING BTREE,
  KEY `FKFE0FB1CFBE23FA7E` (`PRIVILEGE_ID`) USING BTREE,
  CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`MASTER_TYPE_ID`) REFERENCES `master_type` (`ID`),
  CONSTRAINT `permission_ibfk_2` FOREIGN KEY (`PRIVILEGE_ID`) REFERENCES `privilege` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=107500 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('101103', '-1', '100250', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101104', '-1', '100251', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101105', '-1', '100252', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101106', '-1', '100253', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101107', '-1', '100209', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101108', '-1', '100210', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101109', '-1', '100211', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101110', '-1', '100212', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101111', '-1', '100213', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101112', '-1', '100214', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101113', '-1', '100215', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101114', '-1', '100216', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101115', '-1', '100217', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101116', '-1', '100218', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101117', '-1', '100219', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101118', '-1', '100220', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101119', '-1', '100221', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101120', '-1', '100222', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101121', '-1', '100223', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101122', '-1', '100224', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101123', '-1', '100225', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101124', '-1', '100226', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101125', '-1', '100227', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101126', '-1', '100228', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101127', '-1', '100229', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101133', '-1', '100068', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101138', '-1', '100198', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101139', '-1', '100199', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101140', '-1', '100200', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101141', '-1', '100201', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101142', '-1', '100202', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101143', '-1', '100203', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101144', '-1', '100204', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101145', '-1', '100205', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101146', '-1', '100206', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101147', '-1', '100207', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101148', '-1', '100208', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101149', '-1', '100230', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101150', '-1', '100231', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101152', '-1', '100233', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101153', '-1', '100234', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101155', '-1', '100236', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101156', '-1', '100237', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101157', '-1', '100238', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101158', '-1', '100196', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101161', '-1', '100254', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101162', '-1', '100255', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101163', '-1', '100256', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101164', '-1', '100257', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101165', '-1', '100258', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101166', '-1', '100259', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101167', '-1', '100260', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101168', '-1', '100261', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101169', '-1', '100262', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101170', '-1', '100263', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101171', '-1', '100264', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101172', '-1', '100265', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101173', '-1', '100266', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101174', '-1', '100267', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101175', '-1', '100268', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101176', '-1', '100269', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101177', '-1', '100270', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101178', '-1', '100271', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101179', '-1', '100272', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101180', '-1', '100273', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101181', '-1', '100274', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101182', '-1', '100275', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101183', '-1', '100276', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101184', '-1', '100277', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101185', '-1', '100278', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101186', '-1', '100279', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101187', '-1', '100082', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101198', '-1', '100330', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101200', '-1', '100097', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101204', '-1', '100315', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101205', '-1', '100316', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101208', '-1', '100241', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101209', '-1', '100242', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101210', '-1', '100243', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101211', '-1', '100244', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101212', '-1', '100245', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101213', '-1', '100246', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101214', '-1', '100280', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101215', '-1', '100281', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101216', '-1', '100282', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101217', '-1', '100283', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101218', '-1', '100284', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101219', '-1', '100285', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101220', '-1', '100286', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101221', '-1', '100287', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101222', '-1', '100288', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101223', '-1', '100289', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101224', '-1', '100290', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101225', '-1', '100291', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101226', '-1', '100292', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101227', '-1', '100293', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101228', '-1', '100294', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101229', '-1', '100295', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101230', '-1', '100296', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101231', '-1', '100297', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101232', '-1', '100298', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101233', '-1', '100299', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101234', '-1', '100300', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101235', '-1', '100301', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101236', '-1', '100302', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101237', '-1', '100303', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101238', '-1', '100304', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101239', '-1', '100305', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101240', '-1', '100306', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101241', '-1', '100307', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101242', '-1', '100308', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101243', '-1', '100309', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101244', '-1', '100310', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101245', '-1', '100311', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101246', '-1', '100312', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101247', '-1', '100313', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101262', '7', '100230', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101264', '7', '100237', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101265', '7', '100238', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101268', '8', '100238', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101274', '100101', '100068', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101275', '9', '100230', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101276', '9', '100232', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101277', '9', '100238', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101279', '1', '100068', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101280', '1', '100331', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101281', '7', '100068', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101282', '7', '100331', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101283', '8', '100068', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101284', '8', '100331', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101285', '9', '100068', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101286', '9', '100331', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101289', '1', '100333', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101290', '7', '100333', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101291', '8', '100333', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101292', '9', '100333', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101293', '-1', '100334', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101294', '1', '100334', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101295', '7', '100334', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101296', '8', '100334', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101297', '9', '100334', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101298', '-1', '100160', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101299', '1', '100160', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101300', '7', '100160', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101301', '8', '100160', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101302', '9', '100160', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101304', '1', '100335', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101305', '7', '100335', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101306', '8', '100335', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101307', '9', '100335', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101309', '100101', '100250', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101310', '100101', '100251', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101311', '100101', '100252', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101312', '100101', '100253', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101313', '100101', '100198', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101314', '100101', '100199', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101315', '100101', '100200', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101316', '100101', '100201', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101317', '100101', '100202', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101318', '100101', '100203', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101319', '100101', '100204', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101320', '100101', '100205', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101321', '100101', '100206', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101322', '100101', '100207', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101323', '100101', '100208', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101324', '100101', '100209', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101325', '100101', '100210', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101326', '100101', '100211', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101327', '100101', '100212', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101328', '100101', '100213', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101329', '100101', '100214', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101330', '100101', '100215', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101331', '100101', '100216', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101332', '100101', '100217', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101333', '100101', '100218', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101334', '100101', '100219', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101335', '100101', '100220', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101336', '100101', '100221', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101337', '100101', '100222', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101338', '100101', '100223', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101339', '100101', '100224', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101340', '100101', '100225', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101341', '100101', '100226', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101342', '100101', '100227', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101343', '100101', '100228', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101344', '100101', '100229', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101345', '100101', '100254', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101346', '100101', '100255', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101347', '100101', '100256', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101348', '100101', '100257', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101349', '100101', '100258', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101350', '100101', '100259', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101351', '100101', '100260', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101352', '100101', '100261', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101353', '100101', '100262', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101354', '100101', '100263', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101355', '100101', '100264', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101356', '100101', '100265', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101357', '100101', '100266', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101358', '100101', '100267', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101359', '100101', '100268', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101360', '100101', '100269', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101361', '100101', '100270', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101362', '100101', '100271', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101363', '100101', '100272', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101364', '100101', '100273', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101365', '100101', '100274', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101366', '100101', '100275', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101367', '100101', '100276', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101368', '100101', '100277', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101369', '100101', '100278', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101370', '100101', '100279', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101371', '100101', '100241', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101372', '100101', '100242', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101373', '100101', '100243', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101374', '100101', '100244', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101375', '100101', '100245', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101376', '100101', '100246', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101377', '100101', '100280', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101378', '100101', '100281', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101379', '100101', '100282', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101380', '100101', '100283', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101381', '100101', '100284', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101382', '100101', '100285', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101383', '100101', '100286', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101384', '100101', '100287', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101385', '100101', '100288', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101386', '100101', '100289', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101387', '100101', '100290', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101388', '100101', '100291', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101389', '100101', '100292', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101390', '100101', '100293', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101391', '100101', '100294', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101392', '100101', '100295', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101393', '100101', '100296', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101394', '100101', '100297', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101395', '100101', '100298', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101396', '100101', '100299', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101397', '100101', '100300', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101398', '100101', '100301', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101399', '100101', '100302', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101400', '100101', '100303', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101401', '100101', '100304', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101402', '100101', '100305', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101403', '100101', '100306', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101404', '100101', '100307', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101405', '100101', '100308', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101406', '100101', '100309', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101407', '100101', '100310', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101408', '100101', '100311', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101409', '100101', '100312', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101410', '100101', '100313', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('101428', '-1', '100076', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101429', '-1', '100077', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101435', '-1', '100081', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101436', '-1', '100079', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101605', '1', '100338', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101606', '7', '100338', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101607', '8', '100338', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101608', '9', '100338', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101609', '-1', '100235', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101611', '-1', '100240', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101613', '1', '100339', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101614', '7', '100339', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101615', '8', '100339', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101616', '9', '100339', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101617', '12', '100250', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101618', '12', '100251', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101619', '12', '100252', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101620', '12', '100253', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101621', '12', '100198', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101622', '12', '100199', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101623', '12', '100200', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101624', '12', '100201', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101625', '12', '100202', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101626', '12', '100203', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101627', '12', '100204', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101628', '12', '100205', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101629', '12', '100206', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101630', '12', '100207', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101631', '12', '100208', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101644', '12', '100210', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101647', '12', '100212', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101648', '12', '100225', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101649', '12', '100213', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101650', '12', '100214', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101651', '12', '100215', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101652', '12', '100216', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101653', '12', '100217', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101654', '12', '100218', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101655', '12', '100219', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101656', '12', '100220', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101657', '12', '100221', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101658', '12', '100222', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101659', '12', '100223', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101660', '12', '100224', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101661', '12', '100226', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101662', '12', '100227', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101663', '12', '100228', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101664', '12', '100229', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101665', '12', '100230', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101666', '12', '100231', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101668', '12', '100233', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101669', '12', '100234', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101671', '12', '100236', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101673', '12', '100238', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101674', '12', '100196', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101677', '12', '100334', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101678', '12', '100160', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101679', '12', '100254', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101680', '12', '100255', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101681', '12', '100256', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101682', '12', '100257', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101683', '12', '100258', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101684', '12', '100259', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101685', '12', '100260', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101686', '12', '100261', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101687', '12', '100262', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101688', '12', '100263', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101689', '12', '100264', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101690', '12', '100265', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101691', '12', '100266', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101692', '12', '100267', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101693', '12', '100268', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101694', '12', '100269', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101695', '12', '100270', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101696', '12', '100271', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101697', '12', '100272', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101698', '12', '100273', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101699', '12', '100274', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101700', '12', '100275', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101701', '12', '100276', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101702', '12', '100277', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101703', '12', '100278', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101704', '12', '100279', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101730', '12', '100247', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101731', '12', '100248', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101732', '12', '100249', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101733', '12', '100241', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101734', '12', '100242', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101735', '12', '100243', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101736', '12', '100244', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101737', '12', '100245', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101738', '12', '100246', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101739', '12', '100280', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101740', '12', '100281', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101741', '12', '100282', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101742', '12', '100283', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101743', '12', '100284', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101744', '12', '100285', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101745', '12', '100286', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101746', '12', '100287', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101748', '12', '100289', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101749', '12', '100290', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101750', '12', '100291', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101751', '12', '100292', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101752', '12', '100293', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101759', '12', '100300', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101760', '12', '100301', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101761', '12', '100302', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101762', '12', '100303', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101763', '12', '100304', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101764', '12', '100305', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101765', '12', '100306', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101766', '12', '100307', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101767', '12', '100308', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101768', '12', '100309', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101769', '12', '100310', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101770', '12', '100311', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101771', '12', '100312', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101772', '12', '100313', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101773', '12', '100100', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101786', '12', '100113', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101789', '12', '100332', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101790', '12', '100336', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101791', '12', '100068', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101792', '-1', '100340', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101793', '1', '100340', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101794', '7', '100340', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101795', '8', '100340', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101796', '9', '100340', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101958', '-1', '100128', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101959', '1', '100128', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101960', '7', '100128', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101961', '8', '100128', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101962', '9', '100128', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101964', '1', '100341', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101965', '7', '100341', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101966', '8', '100341', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101967', '9', '100341', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101969', '1', '100342', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101970', '7', '100342', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101971', '8', '100342', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101972', '9', '100342', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101974', '1', '100343', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101975', '7', '100343', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101976', '8', '100343', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101977', '9', '100343', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101979', '1', '100344', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101980', '7', '100344', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101981', '8', '100344', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('101982', '9', '100344', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102164', '1', '100345', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102165', '7', '100345', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102166', '8', '100345', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102167', '9', '100345', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102168', '-1', '100346', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102169', '1', '100346', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102170', '7', '100346', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102171', '8', '100346', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102172', '9', '100346', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102174', '1', '100347', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102175', '7', '100347', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102176', '8', '100347', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102177', '9', '100347', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102179', '1', '100348', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102180', '7', '100348', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102181', '8', '100348', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102182', '9', '100348', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102184', '1', '100349', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102185', '7', '100349', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102186', '8', '100349', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102187', '9', '100349', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102189', '1', '100350', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102190', '7', '100350', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102191', '8', '100350', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102192', '9', '100350', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102194', '1', '100351', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102195', '7', '100351', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102196', '8', '100351', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102197', '9', '100351', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102198', '-1', '100161', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102199', '1', '100161', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102200', '7', '100161', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102201', '8', '100161', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102202', '9', '100161', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102393', '-1', '100139', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102395', '1', '100352', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102396', '7', '100352', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102397', '8', '100352', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102398', '9', '100352', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102575', '-1', '100353', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102576', '-1', '100354', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102577', '1', '100354', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102578', '7', '100354', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102579', '8', '100354', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102580', '9', '100354', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102581', '-1', '100355', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102582', '1', '100355', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102583', '7', '100355', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102584', '8', '100355', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102585', '9', '100355', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102586', '-1', '100356', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102587', '1', '100356', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102588', '7', '100356', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102589', '8', '100356', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102590', '9', '100356', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102771', '-1', '100357', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102772', '1', '100357', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102773', '7', '100357', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102774', '8', '100357', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('102775', '9', '100357', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103120', '-1', '100358', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103121', '1', '100358', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103122', '7', '100358', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103123', '8', '100358', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103124', '9', '100358', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103144', '-1', '100359', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103145', '1', '100359', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103146', '7', '100359', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103147', '8', '100359', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103148', '9', '100359', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103506', '-1', '100360', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103507', '1', '100360', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103508', '7', '100360', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103509', '8', '100360', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103510', '9', '100360', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103855', '100101', '100074', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('103868', '-1', '100361', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103869', '1', '100361', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103870', '7', '100361', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103871', '8', '100361', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('103872', '9', '100361', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104062', '100147', '100140', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104064', '7', '100250', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104066', '7', '100252', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104067', '7', '100253', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104068', '7', '100254', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104069', '7', '100255', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104070', '7', '100256', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104071', '7', '100257', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104072', '7', '100258', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104073', '7', '100259', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104074', '7', '100260', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104075', '7', '100261', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104076', '7', '100262', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104077', '7', '100263', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104078', '7', '100264', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104079', '7', '100265', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104080', '7', '100266', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104081', '7', '100267', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104082', '7', '100268', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104083', '7', '100269', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104084', '7', '100270', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104085', '7', '100271', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104086', '7', '100272', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104087', '7', '100273', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104088', '7', '100274', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104089', '7', '100275', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104090', '7', '100276', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104091', '7', '100277', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104092', '7', '100278', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104093', '7', '100279', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104109', '7', '100330', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104115', '7', '100315', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104116', '7', '100316', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104119', '7', '100241', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104120', '7', '100242', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104121', '7', '100243', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104122', '7', '100244', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104123', '7', '100245', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104124', '7', '100246', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104125', '7', '100280', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104126', '7', '100281', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104127', '7', '100282', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104128', '7', '100283', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104129', '7', '100284', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104130', '7', '100285', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104131', '7', '100286', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104132', '7', '100287', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104133', '7', '100288', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104134', '7', '100289', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104135', '7', '100290', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104136', '7', '100291', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104137', '7', '100292', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104138', '7', '100293', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104139', '7', '100294', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104140', '7', '100295', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104141', '7', '100296', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104142', '7', '100297', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104143', '7', '100298', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104144', '7', '100299', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104145', '7', '100300', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104146', '7', '100301', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104147', '7', '100302', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104148', '7', '100303', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104149', '7', '100304', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104150', '7', '100305', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104151', '7', '100306', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104152', '7', '100307', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104153', '7', '100308', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104154', '7', '100309', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104155', '7', '100310', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104156', '7', '100311', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104157', '7', '100312', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104158', '7', '100313', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104159', '8', '100250', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104160', '8', '100251', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104161', '8', '100198', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104162', '8', '100199', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104163', '8', '100200', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104164', '8', '100201', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104165', '8', '100202', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104166', '8', '100203', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104167', '8', '100204', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104168', '8', '100205', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104169', '8', '100206', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104170', '8', '100207', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104171', '8', '100208', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104183', '9', '100250', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104184', '9', '100251', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104185', '-1', '100362', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104186', '1', '100362', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104187', '7', '100362', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104188', '8', '100362', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104189', '9', '100362', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104363', '-1', '100363', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104364', '-1', '100364', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104365', '-1', '100365', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104366', '-1', '100366', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104367', '-1', '100367', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104683', '-1', '100333', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104688', '9', '100368', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104700', '-1', '100369', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104701', '-1', '100370', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104702', '-1', '100371', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104703', '-1', '100372', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104704', '-1', '100373', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104705', '-1', '100374', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104706', '-1', '100375', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104707', '-1', '100376', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104708', '-1', '100377', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104709', '-1', '100378', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104710', '69', '100250', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104711', '69', '100252', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104712', '69', '100253', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104713', '69', '100198', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104714', '69', '100199', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104715', '69', '100200', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104716', '69', '100201', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104717', '69', '100202', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104718', '69', '100203', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104719', '69', '100204', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104720', '69', '100205', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104721', '69', '100206', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104722', '69', '100207', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104723', '69', '100208', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104724', '69', '100212', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104725', '69', '100225', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104726', '69', '100213', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104727', '69', '100214', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104728', '69', '100215', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104729', '69', '100216', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104730', '69', '100217', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104731', '69', '100218', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104732', '69', '100219', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104733', '69', '100220', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104734', '69', '100221', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104735', '69', '100222', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104736', '69', '100223', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104737', '69', '100224', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104738', '69', '100226', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104739', '69', '100227', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104740', '69', '100228', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104741', '69', '100229', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104742', '69', '100247', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104743', '69', '100248', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104744', '69', '100249', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104745', '69', '100161', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104746', '69', '100369', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104747', '69', '100370', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104748', '69', '100371', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104749', '69', '100372', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104750', '69', '100373', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104751', '69', '100374', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104752', '69', '100375', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104753', '69', '100376', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104754', '69', '100377', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104755', '69', '100280', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104756', '69', '100281', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104757', '69', '100282', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104758', '69', '100283', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104759', '69', '100284', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104760', '69', '100285', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104761', '69', '100286', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104762', '69', '100287', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104763', '69', '100288', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104764', '69', '100289', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104765', '69', '100290', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104766', '69', '100291', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104767', '69', '100292', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104768', '69', '100293', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104769', '69', '100294', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104770', '69', '100295', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104771', '69', '100296', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104772', '69', '100297', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104773', '69', '100298', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104774', '69', '100299', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104775', '69', '100300', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104776', '69', '100301', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104777', '69', '100302', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104778', '69', '100303', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104779', '69', '100304', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104780', '69', '100305', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104781', '69', '100306', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104782', '69', '100307', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104783', '69', '100308', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104784', '69', '100309', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104785', '69', '100310', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104786', '69', '100311', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104787', '69', '100312', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104788', '69', '100313', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104789', '100188', '100254', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104790', '100188', '100255', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104791', '100188', '100256', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104792', '100188', '100257', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104793', '100188', '100258', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104794', '100188', '100259', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104795', '100188', '100260', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104796', '100188', '100261', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104797', '100188', '100262', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104798', '100188', '100263', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104799', '100188', '100264', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104800', '100188', '100265', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104801', '100188', '100266', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104802', '100188', '100267', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104803', '100188', '100268', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104804', '100188', '100269', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104805', '100188', '100270', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104806', '100188', '100271', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104807', '100188', '100272', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104808', '100188', '100273', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104809', '100188', '100274', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104810', '100188', '100275', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104811', '100188', '100276', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104812', '100188', '100277', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104813', '100188', '100278', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104814', '100188', '100279', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('104815', '-1', '100379', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104816', '1', '100379', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104817', '7', '100379', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104818', '8', '100379', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104819', '9', '100379', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104822', '-1', '100380', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104823', '1', '100380', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104824', '7', '100380', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104825', '8', '100380', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104826', '9', '100380', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104827', '1', '100254', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104828', '1', '100255', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104829', '1', '100256', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104830', '1', '100257', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104831', '1', '100258', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104832', '1', '100259', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104833', '1', '100260', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104834', '1', '100261', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104835', '1', '100262', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104836', '1', '100263', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104837', '1', '100264', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104838', '1', '100265', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104839', '1', '100266', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104840', '1', '100267', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104841', '1', '100268', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104842', '1', '100269', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104843', '1', '100270', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104844', '1', '100271', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104845', '1', '100272', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104846', '1', '100273', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104847', '1', '100274', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104848', '1', '100275', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104849', '1', '100276', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104850', '1', '100277', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104851', '1', '100278', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104852', '1', '100279', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104853', '1', '100369', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104854', '1', '100370', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104855', '1', '100371', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104856', '1', '100372', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104857', '1', '100373', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104858', '1', '100374', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104859', '1', '100375', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104860', '1', '100376', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104861', '1', '100377', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104862', '1', '100280', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104863', '1', '100281', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104864', '1', '100282', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104865', '1', '100283', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104866', '1', '100284', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104867', '1', '100285', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104868', '1', '100286', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104869', '1', '100287', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104870', '1', '100288', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104871', '1', '100289', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104872', '1', '100290', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104873', '1', '100291', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104874', '1', '100292', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104875', '1', '100293', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104876', '1', '100294', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104877', '1', '100295', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104878', '1', '100296', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104879', '1', '100297', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104880', '1', '100298', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104881', '1', '100299', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104882', '1', '100300', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104883', '1', '100301', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104884', '1', '100302', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104885', '1', '100303', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104886', '1', '100304', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104887', '1', '100305', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104888', '1', '100306', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104889', '1', '100307', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104890', '1', '100308', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104891', '1', '100309', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104892', '1', '100310', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104893', '1', '100311', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104894', '1', '100312', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104895', '1', '100313', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104896', '1', '100100', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104897', '1', '100101', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104898', '1', '100102', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104899', '1', '100103', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104900', '1', '100104', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104901', '1', '100105', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104902', '1', '100106', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104903', '1', '100107', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104904', '1', '100108', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104905', '1', '100109', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104906', '1', '100110', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104907', '1', '100111', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104908', '1', '100112', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('104909', '1', '100113', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105214', '1', '100250', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105215', '1', '100251', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105216', '1', '100252', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105217', '1', '100253', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105218', '1', '100198', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105219', '1', '100199', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105220', '1', '100200', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105221', '1', '100201', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105222', '1', '100202', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105223', '1', '100203', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105224', '1', '100204', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105225', '1', '100205', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105226', '1', '100206', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105227', '1', '100207', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105228', '1', '100208', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105229', '1', '100319', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105230', '1', '100320', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105231', '1', '100321', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105232', '1', '100322', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105233', '1', '100323', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105234', '1', '100324', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105235', '1', '100325', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105236', '1', '100326', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105237', '1', '100327', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105238', '1', '100328', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105239', '1', '100329', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105240', '1', '100212', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105241', '1', '100225', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105242', '1', '100213', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105243', '1', '100214', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105244', '1', '100215', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105245', '1', '100216', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105246', '1', '100217', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105247', '1', '100218', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105248', '1', '100219', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105249', '1', '100220', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105250', '1', '100221', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105251', '1', '100222', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105252', '1', '100223', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105253', '1', '100224', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105254', '1', '100226', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105255', '1', '100227', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105256', '1', '100228', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105257', '1', '100229', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105258', '1', '100230', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105259', '1', '100231', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105260', '1', '100232', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105261', '1', '100233', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105262', '1', '100234', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105263', '1', '100235', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105264', '1', '100236', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105265', '1', '100237', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105266', '1', '100238', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105267', '1', '100353', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105268', '1', '100196', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105269', '1', '100239', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105270', '1', '100240', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105271', '1', '100378', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105272', '1', '100082', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105273', '1', '100083', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105274', '1', '100084', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105275', '1', '100085', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105276', '1', '100314', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105277', '1', '100086', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105278', '1', '100087', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105279', '1', '100088', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105280', '1', '100089', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105281', '1', '100090', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105282', '1', '100091', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105283', '1', '100092', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105284', '1', '100093', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105285', '1', '100094', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105286', '1', '100095', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105287', '1', '100330', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105288', '1', '100096', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105289', '1', '100097', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105290', '1', '100162', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105291', '1', '100098', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105292', '1', '100099', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105293', '1', '100315', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105294', '1', '100316', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105295', '1', '100317', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105296', '1', '100318', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105297', '1', '100247', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105298', '1', '100248', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105299', '1', '100249', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105300', '1', '100069', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105301', '1', '100070', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105302', '1', '100072', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105303', '1', '100073', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105304', '1', '100074', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105306', '1', '100076', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105307', '1', '100077', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105308', '1', '100078', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105309', '1', '100071', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105310', '1', '100080', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105311', '1', '100332', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105312', '1', '100336', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105313', '1', '100081', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105314', '1', '100139', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105315', '1', '100142', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105316', '1', '100140', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105317', '1', '100079', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105318', '1', '100138', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105657', '78', '100250', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105658', '78', '100251', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105659', '78', '100252', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105660', '78', '100253', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105661', '78', '100069', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105662', '78', '100070', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105663', '78', '100068', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105664', '78', '100381', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105665', '78', '100382', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105666', '78', '100383', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105685', '-1', '100384', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105686', '1', '100384', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105687', '7', '100384', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105688', '8', '100384', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('105689', '9', '100384', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106516', '-1', '100386', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106654', '7', '100198', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106655', '7', '100199', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106656', '7', '100200', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106657', '7', '100201', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106658', '7', '100202', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106659', '7', '100203', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106660', '7', '100204', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106661', '7', '100205', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106662', '7', '100206', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106663', '7', '100207', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106664', '7', '100208', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106668', '12', '100082', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106670', '12', '100077', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106671', '12', '100078', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106672', '12', '100098', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106673', '-1', '100387', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106674', '1', '100387', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106675', '7', '100387', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106676', '8', '100387', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106677', '9', '100387', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106678', '-1', '100388', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106679', '1', '100388', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106680', '7', '100388', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106681', '8', '100388', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106682', '9', '100388', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106683', '-1', '100389', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106684', '1', '100389', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106685', '7', '100389', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106686', '8', '100389', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106687', '9', '100389', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106688', '-1', '100390', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106689', '1', '100390', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106690', '7', '100390', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106691', '8', '100390', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106692', '9', '100390', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106693', '-1', '100391', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106694', '-1', '100392', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106695', '1', '100391', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106696', '1', '100391', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106697', '7', '100391', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106698', '7', '100391', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106699', '8', '100391', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106700', '8', '100391', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106701', '9', '100391', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106702', '9', '100391', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106703', '-1', '100393', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106704', '1', '100393', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106705', '7', '100393', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106706', '8', '100393', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106707', '9', '100393', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106708', '-1', '100394', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106709', '1', '100394', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106710', '7', '100394', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106711', '8', '100394', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106712', '9', '100394', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106713', '-1', '100395', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106714', '1', '100395', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106715', '7', '100395', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106716', '8', '100395', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106717', '9', '100395', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106718', '-1', '100396', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106719', '1', '100396', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106720', '7', '100396', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106721', '8', '100396', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106722', '9', '100396', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106723', '-1', '100397', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106724', '1', '100397', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106725', '7', '100397', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106726', '8', '100397', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106727', '9', '100397', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106728', '-1', '100398', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106729', '1', '100398', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106730', '7', '100398', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106731', '8', '100398', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106732', '9', '100398', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106733', '-1', '100399', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106734', '1', '100399', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106735', '7', '100399', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106736', '8', '100399', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106737', '9', '100399', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106738', '-1', '100400', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106739', '1', '100400', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106740', '7', '100400', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106741', '8', '100400', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106742', '9', '100400', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106743', '-1', '100401', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106744', '1', '100401', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106745', '7', '100401', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106746', '8', '100401', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106747', '9', '100401', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106748', '-1', '100402', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106749', '1', '100402', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106750', '7', '100402', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106751', '8', '100402', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106752', '9', '100402', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106753', '-1', '100403', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106754', '1', '100403', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106755', '7', '100403', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106756', '8', '100403', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106757', '9', '100403', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106778', '-1', '100140', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106779', '1', '100404', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106780', '1', '100157', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106786', '-1', '100406', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106787', '-1', '100407', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106796', '7', '100408', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106799', '106', '100082', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106800', '106', '100083', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106801', '106', '100405', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106802', '106', '100084', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106803', '106', '100085', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106804', '106', '100314', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106815', '106', '100096', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106816', '106', '100097', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106817', '106', '100162', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106818', '106', '100098', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106819', '106', '100099', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106820', '106', '100317', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106821', '106', '100318', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106849', '106', '100068', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106850', '107', '100410', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106851', '107', '100411', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106854', '107', '100074', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106855', '107', '100068', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106858', '-1', '100412', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106859', '-1', '100247', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106860', '-1', '100248', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106861', '-1', '100249', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106862', '-1', '100410', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106864', '-1', '100409', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106865', '-1', '100232', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106866', '-1', '100239', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106867', '100101', '100247', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('106868', '100101', '100248', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('106871', '106', '100069', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106872', '106', '100070', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106873', '106', '100230', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106874', '106', '100406', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106875', '106', '100234', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106876', '106', '100407', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106877', '106', '100408', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106878', '7', '100069', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106879', '7', '100070', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106882', '107', '100069', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106883', '107', '100070', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106887', '8', '100069', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106888', '8', '100070', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106889', '1', '100405', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106890', '1', '100410', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106891', '1', '100411', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106892', '1', '100406', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106893', '1', '100407', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106894', '1', '100408', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106895', '1', '100409', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106896', '1', '100413', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106897', '1', '100364', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106898', '1', '100365', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106899', '1', '100366', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106900', '1', '100367', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106901', '1', '100412', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106902', '1', '100385', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106903', '1', '100381', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106904', '1', '100382', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106905', '1', '100383', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106906', '1', '100414', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106907', '1', '100415', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106908', '1', '100416', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106909', '-1', '100069', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106910', '-1', '100070', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106911', '-1', '100157', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106912', '-1', '100138', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106913', '1', '100417', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106914', '1', '100418', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106915', '1', '100419', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106916', '1', '100420', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106917', '1', '100421', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106918', '1', '100422', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106919', '1', '100423', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106920', '1', '100424', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106923', '108', '100230', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106924', '108', '100423', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106925', '108', '100408', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106926', '108', '100406', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106927', '108', '100425', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106928', '108', '100407', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106929', '108', '100426', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106930', '108', '100319', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106931', '108', '100320', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106932', '108', '100321', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106933', '108', '100322', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106934', '108', '100323', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106935', '108', '100324', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106936', '108', '100325', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106937', '108', '100326', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106938', '108', '100327', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106939', '108', '100328', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106940', '108', '100329', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106941', '108', '100409', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106942', '108', '100418', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106943', '108', '100082', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106944', '108', '100083', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106945', '108', '100405', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106946', '108', '100084', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106947', '108', '100085', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106948', '108', '100314', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106949', '108', '100086', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106950', '108', '100087', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106951', '108', '100088', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106952', '108', '100089', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106953', '108', '100090', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106954', '108', '100091', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106955', '108', '100092', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106956', '108', '100093', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106957', '108', '100094', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106958', '108', '100095', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106959', '108', '100318', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106960', '108', '100069', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106961', '108', '100070', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106962', '108', '100068', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106965', '1', '100425', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106966', '1', '100426', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106967', '1', '100427', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106970', '108', '100078', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106971', '100266', '100247', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('106972', '100266', '100248', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('106973', '100266', '100249', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('106974', '100266', '100410', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('106975', '100266', '100424', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('106976', '100266', '100411', '90540', 'tenant_system');
INSERT INTO `permission` VALUES ('106977', '108', '100427', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106978', '108', '100366', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106979', '108', '100367', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106980', '108', '100364', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106981', '108', '100365', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106982', '108', '100412', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106983', '108', '100385', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106984', '108', '100074', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106986', '108', '100076', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106987', '108', '100077', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106988', '108', '100071', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106989', '108', '100080', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106990', '108', '100404', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106991', '108', '100072', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106992', '108', '100332', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106993', '108', '100336', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106994', '108', '100081', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106995', '108', '100139', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106996', '108', '100142', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106997', '108', '100140', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106998', '108', '100079', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('106999', '108', '100157', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107000', '108', '100138', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107001', '108', '100247', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107002', '108', '100248', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107003', '108', '100249', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107004', '108', '100410', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107005', '108', '100424', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107006', '108', '100411', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107007', '108', '100096', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107008', '108', '100097', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107009', '108', '100162', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107010', '108', '100098', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107011', '108', '100099', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107012', '108', '100317', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107013', '108', '100417', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107014', '108', '100100', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107015', '108', '100101', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107016', '108', '100102', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107017', '108', '100103', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107018', '108', '100104', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107019', '108', '100105', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107020', '108', '100428', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107021', '108', '100106', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107022', '108', '100107', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107023', '108', '100108', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107024', '108', '100109', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107025', '108', '100110', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107026', '108', '100111', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107027', '108', '100112', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107028', '108', '100113', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107029', '108', '100419', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107030', '108', '100420', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107031', '108', '100421', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107032', '108', '100422', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107035', '-1', '100425', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107036', '-1', '100426', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107037', '-1', '100417', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107038', '-1', '100418', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107039', '-1', '100074', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107040', '-1', '100078', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107041', '-1', '100071', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107042', '-1', '100332', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107043', '-1', '100336', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107066', '8', '100230', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107067', '8', '100406', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107068', '8', '100247', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107069', '8', '100248', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107073', '8', '100409', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107074', '8', '100417', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107076', '7', '100406', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107077', '7', '100247', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107078', '7', '100248', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107079', '7', '100249', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107083', '7', '100409', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107084', '7', '100417', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107085', '7', '100418', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107089', '7', '100425', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107090', '1', '100429', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107091', '1', '100430', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107092', '1', '100431', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107093', '1', '100432', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107094', '1', '100433', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107095', '1', '100434', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107096', '1', '100435', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107097', '1', '100436', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107098', '1', '100437', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107099', '1', '100438', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107100', '1', '100439', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107101', '1', '100440', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107102', '108', '100429', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107103', '108', '100430', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107104', '108', '100431', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107105', '108', '100432', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107106', '108', '100433', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107108', '108', '100435', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107110', '108', '100437', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107111', '108', '100438', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107112', '108', '100439', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107113', '108', '100440', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107114', '8', '100429', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107115', '8', '100430', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107116', '8', '100431', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107117', '8', '100432', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107118', '8', '100433', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107120', '8', '100435', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107122', '8', '100437', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107123', '8', '100438', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107124', '8', '100439', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107125', '8', '100440', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107126', '-1', '100429', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107127', '-1', '100430', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107128', '-1', '100431', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107129', '-1', '100432', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107130', '-1', '100433', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107132', '-1', '100435', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107134', '-1', '100437', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107135', '-1', '100438', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107136', '-1', '100439', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107137', '-1', '100440', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107138', '7', '100429', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107139', '7', '100430', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107140', '7', '100431', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107141', '7', '100432', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107142', '7', '100433', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107144', '7', '100435', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107146', '7', '100437', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107147', '7', '100438', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107148', '7', '100439', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107149', '7', '100440', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107150', '109', '100429', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107151', '109', '100430', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107152', '109', '100431', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107153', '109', '100230', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107154', '109', '100423', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107155', '109', '100408', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107156', '109', '100406', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107157', '109', '100432', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107158', '109', '100433', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107160', '109', '100435', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107162', '109', '100247', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107163', '109', '100248', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107164', '109', '100249', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107165', '109', '100437', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107166', '109', '100438', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107167', '109', '100439', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107168', '109', '100440', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107169', '109', '100410', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107170', '109', '100424', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107171', '109', '100411', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107172', '109', '100425', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107173', '109', '100407', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107174', '109', '100426', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107175', '109', '100319', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107176', '109', '100320', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107177', '109', '100321', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107178', '109', '100322', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107179', '109', '100323', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107180', '109', '100324', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107181', '109', '100325', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107182', '109', '100326', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107183', '109', '100327', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107184', '109', '100328', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107185', '109', '100329', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107186', '109', '100082', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107187', '109', '100083', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107188', '109', '100405', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107189', '109', '100084', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107190', '109', '100085', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107191', '109', '100314', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107192', '109', '100086', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107193', '109', '100087', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107194', '109', '100088', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107195', '109', '100089', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107196', '109', '100090', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107197', '109', '100091', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107198', '109', '100092', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107199', '109', '100093', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107200', '109', '100094', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107201', '109', '100095', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107202', '109', '100096', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107203', '109', '100097', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107204', '109', '100162', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107205', '109', '100098', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107206', '109', '100099', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107207', '109', '100317', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107208', '109', '100318', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107209', '109', '100409', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107210', '109', '100417', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107211', '109', '100418', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107212', '109', '100100', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107213', '109', '100101', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107214', '109', '100102', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107215', '109', '100103', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107216', '109', '100104', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107217', '109', '100105', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107218', '109', '100428', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107219', '109', '100106', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107220', '109', '100107', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107221', '109', '100108', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107222', '109', '100109', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107223', '109', '100110', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107224', '109', '100111', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107225', '109', '100112', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107226', '109', '100113', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107227', '109', '100419', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107228', '109', '100420', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107229', '109', '100421', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107230', '109', '100422', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107231', '109', '100138', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107232', '109', '100068', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107233', '-1', '100441', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107234', '108', '100441', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107235', '1', '100441', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107236', '-1', '100442', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107237', '1', '100443', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107238', '1', '100444', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107239', '-1', '100443', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107240', '-1', '100444', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107241', '7', '100443', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107242', '7', '100444', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107244', '1', '100428', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107253', '8', '100443', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107254', '8', '100444', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107255', '106', '100443', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107256', '108', '100443', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107257', '108', '100444', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107263', '1', '100445', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107264', '1', '100446', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107265', '1', '100447', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107266', '1', '100448', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107267', '1', '100449', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107268', '1', '100450', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107269', '1', '100451', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107270', '1', '100452', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107271', '1', '100453', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107272', '1', '100454', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107273', '1', '100455', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107274', '1', '100456', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107275', '1', '100457', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107276', '1', '100458', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107277', '1', '100459', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107278', '1', '100460', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107279', '1', '100461', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107280', '108', '100445', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107281', '108', '100446', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107282', '108', '100447', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107283', '108', '100448', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107284', '108', '100449', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107285', '108', '100450', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107286', '108', '100451', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107287', '108', '100452', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107288', '108', '100453', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107289', '108', '100454', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107290', '108', '100455', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107291', '108', '100456', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107292', '108', '100457', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107293', '108', '100458', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107294', '108', '100459', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107295', '108', '100460', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107296', '108', '100461', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107297', '107', '100455', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107298', '107', '100424', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107299', '107', '100456', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107302', '-1', '100457', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107303', '-1', '100458', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107304', '-1', '100459', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107305', '-1', '100460', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107306', '-1', '100461', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107307', '-1', '100100', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107309', '-1', '100445', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107310', '-1', '100446', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107311', '-1', '100447', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107312', '-1', '100448', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107313', '-1', '100449', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107314', '-1', '100450', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107315', '-1', '100451', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107316', '-1', '100452', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107317', '-1', '100453', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107318', '-1', '100454', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107319', '7', '100445', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107320', '7', '100446', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107321', '7', '100447', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107322', '7', '100448', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107323', '7', '100449', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107324', '7', '100450', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107325', '7', '100451', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107326', '7', '100452', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107327', '7', '100453', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107328', '7', '100454', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107329', '8', '100445', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107330', '8', '100446', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107331', '8', '100447', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107332', '8', '100448', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107333', '8', '100449', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107334', '8', '100450', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107335', '8', '100451', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107336', '8', '100452', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107337', '8', '100453', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107338', '8', '100454', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107340', '7', '100100', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107341', '8', '100457', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107342', '8', '100458', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107343', '8', '100459', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107345', '8', '100461', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107346', '7', '100457', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107347', '7', '100458', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107348', '7', '100459', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107349', '7', '100460', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107350', '7', '100461', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107351', '1', '100462', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107352', '108', '100462', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107353', '-1', '100462', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107354', '7', '100462', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107355', '8', '100425', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107356', '8', '100462', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107361', '8', '100460', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107362', '106', '100100', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107363', '106', '100425', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107364', '1', '100463', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107365', '108', '100463', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107366', '113', '100078', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107367', '113', '100157', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107368', '113', '100138', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107369', '113', '100068', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107371', '1', '100464', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107372', '1', '100465', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107373', '1', '100466', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107375', '-1', '100466', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107376', '1', '100467', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107377', '1', '100468', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107378', '-1', '100469', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107379', '-1', '100470', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107380', '-1', '100471', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107381', '-1', '100472', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107382', '-1', '100473', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107383', '-1', '100474', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107384', '-1', '100475', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107385', '-1', '100476', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107386', '7', '100469', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107387', '7', '100470', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107388', '7', '100471', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107389', '7', '100472', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107390', '7', '100473', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107391', '7', '100474', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107392', '7', '100475', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107393', '7', '100476', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107394', '8', '100469', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107395', '8', '100470', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107396', '8', '100471', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107397', '8', '100472', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107398', '8', '100473', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107399', '8', '100474', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107400', '8', '100475', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107401', '8', '100476', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107402', '108', '100469', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107403', '108', '100470', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107404', '108', '100471', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107405', '108', '100464', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107406', '108', '100465', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107407', '108', '100467', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107408', '108', '100468', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107409', '108', '100466', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107410', '108', '100472', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107411', '108', '100473', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107412', '108', '100474', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107413', '108', '100475', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107414', '108', '100476', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107416', '7', '100466', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107419', '1', '100477', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107420', '-1', '100477', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107428', '-1', '100478', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107442', '-1', '100479', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107443', '-1', '100480', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107444', '-1', '100481', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107446', '106', '100429', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107447', '106', '100430', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107448', '106', '100431', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107449', '106', '100423', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107450', '106', '100483', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107451', '106', '100477', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107452', '106', '100479', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107453', '106', '100432', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107454', '106', '100433', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107455', '106', '100444', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107458', '106', '100435', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107460', '106', '100445', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107461', '106', '100449', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107462', '106', '100450', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107463', '106', '100469', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107464', '106', '100452', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107465', '106', '100484', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107466', '106', '100454', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107467', '106', '100480', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107468', '106', '100471', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107469', '106', '100481', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107470', '106', '100437', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107471', '106', '100438', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107472', '106', '100439', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107473', '106', '100440', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107474', '106', '100485', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107475', '-1', '100486', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107476', '108', '100486', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107478', '7', '100486', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107480', '8', '100486', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107481', '-1', '100487', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107484', '7', '100488', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107485', '7', '100489', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107488', '106', '100488', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107489', '106', '100489', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107490', '108', '100488', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107491', '108', '100489', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107492', '1', '100488', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107493', '1', '100489', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107494', '8', '100477', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107495', '8', '100479', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107496', '8', '100487', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107497', '8', '100480', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107498', '8', '100100', '90541', 'tenant_system');
INSERT INTO `permission` VALUES ('107499', '8', '100466', '90541', 'tenant_system');

-- ----------------------------
-- Table structure for portal_announcement
-- ----------------------------
DROP TABLE IF EXISTS `portal_announcement`;
CREATE TABLE `portal_announcement` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `START_TIME` datetime DEFAULT NULL,
  `ANNOUNCE_AUTHOR` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `ANNOUNCE_TITLE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ANNOUNCE_TIME` datetime DEFAULT NULL,
  `ANNOUNCE_STATUS` bigint(10) DEFAULT NULL,
  `ANNOUNCE_CONTENT` varchar(10000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `ANNOUNCE_FLAG` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_announcement
-- ----------------------------

-- ----------------------------
-- Table structure for portal_announcement_file
-- ----------------------------
DROP TABLE IF EXISTS `portal_announcement_file`;
CREATE TABLE `portal_announcement_file` (
  `ANNOUNCE_FILE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FILE_PATH` varchar(255) DEFAULT NULL,
  `FILE_NAME` varchar(255) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ANNOUNCE_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of portal_announcement_file
-- ----------------------------

-- ----------------------------
-- Table structure for portal_announcement_file_rel
-- ----------------------------
DROP TABLE IF EXISTS `portal_announcement_file_rel`;
CREATE TABLE `portal_announcement_file_rel` (
  `ANNOUNCE_ID` bigint(20) NOT NULL,
  `ANNOUNCE_FILE_ID` bigint(20) NOT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ANNOUNCE_ID`,`ANNOUNCE_FILE_ID`),
  KEY `FK37059B9BD2C22000` (`ANNOUNCE_ID`) USING BTREE,
  KEY `FK37059B9B24AEAE53` (`ANNOUNCE_FILE_ID`) USING BTREE,
  CONSTRAINT `portal_announcement_file_rel_ibfk_1` FOREIGN KEY (`ANNOUNCE_FILE_ID`) REFERENCES `portal_announcement_file` (`ANNOUNCE_FILE_ID`),
  CONSTRAINT `portal_announcement_file_rel_ibfk_2` FOREIGN KEY (`ANNOUNCE_ID`) REFERENCES `portal_announcement` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of portal_announcement_file_rel
-- ----------------------------

-- ----------------------------
-- Table structure for portal_announcement_user_rel
-- ----------------------------
DROP TABLE IF EXISTS `portal_announcement_user_rel`;
CREATE TABLE `portal_announcement_user_rel` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `LOGIN_ID` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ANNOUNCEMENT_ID` bigint(19) DEFAULT NULL,
  `READ_TIME` datetime DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_announcement_user_rel
-- ----------------------------

-- ----------------------------
-- Table structure for portal_app
-- ----------------------------
DROP TABLE IF EXISTS `portal_app`;
CREATE TABLE `portal_app` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `APP_CODE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `APP_NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_app
-- ----------------------------

-- ----------------------------
-- Table structure for portal_application_system
-- ----------------------------
DROP TABLE IF EXISTS `portal_application_system`;
CREATE TABLE `portal_application_system` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `SYS_CODE` varchar(50) COLLATE utf8_bin NOT NULL,
  `SYS_NAME` varchar(50) COLLATE utf8_bin NOT NULL,
  `SYS_URL` varchar(500) COLLATE utf8_bin NOT NULL,
  `SYS_DESC` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_application_system
-- ----------------------------
INSERT INTO `portal_application_system` VALUES ('1', 'platform', '平台门户', 'menuinfo.action', null, 'tenant_system');

-- ----------------------------
-- Table structure for portal_data_source
-- ----------------------------
DROP TABLE IF EXISTS `portal_data_source`;
CREATE TABLE `portal_data_source` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PWD` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `DATA_SOURCE_NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `DATA_SOURCE_URL` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `DRIVER_CLASS_NAME` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `APP_ID` bigint(19) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKDF75F6FD299A8F12` (`APP_ID`) USING BTREE,
  CONSTRAINT `portal_data_source_ibfk_1` FOREIGN KEY (`APP_ID`) REFERENCES `portal_app` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_data_source
-- ----------------------------

-- ----------------------------
-- Table structure for portal_intro_info
-- ----------------------------
DROP TABLE IF EXISTS `portal_intro_info`;
CREATE TABLE `portal_intro_info` (
  `ID` bigint(19) NOT NULL,
  `INTRO_STEP` bigint(10) DEFAULT NULL,
  `INTRO_TAG_NAME` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `INTRO_TAG_TYPE` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `INTRO_SHOW_POSITION` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `INTRO_INFO` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `INTRO_NAME` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `INTRO_TITLE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `PAGE_ID` bigint(19) DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK389FD4749C19F1D2` (`PAGE_ID`) USING BTREE,
  CONSTRAINT `portal_intro_info_ibfk_1` FOREIGN KEY (`PAGE_ID`) REFERENCES `portal_intro_page` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_intro_info
-- ----------------------------

-- ----------------------------
-- Table structure for portal_intro_page
-- ----------------------------
DROP TABLE IF EXISTS `portal_intro_page`;
CREATE TABLE `portal_intro_page` (
  `ID` bigint(19) NOT NULL,
  `PAGE_CODE` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `PAGE_NAME` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `APP_SYS_CODE` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `APP_CODE` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `PAGE_DESC` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_intro_page
-- ----------------------------
INSERT INTO `portal_intro_page` VALUES ('1', 'portal_mainpage', 'portal_mainpage(platform)', 'platform', null, null, null);

-- ----------------------------
-- Table structure for portal_intro_user_visit
-- ----------------------------
DROP TABLE IF EXISTS `portal_intro_user_visit`;
CREATE TABLE `portal_intro_user_visit` (
  `ID` bigint(19) NOT NULL,
  `VISIT_TIME` datetime DEFAULT NULL,
  `IS_VISIT` bigint(10) DEFAULT NULL,
  `LOGIN_ID` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `PAGE_ID` bigint(19) DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKDD5762FD9C19F1D2` (`PAGE_ID`) USING BTREE,
  CONSTRAINT `portal_intro_user_visit_ibfk_1` FOREIGN KEY (`PAGE_ID`) REFERENCES `portal_intro_page` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_intro_user_visit
-- ----------------------------

-- ----------------------------
-- Table structure for portal_layout
-- ----------------------------
DROP TABLE IF EXISTS `portal_layout`;
CREATE TABLE `portal_layout` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `LAYOUT_NAME` varchar(20) COLLATE utf8_bin NOT NULL,
  `LAYOUT_TEMPLET` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `LAYOUT_DATA` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `IS_DEFAULT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_layout
-- ----------------------------
INSERT INTO `portal_layout` VALUES ('1', '单列布局', 'column', '', 'tenant_system', '1');
INSERT INTO `portal_layout` VALUES ('2', '两列布局', 'column', '50,50', 'tenant_system', '1');
INSERT INTO `portal_layout` VALUES ('3', '三列布局', 'column', '33,33,33', 'tenant_system', '1');
INSERT INTO `portal_layout` VALUES ('290', 'testV', '', '50,50,50', 'tenant_system', '0');

-- ----------------------------
-- Table structure for portal_logo_pic
-- ----------------------------
DROP TABLE IF EXISTS `portal_logo_pic`;
CREATE TABLE `portal_logo_pic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PIC_CLOB` longtext,
  `IMAGE_FILE_NAME` varchar(130) DEFAULT NULL,
  `UPLOAD_USER` varchar(130) DEFAULT NULL,
  `tenant_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of portal_logo_pic
-- ----------------------------

-- ----------------------------
-- Table structure for portal_menuinfo
-- ----------------------------
DROP TABLE IF EXISTS `portal_menuinfo`;
CREATE TABLE `portal_menuinfo` (
  `ID` bigint(38) NOT NULL AUTO_INCREMENT,
  `ORD` bigint(38) DEFAULT NULL,
  `MENU_DESC` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MENU_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MENU_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MENUINFO_ID` bigint(38) DEFAULT NULL,
  `TENANT_ID` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `ICON` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_DISABLE` bigint(10) DEFAULT NULL,
  `APP_SYS_CODE` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `SERVICE_APP_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_USER` int(11) DEFAULT NULL,
  `BY_USER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MENUINFO_TYPE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK183B91007C20632E` (`MENUINFO_ID`) USING BTREE,
  KEY `FK183B9100A9BEB289` (`MENUINFO_TYPE_ID`) USING BTREE,
  CONSTRAINT `portal_menuinfo_ibfk_1` FOREIGN KEY (`MENUINFO_ID`) REFERENCES `portal_menuinfo` (`ID`),
  CONSTRAINT `portal_menuinfo_ibfk_2` FOREIGN KEY (`MENUINFO_TYPE_ID`) REFERENCES `portal_menuinfo_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10640 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_menuinfo
-- ----------------------------
INSERT INTO `portal_menuinfo` VALUES ('100', '100', '门户管理', '', '设置', 'PORTAL_MANAGE', null, 'tenant_system', 'th-large', '0', '', '', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('101', '6', '菜单表', 'menuinfo!list.action', '菜单管理', 'menuinfo', '100', 'tenant_system', '', '0', '', '', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('102', '17', '公告管理（旧）', 'announcement!list.action', '公告管理（旧）', 'system_board', '10633', 'tenant_system', '', '1', '', '', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('143', '5', '组件配置属性实例', '/portalPortletConfigInstance!list.action', '组件配置属性实例', 'propertyInstance', '161', 'tenant_system', '', '1', '', 'portal', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('145', null, '门户主题风格', '/portalTheme!list.action', '门户主题风格', 'PORTAL_THEME', '159', 'tenant_system', '', '1', '', 'portal', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('146', '3', '门户组件实例', '/portalPortletInstance!list.action', '门户组件实例', 'portletInstance', '161', 'tenant_system', '', '1', '', 'portal', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('147', '4', '门户组件的配置', '/portalPortletConfig!list.action', '门户组件的配置属性', 'portletConfig', '161', 'tenant_system', '', '1', '', 'portal', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('149', '20', '门户布局器', '/portalLayout!list.action', '布局器管理', 'PORTAL_LAYOUT', '100', 'tenant_system', '', '1', '', 'portal', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('150', '2', '门户组件的事件', '/portletEvent!list.action', '门户组件的事件', 'PORTLET_EVENT', '161', 'tenant_system', '', '1', '', 'portal', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('152', null, '组件主题', '/portalPortletTheme!list.action', '组件主题', 'PORTLET_THEME', '159', 'tenant_system', '', '1', '', 'portal', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('153', '13', '门户页面', '/portalPage!list.action', '门户页面', 'PORTAL_PAGE', '100', 'tenant_system', '', '1', '', 'portal', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('154', '1', '门户组件', '/portalPortlet!list.action', '门户组件', 'PORTAL_PORTLET', '161', 'tenant_system', '', '1', '', 'portal', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('159', '10', '主题管理', '', '主题管理', 'THEME_MANAGE', '100', 'tenant_system', '', '1', '', '', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('161', '19', '组件管理', '', '组件管理', 'PORTLET_MANAGE', '100', 'tenant_system', '', '1', '', '', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('201', '1', '用户管理', '/userinfo!list.action', '用户管理', 'USERINFO_MANAGE', '100', 'tenant_system', 'blank', '0', 'platform', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('202', '2', '角色管理', '/roleinfo!list.action', '角色管理', 'ROLEINFO_MANAGER', '100', 'tenant_system', '', '0', 'platform', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('203', '3', '组织机构管理', '/orginfo!list.action?type=tree', '组织机构管理', 'ORGINFO_MANAGE', '100', 'tenant_system', '', '1', '', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('204', '4', '组织机构类型管理', '/orgType!list.action', '组织机构类型管理', 'orgType', '217', 'tenant_system', '', '1', '', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('206', '6', '数据源管理', '/ruleTableDataSource!list.action', '数据源管理', 'ruleTableDataSource', '217', 'tenant_system', '', '1', '', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('207', '7', '主表管理', '/tableInfo!list.action', '主表管理', 'tableInfo', '216', 'tenant_system', '', '1', '', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('208', '8', '规则管理', '/dataResRegRule!list.action', '规则管理', 'DATARESREGRULE', '216', 'tenant_system', '', '1', '', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('209', '9', '资源管理', '/resources!list.action', '资源管理', 'RESOURCE', '216', 'tenant_system', '', '1', '', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('210', '10', '主体管理', '/masterType!list.action', '主体管理', 'MASTERTYPE', '217', 'tenant_system', '', '1', '', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('215', '1', '租户管理', '/tenantinfo!list.action', '租户管理', 'tenant_manage', '100', 'tenant_system', '', '0', '', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('216', '4', '安全权限', '', '安全权限', 'security-auth', '100', 'tenant_system', '', '1', '', '', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('217', '11', '安全其他', '', '安全其他', 'security_other', '100', 'tenant_system', '', '1', '', '', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('221', '12', '多租户', '', '多租户', 'tenantinfo', '100', 'tenant_system', '', '1', '', '', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('222', '22', '租户数据共享', '/tenantDataShare!list.action', '租户数据共享', 'tenant_data_share', '221', 'tenant_system', '', '1', '', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('226', '26', '日志服务配置', '/logRule!list.action', '日志服务配置', 'log_rule', '217', 'tenant_system', '', '1', '', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('227', '27', '日志明细查询', '/log!list.action', '日志明细查询', 'log', '217', 'tenant_system', '', '1', '', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('251', '18', '', '/extPropertyDefine!list.action', '用户/机构扩展属性', 'extPropertyDefine', '100', 'tenant_system', '', '1', '', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('256', '5', '云控制台', '', '云市场', 'bconsole', null, 'tenant_system', 'cloud', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('257', '2', '应用发布', 'product/page', '应用发布', 'service_register', '256', 'tenant_system', 'blank', '0', 'platform', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('264', '1', '服务分类信息', 'productType/index', '应用分类', 'producttype', '256', 'tenant_system', 'blank', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('284', '5', 'BPM', '', '流程管理', 'BPM', '100', 'tenant_system', '', '1', '', '', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('285', '1', '任务列表', '/task-list.jsp', '任务列表', 'task-list', '284', 'tenant_system', '', '1', '', 'BPM', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('286', '2', '流程类别树维护', '/category-tree.jsp', '流程类别树维护', 'category-tree', '284', 'tenant_system', '', '1', '', 'BPM', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('287', '3', '流程实例监控', '/bpm/ModelMonitor.action', '流程实例监控', 'ModelMonitor', '284', 'tenant_system', '', '1', '', 'BPM', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('288', '4', '任务委托管理', '/bpm/UserDelegate!manage.action', '任务委托管理', 'UserDelegate_manage', '284', 'tenant_system', '', '1', '', 'BPM', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('289', '5', 'JAVA服务管理', '/bpm/Services!manageService.action?serviceType=java', 'JAVA服务管理', 'Services_manageService', '284', 'tenant_system', '', '1', '', 'BPM', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('290', '6', '外部扩展服务管理', '/bpm/extService.action', '外部扩展服务管理', 'extService', '284', 'tenant_system', '', '1', '', 'BPM', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('291', '7', '流程设计', '/model-list.jsp', '流程设计', 'model_list', '284', 'tenant_system', '', '1', '', 'BPM', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('292', '8', '流程管理', '/bpm/ModelManage!deployments.action?', '流程管理', 'ModeManage', '284', 'tenant_system', '', '1', '', 'BPM', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('293', '9', '表单管理', '/bpm/FormDef!manageForms.action?formType=external', '表单管理', 'FormDef', '284', 'tenant_system', '', '1', '', 'BPM', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('294', '10', '我的任务', '/bpm/MyTask.action', '我的任务', 'mynewtask', '284', 'tenant_system', '', '1', '', 'BPM', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('306', '16', '', '/email!list.action', '邮箱配置', 'EMAIL_CONFIG', '10633', 'tenant_system', '', '1', '', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('307', null, '', '/tenantType!list.action', '租户类型管理', 'TENANT_TYPE', '221', 'tenant_system', '', '1', '', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('308', '7', '', '/roleinfo!config.action', '角色配置管理', 'ROLEINFO_CONFIG', '100', 'tenant_system', '', '1', '', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('309', '14', '', '/userinfo!userApproval.action', '用户角色审批', 'USER_ROLE_APPROVAL', '100', 'tenant_system', '', '1', '', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10550', '3', '审批租户', '/userinfo!tenantApproval.action', '租户审批', 'tenant_approval', '221', 'tenant_system', '', '1', '', 'security', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10562', '15', '', '', '页面建模', 'pageModel', '100', 'tenant_system', 'blank', '1', '', '', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10563', null, '', '/v1/pageType/pageTypes', '页面管理', 'pageModelManage', '10562', 'tenant_system', 'blank', '1', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10564', null, '', '/v1/pageModuleType/moduleClassify', '组件管理', 'pageModuleManage', '10562', 'tenant_system', 'blank', '1', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10566', null, '', '/v1/pageResType/resClassify', '资源管理', 'pageResManage', '10562', 'tenant_system', '', '1', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10571', '6', '', '', '数据库与缓存', 'databaseCache', null, 'tenant_system', 'database', '0', '', '', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10572', null, '', '/productCase/component/service?productId=mysql', 'MySQL', 'Mysql', '10571', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10573', null, '', '/productCase/component/service?productId=redis', 'Redis', 'Redis', '10571', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10574', null, '', '/productCase/component/service?productId=memcached', 'Memcached', 'Memcached', '10571', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10575', '7', '', '', '中间件', 'middleware', null, 'tenant_system', 'hourglass-half', '0', '', '', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10576', null, '', '/productCase/component/service?productId=kafka', 'Kafka', 'kafka', '10575', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10577', null, '', '/productCase/component/service?productId=zookeeper', 'ZooKeeper', 'zookeeper', '10575', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10578', '8', '', '', '大数据组件', 'bigDataComponent', null, 'tenant_system', 'server', '0', '', '', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10579', null, '', '/productCase/component/service?productId=yarn', 'Yarn', 'yarn', '10578', 'tenant_system', '', '1', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10580', null, '', '/productCase/component/service?productId=hive', 'Hive', 'Hive', '10578', 'tenant_system', '', '1', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10581', null, '', '/productCase/component/service?productId=storm', 'Storm', 'Storm', '10578', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10582', null, '', '/productCase/component/service?productId=es', 'Elasticsearch', 'Elasticsearch', '10578', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10583', null, 'ftp', '/productCase/component/service?productId=ftp', 'FTP', 'ftp', '10578', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10584', '3', '服务浏览', 'product/productBrowsePage', '应用市场', 'productBrowse', '256', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10585', '1', '应用', '', '应用', 'application', null, 'tenant_system', 'bars', '0', '', 'ContainerCloud', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10588', '2', '服务', 'bcos/v1/app/service/servicePage', '服务', 'bcmService', '10585', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10589', '3', '任务', '', '任务', 'taskes', '10585', 'tenant_system', '', '1', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10590', '4', '配置', '', '配置', 'toConfigure', '10585', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10591', '2', '镜像', '', '镜像', 'mirrorImage', null, 'tenant_system', 'cubes', '0', '', 'ContainerCloud', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10592', '3', '镜像列表', '/bcos/v1/image/individual/page', '镜像列表', 'mirrorList', '10591', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10593', '2', '公共镜像', '/bcos/v1/image/public/page', '公共镜像', 'publicMirror', '10591', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10594', '1', '镜像构建', '', '镜像构建', 'mirrorConstruction', '10591', 'tenant_system', '', '0', '', '', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10595', '4', '镜像部署', '', '镜像部署', 'collectionDeploy', '10591', 'tenant_system', '', '1', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10596', '4', '存储', '', '存储', 'storage', null, 'tenant_system', 'folder', '0', '', 'ContainerCloud', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10597', '1', '共享存储', 'bcos/v1/storage/file/page', '共享存储', 'fileStore', '10596', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10604', '9', '服务编排', '', '服务编排', 'layout', '100', 'tenant_system', '', '1', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10605', null, '', '/console/v1/project/', '项目管理', '项目管理', '100', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10606', '23', '公告管理', '/message!listSysMsg.action', '公告管理', 'announcement', '10633', 'tenant_system', '', '1', 'platform', 'portal', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10607', null, '', '/system/v1/code/codeTablePage', '数据字典', '数据字典', '100', 'tenant_system', '', '1', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10610', '1', '环境变量', 'bcos/v1/app/env/page', '环境变量', 'x_app_env_page', '10590', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10611', null, 'Dockerfile构建', '/bcos/v1/image/dockerfileConstructs', '程序包构建', 'dockerfileConstructs', '10594', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10612', null, '配置文件', 'bcos/v1/app/config/page', '配置文件', 'configFile', '10590', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10613', null, '代码构建', '/bcos/v1/image/codeConstructs', '代码构建', 'codeConstruction', '10594', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10614', null, '组件库', '/servflow/v1/component/page', '组件库', 'components', '10604', 'tenant_system', '', '1', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10615', null, '组件类型', '/servflow/v1/component/page', '组件类型', 'business_components', '10604', 'tenant_system', '', '1', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10616', '3', '代码', '', '代码', 'code', null, 'tenant_system', 'code', '0', '', 'ContainerCloud', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10617', '1', '代码库', '/bcos/v1/image/codebaseList', '代码库', 'x_image_codebaseList', '10616', 'tenant_system', '', '0', '', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10618', null, '服务列表', '/bcos/v1/app/service/serviceDetailPage', '服务列表', 'x_app_service_serviceDetailPage', '10588', 'tenant_system', '', '1', 'platform', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10619', null, '配置文件', '/bcos/v1/app/config/create/page', '配置文件', 'x_app_config_create_page', '10612', 'tenant_system', '', '1', 'platform', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10620', null, '新建Dokerfile构建', '/bcos/v1/image/addDockerfile', '新建Dokerfile构建', 'x_addDockerfile', '10611', 'tenant_system', '', '1', 'platform', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10621', null, '构建任务/构建历史', '/bcos/v1/image/dockerfileTask', '构建任务/构建历史', 'x_dockerfileTask', '10611', 'tenant_system', '', '1', 'platform', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10622', null, '', '/bcos/v1/image/editDockerfile', '配置Dokerfile构建', 'x_editDockerfile', '10611', 'tenant_system', '', '1', 'platform', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10624', null, '代码构建/构建任务', '/bcos/v1/image/codeTask', '代码构建/构建任务', 'x_codeTask', '10613', 'tenant_system', '', '1', 'platform', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10625', null, '配置代码构建', '/bcos/v1/image/editCodeTask', '配置代码构建', 'x_editCodeTask', '10613', 'tenant_system', '', '1', 'platform', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10626', null, '公共镜像详情', '/bcos/v1/image/public/detailPage', '公共镜像详情', 'x_detailPage', '10593', 'tenant_system', '', '1', 'platform', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10627', null, '我的镜像详情', '/bcos/v1/image/individual/detailPage', '我的镜像详情', 'x_individual_detailPage', '10592', 'tenant_system', '', '1', 'platform', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10628', null, '服务套餐列表', '/productPackage/page', '服务套餐列表', 'x_productPackage_page', '257', 'tenant_system', '', '1', 'platform', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10630', null, 'redis组件详情', '/productCase/component/detail/redis', 'redis组件详情', 'x_productCase_component_detail_redis', '10573', 'tenant_system', '', '1', 'platform', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10631', '10', '', '', '计划任务', 'task_schedule', '100', 'tenant_system', '', '1', 'platform', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10632', '1', '', '/task/schedule/index', '计划管理', 'task_schedule_01', '10631', 'tenant_system', '', '1', 'platform', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10633', null, '消息管理', '', '消息管理', 'message_manage', '100', 'tenant_system', '', '1', 'platform', 'portal', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10634', null, '', '/message!msgList.action', '站内信', 'message_notic', '10633', 'tenant_system', '', '1', '', 'portal', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10635', '4', 'prometheus', '/productCase/component/service?productId=prous', 'Prometheus', 'prometheus', '10578', 'tenant_system', '', '1', 'platform', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10636', '1', '应用管理', 'application/manage', '管理', 'mycase1', '10585', 'tenant_system', '', '0', 'platform', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10637', '2', '', '/bcos/v1/image/codeChecking', '代码检查', 'codeChecking_list', '10616', 'tenant_system', '', '0', 'platform', 'bconsole', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10638', '9', '微服务框架', '', '微服务框架', 'x_app', null, 'tenant_system', 'cloud', '1', '', '', '0', null, null);
INSERT INTO `portal_menuinfo` VALUES ('10639', null, 'SpringCloud', '/productCase/component/service?productId=springcloud', 'SpringCloud', 'x_app_springcloud', '10638', 'tenant_system', '', '1', '', 'bconsole', '0', null, null);

-- ----------------------------
-- Table structure for portal_menuinfo_type
-- ----------------------------
DROP TABLE IF EXISTS `portal_menuinfo_type`;
CREATE TABLE `portal_menuinfo_type` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MENU_TYPE_CODE` varchar(255) NOT NULL,
  `MENUINFO_TYPE_NAME` varchar(50) DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `MENU_TYPE_CODE` (`MENU_TYPE_CODE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of portal_menuinfo_type
-- ----------------------------

-- ----------------------------
-- Table structure for portal_menu_icon
-- ----------------------------
DROP TABLE IF EXISTS `portal_menu_icon`;
CREATE TABLE `portal_menu_icon` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `ICON_CODE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_menu_icon
-- ----------------------------
INSERT INTO `portal_menu_icon` VALUES ('1', 'adjust', null);
INSERT INTO `portal_menu_icon` VALUES ('3', 'anchor', null);
INSERT INTO `portal_menu_icon` VALUES ('4', 'archive', null);
INSERT INTO `portal_menu_icon` VALUES ('5', 'area-chart', null);
INSERT INTO `portal_menu_icon` VALUES ('6', 'arrows', null);
INSERT INTO `portal_menu_icon` VALUES ('7', 'arrows-h', null);
INSERT INTO `portal_menu_icon` VALUES ('8', 'arrows-v', null);
INSERT INTO `portal_menu_icon` VALUES ('11', 'asterisk', null);
INSERT INTO `portal_menu_icon` VALUES ('12', 'at', null);
INSERT INTO `portal_menu_icon` VALUES ('14', 'automobile', null);
INSERT INTO `portal_menu_icon` VALUES ('15', 'balance-scale', null);
INSERT INTO `portal_menu_icon` VALUES ('16', 'ban', null);
INSERT INTO `portal_menu_icon` VALUES ('17', 'bank', null);
INSERT INTO `portal_menu_icon` VALUES ('18', 'bar-chart', null);
INSERT INTO `portal_menu_icon` VALUES ('19', 'bar-chart-o', null);
INSERT INTO `portal_menu_icon` VALUES ('20', 'barcode', null);
INSERT INTO `portal_menu_icon` VALUES ('21', 'bars', null);
INSERT INTO `portal_menu_icon` VALUES ('22', 'battery-0', null);
INSERT INTO `portal_menu_icon` VALUES ('23', 'battery-1', null);
INSERT INTO `portal_menu_icon` VALUES ('24', 'battery-2', null);
INSERT INTO `portal_menu_icon` VALUES ('25', 'battery-3', null);
INSERT INTO `portal_menu_icon` VALUES ('26', 'battery-4', null);
INSERT INTO `portal_menu_icon` VALUES ('27', 'battery-empty', null);
INSERT INTO `portal_menu_icon` VALUES ('28', 'battery-full', null);
INSERT INTO `portal_menu_icon` VALUES ('29', 'battery-half', null);
INSERT INTO `portal_menu_icon` VALUES ('30', 'battery-quarter', null);
INSERT INTO `portal_menu_icon` VALUES ('31', 'battery-three-quarters', null);
INSERT INTO `portal_menu_icon` VALUES ('32', 'bed', null);
INSERT INTO `portal_menu_icon` VALUES ('33', 'beer', null);
INSERT INTO `portal_menu_icon` VALUES ('34', 'bell', null);
INSERT INTO `portal_menu_icon` VALUES ('35', 'bell-o', null);
INSERT INTO `portal_menu_icon` VALUES ('36', 'bell-slash', null);
INSERT INTO `portal_menu_icon` VALUES ('37', 'bell-slash-o', null);
INSERT INTO `portal_menu_icon` VALUES ('38', 'bicycle', null);
INSERT INTO `portal_menu_icon` VALUES ('39', 'binoculars', null);
INSERT INTO `portal_menu_icon` VALUES ('40', 'birthday-cake', null);
INSERT INTO `portal_menu_icon` VALUES ('44', 'bolt', null);
INSERT INTO `portal_menu_icon` VALUES ('45', 'bomb', null);
INSERT INTO `portal_menu_icon` VALUES ('46', 'book', null);
INSERT INTO `portal_menu_icon` VALUES ('47', 'bookmark', null);
INSERT INTO `portal_menu_icon` VALUES ('48', 'bookmark-o', null);
INSERT INTO `portal_menu_icon` VALUES ('50', 'briefcase', null);
INSERT INTO `portal_menu_icon` VALUES ('51', 'bug', null);
INSERT INTO `portal_menu_icon` VALUES ('52', 'building', null);
INSERT INTO `portal_menu_icon` VALUES ('53', 'building-o', null);
INSERT INTO `portal_menu_icon` VALUES ('54', 'bullhorn', null);
INSERT INTO `portal_menu_icon` VALUES ('55', 'bullseye', null);
INSERT INTO `portal_menu_icon` VALUES ('56', 'bus', null);
INSERT INTO `portal_menu_icon` VALUES ('57', 'cab', null);
INSERT INTO `portal_menu_icon` VALUES ('58', 'calculator', null);
INSERT INTO `portal_menu_icon` VALUES ('59', 'calendar', null);
INSERT INTO `portal_menu_icon` VALUES ('60', 'calendar-check-o', null);
INSERT INTO `portal_menu_icon` VALUES ('61', 'calendar-minus-o', null);
INSERT INTO `portal_menu_icon` VALUES ('62', 'calendar-o', null);
INSERT INTO `portal_menu_icon` VALUES ('63', 'calendar-plus-o', null);
INSERT INTO `portal_menu_icon` VALUES ('64', 'calendar-times-o', null);
INSERT INTO `portal_menu_icon` VALUES ('65', 'camera', null);
INSERT INTO `portal_menu_icon` VALUES ('66', 'camera-retro', null);
INSERT INTO `portal_menu_icon` VALUES ('67', 'car', null);
INSERT INTO `portal_menu_icon` VALUES ('68', 'caret-square-o-down', null);
INSERT INTO `portal_menu_icon` VALUES ('69', 'caret-square-o-left', null);
INSERT INTO `portal_menu_icon` VALUES ('70', 'caret-square-o-right', null);
INSERT INTO `portal_menu_icon` VALUES ('71', 'caret-square-o-up', null);
INSERT INTO `portal_menu_icon` VALUES ('72', 'cart-arrow-down', null);
INSERT INTO `portal_menu_icon` VALUES ('73', 'cart-plus', null);
INSERT INTO `portal_menu_icon` VALUES ('74', 'cc', null);
INSERT INTO `portal_menu_icon` VALUES ('75', 'certificate', null);
INSERT INTO `portal_menu_icon` VALUES ('76', 'check', null);
INSERT INTO `portal_menu_icon` VALUES ('77', 'check-circle', null);
INSERT INTO `portal_menu_icon` VALUES ('78', 'check-circle-o', null);
INSERT INTO `portal_menu_icon` VALUES ('79', 'check-square', null);
INSERT INTO `portal_menu_icon` VALUES ('80', 'check-square-o', null);
INSERT INTO `portal_menu_icon` VALUES ('81', 'child', null);
INSERT INTO `portal_menu_icon` VALUES ('82', 'circle', null);
INSERT INTO `portal_menu_icon` VALUES ('83', 'circle-o', null);
INSERT INTO `portal_menu_icon` VALUES ('84', 'circle-o-notch', null);
INSERT INTO `portal_menu_icon` VALUES ('85', 'circle-thin', null);
INSERT INTO `portal_menu_icon` VALUES ('86', 'clock-o', null);
INSERT INTO `portal_menu_icon` VALUES ('87', 'clone', null);
INSERT INTO `portal_menu_icon` VALUES ('88', 'close', null);
INSERT INTO `portal_menu_icon` VALUES ('89', 'cloud', null);
INSERT INTO `portal_menu_icon` VALUES ('90', 'cloud-download', null);
INSERT INTO `portal_menu_icon` VALUES ('91', 'cloud-upload', null);
INSERT INTO `portal_menu_icon` VALUES ('92', 'code', null);
INSERT INTO `portal_menu_icon` VALUES ('93', 'code-fork', null);
INSERT INTO `portal_menu_icon` VALUES ('94', 'coffee', null);
INSERT INTO `portal_menu_icon` VALUES ('95', 'cog', null);
INSERT INTO `portal_menu_icon` VALUES ('96', 'cogs', null);
INSERT INTO `portal_menu_icon` VALUES ('97', 'comment', null);
INSERT INTO `portal_menu_icon` VALUES ('98', 'comment-o', null);
INSERT INTO `portal_menu_icon` VALUES ('99', 'commenting', null);
INSERT INTO `portal_menu_icon` VALUES ('100', 'commenting-o', null);
INSERT INTO `portal_menu_icon` VALUES ('101', 'comments', null);
INSERT INTO `portal_menu_icon` VALUES ('102', 'comments-o', null);
INSERT INTO `portal_menu_icon` VALUES ('103', 'compass', null);
INSERT INTO `portal_menu_icon` VALUES ('104', 'copyright', null);
INSERT INTO `portal_menu_icon` VALUES ('105', 'creative-commons', null);
INSERT INTO `portal_menu_icon` VALUES ('106', 'credit-card', null);
INSERT INTO `portal_menu_icon` VALUES ('108', 'crop', null);
INSERT INTO `portal_menu_icon` VALUES ('109', 'crosshairs', null);
INSERT INTO `portal_menu_icon` VALUES ('110', 'cube', null);
INSERT INTO `portal_menu_icon` VALUES ('111', 'cubes', null);
INSERT INTO `portal_menu_icon` VALUES ('112', 'cutlery', null);
INSERT INTO `portal_menu_icon` VALUES ('113', 'dashboard', null);
INSERT INTO `portal_menu_icon` VALUES ('114', 'database', null);
INSERT INTO `portal_menu_icon` VALUES ('117', 'desktop', null);
INSERT INTO `portal_menu_icon` VALUES ('118', 'diamond', null);
INSERT INTO `portal_menu_icon` VALUES ('119', 'dot-circle-o', null);
INSERT INTO `portal_menu_icon` VALUES ('120', 'download', null);
INSERT INTO `portal_menu_icon` VALUES ('121', 'edit', null);
INSERT INTO `portal_menu_icon` VALUES ('122', 'ellipsis-h', null);
INSERT INTO `portal_menu_icon` VALUES ('123', 'ellipsis-v', null);
INSERT INTO `portal_menu_icon` VALUES ('124', 'envelope', null);
INSERT INTO `portal_menu_icon` VALUES ('125', 'envelope-o', null);
INSERT INTO `portal_menu_icon` VALUES ('126', 'envelope-square', null);
INSERT INTO `portal_menu_icon` VALUES ('127', 'eraser', null);
INSERT INTO `portal_menu_icon` VALUES ('128', 'exchange', null);
INSERT INTO `portal_menu_icon` VALUES ('129', 'exclamation', null);
INSERT INTO `portal_menu_icon` VALUES ('130', 'exclamation-circle', null);
INSERT INTO `portal_menu_icon` VALUES ('131', 'exclamation-triangle', null);
INSERT INTO `portal_menu_icon` VALUES ('132', 'external-link', null);
INSERT INTO `portal_menu_icon` VALUES ('133', 'external-link-square', null);
INSERT INTO `portal_menu_icon` VALUES ('134', 'eye', null);
INSERT INTO `portal_menu_icon` VALUES ('135', 'eye-slash', null);
INSERT INTO `portal_menu_icon` VALUES ('136', 'eyedropper', null);
INSERT INTO `portal_menu_icon` VALUES ('137', 'fax', null);
INSERT INTO `portal_menu_icon` VALUES ('138', 'feed', null);
INSERT INTO `portal_menu_icon` VALUES ('139', 'female', null);
INSERT INTO `portal_menu_icon` VALUES ('140', 'fighter-jet', null);
INSERT INTO `portal_menu_icon` VALUES ('141', 'file-archive-o', null);
INSERT INTO `portal_menu_icon` VALUES ('142', 'file-audio-o', null);
INSERT INTO `portal_menu_icon` VALUES ('143', 'file-code-o', null);
INSERT INTO `portal_menu_icon` VALUES ('144', 'file-excel-o', null);
INSERT INTO `portal_menu_icon` VALUES ('145', 'file-image-o', null);
INSERT INTO `portal_menu_icon` VALUES ('146', 'file-movie-o', null);
INSERT INTO `portal_menu_icon` VALUES ('147', 'file-pdf-o', null);
INSERT INTO `portal_menu_icon` VALUES ('148', 'file-photo-o', null);
INSERT INTO `portal_menu_icon` VALUES ('149', 'file-picture-o', null);
INSERT INTO `portal_menu_icon` VALUES ('150', 'file-powerpoint-o', null);
INSERT INTO `portal_menu_icon` VALUES ('151', 'file-sound-o', null);
INSERT INTO `portal_menu_icon` VALUES ('152', 'file-video-o', null);
INSERT INTO `portal_menu_icon` VALUES ('153', 'file-word-o', null);
INSERT INTO `portal_menu_icon` VALUES ('154', 'file-zip-o', null);
INSERT INTO `portal_menu_icon` VALUES ('155', 'film', null);
INSERT INTO `portal_menu_icon` VALUES ('156', 'filter', null);
INSERT INTO `portal_menu_icon` VALUES ('157', 'fire', null);
INSERT INTO `portal_menu_icon` VALUES ('158', 'fire-extinguisher', null);
INSERT INTO `portal_menu_icon` VALUES ('159', 'flag', null);
INSERT INTO `portal_menu_icon` VALUES ('160', 'flag-checkered', null);
INSERT INTO `portal_menu_icon` VALUES ('161', 'flag-o', null);
INSERT INTO `portal_menu_icon` VALUES ('162', 'flash', null);
INSERT INTO `portal_menu_icon` VALUES ('163', 'flask', null);
INSERT INTO `portal_menu_icon` VALUES ('164', 'folder', null);
INSERT INTO `portal_menu_icon` VALUES ('165', 'folder-o', null);
INSERT INTO `portal_menu_icon` VALUES ('166', 'folder-open', null);
INSERT INTO `portal_menu_icon` VALUES ('167', 'folder-open-o', null);
INSERT INTO `portal_menu_icon` VALUES ('168', 'frown-o', null);
INSERT INTO `portal_menu_icon` VALUES ('169', 'futbol-o', null);
INSERT INTO `portal_menu_icon` VALUES ('170', 'gamepad', null);
INSERT INTO `portal_menu_icon` VALUES ('171', 'gavel', null);
INSERT INTO `portal_menu_icon` VALUES ('172', 'gear', null);
INSERT INTO `portal_menu_icon` VALUES ('173', 'gears', null);
INSERT INTO `portal_menu_icon` VALUES ('174', 'gift', null);
INSERT INTO `portal_menu_icon` VALUES ('175', 'glass', null);
INSERT INTO `portal_menu_icon` VALUES ('176', 'globe', null);
INSERT INTO `portal_menu_icon` VALUES ('177', 'graduation-cap', null);
INSERT INTO `portal_menu_icon` VALUES ('178', 'group', null);
INSERT INTO `portal_menu_icon` VALUES ('179', 'hand-grab-o', null);
INSERT INTO `portal_menu_icon` VALUES ('180', 'hand-lizard-o', null);
INSERT INTO `portal_menu_icon` VALUES ('181', 'hand-paper-o', null);
INSERT INTO `portal_menu_icon` VALUES ('182', 'hand-peace-o', null);
INSERT INTO `portal_menu_icon` VALUES ('183', 'hand-pointer-o', null);
INSERT INTO `portal_menu_icon` VALUES ('184', 'hand-rock-o', null);
INSERT INTO `portal_menu_icon` VALUES ('185', 'hand-scissors-o', null);
INSERT INTO `portal_menu_icon` VALUES ('186', 'hand-spock-o', null);
INSERT INTO `portal_menu_icon` VALUES ('187', 'hand-stop-o', null);
INSERT INTO `portal_menu_icon` VALUES ('190', 'hdd-o', null);
INSERT INTO `portal_menu_icon` VALUES ('191', 'headphones', null);
INSERT INTO `portal_menu_icon` VALUES ('192', 'heart', null);
INSERT INTO `portal_menu_icon` VALUES ('193', 'heart-o', null);
INSERT INTO `portal_menu_icon` VALUES ('194', 'heartbeat', null);
INSERT INTO `portal_menu_icon` VALUES ('195', 'history', null);
INSERT INTO `portal_menu_icon` VALUES ('196', 'home', null);
INSERT INTO `portal_menu_icon` VALUES ('197', 'hotel', null);
INSERT INTO `portal_menu_icon` VALUES ('198', 'hourglass', null);
INSERT INTO `portal_menu_icon` VALUES ('199', 'hourglass-1', null);
INSERT INTO `portal_menu_icon` VALUES ('200', 'hourglass-2', null);
INSERT INTO `portal_menu_icon` VALUES ('201', 'hourglass-3', null);
INSERT INTO `portal_menu_icon` VALUES ('202', 'hourglass-end', null);
INSERT INTO `portal_menu_icon` VALUES ('203', 'hourglass-half', null);
INSERT INTO `portal_menu_icon` VALUES ('204', 'hourglass-o', null);
INSERT INTO `portal_menu_icon` VALUES ('205', 'hourglass-start', null);
INSERT INTO `portal_menu_icon` VALUES ('206', 'i-cursor', null);
INSERT INTO `portal_menu_icon` VALUES ('207', 'image', null);
INSERT INTO `portal_menu_icon` VALUES ('208', 'inbox', null);
INSERT INTO `portal_menu_icon` VALUES ('209', 'industry', null);
INSERT INTO `portal_menu_icon` VALUES ('210', 'info', null);
INSERT INTO `portal_menu_icon` VALUES ('211', 'info-circle', null);
INSERT INTO `portal_menu_icon` VALUES ('212', 'institution', null);
INSERT INTO `portal_menu_icon` VALUES ('213', 'key', null);
INSERT INTO `portal_menu_icon` VALUES ('214', 'keyboard-o', null);
INSERT INTO `portal_menu_icon` VALUES ('215', 'language', null);
INSERT INTO `portal_menu_icon` VALUES ('216', 'laptop', null);
INSERT INTO `portal_menu_icon` VALUES ('217', 'leaf', null);
INSERT INTO `portal_menu_icon` VALUES ('218', 'legal', null);
INSERT INTO `portal_menu_icon` VALUES ('219', 'lemon-o', null);
INSERT INTO `portal_menu_icon` VALUES ('220', 'level-down', null);
INSERT INTO `portal_menu_icon` VALUES ('221', 'level-up', null);
INSERT INTO `portal_menu_icon` VALUES ('222', 'life-bouy', null);
INSERT INTO `portal_menu_icon` VALUES ('223', 'life-buoy', null);
INSERT INTO `portal_menu_icon` VALUES ('224', 'life-ring', null);
INSERT INTO `portal_menu_icon` VALUES ('225', 'life-saver', null);
INSERT INTO `portal_menu_icon` VALUES ('226', 'lightbulb-o', null);
INSERT INTO `portal_menu_icon` VALUES ('227', 'line-chart', null);
INSERT INTO `portal_menu_icon` VALUES ('228', 'location-arrow', null);
INSERT INTO `portal_menu_icon` VALUES ('229', 'lock', null);
INSERT INTO `portal_menu_icon` VALUES ('231', 'magic', null);
INSERT INTO `portal_menu_icon` VALUES ('232', 'magnet', null);
INSERT INTO `portal_menu_icon` VALUES ('233', 'mail-forward', null);
INSERT INTO `portal_menu_icon` VALUES ('234', 'mail-reply', null);
INSERT INTO `portal_menu_icon` VALUES ('235', 'mail-reply-all', null);
INSERT INTO `portal_menu_icon` VALUES ('236', 'male', null);
INSERT INTO `portal_menu_icon` VALUES ('237', 'map', null);
INSERT INTO `portal_menu_icon` VALUES ('238', 'map-marker', null);
INSERT INTO `portal_menu_icon` VALUES ('239', 'map-o', null);
INSERT INTO `portal_menu_icon` VALUES ('240', 'map-pin', null);
INSERT INTO `portal_menu_icon` VALUES ('241', 'map-signs', null);
INSERT INTO `portal_menu_icon` VALUES ('242', 'meh-o', null);
INSERT INTO `portal_menu_icon` VALUES ('243', 'microphone', null);
INSERT INTO `portal_menu_icon` VALUES ('244', 'microphone-slash', null);
INSERT INTO `portal_menu_icon` VALUES ('245', 'minus', null);
INSERT INTO `portal_menu_icon` VALUES ('246', 'minus-circle', null);
INSERT INTO `portal_menu_icon` VALUES ('247', 'minus-square', null);
INSERT INTO `portal_menu_icon` VALUES ('248', 'minus-square-o', null);
INSERT INTO `portal_menu_icon` VALUES ('249', 'mobile', null);
INSERT INTO `portal_menu_icon` VALUES ('250', 'mobile-phone', null);
INSERT INTO `portal_menu_icon` VALUES ('251', 'money', null);
INSERT INTO `portal_menu_icon` VALUES ('252', 'moon-o', null);
INSERT INTO `portal_menu_icon` VALUES ('253', 'mortar-board', null);
INSERT INTO `portal_menu_icon` VALUES ('254', 'motorcycle', null);
INSERT INTO `portal_menu_icon` VALUES ('255', 'mouse-pointer', null);
INSERT INTO `portal_menu_icon` VALUES ('256', 'music', null);
INSERT INTO `portal_menu_icon` VALUES ('257', 'navicon', null);
INSERT INTO `portal_menu_icon` VALUES ('258', 'newspaper-o', null);
INSERT INTO `portal_menu_icon` VALUES ('259', 'object-group', null);
INSERT INTO `portal_menu_icon` VALUES ('260', 'object-ungroup', null);
INSERT INTO `portal_menu_icon` VALUES ('261', 'paint-brush', null);
INSERT INTO `portal_menu_icon` VALUES ('262', 'paper-plane', null);
INSERT INTO `portal_menu_icon` VALUES ('263', 'paper-plane-o', null);
INSERT INTO `portal_menu_icon` VALUES ('264', 'paw', null);
INSERT INTO `portal_menu_icon` VALUES ('265', 'pencil', null);
INSERT INTO `portal_menu_icon` VALUES ('266', 'pencil-square', null);
INSERT INTO `portal_menu_icon` VALUES ('267', 'pencil-square-o', null);
INSERT INTO `portal_menu_icon` VALUES ('269', 'phone', null);
INSERT INTO `portal_menu_icon` VALUES ('270', 'phone-square', null);
INSERT INTO `portal_menu_icon` VALUES ('271', 'photo', null);
INSERT INTO `portal_menu_icon` VALUES ('272', 'picture-o', null);
INSERT INTO `portal_menu_icon` VALUES ('273', 'pie-chart', null);
INSERT INTO `portal_menu_icon` VALUES ('274', 'plane', null);
INSERT INTO `portal_menu_icon` VALUES ('275', 'plug', null);
INSERT INTO `portal_menu_icon` VALUES ('276', 'plus', null);
INSERT INTO `portal_menu_icon` VALUES ('277', 'plus-circle', null);
INSERT INTO `portal_menu_icon` VALUES ('278', 'plus-square', null);
INSERT INTO `portal_menu_icon` VALUES ('279', 'plus-square-o', null);
INSERT INTO `portal_menu_icon` VALUES ('280', 'power-off', null);
INSERT INTO `portal_menu_icon` VALUES ('281', 'print', null);
INSERT INTO `portal_menu_icon` VALUES ('282', 'puzzle-piece', null);
INSERT INTO `portal_menu_icon` VALUES ('283', 'qrcode', null);
INSERT INTO `portal_menu_icon` VALUES ('284', 'question', null);
INSERT INTO `portal_menu_icon` VALUES ('285', 'question-circle', null);
INSERT INTO `portal_menu_icon` VALUES ('287', 'quote-left', null);
INSERT INTO `portal_menu_icon` VALUES ('288', 'quote-right', null);
INSERT INTO `portal_menu_icon` VALUES ('289', 'random', null);
INSERT INTO `portal_menu_icon` VALUES ('290', 'recycle', null);
INSERT INTO `portal_menu_icon` VALUES ('291', 'refresh', null);
INSERT INTO `portal_menu_icon` VALUES ('292', 'registered', null);
INSERT INTO `portal_menu_icon` VALUES ('293', 'remove', null);
INSERT INTO `portal_menu_icon` VALUES ('294', 'reorder', null);
INSERT INTO `portal_menu_icon` VALUES ('295', 'reply', null);
INSERT INTO `portal_menu_icon` VALUES ('296', 'reply-all', null);
INSERT INTO `portal_menu_icon` VALUES ('297', 'retweet', null);
INSERT INTO `portal_menu_icon` VALUES ('298', 'road', null);
INSERT INTO `portal_menu_icon` VALUES ('299', 'rocket', null);
INSERT INTO `portal_menu_icon` VALUES ('300', 'rss', null);
INSERT INTO `portal_menu_icon` VALUES ('301', 'rss-square', null);
INSERT INTO `portal_menu_icon` VALUES ('302', 'search', null);
INSERT INTO `portal_menu_icon` VALUES ('303', 'search-minus', null);
INSERT INTO `portal_menu_icon` VALUES ('304', 'search-plus', null);
INSERT INTO `portal_menu_icon` VALUES ('305', 'send', null);
INSERT INTO `portal_menu_icon` VALUES ('306', 'send-o', null);
INSERT INTO `portal_menu_icon` VALUES ('307', 'server', null);
INSERT INTO `portal_menu_icon` VALUES ('308', 'share', null);
INSERT INTO `portal_menu_icon` VALUES ('309', 'share-alt', null);
INSERT INTO `portal_menu_icon` VALUES ('310', 'share-alt-square', null);
INSERT INTO `portal_menu_icon` VALUES ('311', 'share-square', null);
INSERT INTO `portal_menu_icon` VALUES ('312', 'share-square-o', null);
INSERT INTO `portal_menu_icon` VALUES ('313', 'shield', null);
INSERT INTO `portal_menu_icon` VALUES ('314', 'ship', null);
INSERT INTO `portal_menu_icon` VALUES ('317', 'shopping-cart', null);
INSERT INTO `portal_menu_icon` VALUES ('318', 'sign-in', null);
INSERT INTO `portal_menu_icon` VALUES ('320', 'sign-out', null);
INSERT INTO `portal_menu_icon` VALUES ('321', 'signal', null);
INSERT INTO `portal_menu_icon` VALUES ('323', 'sitemap', null);
INSERT INTO `portal_menu_icon` VALUES ('324', 'sliders', null);
INSERT INTO `portal_menu_icon` VALUES ('325', 'smile-o', null);
INSERT INTO `portal_menu_icon` VALUES ('326', 'soccer-ball-o', null);
INSERT INTO `portal_menu_icon` VALUES ('327', 'sort', null);
INSERT INTO `portal_menu_icon` VALUES ('328', 'sort-alpha-asc', null);
INSERT INTO `portal_menu_icon` VALUES ('329', 'sort-alpha-desc', null);
INSERT INTO `portal_menu_icon` VALUES ('330', 'sort-amount-asc', null);
INSERT INTO `portal_menu_icon` VALUES ('331', 'sort-amount-desc', null);
INSERT INTO `portal_menu_icon` VALUES ('332', 'sort-asc', null);
INSERT INTO `portal_menu_icon` VALUES ('333', 'sort-desc', null);
INSERT INTO `portal_menu_icon` VALUES ('334', 'sort-down', null);
INSERT INTO `portal_menu_icon` VALUES ('335', 'sort-numeric-asc', null);
INSERT INTO `portal_menu_icon` VALUES ('336', 'sort-numeric-desc', null);
INSERT INTO `portal_menu_icon` VALUES ('337', 'sort-up', null);
INSERT INTO `portal_menu_icon` VALUES ('338', 'space-shuttle', null);
INSERT INTO `portal_menu_icon` VALUES ('339', 'spinner', null);
INSERT INTO `portal_menu_icon` VALUES ('340', 'spoon', null);
INSERT INTO `portal_menu_icon` VALUES ('341', 'square', null);
INSERT INTO `portal_menu_icon` VALUES ('342', 'square-o', null);
INSERT INTO `portal_menu_icon` VALUES ('343', 'star', null);
INSERT INTO `portal_menu_icon` VALUES ('344', 'star-half', null);
INSERT INTO `portal_menu_icon` VALUES ('345', 'star-half-empty', null);
INSERT INTO `portal_menu_icon` VALUES ('346', 'star-half-full', null);
INSERT INTO `portal_menu_icon` VALUES ('347', 'star-half-o', null);
INSERT INTO `portal_menu_icon` VALUES ('348', 'star-o', null);
INSERT INTO `portal_menu_icon` VALUES ('349', 'sticky-note', null);
INSERT INTO `portal_menu_icon` VALUES ('350', 'sticky-note-o', null);
INSERT INTO `portal_menu_icon` VALUES ('351', 'street-view', null);
INSERT INTO `portal_menu_icon` VALUES ('352', 'suitcase', null);
INSERT INTO `portal_menu_icon` VALUES ('353', 'sun-o', null);
INSERT INTO `portal_menu_icon` VALUES ('354', 'support', null);
INSERT INTO `portal_menu_icon` VALUES ('355', 'tablet', null);
INSERT INTO `portal_menu_icon` VALUES ('356', 'tachometer', null);
INSERT INTO `portal_menu_icon` VALUES ('357', 'tag', null);
INSERT INTO `portal_menu_icon` VALUES ('358', 'tags', null);
INSERT INTO `portal_menu_icon` VALUES ('359', 'tasks', null);
INSERT INTO `portal_menu_icon` VALUES ('360', 'taxi', null);
INSERT INTO `portal_menu_icon` VALUES ('361', 'television', null);
INSERT INTO `portal_menu_icon` VALUES ('362', 'terminal', null);
INSERT INTO `portal_menu_icon` VALUES ('363', 'thumb-tack', null);
INSERT INTO `portal_menu_icon` VALUES ('364', 'thumbs-down', null);
INSERT INTO `portal_menu_icon` VALUES ('365', 'thumbs-o-down', null);
INSERT INTO `portal_menu_icon` VALUES ('366', 'thumbs-o-up', null);
INSERT INTO `portal_menu_icon` VALUES ('367', 'thumbs-up', null);
INSERT INTO `portal_menu_icon` VALUES ('368', 'ticket', null);
INSERT INTO `portal_menu_icon` VALUES ('369', 'times', null);
INSERT INTO `portal_menu_icon` VALUES ('370', 'times-circle', null);
INSERT INTO `portal_menu_icon` VALUES ('371', 'times-circle-o', null);
INSERT INTO `portal_menu_icon` VALUES ('372', 'tint', null);
INSERT INTO `portal_menu_icon` VALUES ('373', 'toggle-down', null);
INSERT INTO `portal_menu_icon` VALUES ('374', 'toggle-left', null);
INSERT INTO `portal_menu_icon` VALUES ('375', 'toggle-off', null);
INSERT INTO `portal_menu_icon` VALUES ('376', 'toggle-on', null);
INSERT INTO `portal_menu_icon` VALUES ('377', 'toggle-right', null);
INSERT INTO `portal_menu_icon` VALUES ('378', 'toggle-up', null);
INSERT INTO `portal_menu_icon` VALUES ('379', 'trademark', null);
INSERT INTO `portal_menu_icon` VALUES ('380', 'trash', null);
INSERT INTO `portal_menu_icon` VALUES ('381', 'trash-o', null);
INSERT INTO `portal_menu_icon` VALUES ('382', 'tree', null);
INSERT INTO `portal_menu_icon` VALUES ('383', 'trophy', null);
INSERT INTO `portal_menu_icon` VALUES ('384', 'truck', null);
INSERT INTO `portal_menu_icon` VALUES ('385', 'tty', null);
INSERT INTO `portal_menu_icon` VALUES ('386', 'tv', null);
INSERT INTO `portal_menu_icon` VALUES ('387', 'umbrella', null);
INSERT INTO `portal_menu_icon` VALUES ('389', 'university', null);
INSERT INTO `portal_menu_icon` VALUES ('390', 'unlock', null);
INSERT INTO `portal_menu_icon` VALUES ('391', 'unlock-alt', null);
INSERT INTO `portal_menu_icon` VALUES ('392', 'unsorted', null);
INSERT INTO `portal_menu_icon` VALUES ('393', 'upload', null);
INSERT INTO `portal_menu_icon` VALUES ('394', 'user', null);
INSERT INTO `portal_menu_icon` VALUES ('395', 'user-plus', null);
INSERT INTO `portal_menu_icon` VALUES ('396', 'user-secret', null);
INSERT INTO `portal_menu_icon` VALUES ('397', 'user-times', null);
INSERT INTO `portal_menu_icon` VALUES ('398', 'users', null);
INSERT INTO `portal_menu_icon` VALUES ('399', 'video-camera', null);
INSERT INTO `portal_menu_icon` VALUES ('401', 'volume-down', null);
INSERT INTO `portal_menu_icon` VALUES ('402', 'volume-off', null);
INSERT INTO `portal_menu_icon` VALUES ('403', 'volume-up', null);
INSERT INTO `portal_menu_icon` VALUES ('404', 'warning', null);
INSERT INTO `portal_menu_icon` VALUES ('405', 'wheelchair', null);
INSERT INTO `portal_menu_icon` VALUES ('407', 'wifi', null);
INSERT INTO `portal_menu_icon` VALUES ('408', 'wrench', null);

-- ----------------------------
-- Table structure for portal_message
-- ----------------------------
DROP TABLE IF EXISTS `portal_message`;
CREATE TABLE `portal_message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MSG_TITLE` varchar(50) DEFAULT NULL,
  `MSG_STATUS` int(11) DEFAULT NULL,
  `MSG_SENDER` varchar(50) NOT NULL,
  `SEND_TIME` datetime DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `MSG_COTENT` varchar(1000) DEFAULT NULL,
  `IS_ENABLE` int(11) NOT NULL,
  `MSG_RECEIVER` varchar(50) DEFAULT NULL,
  `MSG_POSITION` int(11) DEFAULT NULL,
  `MSG_TYPE` int(11) DEFAULT NULL,
  `RECEIVE_TYPE` int(11) DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of portal_message
-- ----------------------------

-- ----------------------------
-- Table structure for portal_message_file
-- ----------------------------
DROP TABLE IF EXISTS `portal_message_file`;
CREATE TABLE `portal_message_file` (
  `MESSAGE_FILE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FILE_PATH` varchar(255) DEFAULT NULL,
  `FILE_NAME` varchar(255) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MESSAGE_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of portal_message_file
-- ----------------------------

-- ----------------------------
-- Table structure for portal_message_file_rel
-- ----------------------------
DROP TABLE IF EXISTS `portal_message_file_rel`;
CREATE TABLE `portal_message_file_rel` (
  `MESSAGE_ID` bigint(20) NOT NULL,
  `MESSAGE_FILE_ID` bigint(20) NOT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MESSAGE_ID`,`MESSAGE_FILE_ID`),
  KEY `FKFF7B200115365DA1` (`MESSAGE_FILE_ID`) USING BTREE,
  KEY `FKFF7B200175F1C152` (`MESSAGE_ID`) USING BTREE,
  CONSTRAINT `portal_message_file_rel_ibfk_1` FOREIGN KEY (`MESSAGE_FILE_ID`) REFERENCES `portal_message_file` (`MESSAGE_FILE_ID`),
  CONSTRAINT `portal_message_file_rel_ibfk_2` FOREIGN KEY (`MESSAGE_ID`) REFERENCES `portal_message` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of portal_message_file_rel
-- ----------------------------

-- ----------------------------
-- Table structure for portal_message_user_rel
-- ----------------------------
DROP TABLE IF EXISTS `portal_message_user_rel`;
CREATE TABLE `portal_message_user_rel` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LOGIN_ID` varchar(50) DEFAULT NULL,
  `MESSAGE_ID` bigint(20) DEFAULT NULL,
  `READ_TIME` date DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of portal_message_user_rel
-- ----------------------------

-- ----------------------------
-- Table structure for portal_page
-- ----------------------------
DROP TABLE IF EXISTS `portal_page`;
CREATE TABLE `portal_page` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `PAGE_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PORTAL_LAYOUT_ID` bigint(19) DEFAULT NULL,
  `PORTAL_CLIENT_TYPE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `PORTAL_THEME_ID` bigint(19) DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `OWN_ORG` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWN_ROLE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWN_USER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK73757A82301AC2FB` (`PORTAL_LAYOUT_ID`) USING BTREE,
  KEY `FK73757A8267C6E379` (`PORTAL_THEME_ID`) USING BTREE,
  CONSTRAINT `portal_page_ibfk_1` FOREIGN KEY (`PORTAL_LAYOUT_ID`) REFERENCES `portal_layout` (`ID`),
  CONSTRAINT `portal_page_ibfk_2` FOREIGN KEY (`PORTAL_THEME_ID`) REFERENCES `portal_theme` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_page
-- ----------------------------
INSERT INTO `portal_page` VALUES ('1', '首页', '', '1', 'PC', '1', 'tenant_system', '', '', '', 'index');
INSERT INTO `portal_page` VALUES ('83', '运维管理首页', '', '1', 'PC', '292', 'tenant_system', '', 'operationAdministrator', '', 'index');
INSERT INTO `portal_page` VALUES ('84', '运营管理首页', '', '1', 'PC', '292', 'tenant_system', '', 'operationManager', '', 'index');
INSERT INTO `portal_page` VALUES ('85', '服务提供首页', '', '1', 'PC', '292', 'tenant_system', '', 'svc_provision', '', 'index');
INSERT INTO `portal_page` VALUES ('86', '租户管理首页', '', '1', 'PC', '292', 'tenant_system', '', 'tenant_root', '', 'index');
INSERT INTO `portal_page` VALUES ('87', '服务使用者首页', '', '1', 'PC', '292', 'tenant_system', '', 'svc_use', '', 'index');
INSERT INTO `portal_page` VALUES ('91', '平台管理员', '', '1', 'PC', '292', 'tenant_system', '', 'platform', 'admin', 'index');

-- ----------------------------
-- Table structure for portal_portlet
-- ----------------------------
DROP TABLE IF EXISTS `portal_portlet`;
CREATE TABLE `portal_portlet` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `PORTLET_NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `MAX_URL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEFAULT_HIGHT` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `ICON` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CONFIG_URL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEFAULT_WIDTH` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `VIEW_URL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CODE` varchar(20) COLLATE utf8_bin NOT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `STATUS` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PREVIEW_PIC` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PORTLET_TYPE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK2CA23107A8D3EE3B` (`PORTLET_TYPE_ID`) USING BTREE,
  CONSTRAINT `portal_portlet_ibfk_1` FOREIGN KEY (`PORTLET_TYPE_ID`) REFERENCES `portal_portlet_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=627 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_portlet
-- ----------------------------
INSERT INTO `portal_portlet` VALUES ('3', '天气', '天气', '', '', '', '', '', 'portal!weather.action', 'weather', 'tenant_system', 'RELEASE', null, '1');
INSERT INTO `portal_portlet` VALUES ('10', '退出按钮组件', '退出按钮组件', 'portal!exit', '', '', 'portal!exit.action', '', 'portal!exit.action', 'exit', 'tenant_system', 'RELEASE', null, '1');
INSERT INTO `portal_portlet` VALUES ('11', '当前用户组件', '当前用户组件', 'portal!currentuser.action', '', '', 'portal!currentuser.action', '', 'portal!currentuser.action', 'currentuser', 'tenant_system', 'RELEASE', null, '1');
INSERT INTO `portal_portlet` VALUES ('12', '在线用户数组件', '在线用户数组件', 'portal!onlineuser.action', '', '', 'portal!onlineuser.action', '', 'portal!onlineuser.action', 'onlineuser', 'tenant_system', 'RELEASE', null, '1');
INSERT INTO `portal_portlet` VALUES ('13', '公告组件', '公告组件', 'portal!announcement.action', '', '', 'portal!announcement.action', '', 'portal!announcement.action', 'announcement', 'tenant_system', 'RELEASE', null, '1');
INSERT INTO `portal_portlet` VALUES ('14', '菜单组件', '菜单组件', 'portal!horizonMenu.action', '', '', 'portal!horizonMenu.action', '', 'portal!horizonMenu.action', 'menu_horz', 'tenant_system', 'RELEASE', null, '1');
INSERT INTO `portal_portlet` VALUES ('15', '主工作区组件', '主工作区组件', 'portal!workspace.action', '', '', 'portal!workspace.action', '', 'portal!workspace.action', 'workspace', 'tenant_system', 'RELEASE', null, '1');
INSERT INTO `portal_portlet` VALUES ('16', 'logo图标', 'logo', 'portal!logo.action', '', '', 'portal!logo.action', '', 'portal!logo.action', 'logo', 'tenant_system', 'RELEASE', null, '1');
INSERT INTO `portal_portlet` VALUES ('17', '切换主题', '发现', 'portal!themeSwitch.action', '', '', 'portal!themeSwitch.action', '', 'portal!themeSwitch.action', 'themeSwitch', 'tenant_system', 'RELEASE', null, '1');
INSERT INTO `portal_portlet` VALUES ('18', '列式菜单', '列式菜单', 'portal!columnMenu.action', '', '', 'portal!columnMenu.action', '', 'portal!columnMenu.action', 'menu_column', 'tenant_system', 'RELEASE', null, '1');
INSERT INTO `portal_portlet` VALUES ('19', '编辑按钮组件', '编辑按钮', '', '', '', 'portal!edit.action', '', 'portal!edit.action', 'edit', 'tenant_system', 'RELEASE', null, '1');
INSERT INTO `portal_portlet` VALUES ('22', '地区', '地区', null, '400', '', null, null, 'portal!position.action', 'position', 'tenant_system', 'RELEASE', null, '1');
INSERT INTO `portal_portlet` VALUES ('23', '可以更换首页内容', '首页设置', '', '', '', '', '', 'portal!customization.action', 'customization', 'tenant_system', 'RELEASE', null, '1');
INSERT INTO `portal_portlet` VALUES ('24', '服务菜单', '服务菜单', '', '', '', '', '', 'portal!horizonThirdMenu.action', 'ThirdMenu', 'tenant_system', 'RELEASE', null, null);
INSERT INTO `portal_portlet` VALUES ('615', '个性化定制组件', '个性化定制', 'portal!customization.action', '', '', 'portal!customization.action', '', 'portal!customization.action', 'customization', 'tenant_system', 'RELEASE', null, null);
INSERT INTO `portal_portlet` VALUES ('623', '产品订单组件', '产品订单', 'portal!cusproductorder.action', '', '', 'portal!cusproductorder.action', '', 'portal!cusproductorder.action', 'cusproductorder', 'tenant_system', 'RELEASE', null, null);
INSERT INTO `portal_portlet` VALUES ('624', '新公告组件', '新公告组件', 'portal!newAnnouncement.action', '', '', 'portal!newAnnouncement.action', '', 'portal!newAnnouncement.action', 'newAnnouncement', 'tenant_system', 'RELEASE', null, null);
INSERT INTO `portal_portlet` VALUES ('625', '订单组件2', '订单组件2', 'portal!otherProductorder.action', '', '', 'portal!otherProductorder.action', '', 'portal!otherProductorder.action', 'otherProductorder', 'tenant_system', 'RELEASE', null, null);
INSERT INTO `portal_portlet` VALUES ('626', 'This is used for tester testing', 'testV', 'nadadana', '1', '.png', 'nadadana', '2', 'nadanada', '1', 'tenant_system', 'PREPARE', null, '1');

-- ----------------------------
-- Table structure for portal_portlet_config
-- ----------------------------
DROP TABLE IF EXISTS `portal_portlet_config`;
CREATE TABLE `portal_portlet_config` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `PROP_NAME` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PORTAL_PORTLET_ID` bigint(19) DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `DEFAULT_VALUE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROP_CODE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PIC_CLOB` longtext COLLATE utf8_bin,
  PRIMARY KEY (`ID`),
  KEY `FKC21F5D7ACC6F0E19` (`PORTAL_PORTLET_ID`) USING BTREE,
  CONSTRAINT `portal_portlet_config_ibfk_1` FOREIGN KEY (`PORTAL_PORTLET_ID`) REFERENCES `portal_portlet` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_portlet_config
-- ----------------------------
INSERT INTO `portal_portlet_config` VALUES ('2', '地区', '3', 'tenant_system', 'beijing', 'py', null);
INSERT INTO `portal_portlet_config` VALUES ('3', '标题名称', '16', 'tenant_system', '国信云', 'titleName', null);
INSERT INTO `portal_portlet_config` VALUES ('4', '已有页面用户首页配置', '23', 'tenant_system', '/portal/menuinfo!list.action', 'HOME_PAGE', null);
INSERT INTO `portal_portlet_config` VALUES ('7', 'logo图片', '16', 'tenant_system', null, 'logoPic', 0x646174613A696D6167652F706E673B6261736536342C6956424F5277304B47676F414141414E535568455567414141526B4141414561434159414141465367784D764141414141584E535230494172733463365141414141526E51553142414143786A777638595155414141414A6345685A637741414C694D414143346A4158696C503359414149657A5355524256486865376233767A33625A64642F312F41573178315A42565055504353523446513049675551784E627843316144365851326859465652425959587268524C52466A704B464B624B42566961494E4B4A56704E45616B733671616A554E6F5A4E38525431564A534D50484553536F33645A77682F6B6D6438544F647363637A486F2B48373265647466617A396A37372F4C7A4F64642F582F547A5856397233336E767474582B76766662612B357A723350644F78647476762F326B584F424A4A39386366766A4448373767775556733464304D3966356C44787279614E6A5976503332427A3338736872794D666B66736B5342524138656931777759644347315A675849777755664E714478304946302F4E6E6D736F2B524678343368306F492B4D6A566667506763703757653739486F34522B516A2B4849496E35586C61376E536856794830334F52482F75626552683538594D537436475555715A4B46397A7A336B765832362F6365653859496A712F666539666237336E322F736338616D6A7A676C34644932516D776944433733337532364D437144776338612F64652B7A4A434765514E3558312F676744776F4B4A52415650654675432B4C30554A2F506A7870447738562F3468365841723931375631454875544739447169734438715A497656346754473055474E47697177744F45596B4E3251744A686F35366E43306C4A612F30306D474E683734367231336A41745A435A565A54592F696A3366564177546755594F6968797331566636554277314472524E54316D4A71756A79366946354676576D726F4477496D73464A6B354463504A3862354E6B434833486634437A645272577744494A486A66444F6975423433392B372F384570427A2B595375754677336E78426641497462774741542F43373376752F6B68345934516F595137474C4F5177654E396E376C765A6B7155586A534349355545395A45696F476A413333383576694C676C4A466969344646446C436E79382B342F626B7943476A6C6F66593862497037395053427677456D47694D737A713442346748684248734A54346555584F4C6C43706973345672497741412B7A596D7849332F50632F55565441346A66397167576E6D7949736B5175445741674273344864705242684C4A736E545143616539393971576E6A476B4634505773585467626D4F35304A4D7048324D494F4B6A30696E626A6348456147474554335238742B45536B7A734A56486F50566251416674366F79307A4A50447334445255587169735056592F76746C6D44486E3958785077486D4C4B6F6B796F636B4652727175676869776663316764784B305559396A464B5235792B346459644A79486F76554851545053364172793349536E674755335637685972514C6C59776F6271634F6A3159512F594F745670597A4F476B5A4B7541467A345032744C416E57515845425561796D6A724633782B564B317974484449496C5772777050565134622B6E664B796F32482B65734151486C5A4D576859632F42644B5635383934644475553334625877336D55466E765834382B303356415A54493370486549784A57735165655252426A6A47416C564265656C57766355587970554D4E4458614E4C53696C6B39783550427763396967676B657253545161564E467068416650693567794E61446F466445344E6253717746616A52382B504E433135367172707644565953394947664774514939374A464E4B6147354F5A4443723234437A5738753243796D3433785A415464464D573748614C4764396F3741575665644161676538566D693552754A7A466F52454748732B4E4B75466461417344486A55344356534B4D43505465756D7245426E62416F69483354506E392F4A6C667A56695A5A42527350746C346C68362B4F41397A33363754463830416D5236684B4D632F68435038696668636A42717455696D397250313179496130377639694F4E7857376169635A495A37324F65674C373431596862677443653458563865666F62393937397762682B7959327865484F38696678576752746D30586C417645427861365648595878527A67716B59694D36636B5674597742782F4C5A42373333754A547554557738776F7544524235767556437356485131684E4D436A687479594F616965366D7034714E466D3434455272376A4E61347373734947316A656E5265755742716E357658545773573742325A4B5A412F5235734967365271684E416A4D6A76336E7648614252376A56462B624F7352627A556C447445656A4E684559325A37712B52797964424230532F476E44424C492B416F6D78324145506436505A6654475A6C4D42323034703376356F58384B483345496C5430374A493137414452565754736250762B744E7A31554542555A434163696E756B4B44756172417659417A5349436366644838783241767764504C6E4279323569524A682B342F41524C4B495249515752685576557A314234736D4244674169635673484A466A6B36483741336C4B6C41704E3857744D617034314B685749345063474F557435675277736946744332557A4264554B4737494E38506A6B46505641597962514C556430473457425A59416C414B62496158474A564153614966586776642F2F336C737644577972384867655263576A3744794B64716B416E445241636577577533683055736E5954494E746A484E6F5A536A694B762B466D424A6E4E544F562B435A674B4556472F42364D735545327476496F7A304A6C4D57536C517543304571646E48717A516A6B51673879766332374572515237426D6269626539586A5049316A2B764A7835474E68775947324D6152376341536C76556235564F4B6B6159696E434A5651424E6E6A6F774A457368734A6643635674507871534C47626842462F46324B4D426F324745574C34516D55684B736939486C4F4E566D2F33756E7A6E4E366C55757943484277317448496A4543697A622F775450596A6D726F6279564D61374B2F344C63582F566F462B51527A2B73654C576A4C326730565A4D5076306455347241454246666752684D2B6A784D324978673845485269546F43424B626450577367705753786F5A4E6362653551464F6771646E463833726B6C4F67776D3158396D6758532B6D4867776F464244557350387A4870356B2B5937674E7141476D507A78366438416F307643746F3663734A686F7843336365644559596D63773969412F744D62726E426A4767487131412B564E7046775731306177696A3437673658456551424B4B35764B3464564A657538324337724D2B52537531716F4845694E3632465A38546E5159444F68764764656D73776C79746833477A71685069517A7073304F575844593843414F584A6A64374A61754D33696C7935676C5648493030656D326132484F316B77454552732F55505033762F513578573433324C4D47574A517963644767644238676E354742534747344D334F64417765504438794A557069436C63487251347555416B4A4F6A70336D316150744545656F654F48682F6C495A55344A78576F50737977306647736A5A38456C59575A62637641536443714E6135346D4F51736F637A33636C792B626B4676634E72727A526255513330654E53674F716F74424946707076384A4D58506679627849784738706B5550775A7554637355564359575A75365633302B6E2F6861394E4A7935324E77346F617A646231376D777A56503772444164365079705957544C7141302B594E2B494731767431556F562F793545693341664E6746507832753354652B2B784C7A364D7A504E7046645070723939356C6562506B354548424F626B4335617665797659686E746F56317A4D6D495770335759594B782F73684163794A377151627847426261734A6F706B534C57395459515559366F5965326738515A5141626B6A2F7A64463075342B4235754233687077415052306147702F534F2F364E455877394C6732455747594E75762F4E47367A5A67744C43466D2F787633336A47374C4C4C6B7A4B4833686D7350532B31542B6F667836616631656D4A5A47707968774D6C646B4C366D6B54775A576175633177364F4A47713645776E6F71445839304343566979556E31346945354D2F65506D6C744C39354F54656D4B4B61775A6E476A66576D67675A79382B6F353952376D7A354A414B50646B48363075444555764C6F4B717956484A426D6533627059314443354E4575724A536B4F78577564395568665943544A7247475A77724B476E707468442F314B363934614270656A4D464A4269643173534B395573784F666F4167746F6D4B32696A4B7432335077374F565A625453513936416B7770366B754F73425534324F4D6E677043357975695375753879434A2F4D615171754C6A674A62764871485A347346504C6538714176514267384771767645466B71507335584279534F67764A56735A513263687435645A5436334465584A627A4D43337443744C4D6F63423076576167395763676371327762616F77624C4D41466E7165424A492F5232314D77662F624A434842346637436B4657484F7866417A52344942496C5551702F6358574F7033433669313667592F36652F446B4564707A6C384A785A436744526A2B64466F4E5378714C415568764E7A7742346B505352525579475052493068585A7756482F314C4B45485A7832687458474D3265476B716E39415365585372594A6F30666B4353326A675364583658474F5553637151744263354575514256666232794C49576B3173347467304D4871554F323432514569635651413934664E5A4B5276547934584E306B68614E6E6375754B7A7A2B6F5778734D516969425768594E4B35596F6E76685656536750672F47774F5172324F6830705873557A3439793657395A456174414C6E556F726A4236677A54532B6E6C706B41354E4B414F30413475574F4B4265344E454B496F38366A68524E3863394365555964635870566D4B4B4D2F756A386F756A4C37656B5A486B443439522F38384663396D7647524B5955386430666B4676436F38304F526F335A5A3342495365737474456371553377774A39473759537156475349443268572B2F38534F74587570747362334261666B6F682F4A3664616D394C4F665246536B5179653572534150516467314B697967736F43672F6B787074342F414A4E6E6A797530616336506275476731447568675148486646326365524C7462596672734B324E504B5A6D4C45424E4C6B6975515237764874526853476E38454179654E35384638777867546F636D4846326B5737334B714866484F77306754565765314947534B7A314A6A416B536E673664324A4F776C526545445261716D6F4D612B327441414E61744D555A3944795670356E4F4F6A357564666B6A4B76754A334A366A3764484F7774556A796C74447A4E546F37564F5849332B4E5938654368566476566F4B6941756C48664B717079493343687269666D6B4D50676861443272775736514468566B656F39314939492F4A665850674D72362F34556B464970644830504A37747332712B2B617A516F324951574C57716F347166746A78496B506C466755646463693351644641336F36304C434561474434674C4752395576486743334664575A526C68434D4E7741673853747832497A6D573263673875456A515542727559584479546857674D4139573454734C69626F5A6149546C4D39736A4351454B563531564E4D77426B377763667168424C7A566F635861726E6A67714844624B37537656327741646C2B746475454D3762426C654E4F676F506336537351624B596C7331655957376F5779586F4937592B55553462456C51316C446B48645133616E53786D48744168336A5141472B476B77324B5467377177443139433368526F4B5565724943697457344D523476574D4B7A675A4D736A787A742B3164564343302B3654416D695A5237734967324D4853796462426A49442B446B516C64653236555949452F714168345058676261426845504F416C61506D5733393761474741416E47313030726A3947332F46785870527965364966336637644F4E514964456D6C417854504139413247705450397177462F475430614E52725A7A586F774A4D4D696D4B42333437755563565670774D30556833686370704759343930443561654669427353387A446765366C6B36635A664E416D362F44677A55415664676346304669424F354C527A543178305A2F694B654E376E33334A477331567079556D42413065654D6E544B307349695A6B30427058335A6B3766616B516C6F6B4F37366E577465426B34686133785043664B5478726D6E6851454D6F2F64497738502B34464A69446F392B75454941364830716A303976734F68536B3178796F2F5837384D7148556B525244726A3056336F4457414D6B45634C6F416E52766A493443702F6C6E7168414135455065755670704D4B492B70503470436D4D6466706B2B36336872666A617663636D42355779565238376B306D772F414B50633246656E71725358672B65686C78426A6D6549784D79684C4D7664724C7958337A507A656C742B444C7545654564486553593778524B6C546F393232786D494E41315365583046667A58455434665A386B4C727A796B336C47775A764E357644674C7473766A367663664B6A50624177487A6A3372744D497562657971424F3669614D44797968417956395347324F6134337963384646694E6C2B537A6A6B4B794E635A6A6C6F4C6144504451714958376745656D397438526C6E364B333736682F34673638355378643563444A45676C376146583242313445517A4C59376D497652424653512F546F644F416C62672F4E4F6D55487832425963502B56783869523648662F6176586458686D4A4F3633326C4A594D367156764C696D5674656B6C2B6E4D4C70412F6F77742F6633476141683157432F3350486B50707A525146775A5075732B5573536749464732764F52433856556D506B756D6C5A34327A6F66686F2B4E4F717041484A6A34473369757A585A362F38387233502B424232735545466A695A76727945373253444A665367744B496E4169726772316D6934494E68596D6D4A416E543875665650772B335A6457635A38536E323373436756374C2B4352365443705856323849447045586266444B4A787A476C35464D3462434B446B386451576A7377706E77744D5348543554335A73317862744A326E38582F7946332F6A5A38694C4935316C594D35704F4861336468446D4A69464158694757564666427768412B4D4F49556C49374748706E66552B68566D4B454F7630436E732F4F6B3361445448707946757244716E45526636624E632F2F55527052656C362F485A426968356C6253416F775946725031316930764E3742746330556438594D51656C4D5A614E4647645A52535730674D4D4344764F55514F7A425776374949396E574F4E426849454539344E35646D626156382F57594F6B335555656A566667743145665458395A70775A6655412F5867394849503475524A694F587064757563776871375A697657546772486A306E646B544430326D426A344F5271354749726E6A3052772B4442536354535961637877674651745479786647724C6557757072556F4F675A6965364268647549777741535650646859724E5A52744F453836444C515065485157597075646D436848666138484F316567784F714D4E41556C727A62376A355359674A762B4269644E5169797A656D306F785643574A78482B464B58724B466349553168613479456C6D50305961555A4D73466F366D4573446C6C6D675447625979624E7458626F54697678576B454E6C763241456C704252427468415761344A39446F37685A625861706A41556A71414A387030306D78626C33366A46666D744943484777684B425551664D506C344669444B377A526F6E3371636A2F4376662F50346E72416268762F68482F2F794A7A44666C6E4C304157705470704C6466664F5774556B667232715573396B6F4E6B443938594D53413472593035484F777169534773474476316A70706B3852383556332F59766E4132564255776149464B3535796465415954746D4E7841446950655332696F322B6F5A2F4B4468523558564977394D5948314D67517A4943776F327A687A4951485A3947656E6C56473239454354352B46465349674D5971754F683233625858323068636932533951484E736C4A4B626358316A69424A5338536D495946443644344E455268706F47394F4A546B42546B537961444A34326770474C39447077446E4A52704E6F447947594E6834497A63774249454257324E4E72545A686D664551564E5A71686C757755376751594E6C6E7344662B764C727A7655416E6A5243546A4E4746344B4130797045516E57563663696A584D54665356625957724E6359682B505643625253562B30764274307A305173497849393267563534636E514A48334D4B6E47474173755249464A31686C44515075506B3052734637576A685353503431554F6C35425566475A77774254772B38435343695474686A5671355768544A5A6B522B73534A7456473851716E74576366656770434A4A394564784F777336716651526D6D42535367432F6769552F55454B467761674F4A786C743656682F464B7A6943546A4C43437A316E4B35674447785241555463742B566B78417A52596E2F50456A4836434B76534B373279646D4459586A323443617076435A4D6E3473362F6F6756566578582F4751385374682B7879582B77394552672B3675554D4852355A534449684339614E706A4D4576586F4A4A624D38677A566B34386E732F41734937524B56304757554757344B57353967792B4235307531696F41347041337777616F715637546F6F4D445066754856482F48674C4A68426C4747655352566C4E2F695575525665524264746D7A774C566D3252686F46553730696A515147696A30625145684A454B6B744E34564449396C7448497A7069554A4D4E6379676F63327058394A326F70466C6B6D4E43525A41394A417A772B506734415A67392F594456306C5A4B6C4E45737137426F4F62524C6C2B4945452B556348776233347839392B633652543749476548785237646F7636464A647665564A6A494177656E74655859686964497A4A453475564374723571644B4D424C53674465486A572B703244466259417356564B50764C31387163304A6E46525478625155544B546954394F72694365366A705162475855465935624E6E613833564C6A785530756E594259757A4D756569566C5671693368776C32386A4C49344D454B4975656C67364B6D34364D314B64725450425354583936763861526F31434B555A375878364D75326B68546C4E34587530594B70636E75384934696E48426F7A656F564339324146364A7941505A724C34754C4948674533474A6E7047565062765A2B7957346D496E59614A71573442694D75566C784B41302B66315379426C7942677059714E36772B52586C38346B7041736C476C6E573864706E556D434B6C374B7077364D46496F56703377344B364E6C716F7A4A6D45526B6B4B5757474D7A31444A42705A4E5153495A673370645534646D333068414D52756B30465A6C436C6B4B35306659755164745430346C7259442B6B52632F75726E55794E345754516D6C436C6F7852655531304E6169477A535A6B5A654F68374D4B64536352683779556F5977456E756E327951347155436B7648524B487A7835507A53713969615652366B6F44706E74344E677379546645724C5251556A5430672B674F426D4277684F75346547797768636D6C707A514778503744682F787130434B662F4C4B4D46635A6B364274795736414B773043714544543846694A627853477155555950347258336365557A6D2F7A4B68504373586148304D6744556F586850556B6F624D357932336D355A776C42736A61416251774E6A474470724D2B726B6B364279654E42574A7371494855516166676548446F724E304644754130426A7875522B49446336544971466754456C4B522B6A436A474F3762542F7145496730663252365242782F4259693231484577794D342F66526C6C4B454336566858327766616549615369684C307544316D7455524259564F75684F57563351676138436A78376F773350457849612F545A69346F6550523671344E65383476616A37545A6F6F763234776E4D44464249557349374B4C782B4C4478714177594E644B4D2B72637556543455425A6368314D7745396177726C4262666830784B6F57496F3450464A34646F464E423261726A6D78346C7A67356D7931543038724B686F6F666F74395767416534586B56566A4A733869774B4F376F664A2F313475716C6E514D516B447052536361346159524663734C4A576D447841424E445A4C6F66357438514F4576795276704447687937525846534439413947427543354C544E665A75464E454165536A5875474B494D394C5A477164424E63564E486344444C4B5862483552414E4B54586F4235744C3152554D65775562693376737255623456495144636F4E557A42334A437A636E4737495963464F7A59354B387349487658436D58525455726A6962324B76336842463578553166454A2B436B6D4D51796E56436F6F55306D43326C4D724F5A634E6D44456C4437796C656F65343056715278494D344B4F482F6B537256634F4F6933736C5A76646B6B3942644562656F63705152534531495A6B4D7A766D7332584E43445938426F6B506441556F386B774F6F704A4A66586E5763754C4E515234725579437348765941364F586E357A51444549436762792B7A754C4A737459464345654F724A55734256526834364369615057683752316A2F71754D745158367564536B454F705556795349506D3055635449534567443834565A3462476D35654775437070415131467A6C304E7972303865636A774E4277366A6C38526A393751454930373675356430525558436B3059676F45754E397A32716E5242444E437538683757466263415459435A664543546339686D72754A434738584458724F74496541664164704C655936725A6A6F584E4C686D4E6A75365730674C3532587271625953543634676370536672794C4C58556E3450545243414F4A2F5A7138534350486C766C32463642536B79656865575578422F50487365784C4F576B486B5970586A4336484E7A44656D42694A7A42325750697833325042336E4C4A76684167664B633759725A714342696C764F377634762B754C33634D53546853616544754D586538645A4B346963373873736E7955494F5A7742585967323231614A6E394B3652372F676B3138754A6E735169776D732B4362666B58676B6F5447783235757067564653305454774355786F43455A334E59714F3173412B4B542B396B4D63325944614C4D613245324A6D3471564E564948365A59474535424853716253473863526D547436644A59316C70386552743166623855454B646A785536653547726442746B54597074412B347A674B453952704D6A57676A693745724F454475546A614E6472624D305A313245654B6330452B56597536492F6A694C516F733971466246593334547146592B48476E5357486E74304665414850744378556D3053505179366B796F365731722B43524435455952332B6B755531666579634C77786D76334B695A39386E2F7279612B2F7A637149394E754879756F74416441516A6545732B54777473746438324C597737422F57764B797769736458595A2F65634E494C7A4D4E416732797A564242475873386C67416E6E546E68664C63623066424139702F522F77495341657241422F3735566D796F2B362B445642456C546155323070696C64624C7277653751496559664A71334E4D664873326A7A74676B65375343794E6B5741416A57624F6556586B3041776D59357456325A4674436B655649582F5071704E2B6B74706F516D67334C61722F69316F443230692F594E7A567A2F5845533873564261644D664930367058727534633649456D6458517A4B33495964615A65355A55425A645868797A48515858554E6F2F417950336C6A6370636D4C72424745414C6E344C576636394865346164365A5874716B63634D4875446A464C2B68426C3368453730362B5630556144534E453059544B356F5A66423774776763686843654542495466716E536A387976614C524D4B734547594B492B7577706F362B434A4B2B56697A74695471735953566F4936662B4E7772483642666A49655444534A6841355532777950596D497558492F75535267616A4C566B30473065567366737561524E554566394B6F48524F645A76413041676A434171617476446F497352767A34776F6C334B414A786D496B7959314C3766397977704C323958557435615868496176377949302B667443594D335731384C74496674705671662F746B5635654E4F466E387044754570376F687A525730323265567758345A307879615943712B594273466E697141704739776739576F62537A626278714D464B55703172374959704C452F38394B634F49322F2B70765657742F5572704C463930572F2B4F486B56784E36314855574B49376F4A6A2F78384C7752733454502B575A6832517758614D6448447262414554456F4A344765495A4133324D4B7031635257713458594E6A374430546A78726B566338327551623939373977657A347A7845504A7669785A3972302F2F7758767A447154337935624D364A78775A2B6A38594A6D4F5A5266695A79627379556E713853436A79355174446C685243316D4A7A483161415175624C3954474330505156454972384A43756E525151514358366747513346624B6136714B7A7370444E36575067562B6A4F724245586F546E5A327A54576F70684B4B58442B637342564F2F4C32394276366976746275776B6469534752636866714D616B783632487942736D6A344A306B6A5949487251776A3251356E4F30586273726F32305851314664784859314769786F53546A4D4A76466776504F434B2F756F38396F6C6D354D575959596E39794A616B646E573063432F66306C443953596335386D47716259454C3171486548777033476D562F55516263523474647A79304F394F5851467330526E6171644E4C557649534A554236665A4969554E582B37545256346572662F6B78412F6C62633372686E57654139334A564A304D396F4746674F434D6A6F5A4565462F566E43583461546477446A3978302F38367A3867504B7A536C3135677750465A7A617A6B345639494D4D475046613331514873382B4E6353506147427032656E5543376C2F3970482F6F4F58502F344C2F33436F7A30395343683979536D4638767644744E33364538584B535156477A6639496958624966382F4F3472736E686164766E4932557564796F4236476F6B762B3763394F744E5A55555979395A4257634F41482F4F3975566A78523377476634765757384C6162576F4A6A42506A786267357958594534734C7153566165587961446838754F4142533374684C473377777670466A5568455869576335503779375551583447414F656B58636A62512B75794E746D4B53785161774869782F5A34362F707244743153454C64593878364C78435970747A374D6F5349367470477737436D4F6B566872486B3361422F447A7751365537365354306A6450485470716F493455477A426E6E57344847345A4C7A69486C495942646F35787A4D323135496D4A67733438426677336D6D2F326E50436C41485A52793131774F45704A316B444E576C6635493268384F463575447947442B4E49362B6C37683548356B4775624563746E493477545A73506954456635776F797A78346F71316E7670397868544F47554F3530656A70376B5537666848686848786C505962634F52326632655556774F4D2F68643545544344544441374547627332774768517A62306D6D474C375A4B50756B637463316C48433030344D6774437242512F4C326533573156566853457A51666C5A44694E4F5A3976747868694C347474716C6A723870447333537547636F37514D6D473365505138453378676D577744394E317879456B785144736475375A6935537550482F414630396A797131506143456F625866536F6F3967656362746F4B356D415A6467425A625662793150755979516F6F332F57794958617051744E344B642F2F5476665A51775454685967546D61614A30363175386556687268765A6F6B4C655778396751654C5852456B716767465147446B5652315366463779466B446555342F59635448584349323973756B73682B4538676A676376526D4C4272734E6472743131706853694A4D32773172516E4A4955352F646263516355516C554A546A46344A6E4345706C6E393747674B385A2B524D3641746C6175713231577A694E2B2B2F77507261783634506241474F4B4B644974733953345064576F64794B63436A6D35487A45753468306F774A6147444B41796F534F6B43535435626D633267454D4363303144734237703059374B344C54644E4C7938374862684C574345647570796458384B544E5946785079572B566133355475494C5437554D4A684174455243694B2B6F453567654E5965646A56516D52654447395662367675547459305066434B77334D2F39563933373431553565545677524B326245396562412F56496C6B534775444A6D7A416E4E46616F7749546A4F376D434D585345786849466A3035766F53514F504139654651774A67326945424A455174746A6575494C753868492F36686B547A355A6132795A637674436A7A7131512B2B327937442F36423574337442477345516B684E45714B4D52374247446543636E7435525972626655734C76305750726E476F33767162424250757A4862536B624E4B597941566E7177306B4F4B565A4470743833753063386A43776732776B79756F546961497259672B5A54634A7A37635854464A3356636232504C443159597762344D2B68757275413571313947374A37434347764543646F32732B384D2F3868422F58464B554B4373486A554367376E70414C52706F534767765053484E6B753141483971464E4A31696837796C5262346A36716772657A5A36674764702F2B614F63536E485531764579625843635671432B7832506B754A503371336878546741634C52474A384B6A6C514752774B336C3879654B4754674564657433455A555935484B304458616A7638343342537A373333697A6444626265326562514C713241486C4856795330725966464451654E71445A493957454A6B36733748655577536D55547738683968616E2B635061696B797A57336B6B576C78344F414E2F6777316E6F756F5178395767767A6353665779516D494C576E51497557633169496157655A346A642F416B4E32304D7A6B44355673485A563450466F6D786C306A4F536F44436E384577755A412F4F74644F3266674C4743425375397352555951585350446761504D3944343259486C737A2B4D74484A4C30706C734F49386541684F3355595A422F7136467133774C6F46664C6D41666B74644A4270557A656D516848385577476D2F5279727772332B672B696A6B31526F47344238667779556336527A6545304E7831433443752F5059757135775A567035554550536A6E3351665A5373463970626E343763566D77552B506545753836537761525448346B6E562B53792F32743171584F5962724E3879785977525A4B71506E41455648684935757032464E69515664463958454E322B6B486E6B524C6376635A2B4B7457315458324A7739324C7A4E5152744535695853746767757443574D68566D752B3170475A75726A7042544C764F2B7A75416E6877634E69714B2B516E6A437856505179554656556E6E4C6A30593575594B5373436673333334353657536375797931326635626A6E5873414869786D2B41435934764F5356324968336B44585531426776746F2F6A792F354B744D444D576E6477556C6C6B2F324D396D4B54774668736D4F705A567741664B4474714F4C324D392B6A4A687337616571424B485175776267726F623769694D75524675377A332F722B7339376B63364772675A6667416D4E47755A4D4B524173746E323270376C6834576C6E385054442F6B59362F694743554E326E4D6B653654506E574650366C6C4D73526D7773644A594F2F50627A4549502F363556392F2B622F2B6637337754702B4B79647252426C7274312F50327676503433764D6D627766685168735A30306D42574D6C756C32597A41795258796E446C624437624E453842664466477A786469654B622B3762354F4759436734653363546F4D4E447A6E466A6F4E6B5849667A577449652F394A75762F61526C646A6A5A6F47696F343475444E33454539665570744D66634C546D7655797939524A364549497A6A4B51316A647A61456664356178476D4C6374625A4E44326F63435338474678655941453062304258634A5157676D4B7233636D554D786F45352B4558694B5A31597576773543346F703446704B37595A6A39384B507651505876364A505A6F7A2B6D78483675654766772F4E48486979515451624A7738587A534A4D31716330787350794E414C4466466F2B443238327A4364427756346F726D654E327A626730556D34454B4A6D4A322B4749353156364B525A774A38424C6577624A39304579734B6933696E6261673363646A4874377151756C42776E6F43576A755074624A74484E4E4644616F686D784753715844765473416A734279512F627765445A4A694757304661736F6C6E684554375343672B64394C52414A63534B6C39506247544670634F38566D43777377693737726F57587858677A50334D324872546A4C6C77703058306B4D79613842787373417667394B436C662B5A756B4F7959486D6B5257436D6F37396E2F4C4D634147416545626F6739676D5158794F576B5458446858713276736A363162457631684F365A2F314F6E6B4C694964583043345A747332734A57745A77356879387A5776786D35514D4A54594B4364783654624D6E53674E4979796F6D58493638464A4A4D455976725858584F5A3557675650696C556351496859645A4F43326D71334A577A68703933656E6A676D7A393449773441666768586A59496B644B4C313859554C684E512B69616365684E2F51464B6A694F3443613961524A37674C666962794636755943534339375143724E3347556F766642694D3069617A41772F63754A7A642F774E726859447931747845307A3433624D4F4F364C5A44535779744C4C694B6A3741787A4541734D5961327A586834424F624E30323338436438495648483876475678774D517A2B66672B514C70516845766832416F5868634635412B586277564E62425A4F38394F7872535769732F416C68695A4D504C6A3450346C697A6E59413445655654362B79317873432B61717A4D5A744C3862587041656A616F4C64562F4A5848424B6C754134716A58565771512F42346B483739624A7538715177322B31413562745759375346444D36546765416B55596D6F7A58717578576145695076425966424D5079776B7635314F5031305866715832797665474B4C73767155727A79356C6C6475364B636748756F72593670772B52664E446A547934734B2B6364417744396F67714E476868567259536D41676946694743666A673251514971463237642F4530796F6532365A52436E6D5A4141395154646F375A4F736B4644574F374C4969416C39665661484D5963672F507372786332323456587155427846727562796948764331496C786548452B734C34597541476F4D364E63475248784D394358556D626A424E4549545A46636C415268346766676159657442734342446C574C334F636C465173324C69796A61642F447A6873787042366346726930392B30564A7A634E374C477875317954726B3456576430595258723163712F6C336953334432454535547A523547654D323445384A5133717746707143796C75794B6171734A4879686F64316F65587279347931412B30387943395358466C3242435341442F596F4567714931356A34334A793469564D686F383566387861504C764F326B52755A7A77675949495672776A697A5A43734D3349394859437977766749352F7A672B6F45467A536C787A45572B7746654E41672F593433383974305930614B753159654767504A3879664E51746932454B42386F61746F64656F4E734B6F444C7332666D6F4537616970445035395A7354303230562F4764745176786C4A4F48776B3834655246694E34336A5552733844385A416C6F6C773338497050534F585937614E683673797778644D47386A6639417948664F726A6D7851672F36656350494C53454D6A7677786451484B4645614839716F4379666F753445636D666B5A794D4F6264437544675A69394868425A4C4D4A674E4A2F334D6D376F574C514D707834624774566D5769517373556F506E6F6D49374A7455664A5032766249722F4A743451696A4536566F78645A78456A51515730343768672B486F4C525178324967596A55434243456D72547065696A52723343714A492B6B62384143465478616B6330424E5130422B6232696C74664E5A547870427961504467666A356256725A2B6B687377773839314D2F4B6C6945736A46614B307A65766141336D5438725A62314341776E792B397163392B5378514E6467336E783571484B4434392B5274656B747679446E757332696841566C6773666857335673395646436E6262767871413259427471306A58777A526933425156777734394B78613944494A32662F7A63354B3251486C2F59343873343238324E5651586A4F4D355A756D6B46383967314F386146784651316A4B535968386C76676F512B4E5143512B44466E46356F373039513778784D746B38656263426232736C374971485942546A4763467757725756572B49564436424269654F7644617038473879356C5557364D424959694335383365324E504B317A757032384768667436644944696D4F3768424162504B6D434A303231437A737558316D417137417351594D5532715763716C774151426C7330574A377151625661666D6F62467461466A3769486A524558423647614C6E45553569376B4467786C54795A446A786548624F3966566C375242387159614E64546A64652B64482F546366324B787761304C694579304A67707971685771302B535742306377765267346170754C7939516D4F4336644543614937716B6B31784E42584943794F305646634C5862454461615757435569307956587036534E347373464A67565A6F437077386F6763387551736C78334736614561463437325A3062335546516544515761776854774273587042745157736865633173504B64764173716F747365686333777677724B4C554E7A4546745731684A35306D6274413658626976646F51593832426247474A6746354F7730446E7A5A657435354C6853624874672B745A7579634D6C454B3279703346454653475037754B63794442534A56707953467334464E6D6D325A314F336B4B2B34694E49645A36794167575A444B6B32344262594457775656325378594F494249387075455145486D377473517237684130795555726746596F674D693843704635434E2B74317732754F41616165445150723271777A58525051673373743155496C734B6A6265794B687753615843374A4D453744534D35415545684465436146774E505A68754164435A65456947324A744B7542657865424A72435A644C67574F5A74576F4779355670444B3665324B4334516D714A7945584542757A5242563354776E79774A3066563530436442453546504F7855344B62527561614C672B50377070614E426A4172424C44744D6B51354856593448596173717A6F464F67636E675746626255495756654D514D4765526A7237594F74504C5048346146595130786F334F4A4F436F7A6F76465936656D7978427643544359505A5356636342593172434D71715352476662565774385374304456395079356F4672424559666A45615438384E6974757857383765765848575359676E744F56563435774B482F7A4E672B6C35414A4D644C32704E726D516C4D384574466756475A63616C6E7233666B747062344B794C454773736975767061697330614F58315457485433596234652F63744764304A49634839454A3477714C6D77713334424552433950623562334A4E3351646D6A2F646648445775514A6D485861554C354F564A7A37573962685A654874734168444630424642325956764738495469323870327451435237327531676B6E73664E4F6A325166536C622B7155757031305251382B534B4D6667775638386D6458336C42456D585362374759695A7A554D4D433666374D687243516B695A66736C74494C394B4D33704A6B544F5873453442387A614F4B6E38367731796867596B567576732F7530384255346551556C686678683834497447634C594B6E705252746B5745774E6B4B50436C726D64414B385575427555634E49472B646B774B684E4B7444625A683857663652677359696A4C327072634A57715879624541387A324C6975746F46504B4E754C3038704C5463613041754B6C7A716D54565167494B414C7161564E43575334616E51544E424366614F51586E366470536A7778387343596E55476E6C794D6C6765546A41684D317458385A5047422B49647568726B6972536846792B765277755944765A53636B5947686A48414C61754547526766534577313862673865696A42522B633252556A6C6E7A31487A415637656C54457A4F72745672414A38656B6F536C366A7252565A53454963743333673155477948307143326149577471736A55625A4D4872303051416446685976345267636841706D4A6B496545316539314352674D367A36766250344A6C3931384449524E4C5261434172686E6E59446C4148505771457357364963355262423862367446674C7878333350717272764E4C796A71342F4D346731317A384357697A794638783349334C5A5761536E6C593458614638487449346E507657542F3969633761465030397A3737306C506B705177764B324F79582B4B4E30784D49777A6945302B437371794432364E66444B7A5465776333334B3534506F43467773655741306446567447775432416B7076737270452F396B66496256766C374F4E337A545A313852434A78487933654434625534582B67636635457A766D59566D444B574451685178416E4C6D39533453707379376839656F66474F6A5952466778576159764A497254516D5034516B426D6E45443231494D6E7749625744616F664D7861644D776D6E4350566D67464A6F4D382B542F71426C4A64394B6363742B6D6673786845516D4F61414D6933766C6A43424A516368762F556E6335694758634F64456759545A706F6474664279765256746A5234594352306F746D675567372F793268592B53394E2F6A414E41554972654853454F594542354A307458326D305157586B37772F332B67386D46347279386D6B7A74724C59697276326D6D6932554478367436462B6C453979746643306241644D32694A41366456674B5736725332573879415150323833393253335074702B4654386776435179774C3553724C4939325156746F4532585252746F71724E36536E543951444856507275446A4F44742B467739316747316B31416B456949374C6A376677417A596F7A6A594C3478592B3965585833726447554D4161595146724241617345526F516768502F796330786133636F5062626565415242764E436372594C6F6B34767A347148476C2F7553467443424F686661685936793978644431644E477870356F706E36567A722B6C345A3964724C714D597876703252343972425759333733336A6E66437033624D5074494930466261544E753944364F32693478516D4442354F42446264787A7870345147724E5A6946774E762B476756305745355535384453793073416F4A47754C666E4734394E306F544232674F6E6E446D626F38566167666E367663657354477769386339657547573466634E4A446C543930466A6B6B3159476D69614578636242733151513251514C33306D33447A566D39753441756A6F336156517175547046654A4177677A585354497247366E71474C5744746967367748586877466459497A4E66757666744458372F33726C4C75316A72736D4B2B2B7146747843716F6D5750465376384C424578706E3867674F6C473538486930514B59514A4C4336495136434B797571586277327742416554436F39485A79472B6641776D484B75757146534634354C7251325A41707675534E644471332F784F795471426564654C43417A626B704D32317A566F5076736E5874487633676D6F45684C357179626146312F564867727859446639554B6A776B4537624F2B5862704D70482B713054386B6343744154346852414B6B4958464267764464737357464C414A6D666D48586B793642797573455269455A584444746753775562594B4E4B427679534375374138497667675A3239586248694276354A4666356B6E6C6D665A58764B754A546F624B7241544270644F32452B494B326D52434531595A6C686D6572786F516861307A613038695053774A576435534D705945357176333376483441344770793969364E51586F4933326C7A30495263734944795443374662555176326B7544357550734241575973367354734B4851475656776B4934493947366C3063687A584E6F38796C367372426F7774382F6439534F53662F477658654E65454A6732473679594778306D39744E58326B7A6652646154544F72755A544F38375752595338364A6B5435682B6F4B563344613570316845726B6777693267717A466876593836355851774F586B5A346A4F4A50305659774E4A4B447874452F6B674C7452714779552B43734F6A2B2F43662F7A753742627A544E6F72624F476F4D2F547134415052597534525A4F7038374E323334464370434C5062414C307451592F6F5048794941534C6151374F725730536B7A53347A4C4F795A7542486147424C79657062397837397764626C7965345466756C502F756E5035594642735370614D6E4279776C6F6A7930546F4F2F4A70756D574933703569692B5973446847323562472F7A666C76757268377248643036702F694C594A4B6F4E2F78574B5A35596347615747545167412F517953626649484F3548644B4A69317A547939334C4A70304C755932572F4C6B383241426D71513377613244723955774762303867337573756F54727457454A394458794D515961693635396F62474D5359392F5263534E6567685156307551344D455935785A6830314476646D476E4250666A79446343365772774E2B56472F39484457664971774D624A4B3648646F2B3235556B2B7A324542714144574A7130344A4776547556695A682B46682F736766337458755032514C59497A444B5736337374594A4F6E365957426D4D686D4E48727042696E566B764534677A37423151337763727A4A626D76653769725A515462417556763235724971454C6A424E524654736650454B6E63723467504E52646255757A4E4A6A6A4F54676673386F364A6E6C506C38557847677A7435576C6A614471594D325879664D69557733376A336A766633386F5A7A74674C613473455236414E396D54504D6657744667396874754A4D4E6F746C72456E496D55457150322F507534514D455856344932416965766B316756486C5931466C445648432B5835617A7654476765477739575A7541654A2F46796E5432306E676D53494F7A2B675A58417A3638662F4C6353382B7753703238614F784F5454716E4A6D655A46426A7846654D5862515574623358476C4A446251687470717774384E666C7A694764676A4A4667517130784C72666A43634554693349306C7372482F364D79545461776445462B6470585663324746755A2F7641416F5169737A5877706765494C534E4865303858436144694F6A324E7079544E6F4D425A53562B36592F2B71344F576D746D364E4D485035306C5034574A7A7A41694D38575A74424E6A4B68725148646778746F433244466E6E7068625550506E747765365A365A4B496743342B787864594D415370626B6D693949335A5A72504A4373467159514446582B4B74414C76667A7135415A2F4A7A696F334A7657595947536F385868397238534734524450485956715542335777673973436B3454505A6F664A3952637347306C616C5359784A7477794F3042496537516F4D516F4B776562526745497A37482F6B502F38342F2F53786C654830386A4C54385737544A4842676A786B3675724879467136314634326B337770376378634435344C4453516446412B4B73517A504B4B4C5A4952504772674277685077515543716336436B32397A3766696F775669762F6959514633466F4453654E38496D2F2B5A6B6E667575502F7874664E414843304179426B76756C4A2F2F4C747A2F784E332F706E336A6138424B34687A4D667A76494F61552B326774554366672B65424F714B6F376154474C3859563751467772506D3375596E79454259336D674855587259707150464D516D58314F37394330495164507931454473644B747046596676766155634E4B46744B5433767351552F44374D5757317971577746674A43456C2B644744773643703446744E4548693577476F7069327859616D5148684148464E4E4F2B302F4A6F6C3767526C4D536C37392F62326563365534384C4E73367A476B514C447253334F6F7965424E73576A417966746775627557334B664A6B785A4355574938446442656171474B59686459717346756A43375638354265512F544C6D462F394A797A624D61524167504F7257583267454C637835694F4E7844434A746F327435704D624939384C4D347173446F573777483568326446792B2F68726B48656A6B3456466E43387742797A375149304D6D30375967364530436A6C657A7041596135473176562F79464B667752564843724D41725465494769697648512B50484D52575743354F59475167652F4151754A5A68506E59764F416E464C314D49634747702B697661386F74776E7247384943574838564D5670446A5976536437666A76324F756B6B78455863562F2F414833794E754D4A3275645A37625745746A6861596F7A5270674C4854474E6F3969704D3251316C742B2F476F51564737734A4D63324D464750766337307966594B4542656533396955706835396F4C3852776B4C5145422B2F542F39647A2F7055555037767531574843307734457843632F4A6375422B337841576137396E4C57524C4B6454424D4C5A413665534F7033414C4B6F434648626B646371423274387338684D4565336B54466B4C445564752B2B776D457368647051526F4B754F2F715771307376325939774E457338703967743458494E33794F316E34456742424763526D495062794D323178764B6B413469796F71564D32314E4F432B67536D50344A542B6E594C45734367364731657941706878744C6A2B35476530582F4B416F4D594F457870683764444755746468422B433664504B3468515032496158526B372F5A544732576F34597542612B2B5252334A4941592B6B3436524469666A586E624863357651756C6C614F612F4749494A5545365257424D2F664563786B6D37554535463658574549375257786C45437736446A31472B6570682F61527141794B523874732F73516F6277684D486133347A415A554E6C3841577A656642417A516C4D616F41776374597378624D5164494B2F772B4E784C5257764171516942775865535462414844384752476B5A396A747654736D7150676A386D4F4E574F4B586D5A61772F47764B385452444847552B72385A506D6B323058793269336C6A70656A2B62475943306E582F64362F38432F3971724D6567694D464A7144756C347650785657374161632B57334C424B4831564F4861573657314F69614E3746344574684537695743556E6E35424F6561597939624478722F2B56762F53547A6E49597A6945776744464932503343574161324559563564444F556C586D32457A4C6C6F41586C754F56744D57797043764167634C524E6949344633517253376E32597A4B6361764A794F476F485A2F4D50384E546958774E4257473855455439714E4D48773975686E4B3272594A415272744167695336422B30695853437666336D494650656A754A2F504F386152504C4A6E5377774477546C77525A31354A5067774C6B457872564275776850306A51754D4F7743752B6447632F744E6A7870457779354342674A68777A37504835744569495262714C427951684C324E6F703939766C5442436265396F2F336153504F71354847734141582B4E58346C57392B2F78506B382B67656A445266484B3039505750332B3734754D416A684C6B3272664F58326E726B6D33454C30654B326C45706838724B72673662736E57316B527871645075597549337779312B4B552F2B36646E6A2B6D71642B706C35316D456876486F586C54506A3259455A76665975745A69664864767A56452F2F675177684F336646634A455A624F4445326E3465364373317146544247594B53325853376A3141594F534E48737074524E5732304C41544B336D5839673642435332774231547566727464476B696A664155484D30554232306552494F4E6F3444796E43497831366877434D2F667A464F396B442B7A354A73513939345866662F4E6E5847446946592B756D787176414F6E6546454D536D46362B58625A4D306A43377835624B3352384A44474F596551776973722F483764356F723463652F68346F7133574B6D386B774B4939792F2F446A2F346C706735366A7A543330654C506A6374462F6C744A4E7A2B375458336B394878597166504B6666752F484D693843672F2F694B32396C67374967383635316A4B6D795467714D364E676F7339704C3656324251526143726E42396B68355979714E75476C4151366667394A42363752464C686C5630686B71334963326759444638506A6B4262576F7736336B464D686B646E6F534A48717A4C674C415768595A52556A572F416D445A6954734E30466E2F587A6948422F644958355932666D33447430722B6856714B7061672B584B323250647A746B44436F3068534E66507061622B6A3561594F49797A364D565647647066385A6B357850574349794B347170686173737A4F4774423946394A55304B323259354A416A4D53426772732B53317975734E4F6F6F7A56346E6A35494A5439564846626B554D353477354239474375754F6F415A53682B3072453651304C532F6342502F6F4B4336724E6E4C4474673339373138436B59765747584247594B6D3038366A4B6C6751754F6B41684B454F4358613159596E465967573432542F484D787073646847666568436A464649615954434E4B6F724D414C384D636952642F51633669694241654F504172326A314265677A683277587A4E3665432B36427579354245595458543050436F685758536B3475594C49396C6C376A7849333765665261596948776D30765641465938585A556B77394D4F755636557077486C7A44534F58724B53654B5241744D2B57334C79434B77615655336269784E7437684C76677869724874364479556E3352774E7A522F566441674D385769485446575265526C662B6F746D6379345568627275447A37334E75647944786169495361454C53586C4371544354447A4E326A59464350486B7A79482B6B44634E766B6554344F504B5462455874423332576F4F625174784649652F58376230304B6C4758656964367A7041626242576177596170324B646F3968516B394C5652346653485278734A48574D35346774424B4951796A676C585945364B50564B316F434A77314F75424A466141662B655A3850434977412F557A39392F5A32354C6D594133745943344E574F61646D4475434F7A61506A372F624F327158534C5A6A654E675776795530304C782B6C585350466E67656E49307A76747A624250494A5A777052636139683243784662636C4865456276556F67475A6A2B467568667469636272326F4E5A472B4D55446276534C746F6B394C786670447A445244616772534C484265566B75546B7634536C454F6758486558734F5A5344787036426B427155637A54506F414856783065536B7734437139794274714179394C66443864706330675530546D6E482F6A62652B3657564D776C6C584934375555344B73744F722F556A71355174446C7A517030345932494375342B71517955444230596738504C3652336662434B504E4877443254624B41375152636663774F5135577751346F36354C74596E443231516944567868744B5333453037556679657A2B6C4E30447A4251686B444F59617074435A42436D5839317A774F544243744131755965396E686A49517167715748567248524E5A39516336527138627668572F73327943387331707241494A366D624E713746385949773273454948525074374A3164627842366541374C4276393935426B62377642695A356C616E70334F53366C56736A37364E6355443348734C54336E2F71692B41746A745A615A6B673364744565714B2B72684D57787542417A734158354144595A6E5651674576566957357039615250646764495175435562646D794F4944434B3277444A6E376F6E6746346B4D6B4D6B2B33614D2F4E6C4252716A674F33714338355A3042493451474933466E496F6677624F74426D504957444B6D546A4A3463594436347944535053455A6C777571683176594163586E74693544684F706273496F6A484F554F5268684C57674E3435454C674A72584D30613956486E33794F6C5667364476393349424E64306A41446435714C68514E41514756774270446736444C79307143746864744A356D596670346B786C436856516355582F7A366C476A636F49624247505A516A772B382F326862357054506D7262594B7A44713135716A38776965665455344658376832323955483067455670676D6E376D5350787237444E4A683976446F364B3234436153777646574B4B593748714C3157355A56394C304D306849314B4C4B384C7A326A516E632F2B6F377954447347523239496567614650637076526A7538612B485A6B2F327A5553525655624E4575346C6D305834444359565A593263513961526C695A6A744336697131426C54595A2F476474594A58464F6875535944452B5053576B3037476B514B3452574361506D2B4746374D6138616D334E712B6935656A754A494F693365304F76706A4C675065466369682F566B4D5A7943537755736A554854445237576D30527974516F56795265724768635559566977644A5075783142334354476F592B2B654365697330586759795A77454965396466704158744C546E3758766874592B6B49684F7274456C4E56662B45714171536F38614849496B446D6E32784E74593271674E44744A4A55774A6E6A31624F764B5470484B624A3643484B5946526B32316C4834544E686937396977655954706F4535552F784D58644B696B4E4D6D5673352B6C6631572F4870686369717752665433483573366F71415A576F415853694352385344465552472B7879725A513436665757426F532F303457424D6274647A574E41752B524A75396741416E32446178634D395742734A3448655245776C5049615576376E4D757A51596E4655426A596F3436466B384A332F42765A506A584F532F7866362F4C4A2B4D74724B324D45787372462F6558662B7537542F2F2B61323939795270384A6E697A4E73473073635A714B7238565042795079324C3370416F6935394E5233734A61774766506F69786A4438356B6B70556E756F587A636F4D342B534D79706365626477596E562F4136586A376C50356C6B4D50454D4B6F4A6841714679672B59734656523333717476424637315A744166786C74467A426D78704D39714275634A3032494B566763422F466D496836334356727A3871613170746B435262535549693572442B666935784B54777A514562364B642F2F5475662F666A6E586E30622F332F347A653938536F4F437352663763723466756A5638373832333374787272326C73654B37567657585055444C396A624876626B736B7546387436495251474E5335376D35727944652F7835486D457A4570385236737747523630434132617A6A62775A516D434D4158514873675A4B366D593541754567772B37616574744A6D327237316F394477494168674A6E476A5A786D4B4859447937706F4C6177614F5A57547656302F6766544E7365686B5A6D514C694430454A6477656842724E4849796D676A4C6A65374E574748574534486E66636B67354D764564336E4F4D4E39696F51486F5A2F3579424A6A776953726E4F35706851727778574E763373314E645041437769326376716A4A756C436559687742425563536D656A6451516C455A345134796F48324B70724F6671773158466C686271444746704E4235304C44494853586873564441614276394C48567347363364462F4242434B506A7337696E37725A5A65786975786C743063367A54316743796875724F72616E64734A6D6A39684153535A6F4E464C4F74494B693972444C47424B6738597A455670304C536A754947574A76393245624546616C776D31626277784D327079326E454C7573386267685A6E584634427461664C44614A3964744D37544D7A50434144354E5744496F5343674E557069586155784B69587534613873776542364D63744147644849306F4B4A5A6F3131647239704434632B417067473364346564644A4D594248593441752B2B524B54762F723475364E6B74746C4159647964425935464D6256763237345949342F74386C59564950764A373942696F51467578716D7A71686E64524F7356533742416E6A6144795451586276636D4B2F306B6731757059484150445368567563707371416B4C644874794D3455366F4350765356683962792B7A7043775950566C422B6539676F7244734E3751474679345539593064774F515368535045536E42393039336A525451683651694D7939564E7643414D5750554A6D746B7761684A734134314270457259546E456333415747687630505266593364516E7878517578714E4F6245787754746258646E4D4C752F5777764F516F58334C764669307441386444496D63456E61592F555976354E48554E4B6330465277636F47547A346E4A796479725865686A6142614E3937596A37515255564E68344E6B382B6A364E374B592F5061725056554746493579704A464E2B733461536B454B6F77766D59763970527551684E476F4A4F685633427967626635554B684D4C724A6D7838472F4B624E35315459325331635952532F624F5844794C4A78316C625A542F78436D585A71786767704267345246486850654254774D4C49357743374655326B6678324E6F6D445336565A54594E4A345A5976643635414733714762676D6A4A6F4D566B2B6F2B6130673336716A4D6141754436344766597254455031793867696B43335A3977506A4B6E7A56536E53384D33626B465A49617938367A753679776F316633594C377549446E7430566C71567A6F5755435A624332442B5444376D556270704C5050596639487332416D58426B2B464A63637865424F3258392F343964736A5759375364424964326862425031716530636971535A2F55517438514F6C4651307662784B4D335551796D4379764D31515765576E43677233566E4D47446252475775594A354851467255795054674965426B30723254352F356D53446B6E6F44593973446B2F50643737396C51754F446A75615950426C73465A6A34764A6C48463048624D5844566C684479795A5574486A51736262662B655237696B33595566494C3133634E54794D384D4E322B6C732F43475769506C7A326F613537466A4F4F45656C4953475954424341466B56764D41382B35736C386353322B446A7150442B544559303661647649384D616F5850767762347641634B322F396A30637971544E762F504B397A3941427868545479726F74523165443059664A2F73427232447A35484D324252733335316C38534C774C586E6935484C4A714F3469426B4D2B52726D7650414C4757796665797957763772624E3041622F7A766F6A414D416D616A4D55565974765A7A484F627746714273666473566D784674493032636771697A62526436453636703256744758624C346F2F2F6641786A7935726243654C515956736934624E42465344685A5A41554C72652B44654C4B475579715436423032364D39616E6B384F4175786854484C2F32474B357A477A67724E47614E59497A4270686553416F39687A4D327171786D6E7257557778732B416A4C5659382B6A484543536934615864356F652F5935736A374A6A2F52564776646B714B4B6F63465951417334374B636C4B51324E55672B2B3056594B54424E62754D6D79535A6E364F69773078747A307443557759724234646F6252687546634A515A6B3951536E64546F4F4372586F436E6D546A726653354531543332567750506C617A676E343271474C554A52304D734D5759533550495950317A44383774766155636A344E59456176557076687369364E756A716F4942685062652F66454E4E4C454C77336D42495938474B77654C61414F36714C4F6E2F3343717A38532F5A632F7553566E694D38454A766A6C4C32374E514379327342726B655368326A4965504E57355067527055376B6538636356416B37396144596F4834596C58495379666832653369594434544430376E6836326875473154667773444578794B77413967554841344933746A50536D544C615032434C702F365247794567544767634B6B45387663347373684358476D422B6A49586932634142785937346B654D506F654864436779352F6C644134547A34576F714C6A5A4C5A7147777A415032537A4E747276707068634577434F747A62687951306168482B6B5966394D6F30306E44336B706737496F3034756E2F453258583537586242667975782F685765326935465A59474A2F522B49764779645061364B5462683970535644754471486A65706770496C7863444D72764E2B4F44624A424F33484D4D677851423368584D4F79684D504C6C75677574474F61435A346250446451634F4E38696B5069325479506D634B337264344642414C6F624A623569433279477643347530596754355A426F47344232386630526731734B79324B54692F4355337555412B524C745A797A513267523133796934314133494F726F5378734A557841434558506B6361457A6D72474A5641475075326E544B65422B4B6F3464633075424B585446704350786E4D77413563412F6B556747694F76714E4D466C4F4E6A6E764170694B3159395171484B733537667454624E574A7645327054614B71695765564D30336C3654506A69795957786774476A4F6538635742446C36787358415458494C7434387A43705A6739683772644F4531774265496436424957395A51536C386B695934436B4F54796E69456749444E622B5637767278774670486D35484B3053304274597649714956694338385A2B5441632F4147304F4C6967674A6F4B56613257516A6939592F56736D5265797A78303353355359316D4E4C79442F534C6B65374A316934505268745854614C59576F3236566F76483475484237716F543234316A614F65773354425A48703943325A5949692F2F44424F522F432F6F6177422B2B674E445934467169454746386E3877595248694C7261437732536B6537554C70647576713053674478424859776E4B6C446547444846344C627A4E742F30556E5162504477427A454535714639685374644A4777466A2F514E4C4536576D516270726F6E5550784E702F38784A7933432B666E656D3931424F4E6E6F6A572B544C75514C72624A696E63654D53744B4A5A79516553356458684368386B4769325A597133434F73616944666161655634666C4345584C54517443324D527A3739754778684364425175566E314C51653664796F616A4439426F7679336E4C51616E733875454F58483862554D6E4D4C594439424E4D4A774732454B4B6468445036455777534D4D58796A305276764F62384D75332B78374353715A4D577942726F487A784165687162425176516951736E61515130737378637465415474457A4E667A58504977726C32694F706275594C38496B2F36744F5767566C73636B6E724C786F676A6A436871424765346F413444504968444F6742794C756646616D77717A2B64697369764F6B4B587677324E697276545364314155394739452F2B68373074594C574158687A556546735A64457775486833456C6C58434166474D566F5A6F72384C49674468704E377963596C3846445639304F336B356A527653796C674D506E6E6C66777770624339584539344435663178796E5655593646344A58534B3537635545564A67476E5149336D46427956424832745548574F3246446851734773684A42534A68474C3878704E6F416E5477344B694E72695768664444356F4A78446A654A506D6D414A435A6A5549436E2F557951556978316945646951657770787470326F4D4878716F547A5941486935436F38454B343831576A4B664862575A33636B51766B367238502B726B4F77473131375A5A30424D556F4354726E346542585346596F6D41554632595048794C454677634E454D5A6771504969494B4B56457774786F484149316153646F337966636834472F3176794C6C496C7132302F4D625453326F6D576E4A786735786B5A32344C316A59445377364147733362676E5163395649664E5471477A78443163715839416D6A42374967446934656F626754456F7A442B4E75745656702F70445378725570702F3370456B34333651395A41564A553373594C545235456E326F594E312B305045694E426B695651386331304C35454A37666F63794134702B582B78466E4F527971416E734D342F633171394368654C6C7757775078632F7271337031415637707048767770766F6357444B6751743652683859666174654D763451786F777161423075442B6D4E773350472B42614269363246585672653855784D4D5779564563776668562B534F492F732F6B72646F69784274476237574E4F7131365A554C7866446F717475416A427A6F756A4952477A757758427455594255564E343869506D396A644631504B2B3454634C387539516C6C376F4C77494457335A7450574A502B364332464C4B585242514D4D61676C4B6B7766484536656E53464A6341414343453059656A6D45774144566F36524155315958464974616F644C67646F614430794C426C452F6242755347776B44644B565839793657384B6944676444416D445A524D465A67334A48454361706E464D64312B5A33597A39584F53714D456F414750476F686668575547444968516E70385153514D322B52716B3831336369383571316B6A41416530564A6F2F2F7041307339614641754D6772673173466F784A434168524656552B754C43564E72646759354B34424B6A71545174374B65646F6D656F5A6F555739674A445149742B68544A79484B42625A413546383179784930507057514B476837757A4231547A4E465A2F43744C453053396B355A6F5A34326771654E4D4563484373627A4D75717879555977737641486E47636B424B4C48673838344B56344E334C574977524A69384F4C5556453547696F623941764B70596D51674B3170655A51414B496A443576526B5449412B33655766706754594F4D6B33424D4F68486C323269496468463679426F4D487230696A5851654E6B62625271385970386F61687044794E6F6962774D49437A7A56566B53636C653152346A63714D4345415171554E466264366C5A3676447972687557496A6645447A5A496367566663774968584263564B42534578434D5A775676696D424D55324A77446970674436524A6F51574457503330626A7550796359784745734836785168555062744B753261394E34304B446F4F5153474E7261614453466F323263434C3554364A547A6C69623254726A675647737977592F497079695A616D465468536F75563232496B4D41456E4735786B634A4C425353306D74595053636A76796C6A72615A7138344542725930445A6C4E55714934726E4D5261707A684A7A476F556D63564C534B2F4E32504F4B35594359317A5871333568425443564C314176525A4A3841496E7258726C742F5A6B6F5641306E2B36755775556D6F51457657354A6356764F6A69567143324D323238436A78335A646D7968614357326B38785750376D627935767549476F416D4945394B5534465158647A33414A3152506E736B6E742B717841336D39486C42707545533335324E5858416959584A38596B4C65712F506262314F4F436B545952435130326579656939464A3246693546343034495841586C6B71454A79706435525541556A7474576750624A327169372F66546F497058795858766B63727031583345486F416E4C713779794A7A54523263436466473454394D7A765170497641766E3151397A6D556C2B31745631784236464A6A4F6454494773644A6A762F3468452B546D4635477A4D44576C346C4349726E4D712F627A734D4954537A626B6D6B6431785435397267496A2F76564B77794B6F3748694241523248642B76754B4F515542516A575747326C466144494544563351787854373769555559576E677A523054536A35314E585850465151554C4F39736C6C7050306E47766C354B37317459424C6B4C356479665446375433624646566663494C5167555342632B646A2F5A70586642576D7559466A49384E2F3672334C554274724F46314E346978556C672F4B4C3234385278424E66696B46685868585246566363435639593350694D46714557487371464E4A544851336C647148357845574C4B564B366E694B4352646E326B65385556633941693451765A374E62745169714C534F363669796377486E4A54436F6A66476A4F65313375524B783439535042356836616E554467327347677551706D6F48664649784A7954752F442B3242324C6B32344E616B636F6E2F594F4B68543239534878465138584A4E5263616C5943723858495565646946456F4C74612F373145534937775755422F73656A2F3774666964666556454F6A4E565A376F31557276312F45506B4648722B2B776E544633594B4564715255424862516B786550797368486850795754376B496C73735730715A64572F79556B524666446337764C72493437615551344F6D376C497A34322F6F4D726F5450656B6D7438686B7A78717641363730716E53737543784A4B466E346C72414B4C37744437414A5848437A7554543549456C4574574D4A75744376494D57513245573066354B4A7A38696D49637138446D4F714E50386A6C79785838544B56423879716F4B48444C4F4B71656E64476A4C39586831786331446773636A32474A364B337A574856426C597832315945485962752F6851436743584C776E732F7175525079684D4941706C39785867625A6B4A5A4D747439564B70696E54304977703456614230782F7255334A6E47586556612F2B59524C37427739656E5746656344784B77537567454674625A64376D383841534F4637336A32424A572F3967423369474C495A52556267504B4B797539716A31657A434C4553683771596C7978596779644D513667504645346A4D474E5768657172315632504C323675473930586E454849574671647A504D3578752F724657646D504973794877634D71684E7658394547456561574B5372643244785A6955543462426D694E4D577971647348492F66717A75614A59694E4A3279304F797555444873456E637674385971326571474C6E545944786E433339614F383765394D54697276696B6351456868624143592B413168496D33644F35616B55676938596475484E647767734A692B446855595A374B7A3844384B70526470693954464776466E4A324A454D3134774A4E4A514E66755A6656444A69595A464757536954724568514C4E5A482B666C485A537871366A4D51392B493251566D7A4E524B41746D766A494A2F6E4E336A62722B2F6D584E4748684B4D736C6C4F4652586E4C6768415177703577727A356141472F544845614B304F6B474A793143724C324C62494F3377585A742B666E49464669306D4D526A5A564F57584B746754506D45377A41466D586D746F4A5551652F6D4A4E464459356C624F4C4A4B634A72417837506F6476664B316D785039764C35412B616844516F43706E77566A6B34433577494C4B556C4138372B373258343839484E6A386657666C5158475A304F4B33375661636E5839306E424B67586479465A526F3755797251464B7973497448747933514B786C4548724A6F6A3861457375364263655447575057555A32477646356B667A6A502F56756E6E556F456B7651754443766B73496C413942626864326236454442446173674D324C426F695864756679435A64466F4444707542753947443053616A744B47515661356B5268786736735673347149782B336D474D75735132755A46446157526E4569345A3562674B6248383044355274744270353078634D4B5458492B4270786B7A697076547869423356586B68534B2F4654614575375446436C774A6C63506932533273796D76746F777956685955562F336A7A634869354B416A3669705669647A6E656C453067333561386162784E7551394261784E39726A594330634A69796E79486670316252566179352B5172486859777163506347673762545651576C6B77733268364B4D4C74776F35694D6868446A4F38704F4C5866534F5637353758676D6C35566142615846346F396A467530336866692B7633662F672B4865382B7A396A37336E755A656558485469792F6D38486651565A57744B555735576D6446654F63626F704B4F64387665735377434E7553707A414B6A58677757307734733748436F2B4B7A4C71767437623347566F41724E794F65746A52712B6A51414A6B6A316356724B7759365049513946417341647136537544676B787539486575774A7A5A527A2F7565752F3834537543397A3733306A425443692B393937747476462F6673533838372F636C7875754B75504C78615530436B7462516F502F4B2B35396C7676357A4C4865714A637056753954776F582B316B3855642F5267724336537A4F31517453764B59306652776F4D3874437463446C56326D4F5855656B745644355632567A6C36454A323656637845732B322F476374426F754B43445858637869462F594378646E564639736D6E6C416F7252555143386355695262795531306C6F54517671734C37506E502F6E65517858696D427244696D30464D79557A4465554337507676513039586C53686177456F2B33574437574E4E50716E7676654F4F50626649785263584A7A694B5850695A5A5538436D646C763969764B53687679453533764B63672F714A73684C4D717469734F6743597050345A656646464C624F79675258695678313573382F426D303133384C41726167422B49523743556252654F786A7742307557796F674C3263746F58767633476A377A6E7566736630534A387752596A46674D4C65454B523944425946344D536D6C7234553969695A444A4D6F5955536B664A7738694B4B386A544C794A5450432F5366636443594D4D36563468455974315562685069774D4C5069336E74586C4A56453446526C6337327A7554526F5573715441324831424D45375A4B6D41674954776E6E4C42577534474A4D795443732F357167586A7776385274776165446F57436768427438324A676B64734356526C6246555447586957544D5667753170635874696F355150385A6831413870697A56487361725552714163653357415A31307A374F35485544356968576B63746845734B7A4B526965554F525657795A4C34736B79653959682F7851706F45737075784351543936525A6943394D322F6A425865536677714537693870723732526F69796B514B525537596D67687663697537566C326F564975473679644B5279685A414B754C47535A37464D324757376444556446502F723567732B4B6D2F6B396551794179734C4B425A535042524C7946434465576A686266747152372F456F393654787557496E306B53445261455854396B686C44652F6263724F593561456C326E436B734D42614637635A6967376477746C703158596846364C7733626C7764302F37456433574542484B5A66416B556F6D454A594E375858537954436C45324F713857576335624C56775479633141666C7A306F454F516D357363314F6A6A65412B56683633727A6757543066384671754164636A3145314267383341783453756570654243584A2B4A72776F4473584443756F706C314136774954442F51497666684A694766304F697673454C536937634C56642F45416C41454952484B6D77416B63716D612F64652F6548766E62765861574E4B41624B2F735050336A2F30375754474E367844464A6E663531544848486D7A63794365324A4469743162326A7046633254515362477A6B6F32674D6E716456536C7555545779516D2F4939737441674D6669636F5847627A45416D566E6B435779614A4F754E59784F50647650414E5876615563736E6E374D55466C7475704D494A6F46356775364A6A7A7579345A6C30445A4842744F5058354D3456676C383636587633377658572F2F377231336C4C62473859352B4F4F6C514D4F365537665077314F2B38387630504E4C4C5174525A4552776261493546422B56456770492B555345634F417075744575584A6D39796D2F4F496E62336B58367147454F6C64326442397365776B73426C372B374446454C43674A47324478376E345455396E6A6774694F5277536F4F384A43374844456777614D546E7539714247555850304F53754750735375377966376930525A4C426F736E6A675A4F4F67754F556A4A66752F665930796959775430326D6B2F3651582F6F6C354D4F6878335475506579636274662F657062594F34337A5A6634327A735955775165426F636F5472577A574656796B35734A615347506E6F66326C53734434617979636D4E5135374A46304457445255664C6775346B694A36664842317153674E76593145753057596D4B4C5566644339686F512F4A67784A69643951754F5477524F764F69427969797651762F712F666573576B684861466B71504F4267686E634E2B3639617A5332647379784D547A74386E734E687664304269757A5939334D317139304C49534D73392B647149355370396F364F68614C484F6C546134704E2B2B346577645467566F4D57626574706F596D42375654795139465545305238494D397237564E417562544A5856685A6930494766556765464E4A50664F36564438544F654536724A654F554854385765322B42542B45494A614E6A306F75746B73486C593150416A6B3833594B45467A4C7168506A6E6D55314F3775504F4C6E6930592F714E6E667170314E6F576A737048624F416B5561784336303871487A4A786D62594B5875436552566F3568744E334A6C776B615473646F724E417143795969427235412F4F58346F5842594453624170486E384C4F667A46716F6E376C316D662B6D723945716F696D416538436832433768544D41577A733836383248734C76496457795A4476472F66652F634731726A346D3155377465623658422F657A502F384C332F7772662F562F6672616D762B4E3852796D2F47374C78316677797A384E304737724B42766C4E386F2B736E3253424B5438572F474966566164743272356538695A6538715A3274536874564868792F563445314B6734626C534E5536507A4F62634C654A7964636F682F566C346F704D5564544478684770494852624672305A46764C712F534C6B4B354149356A716E6679666D674A58372F3332465031416E39736C56424E575449384A63726C6E644F707254646931515469364575666D6664682B67306E4B5A45574B6F39466E6F2F6E675557727362504F796E77716E4F563243706B2F4B3574442B37674C4E494B57654B504B516776365368524C52655638786D6C6773594E70634C6C4C4363736E674F49376562645447646D634849354674365263674F713149354A484E364E334A7A4973336E6376336E644E4B5A6B416C6B3272774935786A7A3144325368574672315864324E6F4C52755864344263374434614B322F3757564F414971742B2F4B7277346A4647624E3137476B587A6B39465A4B463935414B4F6F6C5365615755684F766C6D6F34724265696E41715842626B537054466F764450444354446F76595754393556544A6E6744314644544E526957564E512F694A4D584169476F48464279474C446E317077353043385A44616C334E6A6C2B347630475066622F2F362F397577662B6273767272715434546A44456168587A6B7233516E737862597439555041335A733259597658356A766E48392F64747975596A6233456877694E586E6D77364347645A4E766A6944717A71722F67712B5863793943326250696A7A712F426F6E643849664141596E444B776F76564D76546D552F4D72375977504A734F6F634B73636A384B4C74473343657A524E7038446175455959794B64516A49664F5835385A504F6D7A68532B694B454A377061556978497253544F6D6B53626C453830316D346539774C6366395232724242735A4B33552B61736D374F7156506637616350524C2B30466D4C2B6B564C6F2F3759676E6575497A71324F51464D4F49567A515766697A5541736B5669696B2F5A45426559375045776D6B74632B71792B717A67435367667969395165416B50704856514F655579576545344D64794D6376664F7477716D4E666D576B42584D4577504A4D4B74676C4635757951563736354941625A4B4C572F334B624A5133326957413072727632346875666347506F78452F7776506B526467693845745A4530546C5056587873494D5051722B39484438657664417535446B6E432B526C4C6C653969494939536B626C62616F62522F32657651745442454D37466A656B4F517A4B59766831754D32586C4D61574D75456E48334B5335555A65745A45707A715A6E433553303441554B463257694D504C63796D2F317051444872494A567667383748796779342B5774426D337A72466C4A6E56665271494A5973475569464235703652556F476E7549576F65657341493755504C6163325765444D714F7473576A525273347564484C663071714A68644659594B38776E4A59416F4B72585A4776794E6D502B454B67312B37475A696D646542656878627471735775425431346F62315579387866435746707A397A65507A623667796677776E68366468536B5446454B4D2F33433338395370536772454177444B44786C7A6A4F5A5774486856417A6D64736A4B5132587A73596332686D45495A6B5866524768662F6A772F736874495768566666305144713961795547616556383779696F594B743431546B704D3261305745434B72384D704D7235734255344162486B53656A3976794555524F6268446550674B526150304830636E744A66746D2B3244454A7A396B666E706E783445537A75654E4943594748387A722F3572337955644E726A57585A686672483358482B42623145794538656B3054304C6D4C712F3666466D4647556853383856435972486A71376D4E4B364D3378484B5A416C6D735771655076586C313936484843464D794A556E47305361656F4945794250356B4E307377796965566A6B73396B6E356639353551526C4C686276572F51794B39654C783836774E465278763368594255336972465A4E4E7439636879502B4C54707146574B742F4C614A772B566D43594A506A794F596C625337576A4264565157574536577158754C62517A2F446A7771333472542F78373379416866612F2F63552F50796765587A6968414557545A58542F49307557316E412F5579396575584C504D6E562F303176675735524D6C4D6E525A383254717744484E4B77707A32732F78364366394864514775702F6A455863686146494A69374462784C44385775344C304B654543706B314A4D6E4962626555795A6B47466D6D484D4B37486D516F7A7A39536E7344654B34366956416844384F6978554C6C786E4E69725A4D6F695677652F4349474F4F6D6B546C4E5557534179552F4E617941666E4431614E7A70476A354C55683251507469334248486F794D514377305843714548326F7451442B306666302F332F2F726F453162472F2F75482F7443622F2B50542F38746E422B586B436B724B4968786C356673623672634B4574597147643469356B6C584C6A38555257366E77756C7A6F566C78444E38482F70582F366F2F2F6A52642B394E2F374F532B324335566A316F744862783371712F324F6A48596864386958674A794E6C4B426F32614B414A2B357473745679736A79716A4A447A33334E534A66387263444E4B426C43346B43764D5A38644A734E6739433472685530353779556D48516B5833767042574C564C6941396E776B5442314C324533424A3237696C324C61466A73447A366E30414E397A7372414649497367312F34377A37787965662F6D2F2F7357525A374F433063657A454E50394F4C4734346D56566B334D616144636A7250553730396F4D3861443435794C4D6A71474F38734273567A576C6E776E6E77595643514B4A5A4266764376336B4175775455562B724A767A7661756B776D4E51636B4F72322F494A684F58786F7834485A78632B31634767565055344C5743504B784549547A3437426D7668735765302B4A2B66636F32434B59716D7878747579322B5139674B6C77594C4764394A46414F58474A7548526977477935596F6D4C2B5A713742526E2F58433379647161744668506863714F533265517279326D376F677742466A58746E3777355643453578396E56524976334F45715538375432694E55377442624C65306D6F58717A67754769304954416B32385542373064572B355762674B58716D51415375595337744A617843596D6563754B3573626D4C45507237796539666C41325839477A3557394B305A4D4D69736578376D62586969706B304D4C456F32477A4136654F66424E472B5A3932306F31435665637A364931624D484F5965727253632B4C7276734E79453768734A584F5A316779497A55787946773950774730706D73395475667866633149585973477973765569586936637A3376795541554D546978517749435A55774E366C3636414E4D784148735839346B41796E50325931454E7170393074584971434361426F656B716C645464784C4A72434A53735A63476C334D786C2B52344E464546634F743659517452612B3732333430334A4C2F334630617131444F3330747135417738555A486F7957496639523468572F466E46573938664F4470396E78624B4663794356765141716B38374B63336433595A79717A34366A6C325734554636396B4C75784A55345A64426E4F6B6538342B6248343778772B48366A564670335878466D754464616E6F317655645A6577663779684579432F694C4633796F6F775977507947595A694974364B356651415A6A426376645A46496B5A5358355637346B332F3037552F2B334A2F2F5935356B474E2F666A44395A65524F3464435844342F7937304435654F59683168487836386F326956372B69334B6D7966764F70705555784F4F54486D386A51746D31385A4A436A41666D4C572F6C3265676E356E5A6862473078566D793936792F734C6E6E77525149464979627A4950517537334E4A4F4850633374334673756E516C41376A37754C51357A6F6937492F3856642B446B64324732516E574F4E6E2B46383650754A5A676849582F665932316C4343756D434A50436E4D4857496A52644F57355A4954654D5548444352643744744B42394B42715058687A756770497852583268463841424E684C657A574C6A5254695255302B36556154315554597368654D6F7434545458744154663778787545664A6A436F58626E7A68714D34344D3971723662593462766C743371553364793939416438464A614F32326163674C72714E396245704C6C4E7633444B6C5469724F536B37527453655773733656332B343850626F4F3467384C704367484657526164775673734F526E302B76474C7972543550484B2F636D2F596A34562F73722B32314D2F2B72734C4F2F426455444B412B57593850587152634D7361532B4A5737797939627244566F4D693667533862624C66475649695A545367584A786D435067566E67792B736F52752F51566564525550486A39625934547A35566941464D2F6D624947423343544B68505871527541516C6F326D4E4E32525A6E4E3132634366446548723049734854706D544E334F61395A617A6E6F6A51494436517570743732337963547968687639344C4B6E464F6339312F614C394F4E6A6B71334D584370342F36567339746476506E703061426F78682F4452754175385933566A4575305A4454482B6367425876374B643337773259392F3774587A2F596A764947444E494A397173316B7A394D4F5462677971316B34747557354638774D545142764C4A713177566937486E42425555436E554A33516B5A4B4A685065514C704D434E4870565558787A317A487135695558424555694B5A50512B797835484F564E48717476474A53715A44453035693358302B4E566C392B4C61584D627A4F6675334B39487547322B6E3177754B33436C63665A35446361342F736F577A2F7A69717A476778464159466869504F34715569426953663255697646496E696F5231762F4E6263327750696C384933756A7530567374617833646A7649694C786155726D59446D2F7648762F65434867785130384533795970523433422B7058665A4452587850756A476F3275367051795457385769747936456A53417639454735614C7052497874436B5962364655734733417457492B432B4C5536414D506B4E3461774F6D4F734F4D737839414D6F4765644B4F592B6868553763712F2B7268785A6267486430584A414F622B2F2F372F3373674C7049636266364C54777566654C4330617850727970427544716B56425544662F383278327A46686672477346772F44416D64495250583949726A35475153477A52777445706F445A347737706374582F69556D3438515875395A7056634A734C596C4179506356534F783572493267734373393673626872536F61374F496D434C643446334A706C553862304D2F645A52344562665569682B716F78516C48496F5567577632676F486A4E4550476F674C67634752614E41454E62654C6874515374365130515452794948725A732B583145656C7443306D7A354E75484E6D4B345A346C666A6E746E356373397A634B38346271345A6654476F61775172464B73306D3732373334796C74502F363076762F373270372F79656A477252576358362F4966374361664A7657514662666E6E59566B35745965446F5469566A50436972695664514F63564341532F38774F4379564F43484E6F482F774D63515869355A744E537161446E4439776F7A7545366F7432327A48707470514D722F793741706C39576854334E332F7A4C2F36354C394A654A2B2B432B6F77777A42316C44304F325A4252642B34626F6F55446F76516C64744E61682B4F3049507766477A396C764647717276656D742B754D30634B736E674943547471445641512B7363794A51504770516448524C763443526B76486F6A55465668704B787A30486568534D496F4A31376C597A3669695778646135324130736D6C4979693263532F6362416F6252413659447A7A7934316958395857323141304D662B71767369764A393059764635514E684447776D6C7259566372387530394E58777243436753316B782B3061615955437352676A647065703062477054597252344A4A614E2B6270326A6B2F4344743337346E58776E6B386237746A4135767A622F6A53554C2F354274456365382B3745537A44394F39525A4C334A4E754446347679466271327645436565506866394F504C55306C685061704268686D70792F683170574D716F78424D5157446B44327337742F36502B39375639666871393935792F4C3079727074392F6C7676656D743349612F3946757664637562636C68686138484C664C30797A756275714A4A782F5241576A436B59642F3048526B6F493078755858387A685A627A6530364F4D6B35574D736D42526C55344378654F5A6645587651547A6C46576C4E3273572F576737346E305463792F7A4A582F794E6E3348534B7444486F61764C594F343832306D49792F52384A334D45314C363176347572344E6D376D4C426B566F2B5A63474F79597876694469556A7674363674502B6A4C626670395248504339597147644B4B496C4534317434364B31434D59645767624E6F332F316A773046767376704E685144774C73484F302F4E434B4C53596E51476B785358666D754252506D6E3739502F35334E3732346943423558396667454B56774469576A667578534D45754C3641416C4132376B55544A79536E74565835466654357145654F4B4A6D61315275564149624E5332344A45525A3138452F4934797478305A362B6D44714B74594E4A756754506D4A52615735674F4B6D4E53303144597A4856796B5A735A6E6C3077364934714634386A3152444754332B62336F5A5364673069376C56383344393375372F77616C2F414D336435312F652F4C59614764512F347131654562775456666D6F4D78354B4A6B33666A423846503632304D704B4437314E52766E57487630444E2F4B79586C497978524C3370456E4141794E7A524A77784957364A676F4B3251587430456641436A78714965376E56707149345369304D674F50757231515A4F3434567244416D3271535768386578754F50424136504B72485A796B61495457624F476B4577706D56683835562F4F65744C46514D706D38642B67534C6D387650546C4F352F386D344B316854486C4875535773636F36625A574D3869322B4B3950423573763450516A725550584E6271495A34756C612B6D6D4E6746564B556E786C30334C5343456F71697358724F4F2F724B61714134315255694C42586E564538426D74564A324E67334F64396752676F45784C4669306D74384F543967704C4C593872344B663252707632526B434A70725268584D47504C5A516F2B4C694E424F7872555133324D356452766773344E6C346E5678786355544B4E6B396F7A54325A564D624962797558734D4C4335673865526652614D413472694632365141784638325A79645A2B584A685751485739476E48527858414A524C6D38556C43717A4B3464507130523164506B6E6A6A58456E392B4F335A623956356A2F7246432F686D376B562B764368624D78794A2F74652F2F4E382F2F54762F39722F38786750612B6E395176785561467A3752455570384C577A73662F762B6D7A2F6E38613167506A63356C305532732B336E6643474F494953397A443034752B7A51526A6B376B677856546E2B38796D5537786968417674357842717A61594D555852363876345A38436C363361754243686D463169325030394532575031342F7A626663713037614638714646517A737A6F4478335833566244702F3436597639453332355452657135345A2F46754C462F446D48324D30492B3976435A32327A68696676554C4E67506A30622B6662675670513834386E2F5947726B6353764F336E6133754A425A572B6A43704357724E4E594669726463374F494964384361586D563571417A62644F522F5734363273505A324B5866716C444D6C53466C47704A4534697A69553376756E3953334D3476424730664673766858547A306D7A4546746F336F776F5039717861734C4656336145752F4464584C436D6E656F505932713731676C7574584A4A73486E316564364B57376C34352B6A42654C3732356C756E3773786E6C5A746F4A2F4F6535487978547645674336636458524B73316748357452587173502B644A74383265726C4A6550754C42614F7772576E52507859566C41564D65434474517448434B6A784D38704D6E536D56456D3159706D6A5268462F4639337A57496E64656A4936512B3353527337755358753634744D41473742667A564C3337337A336754546F4958647A5A6777534366716F6F4E414B7853796872584F65764D4E6D65355665734F506A496858303643566F79454863693642447A2F494F42514F48356973417465444F55736D6E385A34754F756749744D766B6654757A5059597637465262484F3566632F597276466866334879425A754E6E66484B76586E52734434653955476B545A625143706A3954736152304A5637374857526C44374E37334D746765787361693675474D35365868472F7145594B322B56764973767875736F51794D327067632F764534436E4532644979745A65325243657A49344B426E61564453787775796B4D5247726E6C694A4C38773772426E2B442F485A686559552B503152643246365038344B464975383059577A614874337456587A6442536F62366A324D4A78315533497242757330724A68563677546C4A3162574A38655261744E5650437A4F315865687A672F4B55636C6C59512B4B6F6B706C444F4F6F5147697A764C4233545A6F4B4C78654671614C64417165384B437661456B706A375A484A6C436474754A542F574441487A75585778756475393339447A61473038594C757544544652797358634A4A467351546B4D4B795957435049717966506772624A7365484F335A47736D682F7832646A52426966466574754D33483646347A685874304D4A636247587A61593176316E71776253582F46456E35694457336755772B6448344B4D4A4E53734C7A3251447755536A4F763535306B65414E5A5377616A3134634C6B6E4A614670507362596E73565A575477477979504659316358366D4478614B686B2B58436758634D6A34303163764C3539697468343361564F73642F5246334233324E307353354E4351754A377058445476484D52546A69614B6C6D4F4C6B335A445A6354547246584B526E78464B332F7179362B397A336150432F363349356A51434A39484C773633725751306A58766538646B435A50577378365334492F7A5A4C3779612F786632354E7051476E312B6171726630443239627A314D514879786F5A664C5A6F55584C2F68564430716B4F706B6F547235515475766B5634793838784B64597544526F74334246353348623351794E4A6A426B36746A69354D57496661654351777476773238366B4B5A7473464D766E494A664B484870724B494C2F54496442744B526C4F5842666A634F4B74634948654D583737735254343975594B5362494E30655566527645382B2B556F624659616E484A2B6D7975724279365838664D794A30777A3032652F3869733564556C68573444514C584156553738306F6A505A45656179314B4D4B61575855336F374A444B3573696B522B6473667A794937354B32476B767A504B78464A36363548384879354875556F394D4E36566B4E4656376A2B6D6E344F7762447865396B6A385570683331314D665A4A3342693454305631746E6F614F6A6A67394C5A62486C357673583641324C46367148647359344238664E754E717167567A46414154416F7051454B5736654556597462664F78655561353152674D53466B7941394C564B4C70646E2F3158795575396E4F4D36786B4431365554696E6B6D466545507068696D3455794D565A6A3067675A4535313558764871644D42363855556942775741315A4B73546755483632396E4C34457355632B73314C6B3877535238522B64534253662F4963426830414655336D5959355077687348546332556741413332346D6368316E794A424369486761334D4E38565843596A3438714E5966746645726E4B523978393241587942643064484B686E4E775730706C5977626D582B73462B524E3965556E4E354F4C566D6D6D57497A4C34575046577177325673586858573246736637455836413469712B33626E47546F44317975363070477037506734667357696F6E4C2F4A56576C483159796F57586F565250506B6653415657486350455639354A45454C52584E7A62774772583544737A74346D39536B5A6A6A547A31724E3762784D6B5049746241464977326A5339382B343138306274712F4D5158787951574D7665525530703531587143623241336E48773856426C595772534E6564326D734A55686C45782B5373546C452F3942736A32324C4945476D4B615454344E4D433171684B304162794A4E6746317A7961534F4B4B77523337635431464D334657545173356B757A5A7061556A4D625468413435736447395143432F3374797A59304C42724E305134785452765A38546E6248656449526833536B504B47336F724B395A4D48342B76336E7A42397658554B71384E456A68304B7962514B4F38434D6F4E4156787451596833636A424A55356D666B50737159626B34336B317161715731696F624C316F75366F304842484831427A553872554241346E6E43347857514F52647336305639457162534F6A32772F39355533374F506B647768735270735735536D4938564F646C61783538697A456C34387157494449646259434E79396F35614763616930716D6932624C636A76306B566239316C47796D674E45374B6979594F3247757063666C526D476A5854396B42466F4F326A6A5948716B6D774B346976484E2F6A745A543074366B76366A5A4D743873375049554A5A32435778646B7454436F30695546352B474971676D784C68725764544D417550787A556343463563416D36315769385671367948493844632B4C79782B4D787964367853634F4C4C36347672415A734439346D504E76386C4B452B38526C4B644945544B696D7374796A4654345641776D34375049365147566C2B6B553379504146706A354F66376D55304E564C3256656366416552766A364C5446517370506E575461446B3932706F34444E345842306A446C38454A52476C4B416F54526359637A75484F6F5079674B426A664D383435592F6E66456F344D615543346850646A424853553652723030626C2F4C6D7455582B574466325A496F354E4D5956494339354845566D464D375730694B3854584874455774746339386D305253617A324B7447626347316C483533633750515879577878664B5952614879724942703979662B4E777248374346666349504B6D6D62484D633272437A4B7A733532417673396C6639494C7054495637377A673238702F596F54385030662F504237482F2F634B35387870547773654C4D4747572B626E444D4278554A394B4A716B4A4659666138544C4F7A486365614B63716B314F4E4E766F48617356703369376D376E437266572F684A4C583277664F38384245426475644449506F4A494E4932537863516E364E4F664B74316F6A777961305347504578794B5A41424F71595647624E52483751724959546A6B39704D6B5A34387650662B666D70593475536F373158624944476D37752B79626E4338724E374C72634F33544A382B745333712B4E34524C6D715039397872483668557277323536777275577870726A72363936433832556F76696F6E796E4C59474A5A2F43595644675468717A565741775642476F744A6E697135514E412B6C5A63703756696D594F4B694D72466B433535634A3662744B5558435A47664D2F457237665A705A786C4667677967687537364374767650566479757067396B4B583858472B4B3262776737642B2B4B71386B343632626C452B58536D656C54383769654F312F356F36486D6767503273746333736C673079745848706133716A325867506B53397131786B42507559416250583747494577706D32777964714830724768434364435A7A59704765567246416B5A6C5462573352544F35443679615A74666A376F5130563054617A656F7632796B766B3830524C377453526C4E504430564138752B7547447450662B54773167392F2B4D2F2F334176667459587451334D342F4D6E6263422B6D2B57576550636E41484341504865746C557136555A712B41794338797154427948777359494D4F72464E51556C482B58676E475A4B724A4A574F35326C45734C4E6143394161384779644E374C39433169695A624E4B73484F756F57696D6D70734E33644F504A5A744A78526E54514A7357537235675875616B79773345704277467268323450552F696B6B52664F537661516E5768616B6878374969547762612F715074574544636B4F6F4E684F584165516879353763724D77696D3834583446346B4B357A71707A50653530324C572F7972465979586A354B724E6D4C4634593079626C6535394B424763667474445677614A4B5778344F6C5134664634344B527A6E2F4A6E533674466D59416C6944653336656D774B493453644A574A594379686A4248317571497043764E68684F594F4B363961414D4E4366366C36796E6C54594E79487A63562B515A3076546A6376524F557078336441587A334A49424979515232724E31743435514A35546355363636346E54382F394F646D61756A476F6F5178555A513679364631344A693041306F7835774346504246514F70682F6C6D744236477A59704D664658676E576B736C4635756339644D4862794549446E762F666D5732386138654843374B49794253506E305274446D6D646B707470776E47553356455A37373849386237376F56626175355A346865696762786A6C62564D6A555A6B56354556444455544A30487573475A634F37413345357468704D67686435456C51553930525941416146576253627253586C32617873784A66503754334D4C68366C5031525769383844416C395A4B6C4F34445158446645346F6C374F30512B57696348694576556E4A69502B5451375057676247586F302B7352343577724E475454673033416D2B736755374969792F596F567A6F42473656514756516A70777042436474687266443447327A415A5566677250723158336C7938726D79564132646C665465657964323945443663376168566A75704B4A6837755374566967743741376D686F35497A4A74394774506D305935466C584B52573930486548334F342F71414466626B4F37774D6C62643766536862575066306B58574B50467435447471396138374F41682F41326374554A624E49517547595A59507A6961427A3461446E4D7958787747714E4B3935794A304D64547134416A31774D387136466F4478463254414F646B484D6B365A6E762F3179657A477339474A4A545143724C396F7A4770394F2F75662F3258642F384F4C662F38727272392F2F336C757A5375774751507659624134357A3976374A317979726E7839344254773144417564416D7244336B443258777349732B5131525A717A4B6C425934524D6E7252346C5A2B31464D71727944626C79694533655433526C694A50637245474A396553383446446C654A4A554750694F46424D5359587063443737625949764B4A734D2B666D3463624C517159777936514A50706470666C2B3835526C566C796A324F7157306D74335A48466F316F706D67395378666B6B357346592B5073426E76366F5871652B664C726E334357773047643931392F36374E2F2F5A3938372B326E66754F31443376565A3047386E335445303773706D4E587934456A455171794F30384C756577725044356A7A724843794E62704C6A736B335A44655538564859666E4B7745375174316C7130386362767678616852746E6938496B716D6C726876506A324941386B6D686D5551646B4B74532B4F64714D794643384C33456D626F617A56557932466E2B476A3052796A426A4E386557644F625A77453554713777585A2B5756422F2F6264662B364B7A72494C4B5962345956345358755A7055734B484D7A726E34375965713667663963644B685950783948757931425057335743302B623573744D6555784756642B73796F554C475536624C7A6B5A30577761517A466A31795A45715364546A596F76766D754D794766476D4B745870364379614342517A74484C2B6A74566A594D6F6864444F5A6836676332376763714B426479324477574434716E714F775571437147794D6831506D6D6D65464D3755596C6F704F4B50646C7264512F39537676504C3270372F794F763038644B476555386B774C6D75563846596B78664969626465345A4775412B546E70365972795A3676646E6F6A4B78794B4974564367656433384943504A4C4D684B6F636A73446B795663396266654230474E54547635753169357333486644525A43776168374C494B5A36746D302B346A2F6A6E54456D574930497745524E6939414D673746444541596350436B616B2B664B5A4266767447385636345657506679446E53496A69486B6A6C485739552B66743552787455746C6D72386856567A43642F412F6F42665966374C4B565A4658716A354B485249507968487A68592F6138624A4270466161326B52767537794773724B35535246653274517738755A3143656C576B534B7336763046764D6B56453632617335686665544A79304A552B75476B3356415A3745777875594178654E782B77506673384559783977517346732B79432B564338364146664C53536F5939783265716B58574363314D664257686E3669324A6F4C516E47653631694957385A6534575A657A59666D7966536E4A5A425768796254705952465A504C6E31494D6130433771766C535042516E3564784E35644B444F704F50446E533875344245527A4846445469443058505677506969446577654E4F574E6F396A6F73625A6F6354466F61664C35555679314D2B79423876635537644E38737048465570514F6C386337462F6452797559494A564D736C784F55693758444C3231447166676E4C6E734C66334E6268367747796F736E66486C446136304B6C4135795752592F4D756E4A6D364373355671426570317345476C755463536136633676364A51623765636F666F6931646246514230652F3032424146555152376436396666414375785A4361686343477135566173484470423036575371763978562F577978356359586932664B6446425934783464686357372F6676417053696173744B324B4C76394B4F76704D2F5978484D39386D522F4A4F33706C564275566E6C4449565A6B4548547134726F4C49714A535A766C317770482B50436277555A6D364C304242546D535A62786E59634767454647327A4B4A65594766386A5533426E6E7A62716B383859745A6734665A72664A64546D56364B303737413774332B6861554A646675304E456D2B304B654C57417433724951705569677A566B4B4C46546C475436594A5574677A634C666F6D5463596A464C6A48726D386779574670394E47463645387A62782B64436E534B4F66636C4E6A634D685955343463736D646A35764538702B5675556546383537684C78674C6B39544C6F44352B7532494A716E63695A35535848654433636C736F654D43687955312B365A7744444A467731655041644A5168412B66507556753049697363436F42354C69333749332F773059516B714E686164435763473963707866487A6346636D54396C6859697A30745950734737614145376E387372495867595948336C4E53556B6C48634646306F43537448355645756238356147346236796F664A6E63666151486C714C346F3964754165364F2B68547A355548765847416F2F2F4978516F566B716977787379476B706F723856526C497637712B5654764E51646D3347423938474F64733536525959474A675A733171516A58593546466F4D38576D6A43755861646F6B7959544A2F51674E557076377A5041464C64344B79504231552B70764C73423841394C5859385779676F435262366F42536B654E7968424E61366E4939794B49397956543475466758315667736A67376252666758504D6B34716C34324D64724441733555435063754A51664871495950696469636E6639643943364163797041446C54777150476F44384870586262533054656E67626A794B766B6C6F554467576C5173317861764675684E5479676163644A354F6B776C4D554F537A6F414B6A4A786D696C637333345031623963546A434B6775424C776353513859333158776571675042554C396878306E7434413279414562632F6D3257474D6335434D66386541686F336F4E597739554276303252443265524E7265317A6F43794A52747A764B743753707674794A38614D47674D446A43314358624B616945685068414E6844655A664A6D71497838587A4F356935416D5A2F584A527942433656692F3563664F483369304C2B743251474F573533636B54354B312F4875664747766D7754613649577278492B5269557459557A6C624E4B536A796E64702F63747366536D6941347578626472716B6645364754304365354C4B3743457A325354757338714D6752704F7265716373686978677449583837584869354633305959584C5272564938787A4C7235534E584369553672563578566E736A4874595779637455432B766D6C74504D68416679496567574D494B5233397678564B384D3941413255416851453643647354524B614E534B41705466726E5A562F67333542327945366963636F525375666B34694341476971436B66724C72326C324248454A5A4C53616832685566567169506A42504B6F5668303946764F6F50484B6370495862375A67526F76616B7736446971524E52616B78312F49714B3154787250524F42664951796A526642567776666464414135564E324C4B51464437457650514A69516C434356695A6F6E4E702B72385444696A2B53617638524B696F3972324F5571657A77474E574448784F4B6B7048666D357A47516652625A4570614D6F4D506F2B7A734459704963705348736F39365A35492B6374787A306D72494862754A6B4C4A52762F6F743458786E612B554C31523939443641715263714B612B794C4536427976733571323041375779746C6B4E6B4E6F4779386D57784B56443635615172746B41445A3039765844417159564A383833324E796B47413877546C6E6158614152526E6479692F614659592F47315050686B71457156412F5846705850706A44494C717377556A662F5361756D6968734F7734685439456A52396C79654E4D477A65353055344F344C50434245586A4457626F4A313861556F37444C4562356352396964585151664E59502B496748464A2F714C3475757945627734547670634B6A736E354C374166554168562F78494B413949795574476F7178505171766875706F332F364E4F6132557A6855376F5545736930534450566F41497666652F755278614C777A3070717465644574336E6D6F6A50664A66643735445A517662354F6C73415356523776736273446A2B5569566A77745A77634A546A672F43534F42457333633750476F514C5259705A61487753706E30546336455774476976447159752B434F4252565063724C315564716F65734C79694435332B364A774F58594B6F5A6A6262384141366A313830616D652F306D756646745A34572F4A66634354433554454F47624C68664762764C785847765048764D666E61575063384B75374663555A473073584C2F4A3365443866655444495068474232516B4D77434E585462374B2B63656576426D30516534744C34717976696633343535384B46513866633776347751514E6C4E796B53352F74487450354D30494A5641577432555546417A46592B2B477945645232477672526857636459525562376C6B46533055516C464F436F2B556976796F74377167375A56354C71674F6A6D366648616F626F5067333555614B5A51724B77722B65625A55674D736976754730386E58555334736B2F4D7A6E70485A3072646B43447A7550673050797A304F543845353959684472767A6F7354505165562B5747356C377773672B4963565A35776C724E44565962796248652B72765767634C466142465053386775764D516B4B326A6A5248336E6B36626D756B686664724558794F696E5857796B4A34674F357667435875394864577656784448706A614D6F417858395A3369364C56666E792B444F577942364B682B50734E34303644314E49636F736236525533414530454F37357066506E6C4B4F503075416467306D4A5264666C626942344B6962797A46345A4B4E77576D3871702F5755493963683931746875467171392B682B55594B566E384957727478574C412B714D2F7073424534776A46612F386F366B4B7A536A7051636A377178567A456B5764304B5873625550742F584B37397652445777754947496235516D434F5A454B33496E48786B724D6957776E6C63796C466434646B7267537375434A716A376D5170797553577853457642442B2F5246636D6E62784F67352B647079785544336556556759386E72666448642B512B3553434637644471553164793046306C4642594C3366756C5857314757583762447358416B706C315159673372786868527746346B49366C412F496A3948627A53376B72314C6B51622F694471435A304878554B4570497944744A3374304E4B6D4E30787945792B55306F334E396B7A71764D48355562665964587446666C666C374271326C38496868446A6556666B3874506651772B3970754F794F4B666E58504657396C706A344D35505375656B555635785232444A7135727651434652387047767530714C5738507753746E5A5474354635542F6F334B384144694336462B552B306B46727A74634134304A796F516A33442B7977576F672B74666B507172673572456A6A3178524169706E305870564F6A4B315A6B5072577339583347466F4972755444525366544A75432B4C68624341565476623977464B68445A663846755739525477765265614C3171334C384735534856674770627A796D527046386D6A3562357875492F7272634C7970343244474F73717A77415A764B46662F5530547A4C7A66566F394442436B396F31577748786757795956445A4B79384933612B49716E61636D31486D6F4D456C4165614C46592F537541674A4B6530754F5236372F514E47666B662B452F4973526172574668636859386E37492F304662465A3646654835583769387265504C52516D584532372B545A536B745736754C4C2F654A62557135745063786D34375956397842614A4A584B5A73734B4544687958775A5369733756764B6A764C4F667656555033377446735744706F4768322F344E2B3563564B2B4530356E693731334A65633953536F6E4F2F4B2F617143647245736437684370467A5645652B63464E41505A786C42795756546D654A54556C4575377064374E5956587963775644796B303655764B7867544842644E32482F6E7353766D5263486B7044696974504A5553696B4A52474D5754332B6D68374A4E2B493351553141376178744D6A73797A633853692B7031546D48432B76686655573554434F6C483072753766615642363541385772757856504435526A6B656A6C4A5561467138306D494670727557546C73766B5966735644444952676B41564471327A615861716B4B387A6979514A63337274786C69374567686E4F416D79462F2F706B3655426F5045327054796D4A41476B78647732366D34446F6339627556626C634D5132455970414E5133744233466F77384F59644D58612B7A64614A386B53394B4A334A785844466469546C73626A6778525057612F644953786C796757722B466234716C79765751344B5A5838516237594B4B5A3446434B48636642554A78735269634E416D786F656A736256776E50544A516E7A6E4B78583975584456656763676A374E6B41346F4C596F4844314E7135496C584B527532345356367948424162426A69504E534A6B6F7A6D506D496F44434A69455462397A527250724258316F734762534C656863566E586A4B5477655734466E497737467544636F4339766753526774654E4A516F6A36767A6D4161696E2B5754464D49717053452B37707743717935666159667A6D304B543138343962516C634C5A6372546F4F45434F485075396E6F3352695277395132494B53654E494B53797832412B34755769666A43346D6B2F325543392B554C5A304B7466354641795861556D656C4643546F4957537161376F455750756B644B78714D56524237785A3367616D4651475373744B59334C736C4A5956354F49766D4D5854576933744E31784752325A5075754B4B347944424B6F4972676576746348476B436142347569397A695A352F78683967683677576A744F6F622B6C4365586278695859586C457859434E3330514979782F46627056706158307063555336553447474E35375A79323336315A5A5131646363564A6B4B42565279555831506275706856674248587535612B52306B6C314C5035794F6571533333304C57556C3351636C59477867484A30314362475935527238545A685755306C6474424F4A70372B59576A3652585848455753506A793351305943626C6F72616B4E2F2B794F534C7279684E4B5A766574524F6F2F614455346151556B5872325341306D49735A3139635648712B644E3273574641696E6C77672B75795236596F7262683253793870634636595554685A3445325A357535394D784D4B516A314C69583375673047684C63616E4F5253556A454D624E486C394544365542582B51784F4573466B594D665039704657346C48576D4257635378422B587376514934557532697478586D31577136344735436756677248462F6C496B596A657670553665367871495634575536745138734B74484F337772425755686A58557A53505874627138547A332B72694C72384B4F637172624C68624C61764E4356707A7079656E67306C714C314C4D7644666D42357852553344676C773966524A59494831684A2B376E697A38674956344B2B2F4771463455442F566E70624261415A3462744D58625665434B624B544D5265503778506B6F68414B364B705972486A3549734D4E694B4A6862474849567233423270654E31424B67664A596B7264426173733938595647317650496833725255354C4B4E5775562B50516C63385770445174302B56574251736A72564B682F68684F334B305266376B357732556C6E3959654461467037495A6D324A394F4C704B4259672B476B766136736C5858484746466B567639325768594F6E30336E324A34307A474A503853504E2B7367676D496A5861433776334C56716763464F696F4C334A6479303230376C6A4A64525830465664634D5145746D485A33426B75376562763772314938536738726166486552547A6C3554386E72594C59555135546279707A487A585672796B6C64465571563178784A4C5367756F7474536F6D495A6F75366F336741355A536A6C734B726C51787733716E483166454E337659694732584376346D687664333745656879744331624B574253755635787852566E67685A6456346D776B4F577879336574463948746C383179497967762F374A6C38594A303444614D72424B7751706C453230654B534B444D3679763856317878696444693544325133692B613434356A366B6779742B696E67444A416D5531614745724C356262577957796272726A69696A73454C655375416B455A7966484561504C4F5A69344E4B42314645762B47746231444171464D72752B6D584848466F7751742B7267374764335A51454E704B4D6764436337656C656E784F6B4B52774465726C4B3634346F70484843674A6C492F3863742F69796957557950576C74697357634F2F652F772F65447658466E583264684141414141424A52553545726B4A6767673D3D);
INSERT INTO `portal_portlet_config` VALUES ('294', 'testV', '3', 'tenant_system', '1', '1', null);

-- ----------------------------
-- Table structure for portal_portlet_config_instance
-- ----------------------------
DROP TABLE IF EXISTS `portal_portlet_config_instance`;
CREATE TABLE `portal_portlet_config_instance` (
  `tenant_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `PROP_VALUE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PORTAL_PORTLET_INSTANCE_ID` bigint(19) DEFAULT NULL,
  `PORTAL_PORTLET_CONFIG_ID` bigint(19) DEFAULT NULL,
  `PIC_CLOB` longtext COLLATE utf8_bin,
  PRIMARY KEY (`ID`),
  KEY `FK9EFAE1BA3E68B88` (`PORTAL_PORTLET_INSTANCE_ID`) USING BTREE,
  KEY `FK9EFAE1BADA8113E8` (`PORTAL_PORTLET_CONFIG_ID`) USING BTREE,
  CONSTRAINT `portal_portlet_config_instance_ibfk_1` FOREIGN KEY (`PORTAL_PORTLET_INSTANCE_ID`) REFERENCES `portal_portlet_instance` (`ID`),
  CONSTRAINT `portal_portlet_config_instance_ibfk_2` FOREIGN KEY (`PORTAL_PORTLET_CONFIG_ID`) REFERENCES `portal_portlet_config` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_portlet_config_instance
-- ----------------------------
INSERT INTO `portal_portlet_config_instance` VALUES ('tenant_system', '70', '/bconsole/v1/pageModel/pageTemplate/1e85c27bd82011e88e131402ec8b0a88', '523', '4', null);
INSERT INTO `portal_portlet_config_instance` VALUES ('tenant_system', '71', '/bconsole/v1/pageModel/pageTemplate/272a1844d8fb11e8bad7fa163e1975ba', '535', '4', null);
INSERT INTO `portal_portlet_config_instance` VALUES ('tenant_system', '72', '/bconsole/v1/pageModel/pageTemplate/1efac958fe7911e8ad011402ec81c25c', '547', '4', null);
INSERT INTO `portal_portlet_config_instance` VALUES ('tenant_system', '73', '/bconsole/v1/pageModel/pageTemplate/b343a91c026f11e9ad011402ec81c25c', '559', '4', null);
INSERT INTO `portal_portlet_config_instance` VALUES ('tenant_system', '74', '/bconsole/v1/pageModel/pageTemplate/2fa8fdaaa21211e9b26a1402ec7d7650', '571', '4', null);
INSERT INTO `portal_portlet_config_instance` VALUES ('tenant_system', '77', '/bconsole/v1/pageModel/pageTemplate/96c007d1fde711e8ad011402ec81c25c', '595', '4', null);

-- ----------------------------
-- Table structure for portal_portlet_event
-- ----------------------------
DROP TABLE IF EXISTS `portal_portlet_event`;
CREATE TABLE `portal_portlet_event` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `EVENT_PARAM` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `EVENT_NAME` varchar(20) COLLATE utf8_bin NOT NULL,
  `CODE` varchar(50) COLLATE utf8_bin NOT NULL,
  `PORTAL_PORTLET_ID` bigint(19) DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKD4D5ED42CC6F0E19` (`PORTAL_PORTLET_ID`) USING BTREE,
  CONSTRAINT `portal_portlet_event_ibfk_1` FOREIGN KEY (`PORTAL_PORTLET_ID`) REFERENCES `portal_portlet` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_portlet_event
-- ----------------------------
INSERT INTO `portal_portlet_event` VALUES ('2', 'url,title', '查看公告', 'open_window', '13', 'tenant_system');
INSERT INTO `portal_portlet_event` VALUES ('3', 'url,title', '打开菜单', 'open_window', '14', 'tenant_system');
INSERT INTO `portal_portlet_event` VALUES ('4', 'url,title', '列式菜单点击', 'open_window', '18', 'tenant_system');
INSERT INTO `portal_portlet_event` VALUES ('5', 'url,title', '查看在线用户', 'open_window', '12', 'tenant_system');
INSERT INTO `portal_portlet_event` VALUES ('6', 'editFlag', '打开编辑菜单页面', 'editMenu', '19', 'tenant_system');
INSERT INTO `portal_portlet_event` VALUES ('7', '', '关闭编辑页面', 'edit_close', '19', 'tenant_system');
INSERT INTO `portal_portlet_event` VALUES ('8', 'editFlag', '打开编辑标题页面', 'editLogo', '19', 'tenant_system');
INSERT INTO `portal_portlet_event` VALUES ('9', 'py', '改变天气', 'editWeather', '22', 'tenant_system');
INSERT INTO `portal_portlet_event` VALUES ('335', 'url,title', 'testV', 'test', '626', 'tenant_system');

-- ----------------------------
-- Table structure for portal_portlet_event_rel
-- ----------------------------
DROP TABLE IF EXISTS `portal_portlet_event_rel`;
CREATE TABLE `portal_portlet_event_rel` (
  `tenant_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `PORTAL_PORTLET_ID` bigint(19) NOT NULL,
  `PORTLET_EVENT_ID` bigint(19) NOT NULL,
  PRIMARY KEY (`PORTAL_PORTLET_ID`,`PORTLET_EVENT_ID`,`tenant_id`),
  KEY `FK71E5E7FCA9B38CD9` (`PORTLET_EVENT_ID`) USING BTREE,
  CONSTRAINT `portal_portlet_event_rel_ibfk_1` FOREIGN KEY (`PORTLET_EVENT_ID`) REFERENCES `portal_portlet_event` (`ID`),
  CONSTRAINT `portal_portlet_event_rel_ibfk_2` FOREIGN KEY (`PORTAL_PORTLET_ID`) REFERENCES `portal_portlet` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_portlet_event_rel
-- ----------------------------
INSERT INTO `portal_portlet_event_rel` VALUES ('tenant_system', '15', '2');
INSERT INTO `portal_portlet_event_rel` VALUES ('tenant_system', '626', '2');
INSERT INTO `portal_portlet_event_rel` VALUES ('tenant_system', '15', '3');
INSERT INTO `portal_portlet_event_rel` VALUES ('tenant_system', '15', '4');
INSERT INTO `portal_portlet_event_rel` VALUES ('tenant_system', '15', '5');
INSERT INTO `portal_portlet_event_rel` VALUES ('tenant_system', '14', '6');
INSERT INTO `portal_portlet_event_rel` VALUES ('tenant_system', '18', '6');
INSERT INTO `portal_portlet_event_rel` VALUES ('tenant_system', '14', '7');
INSERT INTO `portal_portlet_event_rel` VALUES ('tenant_system', '16', '7');
INSERT INTO `portal_portlet_event_rel` VALUES ('tenant_system', '18', '7');
INSERT INTO `portal_portlet_event_rel` VALUES ('tenant_system', '16', '8');
INSERT INTO `portal_portlet_event_rel` VALUES ('tenant_system', '3', '9');

-- ----------------------------
-- Table structure for portal_portlet_instance
-- ----------------------------
DROP TABLE IF EXISTS `portal_portlet_instance`;
CREATE TABLE `portal_portlet_instance` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `LAYOUT_DATA` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `HEIGHT` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ROLE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `PORTLET_INSTANCE_NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `WIDTH` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ORG` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `PORTAL_PORTLET_THEME_ID` bigint(19) DEFAULT NULL,
  `PORTAL_PORTLET_ID` bigint(19) DEFAULT NULL,
  `PORTAL_PAGE_ID` bigint(19) DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PORTAL_INTEGRATE_METHOD` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKFB68BCCD14B49EC` (`PORTAL_PORTLET_THEME_ID`) USING BTREE,
  KEY `FKFB68BCCDA805B91B` (`PORTAL_PAGE_ID`) USING BTREE,
  KEY `FKFB68BCCDCC6F0E19` (`PORTAL_PORTLET_ID`) USING BTREE,
  CONSTRAINT `portal_portlet_instance_ibfk_1` FOREIGN KEY (`PORTAL_PORTLET_THEME_ID`) REFERENCES `portal_portlet_theme` (`ID`),
  CONSTRAINT `portal_portlet_instance_ibfk_2` FOREIGN KEY (`PORTAL_PAGE_ID`) REFERENCES `portal_page` (`ID`),
  CONSTRAINT `portal_portlet_instance_ibfk_3` FOREIGN KEY (`PORTAL_PORTLET_ID`) REFERENCES `portal_portlet` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=856 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_portlet_instance
-- ----------------------------
INSERT INTO `portal_portlet_instance` VALUES ('20', 'systemExit', '', '', '退出', '', '', '425941', '10', '1', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('21', 'currentUser', '', '', '当前用户', '', '', '425941', '11', '1', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('22', 'horizon-menu', '', '', '水平菜单', '', '', '425941', '14', '1', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('23', 'onlineUserDiv', '', '', '在线用户', '', '', '425941', '12', '1', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('24', 'workspace', '', '', '主工作区', '', '', '425941', '15', '1', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('25', 'boardDiv', '', '', '公告', '', '', '425941', '13', '1', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('26', 'logo', '', '', 'logo', '', '', '425941', '16', '1', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('27', 'findCompDIv', '', '', '主题切换', '', '', '425941', '17', '1', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('28', 'column-menu', '', '', '列式菜单', '', '', '425941', '18', '1', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('30', 'editDiv', '', '', '编辑按钮', '', '', '425941', '19', '1', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('31', 'homepageconfig', '', '', '首页设置', '', '', '425941', '23', '1', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('32', 'treediv', '', '', '服务菜单', '', '', '425941', '24', '1', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('519', 'systemExit', '', '', '退出', '', '', '425941', '10', '83', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('520', 'currentUser', '', '', '当前用户', '', '', '425941', '11', '83', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('521', 'horizon-menu', '', '', '水平菜单', '', '', '425941', '14', '83', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('522', 'onlineUserDiv', '', '', '在线用户', '', '', '425941', '12', '83', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('523', 'workspace', '', '', '主工作区-运维管理员', '', '', '425941', '15', '83', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('524', 'boardDiv', '', '', '公告', '', '', '425941', '13', '83', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('525', 'logo', '', '', 'logo', '', '', '425941', '16', '83', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('526', 'findCompDIv', '', '', '主题切换', '', '', '425941', '17', '83', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('527', 'column-menu', '', '', '列式菜单', '', '', '425941', '18', '83', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('528', 'editDiv', '', '', '编辑按钮', '', '', '425941', '19', '83', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('529', 'homepageconfig', '', '', '首页设置', '', '', '425941', '23', '83', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('530', 'treediv', '', '', '服务菜单', '', '', '425941', '24', '83', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('531', 'systemExit', '', '', '退出', '', '', '425941', '10', '84', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('532', 'currentUser', '', '', '当前用户', '', '', '425941', '11', '84', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('533', 'horizon-menu', '', '', '水平菜单', '', '', '425941', '14', '84', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('534', 'onlineUserDiv', '', '', '在线用户', '', '', '425941', '12', '84', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('535', 'workspace', '', '', '主工作区-运营管理员', '', '', '425941', '15', '84', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('536', 'boardDiv', '', '', '公告', '', '', '425941', '13', '84', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('537', 'logo', '', '', 'logo', '', '', '425941', '16', '84', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('538', 'findCompDIv', '', '', '主题切换', '', '', '425941', '17', '84', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('539', 'column-menu', '', '', '列式菜单', '', '', '425941', '18', '84', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('540', 'editDiv', '', '', '编辑按钮', '', '', '425941', '19', '84', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('541', 'homepageconfig', '', '', '首页设置', '', '', '425941', '23', '84', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('542', 'treediv', '', '', '服务菜单', '', '', '425941', '24', '84', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('543', 'systemExit', '', '', '退出', '', '', '425941', '10', '85', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('544', 'currentUser', '', '', '当前用户', '', '', '425941', '11', '85', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('545', 'horizon-menu', '', '', '水平菜单', '', '', '425941', '14', '85', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('546', 'onlineUserDiv', '', '', '在线用户', '', '', '425941', '12', '85', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('547', 'workspace', '', '', '主工作区测试-服务提供者', '', '', '425941', '15', '85', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('548', 'boardDiv', '', '', '公告', '', '', '425941', '13', '85', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('549', 'logo', '', '', 'logo', '', '', '425941', '16', '85', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('550', 'findCompDIv', '', '', '主题切换', '', '', '425941', '17', '85', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('551', 'column-menu', '', '', '列式菜单', '', '', '425941', '18', '85', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('552', 'editDiv', '', '', '编辑按钮', '', '', '425941', '19', '85', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('553', 'homepageconfig', '', '', '首页设置', '', '', '425941', '23', '85', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('554', 'treediv', '', '', '服务菜单', '', '', '425941', '24', '85', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('555', 'systemExit', '', '', '退出', '', '', '425941', '10', '86', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('556', 'currentUser', '', '', '当前用户', '', '', '425941', '11', '86', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('557', 'horizon-menu', '', '', '水平菜单', '', '', '425941', '14', '86', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('558', 'onlineUserDiv', '', '', '在线用户', '', '', '425941', '12', '86', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('559', 'workspace', '', '', '主工作区测试-租户', '', '', '425941', '15', '86', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('560', 'boardDiv', '', '', '公告', '', '', '425941', '13', '86', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('561', 'logo', '', '', 'logo', '', '', '425941', '16', '86', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('562', 'findCompDIv', '', '', '主题切换', '', '', '425941', '17', '86', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('563', 'column-menu', '', '', '列式菜单', '', '', '425941', '18', '86', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('564', 'editDiv', '', '', '编辑按钮', '', '', '425941', '19', '86', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('565', 'homepageconfig', '', '', '首页设置', '', '', '425941', '23', '86', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('566', 'treediv', '', '', '服务菜单', '', '', '425941', '24', '86', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('567', 'systemExit', '', '', '退出', '', '', '425941', '10', '87', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('568', 'currentUser', '', '', '当前用户', '', '', '425941', '11', '87', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('569', 'horizon-menu', '', '', '水平菜单', '', '', '425941', '14', '87', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('570', 'onlineUserDiv', '', '', '在线用户', '', '', '425941', '12', '87', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('571', 'workspace', '', '', '主工作区测试-服务使用者', '', '', '425941', '15', '87', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('572', 'boardDiv', '', '', '公告', '', '', '425941', '13', '87', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('573', 'logo', '', '', 'logo', '', '', '425941', '16', '87', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('574', 'findCompDIv', '', '', '主题切换', '', '', '425941', '17', '87', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('575', 'column-menu', '', '', '列式菜单', '', '', '425941', '18', '87', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('576', 'editDiv', '', '', '编辑按钮', '', '', '425941', '19', '87', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('577', 'homepageconfig', '', '', '首页设置', '', '', '425941', '23', '87', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('578', 'treediv', '', '', '服务菜单', '', '', '425941', '24', '87', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('591', 'systemExit', '', '', '退出', '', '', '425941', '10', '91', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('592', 'currentUser', '', '', '当前用户', '', '', '425941', '11', '91', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('593', 'horizon-menu', '', '', '水平菜单', '', '', '425941', '14', '91', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('594', 'onlineUserDiv', '', '', '在线用户', '', '', '425941', '12', '91', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('595', 'workspace', '', '', '主工作区测试-平台管理者', '', '', '425941', '15', '91', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('596', 'boardDiv', '', '', '公告', '', '', '425941', '13', '91', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('597', 'logo', '', '', 'logo', '', '', '425941', '16', '91', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('598', 'findCompDIv', '', '', '主题切换', '', '', '425941', '17', '91', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('599', 'column-menu', '', '', '列式菜单', '', '', '425941', '18', '91', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('600', 'editDiv', '', '', '编辑按钮', '', '', '425941', '19', '91', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('601', 'homepageconfig', '', '', '首页设置', '', '', '425941', '23', '91', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('602', 'treediv', '', '', '服务菜单', '', '', '425941', '24', '91', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('675', 'customization', '', '', '首页设置', '', '', '425941', '615', '1', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('682', 'customization', '', '', '首页设置-平台管理员', '', '', '425941', '615', '91', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('683', 'cusproductorder', '', '', '首页设置-平台管理员', '', '', '425941', '623', '91', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('696', 'customization', '', '', '首页设置-运维管理', '', '', '425941', '615', '83', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('697', 'customization', '', '', '首页设置-运营管理', '', '', '425941', '615', '84', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('698', 'customization', '', '', '首页设置-服务提供', '', '', '425941', '615', '85', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('699', 'customization', '', '', '首页设置-租户管理', '', '', '425941', '615', '86', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('700', 'customization', '', '', '首页设置-服务使用者', '', '', '425941', '615', '87', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('701', 'newAnnouncement', '', '', '首页设置', '', '', '425941', '624', '91', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('715', 'homepageconfig', '', '', '首页设置', '', '', '425941', '23', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('716', 'logo', '', '', 'logo', '', '', '425941', '16', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('717', 'editDiv', '', '', '编辑按钮', '', '', '425941', '19', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('718', 'onlineUserDiv', '', '', '在线用户', '', '', '425941', '12', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('719', 'currentUser', '', '', '当前用户', '', '', '425941', '11', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('720', 'treediv', '', '', '服务菜单', '', '', '425941', '24', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('721', 'boardDiv', '', '', '公告', '', '', '425941', '13', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('722', 'findCompDIv', '', '', '主题切换', '', '', '425941', '17', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('723', 'horizon-menu', '', '', '水平菜单', '', '', '425941', '14', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('724', 'customization', '', '', '首页设置-服务使用者', '', '', '425941', '615', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('725', 'systemExit', '', '', '退出', '', '', '425941', '10', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('726', 'column-menu', '', '', '列式菜单', '', '', '425941', '18', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('727', 'workspace', '', '', '主工作区测试-服务使用者', '', '', '425941', '15', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('741', 'cusproductorder', '', '', '首页设置-服务提供', '', '', '425941', '623', '85', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('744', 'findCompDIv', '', '', '主题切换', '', '', '425941', '17', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('745', 'logo', '', '', 'logo', '', '', '425941', '16', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('746', 'currentUser', '', '', '当前用户', '', '', '425941', '11', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('747', 'treediv', '', '', '服务菜单', '', '', '425941', '24', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('749', 'onlineUserDiv', '', '', '在线用户', '', '', '425941', '12', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('750', 'workspace', '', '', '主工作区测试-服务提供者', '', '', '425941', '15', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('751', 'customization', '', '', '首页设置-服务提供', '', '', '425941', '615', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('752', 'editDiv', '', '', '编辑按钮', '', '', '425941', '19', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('753', 'horizon-menu', '', '', '水平菜单', '', '', '425941', '14', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('754', 'homepageconfig', '', '', '首页设置', '', '', '425941', '23', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('755', 'boardDiv', '', '', '公告', '', '', '425941', '13', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('756', 'column-menu', '', '', '列式菜单', '', '', '425941', '18', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('757', 'systemExit', '', '', '退出', '', '', '425941', '10', null, 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('800', 'testV', '', '', 'testV1', '', 'bonc', '425941', '626', null, 'tenant_system', '');
INSERT INTO `portal_portlet_instance` VALUES ('801', 'cusproductorder', '', '', '订单', '', '', '425941', '623', '87', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('802', 'cusproductorder', '', '', '订单', '', '', '425941', '623', '86', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('804', 'cusproductorder', '', '', '订单', '', '', '425941', '623', '83', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('807', 'cusproductorder', '', '', '', '', '', '425941', '623', '84', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('853', 'newAnnouncement', '', '', '', '', '', '425941', '624', '87', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('854', 'newAnnouncement', '', '', '', '', '', '425941', '624', '86', 'tenant_system', 'embed');
INSERT INTO `portal_portlet_instance` VALUES ('855', 'newAnnouncement', '', '', '', '', '', '425941', '624', '85', 'tenant_system', 'embed');

-- ----------------------------
-- Table structure for portal_portlet_portlet_event_rel
-- ----------------------------
DROP TABLE IF EXISTS `portal_portlet_portlet_event_rel`;
CREATE TABLE `portal_portlet_portlet_event_rel` (
  `PORTLET_EVENT_ID` bigint(20) NOT NULL,
  `PORTAL_PORTLET_ID` bigint(20) NOT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  KEY `FKF8E8CBD7CC6F0E19` (`PORTAL_PORTLET_ID`) USING BTREE,
  KEY `FKF8E8CBD7A9B38CD9` (`PORTLET_EVENT_ID`) USING BTREE,
  CONSTRAINT `portal_portlet_portlet_event_rel_ibfk_1` FOREIGN KEY (`PORTLET_EVENT_ID`) REFERENCES `portal_portlet_event` (`ID`),
  CONSTRAINT `portal_portlet_portlet_event_rel_ibfk_2` FOREIGN KEY (`PORTAL_PORTLET_ID`) REFERENCES `portal_portlet` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of portal_portlet_portlet_event_rel
-- ----------------------------

-- ----------------------------
-- Table structure for portal_portlet_theme
-- ----------------------------
DROP TABLE IF EXISTS `portal_portlet_theme`;
CREATE TABLE `portal_portlet_theme` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `THEME_NAME` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `THEME_CODE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=425942 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_portlet_theme
-- ----------------------------
INSERT INTO `portal_portlet_theme` VALUES ('425941', '缺省主题', 'default', 'tenant_system');

-- ----------------------------
-- Table structure for portal_portlet_type
-- ----------------------------
DROP TABLE IF EXISTS `portal_portlet_type`;
CREATE TABLE `portal_portlet_type` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PORTLET_TYPE_NAME` varchar(50) DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of portal_portlet_type
-- ----------------------------
INSERT INTO `portal_portlet_type` VALUES ('1', '常用组件', 'tenant_system');

-- ----------------------------
-- Table structure for portal_sys_property
-- ----------------------------
DROP TABLE IF EXISTS `portal_sys_property`;
CREATE TABLE `portal_sys_property` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `APP_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROP_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROP_VALUE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PROP_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_sys_property
-- ----------------------------
INSERT INTO `portal_sys_property` VALUES ('1', null, 'PORTAL.APPSYS.ADMIN', 'platform', 'tenant_system', '用户最后访问门户应用');

-- ----------------------------
-- Table structure for portal_theme
-- ----------------------------
DROP TABLE IF EXISTS `portal_theme`;
CREATE TABLE `portal_theme` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `THEME_NAME` varchar(50) COLLATE utf8_bin NOT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `THEME_FILE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKFB755C1666B4CB19` (`THEME_FILE_ID`) USING BTREE,
  CONSTRAINT `portal_theme_ibfk_1` FOREIGN KEY (`THEME_FILE_ID`) REFERENCES `portal_theme_file` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_theme
-- ----------------------------
INSERT INTO `portal_theme` VALUES ('1', '默认主题', '默认主题', 'tenant_system', '1');
INSERT INTO `portal_theme` VALUES ('2', '横式主题', '横式菜单主题', 'tenant_system', '2');
INSERT INTO `portal_theme` VALUES ('291', 'newTheme', 'newTheme', 'tenant_system', '291');
INSERT INTO `portal_theme` VALUES ('292', '蓝色主题', 'blueTheme', 'tenant_system', '292');

-- ----------------------------
-- Table structure for portal_theme_file
-- ----------------------------
DROP TABLE IF EXISTS `portal_theme_file`;
CREATE TABLE `portal_theme_file` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `THEME_FILE_PATH` varchar(50) DEFAULT NULL,
  `tenant_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of portal_theme_file
-- ----------------------------
INSERT INTO `portal_theme_file` VALUES ('1', 'default', 'tenant_system');
INSERT INTO `portal_theme_file` VALUES ('2', 'default_horiz', 'tenant_system');
INSERT INTO `portal_theme_file` VALUES ('291', 'newTheme', 'tenant_system');
INSERT INTO `portal_theme_file` VALUES ('292', 'blueTheme', 'tenant_system');

-- ----------------------------
-- Table structure for portal_theme_skin
-- ----------------------------
DROP TABLE IF EXISTS `portal_theme_skin`;
CREATE TABLE `portal_theme_skin` (
  `ID` bigint(19) NOT NULL,
  `THEME_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USERINFO_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of portal_theme_skin
-- ----------------------------

-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `PRIVILEGE_MASTER_VALUE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `DATA_RESOURCE_VALUE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MASTER_TYPE_ID` bigint(19) DEFAULT NULL,
  `DATA_RES_REG_RULE_ID` bigint(19) DEFAULT NULL,
  `RESOURCES_ID` bigint(19) DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PRIVILEGE_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PRIVILEGE_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK481306917D71D35` (`DATA_RES_REG_RULE_ID`) USING BTREE,
  KEY `FK481306917E9DD63B` (`MASTER_TYPE_ID`) USING BTREE,
  KEY `FK48130691BB2F55FE` (`RESOURCES_ID`) USING BTREE,
  CONSTRAINT `privilege_ibfk_1` FOREIGN KEY (`DATA_RES_REG_RULE_ID`) REFERENCES `data_res_reg_rule` (`ID`),
  CONSTRAINT `privilege_ibfk_2` FOREIGN KEY (`MASTER_TYPE_ID`) REFERENCES `master_type` (`ID`),
  CONSTRAINT `privilege_ibfk_3` FOREIGN KEY (`RESOURCES_ID`) REFERENCES `resources` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=100490 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('100068', null, null, null, null, '100095', 'tenant_system', '门户菜单', null, '');
INSERT INTO `privilege` VALUES ('100069', null, null, null, null, '120603', 'tenant_system', 'portal所有功能', null, '');
INSERT INTO `privilege` VALUES ('100070', null, null, null, null, '15', 'tenant_system', 'security理所有功能', null, '');
INSERT INTO `privilege` VALUES ('100071', null, null, null, null, '23', 'tenant_system', '资源列表', null, '');
INSERT INTO `privilege` VALUES ('100072', null, null, null, null, '21', 'tenant_system', '主体管理', null, '');
INSERT INTO `privilege` VALUES ('100073', null, null, null, null, '24', 'tenant_system', '授权LOAD数据', null, '');
INSERT INTO `privilege` VALUES ('100074', null, null, null, null, '25', 'tenant_system', '日志配置', null, '');
INSERT INTO `privilege` VALUES ('100076', null, null, null, null, '12', 'tenant_system', '组织机构管理', null, '');
INSERT INTO `privilege` VALUES ('100077', null, null, null, null, '13', 'tenant_system', '组织机构类型管理', null, '');
INSERT INTO `privilege` VALUES ('100078', null, null, null, null, '10', 'tenant_system', '菜单管理', null, '');
INSERT INTO `privilege` VALUES ('100079', null, null, null, null, '11', 'tenant_system', '角色管理', null, '');
INSERT INTO `privilege` VALUES ('100080', null, null, null, null, '85', 'tenant_system', '资源组管理', null, '');
INSERT INTO `privilege` VALUES ('100081', null, null, null, null, '22', 'tenant_system', '授权管理', null, '');
INSERT INTO `privilege` VALUES ('100082', null, null, null, null, '120605', 'tenant_system', '1_2/SECURITY_MANAGE/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100083', null, null, null, null, '120606', 'tenant_system', '1_2/tenantinfo/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100084', null, null, null, null, '120607', 'tenant_system', '1_2/tenant_data_share/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100085', null, null, null, null, '120608', 'tenant_system', '1_2/tenant_manage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100086', null, null, null, null, '120609', 'tenant_system', '1_2/security_other/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100087', null, null, null, null, '120610', 'tenant_system', '1_2/MASTERTYPE/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100088', null, null, null, null, '120611', 'tenant_system', '1_2/ruleTableDataSource/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100089', null, null, null, null, '120612', 'tenant_system', '1_2/log/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100090', null, null, null, null, '120613', 'tenant_system', '1_2/log_rule/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100091', null, null, null, null, '120614', 'tenant_system', '1_2/orgType/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100092', null, null, null, null, '120615', 'tenant_system', '1_2/security-auth/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100093', null, null, null, null, '120616', 'tenant_system', '1_2/tableInfo/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100094', null, null, null, null, '120617', 'tenant_system', '1_2/DATARESREGRULE/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100095', null, null, null, null, '120618', 'tenant_system', '1_2/RESOURCE/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100096', null, null, null, null, '120619', 'tenant_system', '1_2/extPropertyDefine/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100097', null, null, null, null, '120620', 'tenant_system', '1_2/USERINFO_MANAGE/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100098', null, null, null, null, '120621', 'tenant_system', '1_2/ORGINFO_MANAGE/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100099', null, null, null, null, '120622', 'tenant_system', '1_2/ROLEINFO_MANAGER/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100100', null, null, null, null, '120623', 'tenant_system', '1_2/PORTAL_MANAGE/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100101', null, null, null, null, '120624', 'tenant_system', '1_2/THEME_MANAGE/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100102', null, null, null, null, '120625', 'tenant_system', '1_2/PORTLET_THEME/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100103', null, null, null, null, '120626', 'tenant_system', '1_2/PORTAL_THEME/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100104', null, null, null, null, '120627', 'tenant_system', '1_2/system_board/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100105', null, null, null, null, '120628', 'tenant_system', '1_2/PORTAL_LAYOUT/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100106', null, null, null, null, '120629', 'tenant_system', '1_2/PORTLET_MANAGE/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100107', null, null, null, null, '120630', 'tenant_system', '1_2/propertyInstance/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100108', null, null, null, null, '120631', 'tenant_system', '1_2/PORTAL_PORTLET/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100109', null, null, null, null, '120632', 'tenant_system', '1_2/portletInstance/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100110', null, null, null, null, '120633', 'tenant_system', '1_2/PORTLET_EVENT/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100111', null, null, null, null, '120634', 'tenant_system', '1_2/portletConfig/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100112', null, null, null, null, '120635', 'tenant_system', '1_2/menuinfo/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100113', null, null, null, null, '120636', 'tenant_system', '1_2/PORTAL_PAGE/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100114', null, null, null, null, '120637', 'tenant_system', '1_2/console-services2/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100115', null, null, null, null, '120638', 'tenant_system', '1_2/console-services/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100116', null, null, null, null, '120640', 'tenant_system', '1_2/service-expands/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100117', null, null, null, null, '120641', 'tenant_system', '2_2/props-library/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100118', null, null, null, null, '120642', 'tenant_system', '2_2/order-approval/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100119', null, null, null, null, '120643', 'tenant_system', '2_2/service-category/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100120', null, null, null, null, '120644', 'tenant_system', '2_2/service-provider/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100121', null, null, null, null, '120645', 'tenant_system', '2_2/service-manage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100122', null, null, null, null, '120646', 'tenant_system', '2_2/user-group-manage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100123', null, null, null, null, '120647', 'tenant_system', '2_2/tenant_order-manage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100124', null, null, null, null, '120648', 'tenant_system', '2_2/admin_order-manage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100125', null, null, null, null, '120649', 'tenant_system', '2_2/scheduler/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100126', null, null, null, null, '120650', 'tenant_system', '2_2/quota-manage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100128', null, null, null, null, '120651', 'tenant_system', '3_2/services-mysql/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100131', null, null, null, null, '120657', 'tenant_system', '3_2/service-Qw001/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100132', null, null, null, null, '120658', 'tenant_system', '3_2/service-SQLServer/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100133', null, null, null, null, '120659', 'tenant_system', '3_2/service-resAttrDebug/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100138', null, null, null, null, '120661', 'tenant_system', '订单管理（用户）', null, '');
INSERT INTO `privilege` VALUES ('100139', null, null, null, null, '120662', 'tenant_system', '服务实例资源', null, '');
INSERT INTO `privilege` VALUES ('100140', null, null, null, null, '120663', 'tenant_system', '服务管理', null, '');
INSERT INTO `privilege` VALUES ('100141', null, null, null, null, '120665', 'tenant_system', '3_2/instancemanage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100142', null, null, null, null, '120664', 'tenant_system', '服务实例列表（管理员）', null, '');
INSERT INTO `privilege` VALUES ('100144', null, null, null, null, '120667', 'tenant_system', '-1_2/services-Qw003/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100145', null, null, null, null, '120668', 'tenant_system', '-1_2/services-Qw004/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100146', null, null, null, null, '120669', 'tenant_system', '-1_2/services-renxuanwei/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100147', null, null, null, null, '120670', 'tenant_system', '-1_2/services-testtenant/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100148', null, null, null, null, '120671', 'tenant_system', '100037_2/services-qwe/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100149', null, null, null, null, '120672', 'tenant_system', '100037_2/services-111/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100150', null, null, null, null, '120673', 'tenant_system', '100037_2/services-menutest/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100151', null, null, null, null, '120674', 'tenant_system', '9_2/services-test/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100152', null, null, null, null, '120675', null, '12_2/services-testmenu1/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100153', null, null, null, null, '120676', 'tenant_system', '-1_2/services-testmenu/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100154', null, null, null, null, '120678', 'tenant_system', '100037_445/9/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100155', null, null, null, null, '120679', 'tenant_system', '100037_445/8/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100156', null, null, null, null, '120680', 'tenant_system', '100037_445/7/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100157', null, null, null, null, '120677', 'tenant_system', '角色管理', null, '');
INSERT INTO `privilege` VALUES ('100158', null, null, null, null, '120681', 'tenant_system', '100037_445/-1/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100159', null, null, null, null, '120682', 'tenant_system', '100037_445/12/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100160', null, null, null, null, '120683', 'tenant_system', '-1_2/services-ftp/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100161', null, null, null, null, '120685', 'tenant_system', '-1_2/services-bcm/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100162', null, null, null, null, '120686', 'tenant_system', '-1_2/USER_ROLE_APPROVAL/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100163', null, null, null, null, '120687', 'tenant_system', '-1_2/services-res/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100164', null, null, null, null, '120688', 'tenant_system', '-1_2/services-myservice/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100165', null, null, null, null, '120689', 'tenant_system', '-1_2/services-my_service2/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100166', null, null, null, null, '120690', 'tenant_system', '-1_2/services-testslider/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100167', null, null, null, null, '120691', 'tenant_system', '-1_2/services-tests/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100168', null, null, null, null, '120692', 'tenant_system', '-1_2/services-addResAttr/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100169', null, null, null, null, '120693', 'tenant_system', '-1_2/services-addResAttrSave/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100170', null, null, null, null, '120694', 'tenant_system', '-1_2/services-mataDataModuleTest/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100171', null, null, null, null, '120695', 'tenant_system', '1_2/test/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100172', null, null, null, null, '120696', 'tenant_system', '-1_2/servicesCategory-test/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100173', null, null, null, null, '120697', 'tenant_system', '-1_2/services-myservice1/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100174', null, null, null, null, '120698', 'tenant_system', '-1_2/services-testSer/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100175', null, null, null, null, '120699', 'tenant_system', '-1_2/services-zy1/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100176', null, null, null, null, '120700', 'tenant_system', '-1_2/services-zy3/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100177', null, null, null, null, '120701', 'tenant_system', '-1_2/services-zy4/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100178', null, null, null, null, '120702', 'tenant_system', '-1_2/services-svc123/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100179', null, null, null, null, '120703', 'tenant_system', '-1_2/services-niutest_service/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100180', null, null, null, null, '120704', 'tenant_system', '-1_2/services-service/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100181', null, null, null, null, '120705', 'tenant_system', '-1_2/services-register_test/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100182', null, null, null, null, '120706', 'tenant_system', '-1_2/services-register_test2/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100183', null, null, null, null, '120707', 'tenant_system', '-1_2/services-zytest/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100184', null, null, null, null, '120708', 'tenant_system', '-1_2/services-testzy/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100185', null, null, null, null, '120709', 'tenant_system', '-1_2/servicesCategory-bconsole/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100186', null, null, null, null, '120710', 'tenant_system', '-1_2/services-spesify/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100187', null, null, null, null, '120711', 'tenant_system', '-1_2/servicesCategory-z/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100188', null, null, null, null, '120712', 'tenant_system', '-1_2/servicesCategory-a/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100189', null, null, null, null, '120713', 'tenant_system', '-1_2/services-server1/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100190', null, null, null, null, '120714', 'tenant_system', '-1_2/servicesCategory-xbconsole/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100191', null, null, null, null, '120715', 'tenant_system', '-1_2/services-zymysql/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100192', null, null, null, null, '120716', 'tenant_system', '-1_2/services-zzzymysql/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100193', null, null, null, null, '120717', 'tenant_system', '-1_2/services-song_test/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100194', null, null, null, null, '120718', 'tenant_system', '-1_2/services-testportal3/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100195', null, null, null, null, '120721', 'tenant_system', '12_2/services-sshuzhong/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100196', null, null, null, null, '120722', 'tenant_system', '12_2/租户配额/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100197', null, null, null, null, '120723', 'tenant_system', '-1_2//门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100198', null, null, null, null, '120724', 'tenant_system', '-1_2/BIDeployment/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100199', null, null, null, null, '120725', 'tenant_system', '-1_2/uploadmanage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100200', null, null, null, null, '120726', 'tenant_system', '-1_2/exporttask_index/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100201', null, null, null, null, '120727', 'tenant_system', '-1_2/ahr_new/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100202', null, null, null, null, '120728', 'tenant_system', '-1_2/ahq_new/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100203', null, null, null, null, '120729', 'tenant_system', '-1_2/listreport_new/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100204', null, null, null, null, '120730', 'tenant_system', '-1_2/report-new/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100205', null, null, null, null, '120731', 'tenant_system', '-1_2/sumreport_new/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100206', null, null, null, null, '120732', 'tenant_system', '-1_2/analysis_new/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100207', null, null, null, null, '120733', 'tenant_system', '-1_2/sysparam/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100208', null, null, null, null, '120734', 'tenant_system', '-1_2/design/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100209', null, null, null, null, '120735', 'tenant_system', '-1_2/Blogic/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100210', null, null, null, null, '120736', 'tenant_system', '-1_2/Cloud_service_monitoring/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100211', null, null, null, null, '120737', 'tenant_system', '-1_2/Machine_log_analysis/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100212', null, null, null, null, '120738', 'tenant_system', '-1_2/dataetl/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100213', null, null, null, null, '120739', 'tenant_system', '-1_2/dataMappingManager/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100214', null, null, null, null, '120740', 'tenant_system', '-1_2/dataflow00001/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100215', null, null, null, null, '120741', 'tenant_system', '-1_2/etlset/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100216', null, null, null, null, '120742', 'tenant_system', '-1_2/etlworkres/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100217', null, null, null, null, '120743', 'tenant_system', '-1_2/createetlgraph/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100218', null, null, null, null, '120744', 'tenant_system', '-1_2/etlresourceaddroot/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100219', null, null, null, null, '120745', 'tenant_system', '-1_2/000/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100220', null, null, null, null, '120746', 'tenant_system', '-1_2/etlscheduler/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100221', null, null, null, null, '120747', 'tenant_system', '-1_2/etl_cal_resource/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100222', null, null, null, null, '120748', 'tenant_system', '-1_2/monitor/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100223', null, null, null, null, '120749', 'tenant_system', '-1_2/monitor00015/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100224', null, null, null, null, '120750', 'tenant_system', '-1_2/monitorexception/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100225', null, null, null, null, '120751', 'tenant_system', '-1_2/etlPermissionInit/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100226', null, null, null, null, '120752', 'tenant_system', '-1_2/handle001/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100227', null, null, null, null, '120753', 'tenant_system', '-1_2/monitorexlist/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100228', null, null, null, null, '120754', 'tenant_system', '-1_2/workflowex/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100229', null, null, null, null, '120755', 'tenant_system', '-1_2/monitor00011/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100230', null, null, null, null, '120756', 'tenant_system', '-1_2/bconsole/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100231', null, null, null, null, '120757', 'tenant_system', '-1_2/属性信息库/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100232', null, null, null, null, '120758', 'tenant_system', '-1_2/工单审批/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100233', null, null, null, null, '120759', 'tenant_system', '-1_2/服务信息表扩展/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100234', null, null, null, null, '120760', 'tenant_system', '-1_2/服务分类信息/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100235', null, null, null, null, '120761', 'tenant_system', '-1_2/服务实例/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100236', null, null, null, null, '120762', 'tenant_system', '-1_2/服务提供方/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100237', null, null, null, null, '120763', 'tenant_system', '-1_2/服务注册/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100238', null, null, null, null, '120764', 'tenant_system', '-1_2/申请订单/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100239', null, null, null, null, '120765', 'tenant_system', '-1_2/订单中心/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100240', null, null, null, null, '120766', 'tenant_system', '-1_2/调度任务/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100241', null, null, null, null, '120767', 'tenant_system', '-1_2/XJJM/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100242', null, null, null, null, '120768', 'tenant_system', '-1_2/SJJMPZ/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100243', null, null, null, null, '120769', 'tenant_system', '-1_2/ZMGZPZ/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100244', null, null, null, null, '120770', 'tenant_system', '-1_2/SJKZDYSPZ/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100245', null, null, null, null, '120771', 'tenant_system', '-1_2/MXLB/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100246', null, null, null, null, '120772', 'tenant_system', '-1_2/MXBSJC/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100247', null, null, null, null, '120773', 'tenant_system', '-1_2/bcm/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100248', null, null, null, null, '120774', 'tenant_system', '-1_2/bcm-service/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100249', null, null, null, null, '120775', 'tenant_system', '-1_2/bconsole-bcm/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100250', null, null, null, null, '120777', 'tenant_system', '-1_2/APIManage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100251', null, null, null, null, '120778', 'tenant_system', '-1_2/APIStore/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100252', null, null, null, null, '120779', 'tenant_system', '-1_2/APIpublisher/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100253', null, null, null, null, '120780', 'tenant_system', '-1_2/API-ARRANGE/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100254', null, null, null, null, '120781', 'tenant_system', '1_2/Metadata/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100255', null, null, null, null, '120782', 'tenant_system', '1_2/MetadataInit/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100256', null, null, null, null, '120783', 'tenant_system', '1_2/MetaDataService/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100257', null, null, null, null, '120784', 'tenant_system', '1_2/MetaDataManage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100258', null, null, null, null, '120785', 'tenant_system', '1_2/MetaDataPermission/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100259', null, null, null, null, '120786', 'tenant_system', '1_2/ObjectPermission/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100260', null, null, null, null, '120787', 'tenant_system', '1_2/DirectoryPermission/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100261', null, null, null, null, '120788', 'tenant_system', '1_2/TableMaintain/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100262', null, null, null, null, '120789', 'tenant_system', '1_2/SystemSourceMaintain/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100263', null, null, null, null, '120790', 'tenant_system', '1_2/IndRefDoc/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100264', null, null, null, null, '120791', 'tenant_system', '1_2/IntFileSpecification/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100265', null, null, null, null, '120792', 'tenant_system', '1_2/ManageDimMaintain/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100266', null, null, null, null, '120793', 'tenant_system', '1_2/LogicModel/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100267', null, null, null, null, '120794', 'tenant_system', '1_2/ModelManage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100268', null, null, null, null, '120795', 'tenant_system', '1_2/SharingCenter/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100269', null, null, null, null, '120796', 'tenant_system', '1_2/ParmConfigCenter/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100270', null, null, null, null, '120797', 'tenant_system', '1_2/APPManage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100271', null, null, null, null, '120798', 'tenant_system', '1_2/EXC/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100272', null, null, null, null, '120799', 'tenant_system', '1_2/ExcObservations/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100273', null, null, null, null, '120800', 'tenant_system', '1_2/ExcObservationRules/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100274', null, null, null, null, '120801', 'tenant_system', '1_2/Search/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100275', null, null, null, null, '120802', 'tenant_system', '1_2/CacheManage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100276', null, null, null, null, '120803', 'tenant_system', '1_2/CustomSearch/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100277', null, null, null, null, '120804', 'tenant_system', '1_2/ChangeTimeAxis/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100278', null, null, null, null, '120805', 'tenant_system', '1_2/DataCenter/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100279', null, null, null, null, '120806', 'tenant_system', '1_2/DataMap/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100280', null, null, null, null, '120807', 'tenant_system', '1_2/DataService/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100281', null, null, null, null, '120808', 'tenant_system', '1_2/ProductTagCenter/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100282', null, null, null, null, '120809', 'tenant_system', '1_2/ProductTagManage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100283', null, null, null, null, '120810', 'tenant_system', '1_2/ProductPublisher/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100284', null, null, null, null, '120811', 'tenant_system', '1_2/JobsMonitor/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100285', null, null, null, null, '120812', 'tenant_system', '1_2/ProductTagMonitor/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100286', null, null, null, null, '120813', 'tenant_system', '1_2/ProductTagMonitorDetail/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100287', null, null, null, null, '120814', 'tenant_system', '1_2/JobsExcList/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100288', null, null, null, null, '120815', 'tenant_system', '1_2/AdminMonitor/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100289', null, null, null, null, '120816', 'tenant_system', '1_2/DataServicePermInit/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100290', null, null, null, null, '120817', 'tenant_system', '1_2/ServiceApplication/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100291', null, null, null, null, '120818', 'tenant_system', '1_2/ProductTagCollection/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100292', null, null, null, null, '120819', 'tenant_system', '1_2/ProductTagShopping/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100293', null, null, null, null, '120820', 'tenant_system', '1_2/ProductApplication/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100294', null, null, null, null, '120821', 'tenant_system', '1_2/ConfigManage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100295', null, null, null, null, '120822', 'tenant_system', '1_2/SendModeConfig/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100296', null, null, null, null, '120823', 'tenant_system', '1_2/LogicConfig/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100297', null, null, null, null, '120824', 'tenant_system', '1_2/ProcessMaintain/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100298', null, null, null, null, '120825', 'tenant_system', '1_2/GetModeConfig/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100299', null, null, null, null, '120826', 'tenant_system', '1_2/ResourceConfig/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100300', null, null, null, null, '120827', 'tenant_system', '-1_2/DataQuality/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100301', null, null, null, null, '120828', 'tenant_system', '-1_2/AuditJob/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100302', null, null, null, null, '120829', 'tenant_system', '-1_2/AuditMonitor/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100303', null, null, null, null, '120830', 'tenant_system', '-1_2/AuditProDetailModel/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100304', null, null, null, null, '120831', 'tenant_system', '-1_2/AuditResultDetailSearch/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100305', null, null, null, null, '120832', 'tenant_system', '-1_2/AuditResultSearch/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100306', null, null, null, null, '120833', 'tenant_system', '-1_2/AuditRuleEntrance/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100307', null, null, null, null, '120834', 'tenant_system', '-1_2/AuditRuleStatistical/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100308', null, null, null, null, '120835', 'tenant_system', '-1_2/AuditRuleSearch/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100309', null, null, null, null, '120836', 'tenant_system', '-1_2/AuditConfig/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100310', null, null, null, null, '120837', 'tenant_system', '-1_2/AuditProblemConfig/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100311', null, null, null, null, '120838', 'tenant_system', '-1_2/AuditProblemDetailSearch/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100312', null, null, null, null, '120839', 'tenant_system', '-1_2/AuditProblemManage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100313', null, null, null, null, '120840', 'tenant_system', '-1_2/QuestionSearchTemplate/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100314', null, null, null, null, '120842', 'tenant_system', '100101_2/TENANT_TYPE/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100315', null, null, null, null, '120843', 'tenant_system', '100101_2/RoleMapping/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100316', null, null, null, null, '120844', 'tenant_system', '100101_2/RoleService/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100317', null, null, null, null, '120845', 'tenant_system', '100101_2/ROLEINFO_CONFIG/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100318', null, null, null, null, '120846', 'tenant_system', '100101_2/EMAIL_CONFIG/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100319', null, null, null, null, '120853', 'tenant_system', '12_2/BPM/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100320', null, null, null, null, '120854', 'tenant_system', '12_2/Services_manageService/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100321', null, null, null, null, '120855', 'tenant_system', '12_2/task-list/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100322', null, null, null, null, '120856', 'tenant_system', '12_2/UserDelegate_manage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100323', null, null, null, null, '120857', 'tenant_system', '12_2/extService/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100324', null, null, null, null, '120858', 'tenant_system', '12_2/mynewtask/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100325', null, null, null, null, '120859', 'tenant_system', '12_2/ModelMonitor/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100326', null, null, null, null, '120860', 'tenant_system', '12_2/ModeManage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100327', null, null, null, null, '120861', 'tenant_system', '12_2/category-tree/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100328', null, null, null, null, '120862', 'tenant_system', '12_2/model_list/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100329', null, null, null, null, '120863', 'tenant_system', '12_2/FormDef/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100330', null, null, null, null, '120864', 'tenant_system', '-1_2/数据域扩展/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100331', null, null, null, null, '120866', 'tenant_system', '-1_2/services-dcos/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100332', null, null, null, null, '120865', 'tenant_system', '云控制台所有功能', null, '');
INSERT INTO `privilege` VALUES ('100333', null, null, null, null, '120867', 'tenant_system', '-1_2/services-redis/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100334', null, null, null, null, '120869', 'tenant_system', '-1_2/servicesCategory-ftp/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100335', null, null, null, null, '120871', 'tenant_system', '-1_2/services-testvr/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100336', null, null, null, null, '120870', 'tenant_system', '容器云所有功能', null, '');
INSERT INTO `privilege` VALUES ('100337', null, null, null, null, '120872', 'tenant_system', '-1_2/DCOS/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100338', null, null, null, null, '120873', 'tenant_system', '-1_2/services-ceshi/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100339', null, null, null, null, '120874', 'tenant_system', '-1_2/services-testzlm/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100340', null, null, null, null, '120875', 'tenant_system', '-1_2/servicesCategory-mysql_qwer/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100341', null, null, null, null, '120876', 'tenant_system', '-1_2/services-zhenglm/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100342', null, null, null, null, '120877', 'tenant_system', '-1_2/services-zhenglm2/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100343', null, null, null, null, '120878', 'tenant_system', '-1_2/services-zhenglm3/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100344', null, null, null, null, '120879', 'tenant_system', '-1_2/services-zhenglm4/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100345', null, null, null, null, '120880', 'tenant_system', '-1_2/services-123/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100346', null, null, null, null, '120881', 'tenant_system', '-1_2/services-1231/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100347', null, null, null, null, '120882', 'tenant_system', '-1_2/services-zhenglm5/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100348', null, null, null, null, '120883', 'tenant_system', '-1_2/services-zlm123/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100349', null, null, null, null, '120884', 'tenant_system', '-1_2/services-zlm456/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100350', null, null, null, null, '120885', 'tenant_system', '-1_2/services-23/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100351', null, null, null, null, '120886', 'tenant_system', '-1_2/services-zlm789/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100352', null, null, null, null, '120887', 'tenant_system', '-1_2/services-da/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100353', null, null, null, null, '120888', 'tenant_system', '-1_2/bconsole_app_resources/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100354', null, null, null, null, '120889', 'tenant_system', '-1_2/services-1/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100355', null, null, null, null, '120890', 'tenant_system', '-1_2/services-123445/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100356', null, null, null, null, '120891', 'tenant_system', '-1_2/services-test01/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100357', null, null, null, null, '120892', 'tenant_system', '-1_2/services-13123/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100358', null, null, null, null, '120893', 'tenant_system', '-1_2/services-zlmzlm/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100359', null, null, null, null, '120894', 'tenant_system', '-1_2/services-test8/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100360', null, null, null, null, '120895', 'tenant_system', '-1_2/services-mysql2/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100361', null, null, null, null, '120896', 'tenant_system', '-1_2/services-redis1/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100362', null, null, null, null, '120897', 'tenant_system', '-1_2/services-mysql10000/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100363', null, null, null, null, '120898', 'tenant_system', '-1_431/{userinfo.id}/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100364', null, null, null, null, '120899', 'tenant_system', '-1_445/12/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100365', null, null, null, null, '120900', 'tenant_system', '-1_445/9/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100366', null, null, null, null, '120901', 'tenant_system', '-1_445/8/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100367', null, null, null, null, '120902', 'tenant_system', '-1_445/7/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100368', null, null, null, null, '120903', 'tenant_system', '-1_2/servicesCategory-zy_redis/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100369', null, null, null, null, '120904', 'tenant_system', '-1_2/BDA_UI/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100370', null, null, null, null, '120905', 'tenant_system', '-1_2/BDA_UI_MODELSEARCH/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100371', null, null, null, null, '120906', 'tenant_system', '-1_2/BDA_UI_MODEL_LIST/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100372', null, null, null, null, '120907', 'tenant_system', '-1_2/BDA_UI_MODEL_DETECTION/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100373', null, null, null, null, '120908', 'tenant_system', '-1_2/BDA_UI_DEVELOPER/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100374', null, null, null, null, '120909', 'tenant_system', '-1_2/BDA_UI_SETTING/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100375', null, null, null, null, '120910', 'tenant_system', '-1_2/BDA_UI_LOGIC_RULE/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100376', null, null, null, null, '120911', 'tenant_system', '-1_2/BDA_UI_CUSTOMPARAM/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100377', null, null, null, null, '120912', 'tenant_system', '-1_2/metaCodeLogicPartition/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100378', null, null, null, null, '120914', 'tenant_system', '-1_2/market/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100379', null, null, null, null, '120915', 'tenant_system', '-1_2/services-zlm_redis/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100380', null, null, null, null, '120916', 'tenant_system', '-1_2/servicesCategory-kafka/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100381', null, null, null, null, '120917', 'tenant_system', '78_445/78/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100382', null, null, null, null, '120918', 'tenant_system', '78_445/80/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100383', null, null, null, null, '120919', 'tenant_system', '78_445/79/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100384', null, null, null, null, '120920', 'tenant_system', '-1_2/services-kafka/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100385', null, null, null, null, '120921', 'tenant_system', '-1_445/-1/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100386', null, null, null, null, '120922', 'tenant_system', '-1_2/es_search/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100387', null, null, null, null, '120923', 'tenant_system', '-1_2/services-mysql_xzh/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100388', null, null, null, null, '120924', 'tenant_system', '-1_2/servicesCategory-mysql_dcos/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100389', null, null, null, null, '120925', 'tenant_system', '-1_2/servicesCategory-redis/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100390', null, null, null, null, '120927', 'tenant_system', '-1_2/servicesCategory-mysql/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100391', null, null, null, null, '120928', 'tenant_system', '-1_2/servicesCategory-mysqlxzh/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100392', null, null, null, null, '120929', 'tenant_system', '-1_2/servicesCategory-mysqlxzh/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100393', null, null, null, null, '120930', 'tenant_system', '-1_2/servicesCategory-redisxzh/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100394', null, null, null, null, '120931', 'tenant_system', '-1_2/servicesCategory-ftpxzh/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100395', null, null, null, null, '120932', 'tenant_system', '-1_2/servicesCategory-CloudDatabase/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100396', null, null, null, null, '120933', 'tenant_system', '-1_2/services-mysql1/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100397', null, null, null, null, '120934', 'tenant_system', '-1_2/servicesCategory-basicResource/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100398', null, null, null, null, '120935', 'tenant_system', '-1_2/services-docker/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100399', null, null, null, null, '120936', 'tenant_system', '-1_2/services-docker1/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100400', null, null, null, null, '120937', 'tenant_system', '-1_2/services-webServer/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100401', null, null, null, null, '120938', 'tenant_system', '-1_2/services-clusterModel1/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100402', null, null, null, null, '120939', 'tenant_system', '-1_2/services-clusterModel2/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100403', null, null, null, null, '120940', 'tenant_system', '-1_2/services-index11/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100404', null, null, null, null, '120926', 'tenant_system', 'DCOS', null, '');
INSERT INTO `privilege` VALUES ('100405', null, null, null, null, '121000', 'tenant_system', '-1_2/tenant_approval/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100406', null, null, null, null, '121001', 'tenant_system', '-1_2/mycase/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100407', null, null, null, null, '121002', 'tenant_system', '-1_2/servicecase/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100408', null, null, null, null, '121003', 'tenant_system', '-1_2/service_register/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100409', null, null, null, null, '121004', 'tenant_system', '7_2/订单管理/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100410', null, null, null, null, '121005', 'tenant_system', '107_2/日志监控/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100411', null, null, null, null, '121006', 'tenant_system', '107_2/blogic/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100412', null, null, null, null, '121007', 'tenant_system', '-1_445/69/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100413', null, null, null, null, '121008', 'tenant_system', '1_445/1/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100414', null, null, null, null, '121009', 'tenant_system', '1_445/107/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100415', null, null, null, null, '121010', 'tenant_system', '1_445/106/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100416', null, null, null, null, '121011', 'tenant_system', '1_2/dashboard_test0/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100417', null, null, null, null, '121012', 'tenant_system', '1_2/我的订单/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100418', null, null, null, null, '121013', 'tenant_system', '1_2/订单审批/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100419', null, null, null, null, '121014', 'tenant_system', '1_2/pageModel/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100420', null, null, null, null, '121015', 'tenant_system', '1_2/pageModuleManage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100421', null, null, null, null, '121016', 'tenant_system', '1_2/pageResManage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100422', null, null, null, null, '121017', 'tenant_system', '1_2/pageModelManage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100423', null, null, null, null, '121018', 'tenant_system', '1_2/producttype/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100424', null, null, null, null, '121019', 'tenant_system', '1_2/blogic-log/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100425', null, null, null, null, '121020', 'tenant_system', '108_2/service_manage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100426', null, null, null, null, '121021', 'tenant_system', '108_2/配额管理/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100427', null, null, null, null, '121022', 'tenant_system', '1_445/108/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100428', null, null, null, null, '121023', 'tenant_system', '108_2/dataModeling/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100429', null, null, null, null, '121024', 'tenant_system', '1_2/middleware/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100430', null, null, null, null, '121025', 'tenant_system', '1_2/kafka/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100431', null, null, null, null, '121026', 'tenant_system', '1_2/zookeeper/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100432', null, null, null, null, '121027', 'tenant_system', '1_2/bigDataComponent/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100433', null, null, null, null, '121028', 'tenant_system', '1_2/Elasticsearch/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100434', null, null, null, null, '121029', 'tenant_system', '1_2/Hive/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100435', null, null, null, null, '121030', 'tenant_system', '1_2/Storm/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100436', null, null, null, null, '121031', 'tenant_system', '1_2/yarn/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100437', null, null, null, null, '121032', 'tenant_system', '1_2/databaseCache/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100438', null, null, null, null, '121033', 'tenant_system', '1_2/Memcached/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100439', null, null, null, null, '121034', 'tenant_system', '1_2/Mysql/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100440', null, null, null, null, '121035', 'tenant_system', '1_2/Redis/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100441', null, null, null, null, '121036', 'tenant_system', '-1_445/109/角色管理', null, '2');
INSERT INTO `privilege` VALUES ('100442', null, null, null, null, '121037', 'tenant_system', '-1_534/{userinfo.loginId}/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100443', null, null, null, null, '121038', 'tenant_system', '1_2/productBrowse/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100444', null, null, null, null, '121039', 'tenant_system', '1_2/ftp/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100445', null, null, null, null, '121041', 'tenant_system', '1_2/storage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100446', null, null, null, null, '121042', 'tenant_system', '1_2/blockStorage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100447', null, null, null, null, '121043', 'tenant_system', '1_2/backups/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100448', null, null, null, null, '121044', 'tenant_system', '1_2/objectStorage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100449', null, null, null, null, '121045', 'tenant_system', '1_2/fileStore/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100450', null, null, null, null, '121046', 'tenant_system', '1_2/application/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100451', null, null, null, null, '121047', 'tenant_system', '1_2/overview/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100452', null, null, null, null, '121048', 'tenant_system', '1_2/bcmService/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100453', null, null, null, null, '121049', 'tenant_system', '1_2/strategy/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100454', null, null, null, null, '121050', 'tenant_system', '1_2/toConfigure/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100455', null, null, null, null, '121051', 'tenant_system', '1_2/logMonitoring/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100456', null, null, null, null, '121052', 'tenant_system', '1_2/colony/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100457', null, null, null, null, '121053', 'tenant_system', '1_2/mirrorImage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100458', null, null, null, null, '121054', 'tenant_system', '1_2/myCollection/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100459', null, null, null, null, '121055', 'tenant_system', '1_2/myMirror/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100460', null, null, null, null, '121056', 'tenant_system', '1_2/mirrorCenter/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100461', null, null, null, null, '121057', 'tenant_system', '1_2/mirrorConstruction/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100462', null, null, null, null, '121058', 'tenant_system', '1_2/quotaOfMine/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100463', null, null, null, null, '121059', 'tenant_system', '1_2/layout/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100464', null, null, null, null, '121060', 'tenant_system', '1_2/announcement/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100465', null, null, null, null, '121061', 'tenant_system', '1_2/数据字典/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100466', null, null, null, null, '121062', 'tenant_system', '1_2/项目管理/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100467', null, null, null, null, '121063', 'tenant_system', '1_2/dataMode/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100468', null, null, null, null, '121064', 'tenant_system', '1_2/projectModel/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100469', null, null, null, null, '121065', 'tenant_system', '-1_2/taskes/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100470', null, null, null, null, '121066', 'tenant_system', '-1_2/envVariable/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100471', null, null, null, null, '121067', 'tenant_system', '-1_2/configFile/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100472', null, null, null, null, '121068', 'tenant_system', '-1_2/publicMirror/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100473', null, null, null, null, '121069', 'tenant_system', '-1_2/mirrorList/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100474', null, null, null, null, '121070', 'tenant_system', '-1_2/dockerfileConstructs/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100475', null, null, null, null, '121071', 'tenant_system', '-1_2/codeConstruction/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100476', null, null, null, null, '121072', 'tenant_system', '-1_2/collectionDeploy/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100477', null, null, null, null, '121073', 'tenant_system', '-1_2/code/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100478', null, null, null, null, '121074', 'tenant_system', '-1_2/codeRelation/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100479', null, null, null, null, '121075', 'tenant_system', '-1_2/x_image_codebaseList/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100480', null, null, null, null, '121076', 'tenant_system', '-1_2/x_app_env_page/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100481', null, null, null, null, '121077', 'tenant_system', '-1_2/x_app_config_create_page/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100482', null, null, null, null, '121078', 'tenant_system', '109_2/prometheus/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100483', null, null, null, null, '121079', 'tenant_system', '106_2/x_productPackage_page/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100484', null, null, null, null, '121080', 'tenant_system', '106_2/x_app_service_serviceDetailPage/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100485', null, null, null, null, '121081', 'tenant_system', '106_2/x_productCase_component_detail_redis/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100486', null, null, null, null, '121082', 'tenant_system', '-1_2/mycase1/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100487', null, null, null, null, '121083', 'tenant_system', '-1_2/codeChecking_list/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100488', null, null, null, null, '121084', 'tenant_system', '-1_2/x_app/门户菜单', null, '2');
INSERT INTO `privilege` VALUES ('100489', null, null, null, null, '121085', 'tenant_system', '-1_2/x_app_springcloud/门户菜单', null, '2');

-- ----------------------------
-- Table structure for question_answer
-- ----------------------------
DROP TABLE IF EXISTS `question_answer`;
CREATE TABLE `question_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_answer
-- ----------------------------

-- ----------------------------
-- Table structure for question_info
-- ----------------------------
DROP TABLE IF EXISTS `question_info`;
CREATE TABLE `question_info` (
  `ID` bigint(20) NOT NULL,
  `QUESTION_VALUE` longtext,
  `QUESTION_CODE` varchar(255) DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_info
-- ----------------------------

-- ----------------------------
-- Table structure for resources
-- ----------------------------
DROP TABLE IF EXISTS `resources`;
CREATE TABLE `resources` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `RESOUCE_CODE` varchar(255) COLLATE utf8_bin NOT NULL,
  `RESOURCE_NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `RESOURCE_TYPE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_DESC` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESOUCE_URL` varchar(3000) COLLATE utf8_bin DEFAULT NULL,
  `SYSTEM_NO` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `UI_CLASS` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `DATA_RESOURCE_VALUE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_RESOURCE_FILTER_TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCES_ID` bigint(19) DEFAULT NULL,
  `DATA_RES_REG_RULE_ID` bigint(19) DEFAULT NULL,
  `TABLE_INFO_ID` bigint(19) DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `URL_RESOURCES_ID` bigint(19) DEFAULT NULL,
  `GROUP_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `ORD` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `IS_HIDE` bit(1) DEFAULT NULL,
  `INTERFACETYPE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `ISMUTITENANT` bigint(20) DEFAULT NULL,
  `MENUID` bigint(20) DEFAULT NULL,
  `INTERFACEURL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ADDRESSTYPE` varchar(19) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK2FE4CE055D6D2ADB` (`TABLE_INFO_ID`) USING BTREE,
  KEY `FK2FE4CE057D71D35` (`DATA_RES_REG_RULE_ID`) USING BTREE,
  KEY `FK2FE4CE05A2BF86CE` (`URL_RESOURCES_ID`) USING BTREE,
  KEY `FK2FE4CE05BB2F55FE` (`RESOURCES_ID`) USING BTREE,
  CONSTRAINT `resources_ibfk_1` FOREIGN KEY (`TABLE_INFO_ID`) REFERENCES `table_info` (`ID`),
  CONSTRAINT `resources_ibfk_2` FOREIGN KEY (`DATA_RES_REG_RULE_ID`) REFERENCES `data_res_reg_rule` (`ID`),
  CONSTRAINT `resources_ibfk_3` FOREIGN KEY (`URL_RESOURCES_ID`) REFERENCES `resources` (`ID`),
  CONSTRAINT `resources_ibfk_4` FOREIGN KEY (`RESOURCES_ID`) REFERENCES `resources` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=121086 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of resources
-- ----------------------------
INSERT INTO `resources` VALUES ('1', 'portal', '门户系统', '4', '门户系统', '/portal', '', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('2', 'security', '安全系统', '4', '安全系统', '/security', '', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('10', 'MENU_MANAGE', '菜单管理', '1', '菜单管理', '(.*?/menuinfo!list.*?)|(.*?/menuinfo!edit.*?)|(.*?/menuinfo!asyncDeleteAll.*?)', 'portal', null, null, null, null, null, null, 'tenant_system', null, null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('11', 'ROLE_MANAGE', '角色管理', '1', '角色管理', '(.*?/roleinfo!.*?)|(.*?/userinfo!processApproval.*)', 'security', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('12', 'ORGINFO_MANAGE', '组织机构管理', '1', '组织机构管理', '(.*?/orginfo!.*?)', 'security', null, null, null, null, null, null, 'tenant_system', null, null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('13', 'ORGTYPE_MANAGE', '组织机构类型管理', '1', '组织机构类型管理', '(.*?/orgType!.*?)', 'security', null, null, null, null, null, null, 'tenant_system', null, null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('15', 'SECURITY_ALL_URL', 'security理所有功能', '1', '所有URL', '.*', 'security', null, null, null, null, null, null, 'tenant_system', null, null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('21', 'MASTER_MANAGE', '主体管理', '1', '主体管理', '(.*?/masterType!.*?)', 'security', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('22', 'AUTH_MANAGE', '授权管理', '1', '', '(.*/privilege/AuthPermission.*)|(\"/privilege/RecoverPermission\")|(.*privilegeGroup.*)|(.*resourcesGroup!getGroupTree.action.*)|(.*/permission!.*)|(.*?/privilege!toauthMarster.action.*?)|(.*?/privilege!getMarsterValueTabel.action.*?)|(.*/privilege!.*Do.*)|(.*auth.action.*)|(.*resources!listUrl.action.*)|(.*resources!getSelectListD.action.*)|(.*resources!todataAuth.action.*)|(.*resources!todataAuth.action.*) |(.*dataResRegRule!getTables.action.*)|(.*resources!listUI.action.*)|(.*resources!listOther.action.*)|(.*?/privilege!getPrivilegeTreeData.action.*?)', 'security', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('23', 'RESOURCE_LIST', '资源列表', '1', null, '.*/security/resources.*', 'security', null, null, null, null, null, null, 'tenant_system', null, null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('24', 'AUTH_LOAD_DATA', '授权LOAD数据', '1', '', '.*/dataResRegRule!getTables.action.*', 'security', '', '', '', null, null, null, 'tenant_system', null, null, '', '', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('25', 'URL_LOG_RULE', '日志配置', '1', null, '(.*logRule!.*)|(.*/rest/logRule/findAllRule.*)', 'security', null, null, null, null, null, null, 'tenant_system', null, null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('85', 'RESOURCE_GROUP_MANAGER', '资源组管理', '1', null, '(.*resourcesGroup.*)|(.*resources!edit.*)|(.*resources!add.*)', 'security', null, null, null, null, null, null, 'tenant_system', null, null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('100095', 'PORTAL_MENU', '门户菜单', '1', '门户菜单', '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120603', 'PORTAL_ALL_URL', 'portal所有功能', '1', '门户所有url', '.*', 'portal', null, null, null, null, null, null, 'tenant_system', null, null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120604', 'bconsole', '云控制台', '4', '云控制台', '/bconsole', '', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120605', '2/SECURITY_MANAGE/PORTAL_MENU', '2/SECURITY_MANAGE/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'SECURITY_MANAGE', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120606', '2/tenantinfo/PORTAL_MENU', '2/tenantinfo/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'tenantinfo', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120607', '2/tenant_data_share/PORTAL_MENU', '2/tenant_data_share/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'tenant_data_share', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120608', '2/tenant_manage/PORTAL_MENU', '2/tenant_manage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'tenant_manage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120609', '2/security_other/PORTAL_MENU', '2/security_other/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'security_other', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120610', '2/MASTERTYPE/PORTAL_MENU', '2/MASTERTYPE/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'MASTERTYPE', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120611', '2/ruleTableDataSource/PORTAL_MENU', '2/ruleTableDataSource/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'ruleTableDataSource', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120612', '2/log/PORTAL_MENU', '2/log/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'log', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120613', '2/log_rule/PORTAL_MENU', '2/log_rule/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'log_rule', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120614', '2/orgType/PORTAL_MENU', '2/orgType/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'orgType', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120615', '2/security-auth/PORTAL_MENU', '2/security-auth/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'security-auth', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120616', '2/tableInfo/PORTAL_MENU', '2/tableInfo/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'tableInfo', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120617', '2/DATARESREGRULE/PORTAL_MENU', '2/DATARESREGRULE/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'DATARESREGRULE', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120618', '2/RESOURCE/PORTAL_MENU', '2/RESOURCE/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'RESOURCE', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120619', '2/extPropertyDefine/PORTAL_MENU', '2/extPropertyDefine/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'extPropertyDefine', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120620', '2/USERINFO_MANAGE/PORTAL_MENU', '2/USERINFO_MANAGE/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'USERINFO_MANAGE', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120621', '2/ORGINFO_MANAGE/PORTAL_MENU', '2/ORGINFO_MANAGE/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'ORGINFO_MANAGE', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120622', '2/ROLEINFO_MANAGER/PORTAL_MENU', '2/ROLEINFO_MANAGER/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'ROLEINFO_MANAGER', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120623', '2/PORTAL_MANAGE/PORTAL_MENU', '2/PORTAL_MANAGE/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'PORTAL_MANAGE', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120624', '2/THEME_MANAGE/PORTAL_MENU', '2/THEME_MANAGE/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'THEME_MANAGE', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120625', '2/PORTLET_THEME/PORTAL_MENU', '2/PORTLET_THEME/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'PORTLET_THEME', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120626', '2/PORTAL_THEME/PORTAL_MENU', '2/PORTAL_THEME/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'PORTAL_THEME', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120627', '2/system_board/PORTAL_MENU', '2/system_board/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'system_board', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120628', '2/PORTAL_LAYOUT/PORTAL_MENU', '2/PORTAL_LAYOUT/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'PORTAL_LAYOUT', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120629', '2/PORTLET_MANAGE/PORTAL_MENU', '2/PORTLET_MANAGE/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'PORTLET_MANAGE', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120630', '2/propertyInstance/PORTAL_MENU', '2/propertyInstance/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'propertyInstance', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120631', '2/PORTAL_PORTLET/PORTAL_MENU', '2/PORTAL_PORTLET/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'PORTAL_PORTLET', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120632', '2/portletInstance/PORTAL_MENU', '2/portletInstance/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'portletInstance', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120633', '2/PORTLET_EVENT/PORTAL_MENU', '2/PORTLET_EVENT/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'PORTLET_EVENT', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120634', '2/portletConfig/PORTAL_MENU', '2/portletConfig/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'portletConfig', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120635', '2/menuinfo/PORTAL_MENU', '2/menuinfo/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'menuinfo', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120636', '2/PORTAL_PAGE/PORTAL_MENU', '2/PORTAL_PAGE/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'PORTAL_PAGE', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120637', '2/console-services2/PORTAL_MENU', '2/console-services2/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'console-services2', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120638', '2/console-services/PORTAL_MENU', '2/console-services/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'console-services', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120640', '2/service-expands/PORTAL_MENU', '2/service-expands/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'service-expands', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120641', '2/props-library/PORTAL_MENU', '2/props-library/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'props-library', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120642', '2/order-approval/PORTAL_MENU', '2/order-approval/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'order-approval', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120643', '2/service-category/PORTAL_MENU', '2/service-category/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'service-category', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120644', '2/service-provider/PORTAL_MENU', '2/service-provider/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'service-provider', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120645', '2/service-manage/PORTAL_MENU', '2/service-manage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'service-manage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120646', '2/user-group-manage/PORTAL_MENU', '2/user-group-manage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'user-group-manage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120647', '2/tenant_order-manage/PORTAL_MENU', '2/tenant_order-manage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'tenant_order-manage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120648', '2/admin_order-manage/PORTAL_MENU', '2/admin_order-manage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'admin_order-manage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120649', '2/scheduler/PORTAL_MENU', '2/scheduler/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'scheduler', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120650', '2/quota-manage/PORTAL_MENU', '2/quota-manage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'quota-manage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120651', '2/services-mysql/PORTAL_MENU', '2/services-mysql/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'services-mysql', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120657', '2/service-Qw001/PORTAL_MENU', '2/service-Qw001/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'service-Qw001', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120658', '2/service-SQLServer/PORTAL_MENU', '2/service-SQLServer/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'service-SQLServer', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120659', '2/service-resAttrDebug/PORTAL_MENU', '2/service-resAttrDebug/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'service-resAttrDebug', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120661', 'res_service-order-manage', '订单管理（用户）', '1', '订单管理（用户）', '.*/tenant/order-mana.*|.*v1.*', 'bconsole', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120662', 'res_service-instance', '服务实例(用户)', '1', '', '.*/console-home/service-instance/.*|.*v1.*', 'bconsole', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120663', 'res_service-manage', '服务管理', '1', '', '.*service-.*|.*control-.*|.*props-.*|.*quota-manage|.*user-group-manage|.*admin/order-manage|.*service-instance-manage.*|.*scheduler-task-manage|.*v1.*', 'bconsole', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120664', 'res_instance-manage', '服务实例（管理员）', '1', '', '.*/service-instance-manage/.*|.*v1/.*', 'bconsole', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120665', '2/instancemanage/PORTAL_MENU', '2/instancemanage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'instancemanage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120667', '2/services-Qw003/PORTAL_MENU', '2/services-Qw003/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'services-Qw003', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120668', '2/services-Qw004/PORTAL_MENU', '2/services-Qw004/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'services-Qw004', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120669', '2/services-renxuanwei/PORTAL_MENU', '2/services-renxuanwei/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'services-renxuanwei', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120670', '2/services-testtenant/PORTAL_MENU', '2/services-testtenant/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)', 'portal', null, 'services-testtenant', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120671', '2/services-qwe/PORTAL_MENU', '2/services-qwe/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-qwe', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120672', '2/services-111/PORTAL_MENU', '2/services-111/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-111', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120673', '2/services-menutest/PORTAL_MENU', '2/services-menutest/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-menutest', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120674', '2/services-test/PORTAL_MENU', '2/services-test/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-test', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120675', '2/services-testmenu1/PORTAL_MENU', '2/services-testmenu1/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-testmenu1', 'listType', null, '2', null, null, '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120676', '2/services-testmenu/PORTAL_MENU', '2/services-testmenu/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-testmenu', 'listType', null, '2', null, 'tenant_system', null, null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120677', 'Privilege_ROLE_CONTROL', '角色管理', '1', '', '', 'security', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120678', '445/9/Privilege_ROLE_CONTROL', '445/9/角色管理', '2', null, '', 'bconsole', null, '9', 'listType', null, '445', null, 'tenant_system', '120677', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120679', '445/8/Privilege_ROLE_CONTROL', '445/8/角色管理', '2', null, '', 'bconsole', null, '8', 'listType', null, '445', null, 'tenant_system', '120677', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120680', '445/7/Privilege_ROLE_CONTROL', '445/7/角色管理', '2', null, '', 'bconsole', null, '7', 'listType', null, '445', null, 'tenant_system', '120677', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120681', '445/-1/Privilege_ROLE_CONTROL', '445/-1/角色管理', '2', null, '', 'bconsole', null, '-1', 'listType', null, '445', null, 'tenant_system', '120677', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120682', '445/12/Privilege_ROLE_CONTROL', '445/12/角色管理', '2', null, '', 'bconsole', null, '12', 'listType', null, '445', null, 'tenant_system', '120677', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120683', '2/services-ftp/PORTAL_MENU', '2/services-ftp/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-ftp', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120685', '2/services-bcm/PORTAL_MENU', '2/services-bcm/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-bcm', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120686', '2/USER_ROLE_APPROVAL/PORTAL_MENU', '2/USER_ROLE_APPROVAL/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'USER_ROLE_APPROVAL', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120687', '2/services-res/PORTAL_MENU', '2/services-res/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-res', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120688', '2/services-myservice/PORTAL_MENU', '2/services-myservice/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-myservice', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120689', '2/services-my_service2/PORTAL_MENU', '2/services-my_service2/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-my_service2', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120690', '2/services-testslider/PORTAL_MENU', '2/services-testslider/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-testslider', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120691', '2/services-tests/PORTAL_MENU', '2/services-tests/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-tests', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120692', '2/services-addResAttr/PORTAL_MENU', '2/services-addResAttr/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-addResAttr', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120693', '2/services-addResAttrSave/PORTAL_MENU', '2/services-addResAttrSave/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-addResAttrSave', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120694', '2/services-mataDataModuleTest/PORTAL_MENU', '2/services-mataDataModuleTest/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-mataDataModuleTest', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120695', '2/test/PORTAL_MENU', '2/test/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'test', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120696', '2/servicesCategory-test/PORTAL_MENU', '2/servicesCategory-test/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-test', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120697', '2/services-myservice1/PORTAL_MENU', '2/services-myservice1/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-myservice1', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120698', '2/services-testSer/PORTAL_MENU', '2/services-testSer/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-testSer', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120699', '2/services-zy1/PORTAL_MENU', '2/services-zy1/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-zy1', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120700', '2/services-zy3/PORTAL_MENU', '2/services-zy3/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-zy3', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120701', '2/services-zy4/PORTAL_MENU', '2/services-zy4/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-zy4', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120702', '2/services-svc123/PORTAL_MENU', '2/services-svc123/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-svc123', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120703', '2/services-niutest_service/PORTAL_MENU', '2/services-niutest_service/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-niutest_service', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120704', '2/services-service/PORTAL_MENU', '2/services-service/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-service', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120705', '2/services-register_test/PORTAL_MENU', '2/services-register_test/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-register_test', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120706', '2/services-register_test2/PORTAL_MENU', '2/services-register_test2/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-register_test2', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120707', '2/services-zytest/PORTAL_MENU', '2/services-zytest/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-zytest', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120708', '2/services-testzy/PORTAL_MENU', '2/services-testzy/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-testzy', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120709', '2/servicesCategory-bconsole/PORTAL_MENU', '2/servicesCategory-bconsole/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-bconsole', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120710', '2/services-spesify/PORTAL_MENU', '2/services-spesify/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-spesify', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120711', '2/servicesCategory-z/PORTAL_MENU', '2/servicesCategory-z/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-z', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120712', '2/servicesCategory-a/PORTAL_MENU', '2/servicesCategory-a/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-a', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120713', '2/services-server1/PORTAL_MENU', '2/services-server1/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-server1', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120714', '2/servicesCategory-xbconsole/PORTAL_MENU', '2/servicesCategory-xbconsole/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-xbconsole', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120715', '2/services-zymysql/PORTAL_MENU', '2/services-zymysql/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-zymysql', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120716', '2/services-zzzymysql/PORTAL_MENU', '2/services-zzzymysql/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-zzzymysql', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120717', '2/services-song_test/PORTAL_MENU', '2/services-song_test/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-song_test', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120718', '2/services-testportal3/PORTAL_MENU', '2/services-testportal3/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-testportal3', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120719', 'BIDeployment', 'BI构建', '4', 'BI构建', '.*', '', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120720', 'BPM', 'BPM', '4', 'BPM', '/bpm', '', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120721', '2/services-sshuzhong/PORTAL_MENU', '2/services-sshuzhong/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-sshuzhong', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120722', '2/租户配额/PORTAL_MENU', '2/租户配额/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '租户配额', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120723', '2//PORTAL_MENU', '2//门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120724', '2/BIDeployment/PORTAL_MENU', '2/BIDeployment/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'BIDeployment', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120725', '2/uploadmanage/PORTAL_MENU', '2/uploadmanage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'uploadmanage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120726', '2/exporttask_index/PORTAL_MENU', '2/exporttask_index/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'exporttask_index', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120727', '2/ahr_new/PORTAL_MENU', '2/ahr_new/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ahr_new', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120728', '2/ahq_new/PORTAL_MENU', '2/ahq_new/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ahq_new', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120729', '2/listreport_new/PORTAL_MENU', '2/listreport_new/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'listreport_new', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120730', '2/report-new/PORTAL_MENU', '2/report-new/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'report-new', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120731', '2/sumreport_new/PORTAL_MENU', '2/sumreport_new/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'sumreport_new', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120732', '2/analysis_new/PORTAL_MENU', '2/analysis_new/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'analysis_new', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120733', '2/sysparam/PORTAL_MENU', '2/sysparam/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'sysparam', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120734', '2/design/PORTAL_MENU', '2/design/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'design', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120735', '2/Blogic/PORTAL_MENU', '2/Blogic/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'Blogic', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120736', '2/Cloud_service_monitoring/PORTAL_MENU', '2/Cloud_service_monitoring/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'Cloud_service_monitoring', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120737', '2/Machine_log_analysis/PORTAL_MENU', '2/Machine_log_analysis/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'Machine_log_analysis', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120738', '2/dataetl/PORTAL_MENU', '2/dataetl/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'dataetl', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120739', '2/dataMappingManager/PORTAL_MENU', '2/dataMappingManager/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'dataMappingManager', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120740', '2/dataflow00001/PORTAL_MENU', '2/dataflow00001/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'dataflow00001', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120741', '2/etlset/PORTAL_MENU', '2/etlset/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'etlset', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120742', '2/etlworkres/PORTAL_MENU', '2/etlworkres/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'etlworkres', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120743', '2/createetlgraph/PORTAL_MENU', '2/createetlgraph/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'createetlgraph', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120744', '2/etlresourceaddroot/PORTAL_MENU', '2/etlresourceaddroot/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'etlresourceaddroot', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120745', '2/000/PORTAL_MENU', '2/000/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '000', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120746', '2/etlscheduler/PORTAL_MENU', '2/etlscheduler/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'etlscheduler', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120747', '2/etl_cal_resource/PORTAL_MENU', '2/etl_cal_resource/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'etl_cal_resource', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120748', '2/monitor/PORTAL_MENU', '2/monitor/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'monitor', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120749', '2/monitor00015/PORTAL_MENU', '2/monitor00015/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'monitor00015', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120750', '2/monitorexception/PORTAL_MENU', '2/monitorexception/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'monitorexception', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120751', '2/etlPermissionInit/PORTAL_MENU', '2/etlPermissionInit/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'etlPermissionInit', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120752', '2/handle001/PORTAL_MENU', '2/handle001/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'handle001', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120753', '2/monitorexlist/PORTAL_MENU', '2/monitorexlist/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'monitorexlist', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120754', '2/workflowex/PORTAL_MENU', '2/workflowex/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'workflowex', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120755', '2/monitor00011/PORTAL_MENU', '2/monitor00011/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'monitor00011', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120756', '2/bconsole/PORTAL_MENU', '2/bconsole/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'bconsole', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120757', '2/属性信息库/PORTAL_MENU', '2/属性信息库/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '属性信息库', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120758', '2/工单审批/PORTAL_MENU', '2/工单审批/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '工单审批', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120759', '2/服务信息表扩展/PORTAL_MENU', '2/服务信息表扩展/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '服务信息表扩展', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120760', '2/服务分类信息/PORTAL_MENU', '2/服务分类信息/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '服务分类信息', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120761', '2/服务实例/PORTAL_MENU', '2/服务实例/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '服务实例', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120762', '2/服务提供方/PORTAL_MENU', '2/服务提供方/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '服务提供方', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120763', '2/服务注册/PORTAL_MENU', '2/服务注册/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '服务注册', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120764', '2/申请订单/PORTAL_MENU', '2/申请订单/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '申请订单', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120765', '2/订单中心/PORTAL_MENU', '2/订单中心/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '订单中心', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120766', '2/调度任务/PORTAL_MENU', '2/调度任务/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '调度任务', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120767', '2/XJJM/PORTAL_MENU', '2/XJJM/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'XJJM', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120768', '2/SJJMPZ/PORTAL_MENU', '2/SJJMPZ/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'SJJMPZ', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120769', '2/ZMGZPZ/PORTAL_MENU', '2/ZMGZPZ/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ZMGZPZ', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120770', '2/SJKZDYSPZ/PORTAL_MENU', '2/SJKZDYSPZ/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'SJKZDYSPZ', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120771', '2/MXLB/PORTAL_MENU', '2/MXLB/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'MXLB', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120772', '2/MXBSJC/PORTAL_MENU', '2/MXBSJC/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'MXBSJC', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120773', '2/bcm/PORTAL_MENU', '2/bcm/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'bcm', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120774', '2/bcm-service/PORTAL_MENU', '2/bcm-service/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'bcm-service', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120775', '2/bconsole-bcm/PORTAL_MENU', '2/bconsole-bcm/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'bconsole-bcm', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120776', 'API管理', 'API管理', '4', 'API管理', '.*', '', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120777', '2/APIManage/PORTAL_MENU', '2/APIManage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'APIManage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120778', '2/APIStore/PORTAL_MENU', '2/APIStore/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'APIStore', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120779', '2/APIpublisher/PORTAL_MENU', '2/APIpublisher/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'APIpublisher', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120780', '2/API-ARRANGE/PORTAL_MENU', '2/API-ARRANGE/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'API-ARRANGE', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120781', '2/Metadata/PORTAL_MENU', '2/Metadata/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'Metadata', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120782', '2/MetadataInit/PORTAL_MENU', '2/MetadataInit/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'MetadataInit', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120783', '2/MetaDataService/PORTAL_MENU', '2/MetaDataService/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'MetaDataService', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120784', '2/MetaDataManage/PORTAL_MENU', '2/MetaDataManage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'MetaDataManage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120785', '2/MetaDataPermission/PORTAL_MENU', '2/MetaDataPermission/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'MetaDataPermission', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120786', '2/ObjectPermission/PORTAL_MENU', '2/ObjectPermission/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ObjectPermission', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120787', '2/DirectoryPermission/PORTAL_MENU', '2/DirectoryPermission/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'DirectoryPermission', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120788', '2/TableMaintain/PORTAL_MENU', '2/TableMaintain/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'TableMaintain', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120789', '2/SystemSourceMaintain/PORTAL_MENU', '2/SystemSourceMaintain/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'SystemSourceMaintain', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120790', '2/IndRefDoc/PORTAL_MENU', '2/IndRefDoc/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'IndRefDoc', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120791', '2/IntFileSpecification/PORTAL_MENU', '2/IntFileSpecification/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'IntFileSpecification', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120792', '2/ManageDimMaintain/PORTAL_MENU', '2/ManageDimMaintain/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ManageDimMaintain', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120793', '2/LogicModel/PORTAL_MENU', '2/LogicModel/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'LogicModel', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120794', '2/ModelManage/PORTAL_MENU', '2/ModelManage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ModelManage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120795', '2/SharingCenter/PORTAL_MENU', '2/SharingCenter/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'SharingCenter', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120796', '2/ParmConfigCenter/PORTAL_MENU', '2/ParmConfigCenter/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ParmConfigCenter', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120797', '2/APPManage/PORTAL_MENU', '2/APPManage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'APPManage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120798', '2/EXC/PORTAL_MENU', '2/EXC/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'EXC', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120799', '2/ExcObservations/PORTAL_MENU', '2/ExcObservations/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ExcObservations', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120800', '2/ExcObservationRules/PORTAL_MENU', '2/ExcObservationRules/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ExcObservationRules', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120801', '2/Search/PORTAL_MENU', '2/Search/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'Search', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120802', '2/CacheManage/PORTAL_MENU', '2/CacheManage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'CacheManage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120803', '2/CustomSearch/PORTAL_MENU', '2/CustomSearch/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'CustomSearch', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120804', '2/ChangeTimeAxis/PORTAL_MENU', '2/ChangeTimeAxis/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ChangeTimeAxis', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120805', '2/DataCenter/PORTAL_MENU', '2/DataCenter/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'DataCenter', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120806', '2/DataMap/PORTAL_MENU', '2/DataMap/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'DataMap', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120807', '2/DataService/PORTAL_MENU', '2/DataService/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'DataService', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120808', '2/ProductTagCenter/PORTAL_MENU', '2/ProductTagCenter/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ProductTagCenter', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120809', '2/ProductTagManage/PORTAL_MENU', '2/ProductTagManage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ProductTagManage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120810', '2/ProductPublisher/PORTAL_MENU', '2/ProductPublisher/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ProductPublisher', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120811', '2/JobsMonitor/PORTAL_MENU', '2/JobsMonitor/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'JobsMonitor', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120812', '2/ProductTagMonitor/PORTAL_MENU', '2/ProductTagMonitor/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ProductTagMonitor', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120813', '2/ProductTagMonitorDetail/PORTAL_MENU', '2/ProductTagMonitorDetail/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ProductTagMonitorDetail', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120814', '2/JobsExcList/PORTAL_MENU', '2/JobsExcList/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'JobsExcList', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120815', '2/AdminMonitor/PORTAL_MENU', '2/AdminMonitor/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'AdminMonitor', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120816', '2/DataServicePermInit/PORTAL_MENU', '2/DataServicePermInit/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'DataServicePermInit', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120817', '2/ServiceApplication/PORTAL_MENU', '2/ServiceApplication/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ServiceApplication', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120818', '2/ProductTagCollection/PORTAL_MENU', '2/ProductTagCollection/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ProductTagCollection', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120819', '2/ProductTagShopping/PORTAL_MENU', '2/ProductTagShopping/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ProductTagShopping', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120820', '2/ProductApplication/PORTAL_MENU', '2/ProductApplication/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ProductApplication', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120821', '2/ConfigManage/PORTAL_MENU', '2/ConfigManage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ConfigManage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120822', '2/SendModeConfig/PORTAL_MENU', '2/SendModeConfig/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'SendModeConfig', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120823', '2/LogicConfig/PORTAL_MENU', '2/LogicConfig/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'LogicConfig', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120824', '2/ProcessMaintain/PORTAL_MENU', '2/ProcessMaintain/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ProcessMaintain', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120825', '2/GetModeConfig/PORTAL_MENU', '2/GetModeConfig/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'GetModeConfig', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120826', '2/ResourceConfig/PORTAL_MENU', '2/ResourceConfig/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ResourceConfig', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120827', '2/DataQuality/PORTAL_MENU', '2/DataQuality/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'DataQuality', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120828', '2/AuditJob/PORTAL_MENU', '2/AuditJob/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'AuditJob', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120829', '2/AuditMonitor/PORTAL_MENU', '2/AuditMonitor/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'AuditMonitor', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120830', '2/AuditProDetailModel/PORTAL_MENU', '2/AuditProDetailModel/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'AuditProDetailModel', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120831', '2/AuditResultDetailSearch/PORTAL_MENU', '2/AuditResultDetailSearch/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'AuditResultDetailSearch', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120832', '2/AuditResultSearch/PORTAL_MENU', '2/AuditResultSearch/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'AuditResultSearch', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120833', '2/AuditRuleEntrance/PORTAL_MENU', '2/AuditRuleEntrance/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'AuditRuleEntrance', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120834', '2/AuditRuleStatistical/PORTAL_MENU', '2/AuditRuleStatistical/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'AuditRuleStatistical', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120835', '2/AuditRuleSearch/PORTAL_MENU', '2/AuditRuleSearch/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'AuditRuleSearch', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120836', '2/AuditConfig/PORTAL_MENU', '2/AuditConfig/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'AuditConfig', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120837', '2/AuditProblemConfig/PORTAL_MENU', '2/AuditProblemConfig/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'AuditProblemConfig', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120838', '2/AuditProblemDetailSearch/PORTAL_MENU', '2/AuditProblemDetailSearch/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'AuditProblemDetailSearch', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120839', '2/AuditProblemManage/PORTAL_MENU', '2/AuditProblemManage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'AuditProblemManage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120840', '2/QuestionSearchTemplate/PORTAL_MENU', '2/QuestionSearchTemplate/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'QuestionSearchTemplate', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120841', 'ContainerCloud', '容器云', '4', '容器云', '.*', '', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120842', '2/TENANT_TYPE/PORTAL_MENU', '2/TENANT_TYPE/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'TENANT_TYPE', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120843', '2/RoleMapping/PORTAL_MENU', '2/RoleMapping/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'RoleMapping', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120844', '2/RoleService/PORTAL_MENU', '2/RoleService/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'RoleService', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120845', '2/ROLEINFO_CONFIG/PORTAL_MENU', '2/ROLEINFO_CONFIG/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ROLEINFO_CONFIG', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120846', '2/EMAIL_CONFIG/PORTAL_MENU', '2/EMAIL_CONFIG/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'EMAIL_CONFIG', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120847', 'ETL', '云化ETL', '4', '云化ETL', '.*', '', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120848', 'DataModel', '数据建模', '4', '数据建模', '.*', '', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120849', 'MetaData', '元数据', '4', '元数据', '.*', '', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120850', 'DataService', '数据服务', '4', '数据服务', '.*', '', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120851', 'DataQuality', '数据质量', '4', '数据质量', '.*', '', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120852', 'Blogic', 'Blogic', '4', 'Blogic', '.*', '', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120853', '2/BPM/PORTAL_MENU', '2/BPM/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'BPM', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120854', '2/Services_manageService/PORTAL_MENU', '2/Services_manageService/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'Services_manageService', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120855', '2/task-list/PORTAL_MENU', '2/task-list/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'task-list', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120856', '2/UserDelegate_manage/PORTAL_MENU', '2/UserDelegate_manage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'UserDelegate_manage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120857', '2/extService/PORTAL_MENU', '2/extService/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'extService', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120858', '2/mynewtask/PORTAL_MENU', '2/mynewtask/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'mynewtask', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120859', '2/ModelMonitor/PORTAL_MENU', '2/ModelMonitor/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ModelMonitor', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120860', '2/ModeManage/PORTAL_MENU', '2/ModeManage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ModeManage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120861', '2/category-tree/PORTAL_MENU', '2/category-tree/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'category-tree', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120862', '2/model_list/PORTAL_MENU', '2/model_list/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'model_list', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120863', '2/FormDef/PORTAL_MENU', '2/FormDef/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'FormDef', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120864', '2/数据域扩展/PORTAL_MENU', '2/数据域扩展/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '数据域扩展', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120865', 'console', '云控制台所有功能', '1', '', '.*', 'bconsole', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120866', '2/services-dcos/PORTAL_MENU', '2/services-dcos/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-dcos', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120867', '2/services-redis/PORTAL_MENU', '2/services-redis/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-redis', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120868', 'DCOS', 'DCOS', '4', 'DCOS', 'DCOS', '', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120869', '2/servicesCategory-ftp/PORTAL_MENU', '2/servicesCategory-ftp/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-ftp', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120870', 'ROLE_BCM', '容器云所有功能', '1', '', '.*', 'ContainerCloud', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120871', '2/services-testvr/PORTAL_MENU', '2/services-testvr/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-testvr', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120872', '2/DCOS/PORTAL_MENU', '2/DCOS/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'DCOS', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120873', '2/services-ceshi/PORTAL_MENU', '2/services-ceshi/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-ceshi', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120874', '2/services-testzlm/PORTAL_MENU', '2/services-testzlm/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-testzlm', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120875', '2/servicesCategory-mysql_qwer/PORTAL_MENU', '2/servicesCategory-mysql_qwer/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-mysql_qwer', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120876', '2/services-zhenglm/PORTAL_MENU', '2/services-zhenglm/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-zhenglm', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120877', '2/services-zhenglm2/PORTAL_MENU', '2/services-zhenglm2/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-zhenglm2', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120878', '2/services-zhenglm3/PORTAL_MENU', '2/services-zhenglm3/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-zhenglm3', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120879', '2/services-zhenglm4/PORTAL_MENU', '2/services-zhenglm4/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-zhenglm4', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120880', '2/services-123/PORTAL_MENU', '2/services-123/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-123', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120881', '2/services-1231/PORTAL_MENU', '2/services-1231/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-1231', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120882', '2/services-zhenglm5/PORTAL_MENU', '2/services-zhenglm5/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-zhenglm5', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120883', '2/services-zlm123/PORTAL_MENU', '2/services-zlm123/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-zlm123', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120884', '2/services-zlm456/PORTAL_MENU', '2/services-zlm456/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-zlm456', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120885', '2/services-23/PORTAL_MENU', '2/services-23/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-23', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120886', '2/services-zlm789/PORTAL_MENU', '2/services-zlm789/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-zlm789', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120887', '2/services-da/PORTAL_MENU', '2/services-da/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-da', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120888', '2/bconsole_app_resources/PORTAL_MENU', '2/bconsole_app_resources/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'bconsole_app_resources', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120889', '2/services-1/PORTAL_MENU', '2/services-1/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-1', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120890', '2/services-123445/PORTAL_MENU', '2/services-123445/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-123445', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120891', '2/services-test01/PORTAL_MENU', '2/services-test01/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-test01', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120892', '2/services-13123/PORTAL_MENU', '2/services-13123/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-13123', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120893', '2/services-zlmzlm/PORTAL_MENU', '2/services-zlmzlm/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-zlmzlm', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120894', '2/services-test8/PORTAL_MENU', '2/services-test8/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-test8', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120895', '2/services-mysql2/PORTAL_MENU', '2/services-mysql2/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-mysql2', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120896', '2/services-redis1/PORTAL_MENU', '2/services-redis1/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-redis1', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120897', '2/services-mysql10000/PORTAL_MENU', '2/services-mysql10000/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-mysql10000', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120898', '431/{userinfo.id}/ROLE_MANAGE', '431/{userinfo.id}/角色管理', '2', null, '(.*?/roleinfo!.*?)', 'security', null, '{userinfo.id}', 'listType', null, '431', null, 'tenant_system', '11', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120899', '445/12/ROLE_MANAGE', '445/12/角色管理', '2', null, '(.*?/roleinfo!.*?)', 'security', null, '12', 'listType', null, '445', null, 'tenant_system', '11', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120900', '445/9/ROLE_MANAGE', '445/9/角色管理', '2', null, '(.*?/roleinfo!.*?)', 'security', null, '9', 'listType', null, '445', null, 'tenant_system', '11', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120901', '445/8/ROLE_MANAGE', '445/8/角色管理', '2', null, '(.*?/roleinfo!.*?)', 'security', null, '8', 'listType', null, '445', null, 'tenant_system', '11', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120902', '445/7/ROLE_MANAGE', '445/7/角色管理', '2', null, '(.*?/roleinfo!.*?)', 'security', null, '7', 'listType', null, '445', null, 'tenant_system', '11', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120903', '2/servicesCategory-zy_redis/PORTAL_MENU', '2/servicesCategory-zy_redis/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-zy_redis', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120904', '2/BDA_UI/PORTAL_MENU', '2/BDA_UI/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'BDA_UI', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120905', '2/BDA_UI_MODELSEARCH/PORTAL_MENU', '2/BDA_UI_MODELSEARCH/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'BDA_UI_MODELSEARCH', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120906', '2/BDA_UI_MODEL_LIST/PORTAL_MENU', '2/BDA_UI_MODEL_LIST/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'BDA_UI_MODEL_LIST', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120907', '2/BDA_UI_MODEL_DETECTION/PORTAL_MENU', '2/BDA_UI_MODEL_DETECTION/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'BDA_UI_MODEL_DETECTION', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120908', '2/BDA_UI_DEVELOPER/PORTAL_MENU', '2/BDA_UI_DEVELOPER/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'BDA_UI_DEVELOPER', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120909', '2/BDA_UI_SETTING/PORTAL_MENU', '2/BDA_UI_SETTING/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'BDA_UI_SETTING', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120910', '2/BDA_UI_LOGIC_RULE/PORTAL_MENU', '2/BDA_UI_LOGIC_RULE/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'BDA_UI_LOGIC_RULE', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120911', '2/BDA_UI_CUSTOMPARAM/PORTAL_MENU', '2/BDA_UI_CUSTOMPARAM/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'BDA_UI_CUSTOMPARAM', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120912', '2/metaCodeLogicPartition/PORTAL_MENU', '2/metaCodeLogicPartition/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'metaCodeLogicPartition', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120913', 'market', '商业智能应用平台', '4', '商业智能应用平台', '.*', '', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120914', '2/market/PORTAL_MENU', '2/market/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'market', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120915', '2/services-zlm_redis/PORTAL_MENU', '2/services-zlm_redis/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-zlm_redis', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120916', '2/servicesCategory-kafka/PORTAL_MENU', '2/servicesCategory-kafka/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-kafka', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120917', '445/78/ROLE_MANAGE', '445/78/角色管理', '2', null, '(.*?/roleinfo!.*?)', 'security', null, '78', 'listType', null, '445', null, 'tenant_system', '11', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120918', '445/80/ROLE_MANAGE', '445/80/角色管理', '2', null, '(.*?/roleinfo!.*?)', 'security', null, '80', 'listType', null, '445', null, 'tenant_system', '11', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120919', '445/79/ROLE_MANAGE', '445/79/角色管理', '2', null, '(.*?/roleinfo!.*?)', 'security', null, '79', 'listType', null, '445', null, 'tenant_system', '11', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120920', '2/services-kafka/PORTAL_MENU', '2/services-kafka/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-kafka', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120921', '445/-1/ROLE_MANAGE', '445/-1/角色管理', '2', null, '(.*?/roleinfo!.*?)', 'security', null, '-1', 'listType', null, '445', null, 'tenant_system', '11', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120922', '2/es_search/PORTAL_MENU', '2/es_search/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'es_search', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120923', '2/services-mysql_xzh/PORTAL_MENU', '2/services-mysql_xzh/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-mysql_xzh', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120924', '2/servicesCategory-mysql_dcos/PORTAL_MENU', '2/servicesCategory-mysql_dcos/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-mysql_dcos', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120925', '2/servicesCategory-redis/PORTAL_MENU', '2/servicesCategory-redis/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-redis', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120926', 'dcos-test', 'DCOS', '1', 'DCOS', '(.*?/monitor!.*?)', 'DCOS', '', '', '', null, null, null, 'tenant_system', null, null, '', '\0', 'FONTWEB', '1', null, '', '0');
INSERT INTO `resources` VALUES ('120927', '2/servicesCategory-mysql/PORTAL_MENU', '2/servicesCategory-mysql/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-mysql', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120928', '2/servicesCategory-mysqlxzh/PORTAL_MENU', '2/servicesCategory-mysqlxzh/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-mysqlxzh', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120929', '2/servicesCategory-mysqlxzh/PORTAL_MENU', '2/servicesCategory-mysqlxzh/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-mysqlxzh', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120930', '2/servicesCategory-redisxzh/PORTAL_MENU', '2/servicesCategory-redisxzh/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-redisxzh', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120931', '2/servicesCategory-ftpxzh/PORTAL_MENU', '2/servicesCategory-ftpxzh/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-ftpxzh', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120932', '2/servicesCategory-CloudDatabase/PORTAL_MENU', '2/servicesCategory-CloudDatabase/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-CloudDatabase', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120933', '2/services-mysql1/PORTAL_MENU', '2/services-mysql1/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-mysql1', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120934', '2/servicesCategory-basicResource/PORTAL_MENU', '2/servicesCategory-basicResource/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicesCategory-basicResource', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120935', '2/services-docker/PORTAL_MENU', '2/services-docker/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-docker', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120936', '2/services-docker1/PORTAL_MENU', '2/services-docker1/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-docker1', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120937', '2/services-webServer/PORTAL_MENU', '2/services-webServer/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-webServer', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120938', '2/services-clusterModel1/PORTAL_MENU', '2/services-clusterModel1/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-clusterModel1', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120939', '2/services-clusterModel2/PORTAL_MENU', '2/services-clusterModel2/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-clusterModel2', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('120940', '2/services-index11/PORTAL_MENU', '2/services-index11/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'services-index11', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121000', '2/tenant_approval/PORTAL_MENU', '2/tenant_approval/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'tenant_approval', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121001', '2/mycase/PORTAL_MENU', '2/mycase/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'mycase', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121002', '2/servicecase/PORTAL_MENU', '2/servicecase/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'servicecase', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121003', '2/service_register/PORTAL_MENU', '2/service_register/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'service_register', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121004', '2/订单管理/PORTAL_MENU', '2/订单管理/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '订单管理', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121005', '2/日志监控/PORTAL_MENU', '2/日志监控/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '日志监控', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121006', '2/blogic/PORTAL_MENU', '2/blogic/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'blogic', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121007', '445/69/ROLE_MANAGE', '445/69/角色管理', '2', null, '(.*?/roleinfo!.*?)', 'security', null, '69', 'listType', null, '445', null, 'tenant_system', '11', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121008', '445/1/ROLE_MANAGE', '445/1/角色管理', '2', null, '(.*?/roleinfo!.*?)', 'security', null, '1', 'listType', null, '445', null, 'tenant_system', '11', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121009', '445/107/ROLE_MANAGE', '445/107/角色管理', '2', null, '(.*?/roleinfo!.*?)', 'security', null, '107', 'listType', null, '445', null, 'tenant_system', '11', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121010', '445/106/ROLE_MANAGE', '445/106/角色管理', '2', null, '(.*?/roleinfo!.*?)', 'security', null, '106', 'listType', null, '445', null, 'tenant_system', '11', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121011', '2/dashboard_test0/PORTAL_MENU', '2/dashboard_test0/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'dashboard_test0', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121012', '2/我的订单/PORTAL_MENU', '2/我的订单/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '我的订单', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121013', '2/订单审批/PORTAL_MENU', '2/订单审批/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '订单审批', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121014', '2/pageModel/PORTAL_MENU', '2/pageModel/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'pageModel', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121015', '2/pageModuleManage/PORTAL_MENU', '2/pageModuleManage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'pageModuleManage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121016', '2/pageResManage/PORTAL_MENU', '2/pageResManage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'pageResManage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121017', '2/pageModelManage/PORTAL_MENU', '2/pageModelManage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'pageModelManage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121018', '2/producttype/PORTAL_MENU', '2/producttype/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'producttype', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121019', '2/blogic-log/PORTAL_MENU', '2/blogic-log/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'blogic-log', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121020', '2/service_manage/PORTAL_MENU', '2/service_manage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'service_manage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121021', '2/配额管理/PORTAL_MENU', '2/配额管理/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '配额管理', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121022', '445/108/ROLE_MANAGE', '445/108/角色管理', '2', null, '(.*?/roleinfo!.*?)', 'security', null, '108', 'listType', null, '445', null, 'tenant_system', '11', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121023', '2/dataModeling/PORTAL_MENU', '2/dataModeling/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'dataModeling', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121024', '2/middleware/PORTAL_MENU', '2/middleware/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'middleware', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121025', '2/kafka/PORTAL_MENU', '2/kafka/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'kafka', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121026', '2/zookeeper/PORTAL_MENU', '2/zookeeper/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'zookeeper', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121027', '2/bigDataComponent/PORTAL_MENU', '2/bigDataComponent/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'bigDataComponent', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121028', '2/Elasticsearch/PORTAL_MENU', '2/Elasticsearch/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'Elasticsearch', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121029', '2/Hive/PORTAL_MENU', '2/Hive/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'Hive', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121030', '2/Storm/PORTAL_MENU', '2/Storm/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'Storm', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121031', '2/yarn/PORTAL_MENU', '2/yarn/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'yarn', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121032', '2/databaseCache/PORTAL_MENU', '2/databaseCache/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'databaseCache', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121033', '2/Memcached/PORTAL_MENU', '2/Memcached/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'Memcached', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121034', '2/Mysql/PORTAL_MENU', '2/Mysql/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'Mysql', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121035', '2/Redis/PORTAL_MENU', '2/Redis/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'Redis', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121036', '445/109/ROLE_MANAGE', '445/109/角色管理', '2', null, '(.*?/roleinfo!.*?)', 'security', null, '109', 'listType', null, '445', null, 'tenant_system', '11', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121037', '534/{userinfo.loginId}/PORTAL_MENU', '534/{userinfo.loginId}/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '{userinfo.loginId}', 'listType', null, '534', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121038', '2/productBrowse/PORTAL_MENU', '2/productBrowse/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'productBrowse', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121039', '2/ftp/PORTAL_MENU', '2/ftp/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'ftp', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121041', '2/storage/PORTAL_MENU', '2/storage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'storage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121042', '2/blockStorage/PORTAL_MENU', '2/blockStorage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'blockStorage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121043', '2/backups/PORTAL_MENU', '2/backups/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'backups', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121044', '2/objectStorage/PORTAL_MENU', '2/objectStorage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'objectStorage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121045', '2/fileStore/PORTAL_MENU', '2/fileStore/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'fileStore', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121046', '2/application/PORTAL_MENU', '2/application/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'application', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121047', '2/overview/PORTAL_MENU', '2/overview/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'overview', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121048', '2/bcmService/PORTAL_MENU', '2/bcmService/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'bcmService', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121049', '2/strategy/PORTAL_MENU', '2/strategy/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'strategy', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121050', '2/toConfigure/PORTAL_MENU', '2/toConfigure/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'toConfigure', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121051', '2/logMonitoring/PORTAL_MENU', '2/logMonitoring/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'logMonitoring', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121052', '2/colony/PORTAL_MENU', '2/colony/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'colony', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121053', '2/mirrorImage/PORTAL_MENU', '2/mirrorImage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'mirrorImage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121054', '2/myCollection/PORTAL_MENU', '2/myCollection/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'myCollection', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121055', '2/myMirror/PORTAL_MENU', '2/myMirror/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'myMirror', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121056', '2/mirrorCenter/PORTAL_MENU', '2/mirrorCenter/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'mirrorCenter', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121057', '2/mirrorConstruction/PORTAL_MENU', '2/mirrorConstruction/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'mirrorConstruction', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121058', '2/quotaOfMine/PORTAL_MENU', '2/quotaOfMine/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'quotaOfMine', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121059', '2/layout/PORTAL_MENU', '2/layout/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'layout', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121060', '2/announcement/PORTAL_MENU', '2/announcement/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'announcement', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121061', '2/数据字典/PORTAL_MENU', '2/数据字典/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '数据字典', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121062', '2/项目管理/PORTAL_MENU', '2/项目管理/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, '项目管理', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121063', '2/dataMode/PORTAL_MENU', '2/dataMode/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'dataMode', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121064', '2/projectModel/PORTAL_MENU', '2/projectModel/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'projectModel', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121065', '2/taskes/PORTAL_MENU', '2/taskes/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'taskes', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121066', '2/envVariable/PORTAL_MENU', '2/envVariable/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'envVariable', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121067', '2/configFile/PORTAL_MENU', '2/configFile/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'configFile', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121068', '2/publicMirror/PORTAL_MENU', '2/publicMirror/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'publicMirror', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121069', '2/mirrorList/PORTAL_MENU', '2/mirrorList/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'mirrorList', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121070', '2/dockerfileConstructs/PORTAL_MENU', '2/dockerfileConstructs/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'dockerfileConstructs', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121071', '2/codeConstruction/PORTAL_MENU', '2/codeConstruction/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'codeConstruction', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121072', '2/collectionDeploy/PORTAL_MENU', '2/collectionDeploy/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'collectionDeploy', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121073', '2/code/PORTAL_MENU', '2/code/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'code', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121074', '2/codeRelation/PORTAL_MENU', '2/codeRelation/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'codeRelation', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121075', '2/x_image_codebaseList/PORTAL_MENU', '2/x_image_codebaseList/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'x_image_codebaseList', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121076', '2/x_app_env_page/PORTAL_MENU', '2/x_app_env_page/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'x_app_env_page', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121077', '2/x_app_config_create_page/PORTAL_MENU', '2/x_app_config_create_page/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'x_app_config_create_page', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121078', '2/prometheus/PORTAL_MENU', '2/prometheus/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'prometheus', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121079', '2/x_productPackage_page/PORTAL_MENU', '2/x_productPackage_page/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'x_productPackage_page', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121080', '2/x_app_service_serviceDetailPage/PORTAL_MENU', '2/x_app_service_serviceDetailPage/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'x_app_service_serviceDetailPage', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121081', '2/x_productCase_component_detail_redis/PORTAL_MENU', '2/x_productCase_component_detail_redis/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'x_productCase_component_detail_redis', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121082', '2/mycase1/PORTAL_MENU', '2/mycase1/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'mycase1', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121083', '2/codeChecking_list/PORTAL_MENU', '2/codeChecking_list/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'codeChecking_list', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121084', '2/x_app/PORTAL_MENU', '2/x_app/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'x_app', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);
INSERT INTO `resources` VALUES ('121085', '2/x_app_springcloud/PORTAL_MENU', '2/x_app_springcloud/门户菜单', '2', null, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', null, 'x_app_springcloud', 'listType', null, '2', null, 'tenant_system', '100095', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for resource_data_address
-- ----------------------------
DROP TABLE IF EXISTS `resource_data_address`;
CREATE TABLE `resource_data_address` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RESOURCES_ID` bigint(20) DEFAULT NULL,
  `ADDRESSINFO_ID` bigint(20) DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKD980A8D073D93FE` (`ADDRESSINFO_ID`) USING BTREE,
  KEY `FKD980A8D0BB2F55FE` (`RESOURCES_ID`) USING BTREE,
  CONSTRAINT `resource_data_address_ibfk_1` FOREIGN KEY (`ADDRESSINFO_ID`) REFERENCES `addressinfo` (`ID`),
  CONSTRAINT `resource_data_address_ibfk_2` FOREIGN KEY (`RESOURCES_ID`) REFERENCES `resources` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource_data_address
-- ----------------------------

-- ----------------------------
-- Table structure for resource_data_rule
-- ----------------------------
DROP TABLE IF EXISTS `resource_data_rule`;
CREATE TABLE `resource_data_rule` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `FILTER_TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCES_ID` bigint(19) DEFAULT NULL,
  `DATA_RES_REG_RULE_ID` bigint(19) DEFAULT NULL,
  `TABLE_INFO_ID` bigint(19) DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `SECOND_TABLE_ID` bigint(19) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK54B50F801570FA97` (`SECOND_TABLE_ID`) USING BTREE,
  KEY `FK54B50F805D6D2ADB` (`TABLE_INFO_ID`) USING BTREE,
  KEY `FK54B50F807D71D35` (`DATA_RES_REG_RULE_ID`) USING BTREE,
  KEY `FK54B50F80BB2F55FE` (`RESOURCES_ID`) USING BTREE,
  CONSTRAINT `resource_data_rule_ibfk_1` FOREIGN KEY (`SECOND_TABLE_ID`) REFERENCES `table_info` (`ID`),
  CONSTRAINT `resource_data_rule_ibfk_2` FOREIGN KEY (`TABLE_INFO_ID`) REFERENCES `table_info` (`ID`),
  CONSTRAINT `resource_data_rule_ibfk_3` FOREIGN KEY (`DATA_RES_REG_RULE_ID`) REFERENCES `data_res_reg_rule` (`ID`),
  CONSTRAINT `resource_data_rule_ibfk_4` FOREIGN KEY (`RESOURCES_ID`) REFERENCES `resources` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of resource_data_rule
-- ----------------------------
INSERT INTO `resource_data_rule` VALUES ('13', 'listType', '角色（控制＋创建人）', '11', '433', '15', 'tenant_system', null);
INSERT INTO `resource_data_rule` VALUES ('15', 'listType', '菜单控制+创建人', '100095', '535', '2', 'tenant_system', null);

-- ----------------------------
-- Table structure for resource_dependence
-- ----------------------------
DROP TABLE IF EXISTS `resource_dependence`;
CREATE TABLE `resource_dependence` (
  `RESOURCES_ID` bigint(20) NOT NULL,
  `DEP_RESOURCES_ID` bigint(20) NOT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`RESOURCES_ID`,`DEP_RESOURCES_ID`),
  KEY `FKA943EC08BB2F55FE` (`RESOURCES_ID`) USING BTREE,
  KEY `FKA943EC089F628C2E` (`DEP_RESOURCES_ID`) USING BTREE,
  CONSTRAINT `resource_dependence_ibfk_1` FOREIGN KEY (`DEP_RESOURCES_ID`) REFERENCES `resources` (`ID`),
  CONSTRAINT `resource_dependence_ibfk_2` FOREIGN KEY (`RESOURCES_ID`) REFERENCES `resources` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource_dependence
-- ----------------------------

-- ----------------------------
-- Table structure for roleinfo
-- ----------------------------
DROP TABLE IF EXISTS `roleinfo`;
CREATE TABLE `roleinfo` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `ROLE_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROLE_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROLEINFO_ID` bigint(19) DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `ISREGISTER` int(11) DEFAULT NULL,
  `ISDEFAULT` int(11) DEFAULT NULL,
  `ISAPPROVE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK1ECBAA247CBE056` (`ROLEINFO_ID`) USING BTREE,
  CONSTRAINT `roleinfo_ibfk_1` FOREIGN KEY (`ROLEINFO_ID`) REFERENCES `roleinfo` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of roleinfo
-- ----------------------------
INSERT INTO `roleinfo` VALUES ('-1', 'tenant_root', '租户管理员', '108', 'tenant_system', null, '', '1', '1', '1');
INSERT INTO `roleinfo` VALUES ('1', 'root', '超级管理员', null, 'tenant_system', null, '', '0', '0', '0');
INSERT INTO `roleinfo` VALUES ('7', 'svc_provision', '服务提供者', '-1', 'tenant_system', '2018-03-16 14:25:08', '1', '0', '0', '0');
INSERT INTO `roleinfo` VALUES ('8', 'svc_use', '服务使用者', '-1', 'tenant_system', '2018-03-16 14:25:55', '1', '1', '0', '1');
INSERT INTO `roleinfo` VALUES ('106', 'operationManager', '运营管理员', '1', 'tenant_system', '2018-10-19 13:35:59', '1', '0', '0', '0');
INSERT INTO `roleinfo` VALUES ('107', 'operationAdministrator', '运维管理员', '1', 'tenant_system', '2018-10-19 13:40:41', '1', '0', '0', '0');
INSERT INTO `roleinfo` VALUES ('108', 'platform', '平台管理员', '1', 'tenant_system', '2018-11-06 10:50:01', '1', '0', '0', '0');
INSERT INTO `roleinfo` VALUES ('109', 'testR', 'testR', '-1', 'tenant_system', '2018-11-07 15:29:06', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for rule_table_data_source
-- ----------------------------
DROP TABLE IF EXISTS `rule_table_data_source`;
CREATE TABLE `rule_table_data_source` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `DS_CODE` varchar(255) COLLATE utf8_bin NOT NULL,
  `DS_NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `URL` varchar(3000) COLLATE utf8_bin NOT NULL,
  `USERNAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `TYPE` varchar(255) COLLATE utf8_bin NOT NULL,
  `DRIVER` varchar(255) COLLATE utf8_bin NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_bin NOT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `APPCODE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of rule_table_data_source
-- ----------------------------
INSERT INTO `rule_table_data_source` VALUES (1, 'security', 'security数据源', 'jdbc:bonc:mysql://{{mysql.ip}}:{{mysql.port}}/{{mysql.databases.portal}}?autoReconnect=true&amp;useUnicode=true&amp;characterEncoding=UTF8', '{{mysql.username}}', 'mysql', 'com.bonc.jdbc.MysqlDriver', '{{mysql.password}}', 'tenant_system', 'security');

-- ----------------------------
-- Table structure for security_policy
-- ----------------------------
DROP TABLE IF EXISTS `security_policy`;
CREATE TABLE `security_policy` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FUNCTION_NAME` varchar(255) NOT NULL,
  `URL` longtext,
  `IPORMACCHECK` int(11) DEFAULT NULL,
  `TWOIDENTITYCHECK` int(11) DEFAULT NULL,
  `POLICY` longtext,
  `SYSTEM_CODE` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  `VALIDATECODE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_policy
-- ----------------------------

-- ----------------------------
-- Table structure for sex
-- ----------------------------
DROP TABLE IF EXISTS `sex`;
CREATE TABLE `sex` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `SEX_CODE` bigint(19) DEFAULT NULL,
  `SEX_NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sex
-- ----------------------------
INSERT INTO `sex` VALUES ('1', '1', '男', 'tenant_system');
INSERT INTO `sex` VALUES ('2', '0', '女', 'tenant_system');

-- ----------------------------
-- Table structure for table_info
-- ----------------------------
DROP TABLE IF EXISTS `table_info`;
CREATE TABLE `table_info` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(500) COLLATE utf8_bin NOT NULL,
  `TABLE_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RULE_TABLE_DATA_SOURCE_ID` bigint(19) DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `APP_CODE` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `SHOW_NAME` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `NAME_FIELD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_FIELD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKC4FBEE9F913CFCF9` (`RULE_TABLE_DATA_SOURCE_ID`) USING BTREE,
  CONSTRAINT `table_info_ibfk_1` FOREIGN KEY (`RULE_TABLE_DATA_SOURCE_ID`) REFERENCES `rule_table_data_source` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of table_info
-- ----------------------------
INSERT INTO `table_info` VALUES ('1', 'USERINFO', 'ID', '1', 'tenant_system', 'security', '用户', 'USER_NAME', null);
INSERT INTO `table_info` VALUES ('2', 'PORTAL_MENUINFO', 'ID', '1', 'tenant_system', 'portal', '菜单', 'MENU_NAME', 'MENUINFO_ID');
INSERT INTO `table_info` VALUES ('3', 'DATA_RES_REG_RULE', 'ID', '1', 'tenant_system', 'security', '规则', null, null);
INSERT INTO `table_info` VALUES ('4', 'DATA_SOURCE', 'ID', '1', 'tenant_system', 'security', 'DATA_SOURCE', null, null);
INSERT INTO `table_info` VALUES ('5', 'EXT_PROPERTY_DEFINE', 'ID', '1', 'tenant_system', 'security', '扩展属性定义', null, null);
INSERT INTO `table_info` VALUES ('6', 'EXT_PROPERTY_VALUE', 'ID', '1', 'tenant_system', 'security', '扩展属性候选项', null, null);
INSERT INTO `table_info` VALUES ('7', 'MASTER_TYPE', 'ID', '1', 'tenant_system', 'security', '主题', null, null);
INSERT INTO `table_info` VALUES ('8', 'ORG_EXT_PROPERTY_VALUE', 'ID', '1', 'tenant_system', 'security', '组织机构扩展属性值', null, null);
INSERT INTO `table_info` VALUES ('9', 'ORGINFO', 'ID', '1', 'tenant_system', 'security', '组织机构', 'ORG_NAME', 'ORGINFO_ID');
INSERT INTO `table_info` VALUES ('10', 'ORGTYPE', 'ID', '1', 'tenant_system', 'security', '组织机构类型', null, null);
INSERT INTO `table_info` VALUES ('11', 'PERMISSION', 'ID', '1', 'tenant_system', 'security', '授权', null, null);
INSERT INTO `table_info` VALUES ('12', 'PRIVILEGE', 'ID', '1', 'tenant_system', 'security', '权限', null, null);
INSERT INTO `table_info` VALUES ('13', 'RESOURCE_DATA_RULE', null, '1', 'tenant_system', 'security', '资源规则关联', null, null);
INSERT INTO `table_info` VALUES ('14', 'RESOURCES', 'ID', '1', 'tenant_system', 'security', '资源', null, null);
INSERT INTO `table_info` VALUES ('15', 'ROLEINFO', 'ID', '1', 'tenant_system', 'security', '角色', 'ROLE_NAME', 'ROLEINFO_ID');
INSERT INTO `table_info` VALUES ('16', 'RULE_TABLE_DATA_SOURCE', 'ID', '1', 'tenant_system', 'security', '表数据源', null, null);
INSERT INTO `table_info` VALUES ('17', 'SEX', 'ID', '1', 'tenant_system', 'security', '性别', null, null);
INSERT INTO `table_info` VALUES ('18', 'TABLE_INFO', 'ID', '1', 'tenant_system', 'security', '表', null, null);
INSERT INTO `table_info` VALUES ('19', 'USER_EXT_PROPERTY_VALUE', 'ID', '1', 'tenant_system', 'security', '用户扩展属性值', null, null);
INSERT INTO `table_info` VALUES ('20', 'USERINFO_ORGINFO_REL', null, '1', 'tenant_system', 'security', '用户组织机构关联', null, null);
INSERT INTO `table_info` VALUES ('21', 'USERINFO_ROLEINFO_REL', null, '1', 'tenant_system', 'security', '用户角色关联', null, null);
INSERT INTO `table_info` VALUES ('22', 'VIEW_RESOURCES_URL', 'ID', '1', 'tenant_system', 'security', 'URL资源', 'RESOURCE_NAME', null);
INSERT INTO `table_info` VALUES ('23', '.*', null, '1', 'tenant_system', 'security', '全部表', null, null);
INSERT INTO `table_info` VALUES ('24', '^(?!(PERMISSION)$).*$', null, '1', 'tenant_system', 'security', '授权之外的所有表', null, null);
INSERT INTO `table_info` VALUES ('25', 'PORTAL_SYS_PROPERTY', 'ID', '1', 'tenant_system', 'portal', 'PORTAL_SYS_PROPERTY', null, null);
INSERT INTO `table_info` VALUES ('26', 'PORTAL_APPLICATION_SYSTEM', 'ID', '1', 'tenant_system', 'portal', 'PORTAL_APPLICATION_SYSTEM', null, null);
INSERT INTO `table_info` VALUES ('27', 'TENANTTYPE', 'ID', '1', 'tenant_system', 'security', '租户类型', 'TENANTTYPE_NAME', '');
INSERT INTO `table_info` VALUES ('28', 'PORTAL_PAGE', 'ID', '1', 'tenant_system', 'portal', '门户页面', 'PAGE_NAME', '');
INSERT INTO `table_info` VALUES ('29', 'PORTAL_PORTLET', 'ID', '1', 'tenant_system', 'portal', '门户组件', 'DESCRIPTION', '');
INSERT INTO `table_info` VALUES ('30', 'PORTAL_PORTLET_CONFIG', 'ID', '1', 'tenant_system', 'portal', '门户组件配置', 'PROP_NAME', '');
INSERT INTO `table_info` VALUES ('31', 'PORTAL_PORTLET_CONFIG_INSTANCE', 'ID', '1', 'tenant_system', 'portal', '门户组件配置实例', 'PROP_VALUE', '');
INSERT INTO `table_info` VALUES ('32', 'PORTAL_PORTLET_EVENT', 'ID', '1', 'tenant_system', 'portal', '门户组件事件', 'EVENT_PARAM', '');
INSERT INTO `table_info` VALUES ('33', 'PORTAL_PORTLET_EVENT_REL', 'tenant_id', '1', 'tenant_system', 'portal', '门户组件事件关联', 'PORTAL_PORTLET_ID', '');
INSERT INTO `table_info` VALUES ('34', 'PORTAL_PORTLET_INSTANCE', 'ID', '1', 'tenant_system', 'portal', '门户组件实例', 'PORTLET_INSTANCE_NAME', '');
INSERT INTO `table_info` VALUES ('35', 'PORTAL_PORTLET_THEME', 'ID', '1', 'tenant_system', 'portal', '门户组件主题', 'THEME_NAME', '');
INSERT INTO `table_info` VALUES ('36', 'PORTAL_PORTLET_TYPE', 'ID', '1', 'tenant_system', 'portal', '门户组件类型', 'PORTLET_TYPE_NAME', '');
INSERT INTO `table_info` VALUES ('37', 'PORTAL_THEME', 'ID', '1', 'tenant_system', 'portal', '门户主题', 'DESCRIPTION', '');
INSERT INTO `table_info` VALUES ('38', 'PORTAL_THEME_FILE', 'ID', '1', 'tenant_system', 'portal', '门户主题文件', 'THEME_FILE_PATH', '');
INSERT INTO `table_info` VALUES ('40', 'PORTAL_LAYOUT', 'ID', '1', 'tenant_system', 'portal', '布局器', 'LAYOUT_NAME', '');
INSERT INTO `table_info` VALUES ('41', 'PORTAL_ANNOUNCEMENT', 'ID', '1', 'tenant_system', 'portal', '公告', 'ANNOUNCE_TITLE', '');
INSERT INTO `table_info` VALUES ('42', 'PORTAL_MESSAGE', 'ID', '1', 'tenant_system', 'portal', '', 'MSG_TITLE', '');
INSERT INTO `table_info` VALUES ('43', 'PORTAL_MESSAGE_FILE', 'MESSAGE_FILE_ID', '1', 'tenant_system', 'portal', '', 'MESSAGE_FILE_ID', '');
INSERT INTO `table_info` VALUES ('44', 'PORTAL_MESSAGE_USER_REL', 'ID', '1', 'tenant_system', 'portal', '', 'LOGIN_ID', '');
INSERT INTO `table_info` VALUES ('45', 'PORTAL_MESSAGE_FILE_REL', 'MESSAGE_ID', '1', 'tenant_system', 'portal', '', 'MESSAGE_ID', '');
INSERT INTO `table_info` VALUES ('46', 'TESTV', 'test', '1', 'tenant_system', 'bconsole', 'tested by BigHead', 'test', 'test');

-- ----------------------------
-- Table structure for tenantdatashare_tableinfo_rel
-- ----------------------------
DROP TABLE IF EXISTS `tenantdatashare_tableinfo_rel`;
CREATE TABLE `tenantdatashare_tableinfo_rel` (
  `TENANT_DATA_SHARE_ID` bigint(19) NOT NULL,
  `TABLEINFO_ID` bigint(19) NOT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `INCLUDE` varchar(5000) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUDE` varchar(5000) COLLATE utf8_bin DEFAULT NULL,
  `INCLUDE_NAMES` varchar(5000) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUDE_NAMES` varchar(5000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`TENANT_DATA_SHARE_ID`,`TABLEINFO_ID`),
  KEY `FK38473EC239A076BE` (`TABLEINFO_ID`) USING BTREE,
  CONSTRAINT `tenantdatashare_tableinfo_rel_ibfk_1` FOREIGN KEY (`TABLEINFO_ID`) REFERENCES `table_info` (`ID`),
  CONSTRAINT `tenantdatashare_tableinfo_rel_ibfk_2` FOREIGN KEY (`TENANT_DATA_SHARE_ID`) REFERENCES `tenant_data_share` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tenantdatashare_tableinfo_rel
-- ----------------------------
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '2', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '25', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '26', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '28', null, '', '1', '', '首页');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '29', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '30', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '31', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '32', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '33', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '34', null, '', '20,32,31,30,28,27,26,25,24,23,22,21,675', '', '退出,服务菜单,首页设置,编辑按钮,列式菜单,主题切换,logo,公告,主工作区,在线用户,水平菜单,当前用户,首页设置');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '35', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '36', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '37', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '38', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '40', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '41', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '42', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '43', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '44', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('10', '45', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('12', '5', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('12', '7', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('12', '10', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('12', '15', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('12', '17', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('12', '20', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('12', '21', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('12', '27', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('27', '2', null, '', '207,208,210,221,215,222,307,10550', '', '主表管理,规则管理,主体管理,多租户,租户管理,租户数据共享,租户类型管理,租户审批');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('28', '3', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('28', '4', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('28', '7', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('28', '9', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('28', '10', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('28', '11', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('28', '12', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('28', '13', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('28', '14', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('28', '16', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('28', '17', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('28', '18', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('28', '22', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('28', '27', null, '', '', '', '');
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('56', '24', 'tenant_system', null, null, null, null);
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('61', '14', 'tenant_system', null, null, null, null);
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('87', '3', 'tenant_system', null, null, null, null);
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('87', '13', 'tenant_system', null, null, null, null);
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('87', '14', 'tenant_system', null, null, null, null);
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('87', '16', 'tenant_system', null, null, null, null);
INSERT INTO `tenantdatashare_tableinfo_rel` VALUES ('87', '18', 'tenant_system', null, null, null, null);

-- ----------------------------
-- Table structure for tenantdatashare_tenantinfo_rel
-- ----------------------------
DROP TABLE IF EXISTS `tenantdatashare_tenantinfo_rel`;
CREATE TABLE `tenantdatashare_tenantinfo_rel` (
  `TENANT_DATA_SHARE_ID` bigint(19) NOT NULL,
  `TENANT_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANTINFO_ID` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`TENANT_DATA_SHARE_ID`,`TENANTINFO_ID`),
  KEY `FK64781E6F19B3344` (`TENANT_ID`) USING BTREE,
  KEY `FK64781E641FCECD6` (`TENANTINFO_ID`) USING BTREE,
  CONSTRAINT `tenantdatashare_tenantinfo_rel_ibfk_1` FOREIGN KEY (`TENANTINFO_ID`) REFERENCES `tenantinfo` (`TENANT_ID`),
  CONSTRAINT `tenantdatashare_tenantinfo_rel_ibfk_2` FOREIGN KEY (`TENANT_DATA_SHARE_ID`) REFERENCES `tenant_data_share` (`ID`),
  CONSTRAINT `tenantdatashare_tenantinfo_rel_ibfk_3` FOREIGN KEY (`TENANT_ID`) REFERENCES `tenantinfo` (`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tenantdatashare_tenantinfo_rel
-- ----------------------------
INSERT INTO `tenantdatashare_tenantinfo_rel` VALUES ('10', null, '*');
INSERT INTO `tenantdatashare_tenantinfo_rel` VALUES ('12', null, '*');
INSERT INTO `tenantdatashare_tenantinfo_rel` VALUES ('27', null, '*');
INSERT INTO `tenantdatashare_tenantinfo_rel` VALUES ('28', null, '*');
INSERT INTO `tenantdatashare_tenantinfo_rel` VALUES ('56', 'tenant_system', '*');
INSERT INTO `tenantdatashare_tenantinfo_rel` VALUES ('61', 'tenant_system', '*');
INSERT INTO `tenantdatashare_tenantinfo_rel` VALUES ('87', 'tenant_system', '*');

-- ----------------------------
-- Table structure for tenantinfo
-- ----------------------------
DROP TABLE IF EXISTS `tenantinfo`;
CREATE TABLE `tenantinfo` (
  `TENANT_ID` varchar(255) COLLATE utf8_bin NOT NULL,
  `REMARK` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ORD` bigint(10) DEFAULT NULL,
  `IS_SYSTEM` bigint(1) DEFAULT NULL,
  `TENANT_CODE` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANTTYPE_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`TENANT_ID`),
  KEY `FKBD77D458DB711344` (`PARENT_ID`) USING BTREE,
  CONSTRAINT `tenantinfo_ibfk_1` FOREIGN KEY (`PARENT_ID`) REFERENCES `tenantinfo` (`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tenantinfo
-- ----------------------------
INSERT INTO `tenantinfo` VALUES ('*', '所有租户（数据共享专用）', '所有租户', '0', '0', '*', 'tenant_system', null);
INSERT INTO `tenantinfo` VALUES ('bcos', '管理测试环境版本发布', 'bcos', null, '0', 'bcos', 'tenant_system', 'group');
INSERT INTO `tenantinfo` VALUES ('bdos-admin', null, 'bdos-admin', null, '0', 'bdos-admin', 'tenant_system', 'company');
INSERT INTO `tenantinfo` VALUES ('default', null, 'default', null, '0', 'default', 'tenant_system', 'company');
INSERT INTO `tenantinfo` VALUES ('ingress-nginx', null, 'ingress-nginx', null, '0', 'ingress-nginx', 'tenant_system', 'company');
INSERT INTO `tenantinfo` VALUES ('istio-system', '尚文测试租户', 'istio-system', null, '0', 'istio-system', 'tenant_system', 'company');
INSERT INTO `tenantinfo` VALUES ('kube-public', null, 'kube-public', null, '0', 'kube-public', 'tenant_system', 'company');
INSERT INTO `tenantinfo` VALUES ('kube-system', null, 'kube-system', null, '0', 'kube-system', 'tenant_system', 'company');
INSERT INTO `tenantinfo` VALUES ('tenant_system', null, '系统租户', '1', '1', 'tenant_system', null, null);
INSERT INTO `tenantinfo` VALUES ('testboncloud', '', 'testboncloud', '1', '0', 'testboncloud', 'tenant_system', 'enterprise');

-- ----------------------------
-- Table structure for tenanttype
-- ----------------------------
DROP TABLE IF EXISTS `tenanttype`;
CREATE TABLE `tenanttype` (
  `ID` varchar(255) NOT NULL,
  `TENANTTYPE_NAME` varchar(20) NOT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  `SORT` varchar(20) DEFAULT NULL,
  `ISTENANT` varchar(20) DEFAULT NULL,
  `ISAPPROVE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tenanttype
-- ----------------------------
INSERT INTO `tenanttype` VALUES ('114', 'testV', 'tenant_system', '12', '1', '1');
INSERT INTO `tenanttype` VALUES ('company', '子/分公司', 'tenant_system', '1', '0', '1');
INSERT INTO `tenanttype` VALUES ('enterprise', '合作企业', 'tenant_system', '3', '1', '1');
INSERT INTO `tenanttype` VALUES ('group', '集团', 'tenant_system', '2', '0', '0');

-- ----------------------------
-- Table structure for tenant_data_share
-- ----------------------------
DROP TABLE IF EXISTS `tenant_data_share`;
CREATE TABLE `tenant_data_share` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `APP_CODE` varchar(255) COLLATE utf8_bin NOT NULL,
  `RESOURCES_ID` bigint(19) DEFAULT NULL,
  `SRC_TENANT_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESC_TENANT_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK2556859FBB2F55FE` (`RESOURCES_ID`) USING BTREE,
  KEY `FK2556859FBF44DEA9` (`SRC_TENANT_ID`) USING BTREE,
  KEY `FK2556859FF66EEB16` (`DESC_TENANT_ID`) USING BTREE,
  CONSTRAINT `tenant_data_share_ibfk_1` FOREIGN KEY (`RESOURCES_ID`) REFERENCES `resources` (`ID`),
  CONSTRAINT `tenant_data_share_ibfk_2` FOREIGN KEY (`SRC_TENANT_ID`) REFERENCES `tenantinfo` (`TENANT_ID`),
  CONSTRAINT `tenant_data_share_ibfk_3` FOREIGN KEY (`DESC_TENANT_ID`) REFERENCES `tenantinfo` (`TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tenant_data_share
-- ----------------------------
INSERT INTO `tenant_data_share` VALUES ('10', 'portal', '120603', 'tenant_system', null, null);
INSERT INTO `tenant_data_share` VALUES ('12', 'security', '15', 'tenant_system', null, null);
INSERT INTO `tenant_data_share` VALUES ('27', 'portal', '100095', 'tenant_system', null, null);
INSERT INTO `tenant_data_share` VALUES ('28', 'security', '22', 'tenant_system', null, null);
INSERT INTO `tenant_data_share` VALUES ('56', 'security', '24', 'tenant_system', null, null);
INSERT INTO `tenant_data_share` VALUES ('61', 'security', '25', 'tenant_system', null, null);
INSERT INTO `tenant_data_share` VALUES ('87', 'security', '85', 'tenant_system', null, null);

-- ----------------------------
-- Table structure for tenant_data_source
-- ----------------------------
DROP TABLE IF EXISTS `tenant_data_source`;
CREATE TABLE `tenant_data_source` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` varchar(255) DEFAULT NULL,
  `DATA_SOURCE_KEY` varchar(255) DEFAULT NULL,
  `DATA_SOURCE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK85E5EA3BF932A705` (`DATA_SOURCE_ID`) USING BTREE,
  CONSTRAINT `tenant_data_source_ibfk_1` FOREIGN KEY (`DATA_SOURCE_ID`) REFERENCES `rule_table_data_source` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tenant_data_source
-- ----------------------------

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `a` char(1) DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------

-- ----------------------------
-- Table structure for test1
-- ----------------------------
DROP TABLE IF EXISTS `test1`;
CREATE TABLE `test1` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test1
-- ----------------------------

-- ----------------------------
-- Table structure for ticketgrantingticket
-- ----------------------------
DROP TABLE IF EXISTS `ticketgrantingticket`;
CREATE TABLE `ticketgrantingticket` (
  `id` varchar(255) NOT NULL,
  `number_of_times_used` int(11) DEFAULT NULL,
  `creation_time` bigint(20) DEFAULT NULL,
  `expiration_policy` longblob NOT NULL,
  `last_time_used` bigint(20) DEFAULT NULL,
  `previous_last_time_used` bigint(20) DEFAULT NULL,
  `authentication` longblob NOT NULL,
  `expired` bit(1) NOT NULL,
  `services_granted_access_to` longblob NOT NULL,
  `sessions` tinyblob,
  `ticket_granting_ticket` varchar(255) DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  `union_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t7o4fxrrei2whdl48avqa9jt8` (`ticket_granting_ticket`) USING BTREE,
  CONSTRAINT `ticketgrantingticket_ibfk_1` FOREIGN KEY (`ticket_granting_ticket`) REFERENCES `ticketgrantingticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ticketgrantingticket
-- ----------------------------

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `MEMO` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `MOBILE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `LOGIN_ID` varchar(255) COLLATE utf8_bin NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_bin NOT NULL,
  `IS_ADMIN` bigint(1) DEFAULT NULL,
  `USER_NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `SEX_ID` bigint(19) DEFAULT NULL,
  `ORGINFO_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `CREATE_USER` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `IS_NORAML` bigint(1) DEFAULT NULL,
  `RESERVE1` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESERVE2` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESERVE3` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESERVE4` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESERVE5` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_EXPIRE_DATE` datetime DEFAULT NULL,
  `ORGTYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `COMPANYNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `INDUSTRY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `COMPANYSCALE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNREASON` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TELEPHONE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DUTY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_REGISTRATION_NUMBER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ID_NUMBER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_APPLY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `APPROVEDROLEID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `UNIONID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK1ECD62F9401ABD5E` (`SEX_ID`) USING BTREE,
  CONSTRAINT `userinfo_ibfk_1` FOREIGN KEY (`SEX_ID`) REFERENCES `sex` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', '', '1@163.com', '18691202788', 'admin', 'aTmJbfwBnYlrJwqqDCJuYITL9iU=', '1', '管理员', '1', '', 'tenant_system', '2018-12-25 11:55:00', null, '', null, '', '', 'blue-skin', '', '', null, null, null, null, null, null, null, null, null, null, null, null, 'UNION_BF0ACEEBD445C25E24A9A6D309ACC516');
INSERT INTO `userinfo` VALUES ('2', '', '21@163.com', '18691202786', 'xbonc', '+MnR355frETMN6uF0Gf2KNs2FMg=', '1', '管理员', null, '', 'tenant_system', '2018-12-25 11:55:15', '2018-10-16 14:32:15', '', null, '', '', '', '', '', '2019-10-01 00:00:00', null, null, null, null, null, null, null, null, null, null, null, 'UNION_BF0ACEEBD445C25E24A9A6D309ACC516');
INSERT INTO `userinfo` VALUES ('3', '', 'a@qq.com', '18812341234', 'bdos-admin', 'aTmJbfwBnYlrJwqqDCJuYITL9iU=', '0', 'bdos-admin', '1', '', 'bdos-admin', '2018-12-11 15:04:11', '2018-12-11 15:04:11', '1', null, '', '', '', '', '', '2019-03-29 16:52:04', '', '', '', '', '', '', '', '', '', '', '', 'UNION_95A6E0A7302D2045DF8BADC3C639E751');
INSERT INTO `userinfo` VALUES ('4', '', '1@163.com', '18692222222', 'default', 'Iee+JMf88BEGiMJbHCn183YwV+w=', '0', 'default', null, null, 'default', '2018-11-09 10:49:30', '2018-11-09 10:49:30', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'UNION_E00C67CC35E98F50FD417F3ED3EAA7AA');
INSERT INTO `userinfo` VALUES ('5', '', '1@163.com', '18812341234', 'ingress-nginx', '8gkHg+VRPaWJMzsFDH3RIYK6Ffg=', '0', 'ingress-nginx', null, null, 'ingress-nginx', '2018-11-24 13:03:49', '2018-11-23 15:45:01', '', null, '', '1', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `userinfo` VALUES ('6', '', 'aaa@163.com', '12345678901', 'kube-public', '8gkHg+VRPaWJMzsFDH3RIYK6Ffg=', '0', 'kube-public', '1', null, 'kube-public', '2018-11-29 15:28:08', '2018-11-29 15:28:08', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `userinfo` VALUES ('7', '', '11@163.com', '12340912321', 'kube-system', '8gkHg+VRPaWJMzsFDH3RIYK6Ffg=', '0', 'kube-system', null, null, 'kube-system', '2018-12-04 19:23:03', '2018-11-29 15:29:29', '1', null, '', '', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, 'UNION_6F77FCA655D5D5E908B5605AA1A224C0');
INSERT INTO `userinfo` VALUES ('8', '测试', 'xxx@bonc.com.cn', '12345678911', 'istio-system', 'RHNf+YoHkZfWK6ybLKc+uPaMAo0=', '0', 'istio-system', '1', null, 'istio-system', '2018-12-04 19:41:46', '2018-12-04 19:41:46', '1', null, null, null, null, null, null, '2043-12-04 00:00:00', null, null, null, null, null, null, null, null, null, null, null, 'UNION_251877BB660EC90C5040422FACE4AFD5');
INSERT INTO `userinfo` VALUES ('9', '', null, null, 'testboncloud', 'okcK8krfsyMt4+9MopNpq8CKzsg=', '0', 'testboncloud', null, null, 'testboncloud', '2019-04-25 06:35:15', '2019-04-25 06:35:15', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'UNION_D83048DF6A64E1F9030470A1A92C91BF');
INSERT INTO `userinfo` VALUES ('10', '管理测试环境版本发布', null, null, 'bcos', '9ywgciDf1Qb901YP+JhGso6pJMk=', '0', 'bcos', null, null, 'bcos', '2019-04-25 11:46:08', '2019-04-25 11:46:08', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'UNION_D24FE39B4D8B2B2652D973E111AE8E4D');

-- ----------------------------
-- Table structure for userinfo_after_filter
-- ----------------------------
DROP TABLE IF EXISTS `userinfo_after_filter`;
CREATE TABLE `userinfo_after_filter` (
  `id` int(11) DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo_after_filter
-- ----------------------------

-- ----------------------------
-- Table structure for userinfo_orginfo_rel
-- ----------------------------
DROP TABLE IF EXISTS `userinfo_orginfo_rel`;
CREATE TABLE `userinfo_orginfo_rel` (
  `USERINFO_ID` bigint(19) NOT NULL,
  `ORGINFO_ID` varchar(255) COLLATE utf8_bin NOT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  KEY `FKDE9103E6D031B436` (`USERINFO_ID`) USING BTREE,
  KEY `FKDE9103E63BAF4BDE` (`ORGINFO_ID`) USING BTREE,
  CONSTRAINT `userinfo_orginfo_rel_ibfk_1` FOREIGN KEY (`ORGINFO_ID`) REFERENCES `orginfo` (`ID`),
  CONSTRAINT `userinfo_orginfo_rel_ibfk_2` FOREIGN KEY (`USERINFO_ID`) REFERENCES `userinfo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of userinfo_orginfo_rel
-- ----------------------------
INSERT INTO `userinfo_orginfo_rel` VALUES ('1', '1001', 'tenant_system');

-- ----------------------------
-- Table structure for userinfo_roleinfo_rel
-- ----------------------------
DROP TABLE IF EXISTS `userinfo_roleinfo_rel`;
CREATE TABLE `userinfo_roleinfo_rel` (
  `USERINFO_ID` bigint(19) NOT NULL,
  `ROLEINFO_ID` bigint(19) NOT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`USERINFO_ID`,`ROLEINFO_ID`),
  KEY `FK4FE8C7647CBE056` (`ROLEINFO_ID`) USING BTREE,
  CONSTRAINT `userinfo_roleinfo_rel_ibfk_1` FOREIGN KEY (`ROLEINFO_ID`) REFERENCES `roleinfo` (`ID`),
  CONSTRAINT `userinfo_roleinfo_rel_ibfk_2` FOREIGN KEY (`USERINFO_ID`) REFERENCES `userinfo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of userinfo_roleinfo_rel
-- ----------------------------
INSERT INTO `userinfo_roleinfo_rel` VALUES ('1', '1', 'tenant_system');
INSERT INTO `userinfo_roleinfo_rel` VALUES ('2', '107', 'tenant_system');
INSERT INTO `userinfo_roleinfo_rel` VALUES ('3', '-1', 'bdos-admin');
INSERT INTO `userinfo_roleinfo_rel` VALUES ('4', '-1', 'default');
INSERT INTO `userinfo_roleinfo_rel` VALUES ('5', '-1', 'ingress-nginx');
INSERT INTO `userinfo_roleinfo_rel` VALUES ('6', '-1', 'kube-public');
INSERT INTO `userinfo_roleinfo_rel` VALUES ('7', '-1', 'kube-system');
INSERT INTO `userinfo_roleinfo_rel` VALUES ('8', '-1', 'istio-system');
INSERT INTO `userinfo_roleinfo_rel` VALUES ('9', '-1', 'testboncloud');
INSERT INTO `userinfo_roleinfo_rel` VALUES ('10', '-1', 'bcos');

-- ----------------------------
-- Table structure for user_ext_property_value
-- ----------------------------
DROP TABLE IF EXISTS `user_ext_property_value`;
CREATE TABLE `user_ext_property_value` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROPERTY_VALUE` varchar(255) DEFAULT NULL,
  `PROPERTY_NAME` varchar(3000) DEFAULT NULL,
  `USERINFO_ID` bigint(20) DEFAULT NULL,
  `EXT_PROPERTY_DEFINE_ID` bigint(20) DEFAULT NULL,
  `tenant_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK944A5559D031B436` (`USERINFO_ID`) USING BTREE,
  KEY `FK944A55591FCF51E8` (`EXT_PROPERTY_DEFINE_ID`) USING BTREE,
  CONSTRAINT `user_ext_property_value_ibfk_1` FOREIGN KEY (`EXT_PROPERTY_DEFINE_ID`) REFERENCES `ext_property_define` (`ID`),
  CONSTRAINT `user_ext_property_value_ibfk_2` FOREIGN KEY (`USERINFO_ID`) REFERENCES `userinfo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_ext_property_value
-- ----------------------------

-- ----------------------------
-- Table structure for user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE `user_login_log` (
  `ID` bigint(19) NOT NULL AUTO_INCREMENT,
  `LOGIN_NAME` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `LOGIN_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `LOGIN_DATE` datetime DEFAULT NULL,
  `LOGOUT_DATE` datetime DEFAULT NULL,
  `LOGIN_IP` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `STATE` bigint(1) DEFAULT NULL,
  `TENANT_ID` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVE_DATE` datetime DEFAULT NULL,
  `SESSION_ID` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for user_strategy_info
-- ----------------------------
DROP TABLE IF EXISTS `user_strategy_info`;
CREATE TABLE `user_strategy_info` (
  `ID` bigint(20) NOT NULL,
  `USER_ID` varchar(50) DEFAULT NULL,
  `SECURITY_VALUE` varchar(20) DEFAULT NULL,
  `ORD` int(11) DEFAULT NULL,
  `SECURITY_TYPE` varchar(25) DEFAULT NULL,
  `QUESTION_INFO_ID` bigint(20) DEFAULT NULL,
  `TENANT_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK53526886DC1657C3` (`QUESTION_INFO_ID`) USING BTREE,
  CONSTRAINT `user_strategy_info_ibfk_1` FOREIGN KEY (`QUESTION_INFO_ID`) REFERENCES `question_info` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_strategy_info
-- ----------------------------

-- ----------------------------
-- Table structure for user_student
-- ----------------------------
DROP TABLE IF EXISTS `user_student`;
CREATE TABLE `user_student` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_student
-- ----------------------------

-- ----------------------------
-- Table structure for user_student_s
-- ----------------------------
DROP TABLE IF EXISTS `user_student_s`;
CREATE TABLE `user_student_s` (
  `name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_student_s
-- ----------------------------

-- ----------------------------
-- View structure for bpm_group_info
-- ----------------------------
DROP VIEW IF EXISTS `bpm_group_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `bpm_group_info` AS select `t`.`ID` AS `GROUP_CODE`,`t`.`ORG_NAME` AS `GROUP_NAME`,`t`.`ORG_NAME` AS `GROUP_DESC`,`t`.`ORGINFO_ID` AS `PARENT_GROUP_CODE`,`t`.`ORGTYPE_ID` AS `GROUP_TYPE_CODE`,`t`.`TENANT_ID` AS `TENANT_ID` from `orginfo` `t` ;

-- ----------------------------
-- View structure for bpm_group_type_info
-- ----------------------------
DROP VIEW IF EXISTS `bpm_group_type_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `bpm_group_type_info` AS select `orgtype`.`ID` AS `GROUP_TYPE_CODE`,`orgtype`.`ORGTYPE_NAME` AS `GROUP_TYPE_NAME` from `orgtype` ;

-- ----------------------------
-- View structure for bpm_role_info
-- ----------------------------
DROP VIEW IF EXISTS `bpm_role_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `bpm_role_info` AS select `roleinfo`.`ROLE_CODE` AS `ROLE_CODE`,`roleinfo`.`ROLE_NAME` AS `ROLE_NAME`,`roleinfo`.`ROLE_NAME` AS `ROLE_DESC`,`b`.`ROLE_CODE` AS `PARENT_ROLE_CODE`,(case `roleinfo`.`ROLE_CODE` when 'JG_MANAGER' then '1' else '0' end) AS `IS_MANAGER_ROLE`,`roleinfo`.`TENANT_ID` AS `TENANT_ID` from (`roleinfo` left join `roleinfo` `b` on((`roleinfo`.`ROLEINFO_ID` = `b`.`ID`))) ;

-- ----------------------------
-- View structure for bpm_user_ext_info
-- ----------------------------
DROP VIEW IF EXISTS `bpm_user_ext_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `bpm_user_ext_info` AS select '' AS `LOGIN_ID`,'' AS `ATTRIBUTE_CODE`,'' AS `ATTRIBUTE_VALUE`,'' AS `TENANT_ID` ;


-- ----------------------------
-- View structure for bpm_user_info
-- ----------------------------
DROP VIEW IF EXISTS `bpm_user_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `bpm_user_info` AS select distinct `userinfo`.`ID` AS `ID`,`userinfo`.`LOGIN_ID` AS `LOGIN_ID`,`userinfo`.`PASSWORD` AS `USER_PASSWORD`,`userinfo`.`USER_NAME` AS `USER_NAME`,`userinfo`.`USER_NAME` AS `USER_DESC`,`userinfo`.`EMAIL` AS `EMAIL`,`userinfo`.`MOBILE` AS `MOBILE`,`userinfo`.`IS_ADMIN` AS `IS_ADMIN`,`userinfo`.`TENANT_ID` AS `TENANT_ID` from `userinfo` ;

-- ----------------------------
-- View structure for bpm_user_role_rel
-- ----------------------------
DROP VIEW IF EXISTS `bpm_user_role_rel`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `bpm_user_role_rel` AS select `a`.`LOGIN_ID` AS `LOGIN_ID`,`b`.`ROLE_CODE` AS `ROLE_CODE`,`a`.`TENANT_ID` AS `TENANT_ID` from ((`userinfo` `a` join `roleinfo` `b`) join `userinfo_roleinfo_rel` `c`) where ((`a`.`ID` = `c`.`USERINFO_ID`) and (`b`.`ID` = `c`.`ROLEINFO_ID`)) ;

-- ----------------------------
-- View structure for bpm_user_role_relas
-- ----------------------------
DROP VIEW IF EXISTS `bpm_user_role_relas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `bpm_user_role_relas` AS select `a`.`LOGIN_ID` AS `LOGIN_ID`,`b`.`ROLE_CODE` AS `ROLE_CODE`,`a`.`TENANT_ID` AS `TENANT_ID` from ((`userinfo` `a` join `roleinfo` `b`) join `userinfo_roleinfo_rel` `c`) where ((`a`.`ID` = `c`.`USERINFO_ID`) and (`b`.`ID` = `c`.`ROLEINFO_ID`)) ;
-- ----------------------------
-- View structure for bpm_user_group_rel
-- ----------------------------
DROP VIEW IF EXISTS `bpm_user_group_rel`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `bpm_user_group_rel` AS select distinct `a`.`LOGIN_ID` AS `LOGIN_ID`,`b`.`ID` AS `GROUP_CODE`,(case `b`.`ORGTYPE_ID` when 333 then '1' else '0' end) AS `IS_MASTER_GROUP`,(case when (`e`.`PROPERTY_VALUE` = `a`.`LOGIN_ID`) then '1' else '0' end) AS `IS_GROUP_MANAGER`,`a`.`TENANT_ID` AS `TENANT_ID` from (((`userinfo_orginfo_rel` `c` join `orginfo` `b` on((`b`.`ID` = `c`.`ORGINFO_ID`))) join `bpm_user_info` `a` on((`a`.`ID` = `c`.`USERINFO_ID`))) left join `org_ext_property_value` `e` on(((`c`.`ORGINFO_ID` = `e`.`ORGINFO_ID`) and (`a`.`LOGIN_ID` = `e`.`PROPERTY_VALUE`) and (`e`.`EXT_PROPERTY_DEFINE_ID` = 7)))) ;