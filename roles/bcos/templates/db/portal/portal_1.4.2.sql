SET FOREIGN_KEY_CHECKS=0;
--
-- -- Disable foreign keys
--

--
-- Dropping constraints from permission
--
ALTER TABLE permission 
   DROP FOREIGN KEY permission_ibfk_1;
ALTER TABLE permission 
   DROP FOREIGN KEY permission_ibfk_2;

--
-- Dropping constraints from portal_menuinfo
--
ALTER TABLE portal_menuinfo 
   DROP FOREIGN KEY portal_menuinfo_ibfk_1;
ALTER TABLE portal_menuinfo 
   DROP FOREIGN KEY portal_menuinfo_ibfk_2;

--
-- Dropping constraints from privilege
--
ALTER TABLE privilege 
   DROP FOREIGN KEY privilege_ibfk_1;
ALTER TABLE privilege 
   DROP FOREIGN KEY privilege_ibfk_2;
ALTER TABLE privilege 
   DROP FOREIGN KEY privilege_ibfk_3;

--
-- Dropping constraints from resources
--
ALTER TABLE resources 
   DROP FOREIGN KEY resources_ibfk_1;
ALTER TABLE resources 
   DROP FOREIGN KEY resources_ibfk_2;
ALTER TABLE resources 
   DROP FOREIGN KEY resources_ibfk_3;
ALTER TABLE resources 
   DROP FOREIGN KEY resources_ibfk_4;

--
-- Dropping constraints from log_rule
--
ALTER TABLE log_rule 
   DROP FOREIGN KEY log_rule_ibfk_1;

--
-- Dropping constraints from resource_data_address
--
ALTER TABLE resource_data_address 
   DROP FOREIGN KEY resource_data_address_ibfk_2;

--
-- Dropping constraints from resource_data_rule
--
ALTER TABLE resource_data_rule 
   DROP FOREIGN KEY resource_data_rule_ibfk_4;

--
-- Dropping constraints from resource_dependence
--
ALTER TABLE resource_dependence 
   DROP FOREIGN KEY resource_dependence_ibfk_1;

--
-- Dropping constraints from tenant_data_share
--
ALTER TABLE tenant_data_share 
   DROP FOREIGN KEY tenant_data_share_ibfk_1;

--
-- Inserting data into table permission
--
INSERT INTO permission(ID, MASTER_VALUE, PRIVILEGE_ID, MASTER_TYPE_ID, TENANT_ID) VALUES
(200000, '-1', 100408, 90541, 'tenant_system'),
(200001, '-1', 100483, 90541, 'tenant_system'),
(200002, '-1', 200000, 90541, 'tenant_system'),
(200003, '-1', 200001, 90541, 'tenant_system'),
(200004, '-1', 200002, 90541, 'tenant_system'),
(200005, '-1', 200003, 90541, 'tenant_system'),
(200006, '-1', 100488, 90541, 'tenant_system'),
(200007, '-1', 100489, 90541, 'tenant_system'),
(200008, '-1', 100463, 90541, 'tenant_system'),
(200009, '-1', 200004, 90541, 'tenant_system'),
(200010, '-1', 200005, 90541, 'tenant_system'),
(200011, '8', 100408, 90541, 'tenant_system'),
(200012, '8', 100483, 90541, 'tenant_system'),
(200013, '8', 200001, 90541, 'tenant_system'),
(200014, '8', 200002, 90541, 'tenant_system'),
(200015, '8', 200003, 90541, 'tenant_system'),
(200016, '8', 100488, 90541, 'tenant_system'),
(200017, '8', 100489, 90541, 'tenant_system'),
(200018, '8', 100463, 90541, 'tenant_system'),
(200019, '8', 200004, 90541, 'tenant_system'),
(200020, '8', 200005, 90541, 'tenant_system');

