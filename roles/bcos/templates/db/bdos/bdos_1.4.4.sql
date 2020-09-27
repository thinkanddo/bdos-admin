/*
Navicat MySQL Data Transfer

Source Server         : 172.16.3.25
Source Server Version : 50544
Source Host           : 172.16.3.25:3306
Source Database       : bdos_dev

Target Server Type    : MYSQL
Target Server Version : 50544
File Encoding         : 65001

Date: 2020-03-25 11:25:21
*/


-- ----------------------------
-- 修改：bdos_stateful_service_unit_version表中rabbitmq的镜像名称
-- ----------------------------
update `bdos_stateful_service_unit_version` set `version_path`='{{harbor.dns}}:{{harbor.port}}/library/kafka-alp-0.9.0:external-access' where id=9;
update `bdos_stateful_service_unit_version` set `version_path`='{{harbor.dns}}:{{harbor.port}}/library/kafka-alp-0.10.0:external-access' where id=10;
update `bdos_stateful_service_unit_version` set `version_path`='{{harbor.dns}}:{{harbor.port}}/library/kafka-alp-0.10.1:external-access' where id=11;
update `bdos_stateful_service_unit_version` set `version_path`='{{harbor.dns}}:{{harbor.port}}/library/kafka-alp-1.0.0:external-access' where id=12;
