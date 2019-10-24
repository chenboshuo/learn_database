create database spj
go
use spj;

create table supply
(
  supply_id varchar(4) primary key,
  supply_name varchar(20) unique,
  status smallint,
  city varchar(10)
);
create table parts
(
  part_id varchar(4) primary key,
  part_name varchar(20),
  color varchar(10),
  weight smallint,
);
create table project
(
  project_id varchar(4) primary key,
  project_name varchar(20),
  city varchar(10)
);
create table SPJ
(
  supply_id varchar(4),
  part_id varchar(4),
  project_id varchar(4),
  quantity smallint,
  PRIMARY KEY (supply_id,part_id,project_id),
  FOREIGN KEY (supply_id) REFERENCES supply(supply_id),
  FOREIGN KEY (part_id) REFERENCES parts(part_id),
  FOREIGN KEY (project_id) REFERENCES project(project_id)
);


insert into supply
values('S1', '精益', 20, '天津');

insert into supply
values('S2', '盛锡', 10, '北京');
insert into supply
values('S3', '东方红', 30, '北京');
insert into supply
values('S4', '丰泰盛', 20, '天津');
insert into supply
values('S5', '为民', 30, '上海');
insert into parts
values('P1', '螺母', '红', 12);
insert into parts
values('P2', '螺栓', '绿', 12);
insert into parts
values('P3', '螺丝刀', '蓝', 12);
insert into parts
values('P4', '螺丝刀', '红', 12);
insert into parts
values('P5', '凸轮', '蓝', 12);
insert into parts
values('P6', '齿轮', '红', 12);
insert into project
values('J1', '三建', '北京');
insert into project
values('J2', '一汽', '长春');
insert into project
values('J3', '弹簧厂', '天津');
insert into project
values('J4', '造船厂', '天津');
insert into project
values('J5', '机车厂', '唐山');
insert into project
values('J6', '无线电厂', '常州');
insert into project
values('J7', '半导体厂', '南京');
insert into SPJ
values('S1', 'P1', 'J1', 200);
insert into SPJ
values('S1', 'P1', 'J3', 100);
insert into SPJ
values('S1', 'P1', 'J4', 700);
insert into SPJ
values('S1', 'P2', 'J2', 100);
insert into SPJ
values('S2', 'P3', 'J1', 400);
insert into SPJ
values('S2', 'P3', 'J2', 200);
insert into SPJ
values('S2', 'P3', 'J3', 500);
insert into SPJ
values('S2', 'P3', 'J4', 400);
insert into SPJ
values('S2', 'P5', 'J1', 400);
insert into SPJ
values('S2', 'P5', 'J2', 100);
insert into SPJ
values('S3', 'P1', 'J1', 200);
insert into SPJ
values('S3', 'P3', 'J1', 200);
insert into SPJ
values('S4', 'P5', 'J1', 100);
insert into SPJ
values('S4', 'P6', 'J3', 300);
insert into SPJ
values('S4', 'P6', 'J4', 200);
insert into SPJ
values('S5', 'P2', 'J4', 100);
insert into SPJ
values('S5', 'P3', 'J1', 200);
insert into SPJ
values('S5', 'P6', 'J2', 200);
insert into SPJ
values('S5', 'P6', 'J4', 500);