--
-- Updating data of table portal_menuinfo
--
UPDATE portal_menuinfo SET IS_DISABLE = 0 WHERE ID = 10604;
UPDATE portal_menuinfo SET IS_DISABLE = 0 WHERE ID = 10614;
UPDATE portal_menuinfo SET ORD = 2, MENU_DESC = '组件模板', URL = '/servflow/v1/component/template', MENU_NAME = '组件模板', IS_DISABLE = 0 WHERE ID = 10615;
UPDATE portal_menuinfo SET IS_DISABLE = 0 WHERE ID = 10638;
UPDATE portal_menuinfo SET IS_DISABLE = 0 WHERE ID = 10639;

--
-- Inserting data into table portal_menuinfo
--
INSERT INTO portal_menuinfo(ID, ORD, MENU_DESC, URL, MENU_NAME, MENU_CODE, MENUINFO_ID, TENANT_ID, ICON, IS_DISABLE, APP_SYS_CODE, SERVICE_APP_CODE, IS_USER, BY_USER, MENUINFO_TYPE_ID) VALUES
(20000, 3, '外部服务', 'bcos/v1/app/exterservice/page', '外部服务', 'exterService', 10585, 'tenant_system', '', 1, '', 'bconsole', 0, NULL, NULL),
(20001, 10, 'measure', '', '度量', 'measure', NULL, 'tenant_system', 'line-chart', 0, '', '', 0, NULL, NULL),
(20002, 1, '项目质量', '/console/v1/quality/project', '项目质量', 'measure_1', 20001, 'tenant_system', '', 0, '', 'bconsole', 0, NULL, NULL),
(20003, 2, '应用质量', '/console/v1/quality/application', '应用质量', 'measure_2', 20001, 'tenant_system', '', 0, '', 'bconsole', 0, NULL, NULL),
(20004, 4, '可视化编排', '/servflow/list', '可视化编排', 'servflow_rule', 10604, 'tenant_system', '', 0, '', 'bconsole', 0, NULL, NULL);

--
-- Inserting data into table privilege
--
INSERT INTO privilege(ID, PRIVILEGE_MASTER_VALUE, DATA_RESOURCE_VALUE, MASTER_TYPE_ID, DATA_RES_REG_RULE_ID, RESOURCES_ID, TENANT_ID, PRIVILEGE_NAME, PRIVILEGE_CODE, TYPE) VALUES
(200000, NULL, NULL, NULL, NULL, 200000, 'tenant_system', '-1_2/exterService/门户菜单', NULL, '2'),
(200001, NULL, NULL, NULL, NULL, 200001, 'tenant_system', '-1_2/measure/门户菜单', NULL, '2'),
(200002, NULL, NULL, NULL, NULL, 200002, 'tenant_system', '-1_2/measure_2/门户菜单', NULL, '2'),
(200003, NULL, NULL, NULL, NULL, 200003, 'tenant_system', '-1_2/measure_1/门户菜单', NULL, '2'),
(200004, NULL, NULL, NULL, NULL, 200004, 'tenant_system', '-1_2/servflow_rule/门户菜单', NULL, '2'),
(200005, NULL, NULL, NULL, NULL, 200005, 'tenant_system', '-1_2/components/门户菜单', NULL, '2');

