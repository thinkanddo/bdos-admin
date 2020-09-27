--
-- Dropping constraints from roleinfo
--
ALTER TABLE roleinfo 
   DROP FOREIGN KEY roleinfo_ibfk_1;

--
-- Dropping constraints from tenantinfo
--
ALTER TABLE tenantinfo 
   DROP FOREIGN KEY tenantinfo_ibfk_1;

--
-- Dropping constraints from userinfo
--
ALTER TABLE userinfo 
   DROP FOREIGN KEY userinfo_ibfk_1;

--
-- Dropping constraints from userinfo_roleinfo_rel
--
ALTER TABLE userinfo_roleinfo_rel 
   DROP FOREIGN KEY userinfo_roleinfo_rel_ibfk_1;
ALTER TABLE userinfo_roleinfo_rel 
   DROP FOREIGN KEY userinfo_roleinfo_rel_ibfk_2;

--
-- Dropping constraints from app_tenant_data_source
--
ALTER TABLE app_tenant_data_source 
   DROP FOREIGN KEY app_tenant_data_source_ibfk_1;

--
-- Dropping constraints from tenantdatashare_tenantinfo_rel
--
ALTER TABLE tenantdatashare_tenantinfo_rel 
   DROP FOREIGN KEY tenantdatashare_tenantinfo_rel_ibfk_1;

--
-- Dropping constraints from tenant_data_share
--
ALTER TABLE tenant_data_share 
   DROP FOREIGN KEY tenant_data_share_ibfk_2;

--
-- Dropping constraints from image_files
--
ALTER TABLE image_files 
   DROP FOREIGN KEY image_files_ibfk_1;

--
-- Dropping constraints from userinfo_orginfo_rel
--
ALTER TABLE userinfo_orginfo_rel 
   DROP FOREIGN KEY userinfo_orginfo_rel_ibfk_2;

--
-- Dropping constraints from user_ext_property_value
--
ALTER TABLE user_ext_property_value 
   DROP FOREIGN KEY user_ext_property_value_ibfk_2;

--
-- Deleting data from table roleinfo
--
DELETE FROM roleinfo WHERE ID = 109;

--
-- Deleting data from table tenantinfo
--
DELETE FROM tenantinfo WHERE TENANT_ID = 'testboncloud';

--
-- Updating data of table tenantinfo
--
UPDATE tenantinfo SET REMARK = NULL WHERE TENANT_ID = 'bcos';
UPDATE tenantinfo SET REMARK = NULL WHERE TENANT_ID = 'istio-system';

--
-- Deleting data from table userinfo
--
DELETE FROM userinfo WHERE ID = 9;

--
-- Updating data of table userinfo
--
UPDATE userinfo SET MEMO = NULL WHERE ID = 8;
UPDATE userinfo SET MEMO = NULL WHERE ID = 10;

--
-- Deleting data from table userinfo_roleinfo_rel
--
DELETE FROM userinfo_roleinfo_rel WHERE USERINFO_ID = 9 AND ROLEINFO_ID = -1;
--
-- -- Enable foreign keys
--

--
-- Creating constraints for roleinfo
--
ALTER TABLE roleinfo 
  ADD CONSTRAINT roleinfo_ibfk_1 FOREIGN KEY (ROLEINFO_ID)
    REFERENCES roleinfo(ID);

--
-- Creating constraints for tenantinfo
--
ALTER TABLE tenantinfo 
  ADD CONSTRAINT tenantinfo_ibfk_1 FOREIGN KEY (PARENT_ID)
    REFERENCES tenantinfo(TENANT_ID);

--
-- Creating constraints for userinfo
--
ALTER TABLE userinfo 
  ADD CONSTRAINT userinfo_ibfk_1 FOREIGN KEY (SEX_ID)
    REFERENCES sex(ID);

--
-- Creating constraints for userinfo_roleinfo_rel
--
ALTER TABLE userinfo_roleinfo_rel 
  ADD CONSTRAINT userinfo_roleinfo_rel_ibfk_1 FOREIGN KEY (ROLEINFO_ID)
    REFERENCES roleinfo(ID);
ALTER TABLE userinfo_roleinfo_rel 
  ADD CONSTRAINT userinfo_roleinfo_rel_ibfk_2 FOREIGN KEY (USERINFO_ID)
    REFERENCES userinfo(ID);

--
-- Creating constraints for app_tenant_data_source
--
ALTER TABLE app_tenant_data_source 
  ADD CONSTRAINT app_tenant_data_source_ibfk_1 FOREIGN KEY (TENANTINFO_ID)
    REFERENCES tenantinfo(TENANT_ID);

--
-- Creating constraints for tenantdatashare_tenantinfo_rel
--
ALTER TABLE tenantdatashare_tenantinfo_rel 
  ADD CONSTRAINT tenantdatashare_tenantinfo_rel_ibfk_1 FOREIGN KEY (TENANTINFO_ID)
    REFERENCES tenantinfo(TENANT_ID);

--
-- Creating constraints for tenant_data_share
--
ALTER TABLE tenant_data_share 
  ADD CONSTRAINT tenant_data_share_ibfk_2 FOREIGN KEY (SRC_TENANT_ID)
    REFERENCES tenantinfo(TENANT_ID);

--
-- Creating constraints for image_files
--
ALTER TABLE image_files 
  ADD CONSTRAINT image_files_ibfk_1 FOREIGN KEY (USER_IMAGE)
    REFERENCES userinfo(ID);

--
-- Creating constraints for userinfo_orginfo_rel
--
ALTER TABLE userinfo_orginfo_rel 
  ADD CONSTRAINT userinfo_orginfo_rel_ibfk_2 FOREIGN KEY (USERINFO_ID)
    REFERENCES userinfo(ID);

--
-- Creating constraints for user_ext_property_value
--
ALTER TABLE user_ext_property_value 
  ADD CONSTRAINT user_ext_property_value_ibfk_2 FOREIGN KEY (USERINFO_ID)
    REFERENCES userinfo(ID);
