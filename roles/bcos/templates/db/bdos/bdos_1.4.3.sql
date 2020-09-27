alter table bdos_ci modify env_variables text;
alter table bdos_image_version modify env_variables text;

INSERT INTO bdos_dockerfile_type (id,create_time,description,type_name,update_time) VALUES 
('2','2019-09-27 09:21:39.000','node','node','2019-09-27 09:21:50.000')
,('3','2019-07-25 10:16:14.000','python','python','2019-07-25 10:16:25.000');

INSERT INTO bdos_dockerfile_template (id,create_time,dockerfile_content,dockerfile_name,tenant_name,created_by,project_id,type_id) VALUES 
('1','2019-09-27 09:33:37.000','FROM ${baseImageUrl}/python:2.7.14
RUN mkdir /py_project
WORKDIR /py_project
ADD ${filePath} /py_project
#RUN pip install -r /py_project/requirements.txt
CMD ["python", "
manage.py", "runserver"]','2.7.14','imagetenant','1111','111','3')
,('2','2019-09-27 09:33:37.000','FROM ${baseImageUrl}/python:3.6.4
RUN mkdir /py_project
WORKDIR /py_project
ADD ${filePath} /py_project
#RUN pip install -r /py_project/requirements.txt
CMD ["python", "
manage.py", "runserver"]','3.6.4','imagetenant','1111','111','3')
,('2c90839f69992bd201699933096e0005','2019-09-27 09:33:30.000','FROM ${baseImageUrl}/node:8.11
RUN mkdir -p /home/workdir
ADD  ${filePath} /home/workdir
WORKDIR /home/workdir
RUN npm install
RUN npm build
CMD ["npm", "start"]','8.11','imagetenant','1111','111','2')
,('2c90839f69992bd201699933096e0006','2019-09-27 09:33:33.000','FROM ${baseImageUrl}/node:9.11
RUN mkdir -p /home/workdir
ADD  ${filePath} /home/workdir
WORKDIR /home/workdir
RUN npm install
RUN npm build
CMD ["npm", "start"]','9.11','imagetenant','1111','111','2')
,('2c90839f69992bd201699933096e0007','2019-09-27 09:33:37.000','FROM ${baseImageUrl}/node:10.15
RUN mkdir -p /home/workdir
ADD  ${filePath} /home/workdir
WORKDIR /home/workdir
RUN npm install
RUN npm build
CMD ["npm", "start"]','10.15','imagetenant','1111','111','2');