--
-- Inserting data into table resources
--
INSERT INTO resources(ID, RESOUCE_CODE, RESOURCE_NAME, RESOURCE_TYPE, RESOURCE_DESC, RESOUCE_URL, SYSTEM_NO, UI_CLASS, DATA_RESOURCE_VALUE, DATA_RESOURCE_FILTER_TYPE, RESOURCES_ID, DATA_RES_REG_RULE_ID, TABLE_INFO_ID, TENANT_ID, URL_RESOURCES_ID, GROUP_ID, ORD, IS_HIDE, INTERFACETYPE, ISMUTITENANT, MENUID, INTERFACEURL, ADDRESSTYPE) VALUES
(200000, '2/exterService/PORTAL_MENU', '2/exterService/门户菜单', '2', NULL, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', NULL, 'exterService', 'listType', NULL, 2, NULL, 'tenant_system', 100095, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200001, '2/measure/PORTAL_MENU', '2/measure/门户菜单', '2', NULL, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', NULL, 'measure', 'listType', NULL, 2, NULL, 'tenant_system', 100095, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200002, '2/measure_2/PORTAL_MENU', '2/measure_2/门户菜单', '2', NULL, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', NULL, 'measure_2', 'listType', NULL, 2, NULL, 'tenant_system', 100095, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200003, '2/measure_1/PORTAL_MENU', '2/measure_1/门户菜单', '2', NULL, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', NULL, 'measure_1', 'listType', NULL, 2, NULL, 'tenant_system', 100095, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200004, '2/servflow_rule/PORTAL_MENU', '2/servflow_rule/门户菜单', '2', NULL, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', NULL, 'servflow_rule', 'listType', NULL, 2, NULL, 'tenant_system', 100095, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200005, '2/components/PORTAL_MENU', '2/components/门户菜单', '2', NULL, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', NULL, 'components', 'listType', NULL, 2, NULL, 'tenant_system', 100095, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
--
-- -- Enable foreign keys
--

--
-- Creating constraints for permission
--
ALTER TABLE permission 
  ADD CONSTRAINT permission_ibfk_1 FOREIGN KEY (MASTER_TYPE_ID)
    REFERENCES master_type(ID);
ALTER TABLE permission 
  ADD CONSTRAINT permission_ibfk_2 FOREIGN KEY (PRIVILEGE_ID)
    REFERENCES privilege(ID);

--
-- Creating constraints for portal_menuinfo
--
ALTER TABLE portal_menuinfo 
  ADD CONSTRAINT portal_menuinfo_ibfk_1 FOREIGN KEY (MENUINFO_ID)
    REFERENCES portal_menuinfo(ID);
ALTER TABLE portal_menuinfo 
  ADD CONSTRAINT portal_menuinfo_ibfk_2 FOREIGN KEY (MENUINFO_TYPE_ID)
    REFERENCES portal_menuinfo_type(ID);

--
-- Creating constraints for privilege
--
ALTER TABLE privilege 
  ADD CONSTRAINT privilege_ibfk_1 FOREIGN KEY (DATA_RES_REG_RULE_ID)
    REFERENCES data_res_reg_rule(ID);
ALTER TABLE privilege 
  ADD CONSTRAINT privilege_ibfk_2 FOREIGN KEY (MASTER_TYPE_ID)
    REFERENCES master_type(ID);
ALTER TABLE privilege 
  ADD CONSTRAINT privilege_ibfk_3 FOREIGN KEY (RESOURCES_ID)
    REFERENCES resources(ID);

--
-- Creating constraints for resources
--
ALTER TABLE resources 
  ADD CONSTRAINT resources_ibfk_1 FOREIGN KEY (TABLE_INFO_ID)
    REFERENCES table_info(ID);
ALTER TABLE resources 
  ADD CONSTRAINT resources_ibfk_2 FOREIGN KEY (DATA_RES_REG_RULE_ID)
    REFERENCES data_res_reg_rule(ID);
ALTER TABLE resources 
  ADD CONSTRAINT resources_ibfk_3 FOREIGN KEY (URL_RESOURCES_ID)
    REFERENCES resources(ID);
ALTER TABLE resources 
  ADD CONSTRAINT resources_ibfk_4 FOREIGN KEY (RESOURCES_ID)
    REFERENCES resources(ID);

--
-- Creating constraints for log_rule
--
ALTER TABLE log_rule 
  ADD CONSTRAINT log_rule_ibfk_1 FOREIGN KEY (RESOURCES_ID)
    REFERENCES resources(ID);

--
-- Creating constraints for resource_data_address
--
ALTER TABLE resource_data_address 
  ADD CONSTRAINT resource_data_address_ibfk_2 FOREIGN KEY (RESOURCES_ID)
    REFERENCES resources(ID);

--
-- Creating constraints for resource_data_rule
--
ALTER TABLE resource_data_rule 
  ADD CONSTRAINT resource_data_rule_ibfk_4 FOREIGN KEY (RESOURCES_ID)
    REFERENCES resources(ID);

--
-- Creating constraints for resource_dependence
--
ALTER TABLE resource_dependence 
  ADD CONSTRAINT resource_dependence_ibfk_1 FOREIGN KEY (DEP_RESOURCES_ID)
    REFERENCES resources(ID);

--
-- Creating constraints for tenant_data_share
--
ALTER TABLE tenant_data_share 
  ADD CONSTRAINT tenant_data_share_ibfk_1 FOREIGN KEY (RESOURCES_ID)
    REFERENCES resources(ID);


ALTER TABLE `permission` auto_increment=900000 ;
ALTER TABLE `portal_menuinfo` auto_increment=90000;
ALTER TABLE `privilege` auto_increment=900000;
ALTER TABLE `resources` auto_increment=900000;

SET FOREIGN_KEY_CHECKS=0;
--
-- -- Disable foreign keys
--

--
-- Dropping constraints from permission
--
ALTER TABLE permission DROP FOREIGN KEY permission_ibfk_1;
ALTER TABLE permission DROP FOREIGN KEY permission_ibfk_2;

--
-- Dropping constraints from portal_menuinfo
--
ALTER TABLE portal_menuinfo DROP FOREIGN KEY portal_menuinfo_ibfk_1;
ALTER TABLE portal_menuinfo DROP FOREIGN KEY portal_menuinfo_ibfk_2;

--
-- Dropping constraints from privilege
--
ALTER TABLE privilege DROP FOREIGN KEY privilege_ibfk_1;
ALTER TABLE privilege DROP FOREIGN KEY privilege_ibfk_2;
ALTER TABLE privilege DROP FOREIGN KEY privilege_ibfk_3;

--
-- Dropping constraints from resources
--
ALTER TABLE resources DROP FOREIGN KEY resources_ibfk_1;
ALTER TABLE resources DROP FOREIGN KEY resources_ibfk_2;
ALTER TABLE resources DROP FOREIGN KEY resources_ibfk_3;
ALTER TABLE resources DROP FOREIGN KEY resources_ibfk_4;

--
-- Inserting data into table permission
--
INSERT INTO permission(ID, MASTER_VALUE, PRIVILEGE_ID, MASTER_TYPE_ID, TENANT_ID) VALUES
(200021, '-1', 200006, 90541, 'tenant_system'),
(200022, '-1', 100434, 90541, 'tenant_system'),
(200023, '-1', 100482, 90541, 'tenant_system'),
(200024, '-1', 200007, 90541, 'tenant_system'),
(200025, '-1', 100436, 90541, 'tenant_system'),
(200026, '8', 200006, 90541, 'tenant_system'),
(200027, '8', 100482, 90541, 'tenant_system'),
(200028, '8', 200007, 90541, 'tenant_system'),
(200029, '8', 100436, 90541, 'tenant_system'),
(200030, '8', 100434, 90541, 'tenant_system'),
(200031, '7', 200006, 90541, 'tenant_system'),
(200032, '7', 100434, 90541, 'tenant_system'),
(200033, '7', 100482, 90541, 'tenant_system'),
(200034, '7', 200007, 90541, 'tenant_system'),
(200035, '7', 100436, 90541, 'tenant_system');

--
-- Updating data of table portal_menuinfo
--
UPDATE portal_menuinfo SET IS_DISABLE = 0 WHERE ID = 10579;
UPDATE portal_menuinfo SET IS_DISABLE = 0 WHERE ID = 10580;

--
-- Inserting data into table portal_menuinfo
--
INSERT INTO portal_menuinfo(ID, ORD, MENU_DESC, URL, MENU_NAME, MENU_CODE, MENUINFO_ID, TENANT_ID, ICON, IS_DISABLE, APP_SYS_CODE, SERVICE_APP_CODE, IS_USER, BY_USER, MENUINFO_TYPE_ID) VALUES
(20005, NULL, 'Hbase', '/productCase/component/service?productId=hbase', 'Hbase', 'Hbase', 10578, 'tenant_system', '', 0, '', 'bconsole', 0, NULL, NULL),
(20006, NULL, 'Spark', '/productCase/component/service?productId=spark', 'Spark', 'Spark', 10578, 'tenant_system', '', 0, '', 'bconsole', 0, NULL, NULL);

--
-- Inserting data into table privilege
--
INSERT INTO privilege(ID, PRIVILEGE_MASTER_VALUE, DATA_RESOURCE_VALUE, MASTER_TYPE_ID, DATA_RES_REG_RULE_ID, RESOURCES_ID, TENANT_ID, PRIVILEGE_NAME, PRIVILEGE_CODE, TYPE) VALUES
(200006, NULL, NULL, NULL, NULL, 200006, 'tenant_system', '-1_2/Hbase/门户菜单', NULL, '2'),
(200007, NULL, NULL, NULL, NULL, 200007, 'tenant_system', '-1_2/Spark/门户菜单', NULL, '2');

--
-- Inserting data into table resources
--
INSERT INTO resources(ID, RESOUCE_CODE, RESOURCE_NAME, RESOURCE_TYPE, RESOURCE_DESC, RESOUCE_URL, SYSTEM_NO, UI_CLASS, DATA_RESOURCE_VALUE, DATA_RESOURCE_FILTER_TYPE, RESOURCES_ID, DATA_RES_REG_RULE_ID, TABLE_INFO_ID, TENANT_ID, URL_RESOURCES_ID, GROUP_ID, ORD, IS_HIDE, INTERFACETYPE, ISMUTITENANT, MENUID, INTERFACEURL, ADDRESSTYPE) VALUES
(200006, '2/Hbase/PORTAL_MENU', '2/Hbase/门户菜单', '2', NULL, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', NULL, 'Hbase', 'listType', NULL, 2, NULL, 'tenant_system', 100095, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200007, '2/Spark/PORTAL_MENU', '2/Spark/门户菜单', '2', NULL, '(.*menuinfo!add.action)|(.*menuinfo!edit.action.*)||(.*?/menuinfo.action.*?)|(.*?/menuinfo!getMenuDatas.action.*?)|(.*?/onlineUser!get.*?)|(.*?/logout.action.*?)|(.*rest/menus/list.*)|(.*/dataResRegRule!getTables.action.*)', 'portal', NULL, 'Spark', 'listType', NULL, 2, NULL, 'tenant_system', 100095, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
--
-- -- Enable foreign keys
--

--
-- Creating constraints for permission
--
ALTER TABLE permission ADD CONSTRAINT permission_ibfk_1 FOREIGN KEY (MASTER_TYPE_ID)
    REFERENCES master_type(ID) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE permission ADD CONSTRAINT permission_ibfk_2 FOREIGN KEY (PRIVILEGE_ID)
    REFERENCES privilege(ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Creating constraints for portal_menuinfo
--
ALTER TABLE portal_menuinfo ADD CONSTRAINT portal_menuinfo_ibfk_1 FOREIGN KEY (MENUINFO_ID)
    REFERENCES portal_menuinfo(ID) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE portal_menuinfo ADD CONSTRAINT portal_menuinfo_ibfk_2 FOREIGN KEY (MENUINFO_TYPE_ID)
    REFERENCES portal_menuinfo_type(ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Creating constraints for privilege
--
ALTER TABLE privilege ADD CONSTRAINT privilege_ibfk_1 FOREIGN KEY (DATA_RES_REG_RULE_ID)
    REFERENCES data_res_reg_rule(ID) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE privilege ADD CONSTRAINT privilege_ibfk_2 FOREIGN KEY (MASTER_TYPE_ID)
    REFERENCES master_type(ID) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE privilege ADD CONSTRAINT privilege_ibfk_3 FOREIGN KEY (RESOURCES_ID)
    REFERENCES resources(ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Creating constraints for resources
--
ALTER TABLE resources ADD CONSTRAINT resources_ibfk_1 FOREIGN KEY (TABLE_INFO_ID)
    REFERENCES table_info(ID) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE resources ADD CONSTRAINT resources_ibfk_2 FOREIGN KEY (DATA_RES_REG_RULE_ID)
    REFERENCES data_res_reg_rule(ID) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE resources ADD CONSTRAINT resources_ibfk_3 FOREIGN KEY (URL_RESOURCES_ID)
    REFERENCES resources(ID) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE resources ADD CONSTRAINT resources_ibfk_4 FOREIGN KEY (RESOURCES_ID)
    REFERENCES resources(ID) ON DELETE RESTRICT ON UPDATE RESTRICT;