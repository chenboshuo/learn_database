create database factory
go
use factory;
-- department 表
create table department
(
  dept_id varchar(3) not null,
  -- 员工部门号
  dept_name varchar(20) not null,
  -- 部门名
  note text,
  -- 备注
  primary key (dept_id)
);


insert into department
values
  ('1', '财务部', '财务部'),
  ('2', '研发部', '研发部'),
  ('3', '人力资源部', '人力资源部');

-- employee 表
create table employee
(
  employee_id varchar(6) not null,
  -- 员工编号
  name varchar(10) not null,
  -- 姓名
  birthday datetime not null,
  -- 出生日期
  sex bit not null,
  -- 性别
  adress varchar(20),
  -- 地址
  zip varchar(6),
  -- 邮编
  phonenumber varchar(12),
  -- 电话号码
  email_adress varchar(30),
  -- 电子邮件地址
  dept_id varchar(3),
  -- 员工部门号
  primary key (employee_id),
  foreign key (dept_id) references department
);

insert into employee
values
  ('1001', '李勇', '78-3-12', '0', '河南', '475001', '3880378', 'ly@henu.edu.cn', '1'),
  ('1002', '王敏', '80-11-2', '1', '河南', '475002', '0378311', 'wm@henu.edu.cn', '1'),
  ('1003', '刘晨', '78-6-22', '0', '河南', '475003', '0378322', 'lc@henu.edu.cn', '1'),
  ('1004', '周宏', '83-10-3', '1', '河北', '475004', '7865987', 'zh@ henu.edu.cn', '1'),
  ('2001', '张立', '78-8-1', '0', '河南', '475005', '0378333', 'zl@henu.edu.cn', '2'),
  ('2002', '刘毅', '82-1-23', '0', '河南', '475006', '0378344', 'ly@henu.edu.cn', '2'),
  ('2003', '张玫', '81-3-15', '1', '河南', '475007', '0378355', 'zm@henu.edu.cn', '2'),
  ('2004', '王军', '79-5-12', '0', '山东', '475008', '5687967', 'wj@henu.edu.cn', '2'),
  ('3001', '徐静', '76-8-12', '1', '河南', '475009', '0378366', 'xj@henu.edu.cn', '3'),
  ('3002', '赵军', '79-2-19', '0', '河南', '475010', '0378377', 'zj@henu.edu.cn', '3'),
  ('3003', '王霞', '82-8-18', '1', '湖南', '475011', '7556677', 'wx@henu.edu.cn', '3');

create table salary
(
  employee_id varchar(6) not null,
  income float(8) not null,
  outcome float(8) not null,
  primary key (employee_id),
  foreign key
  (employee_id) references employee
);

insert into salary
  ( employee_id , income , outcome )
values
  ('1001', '3600', '1500'),
  ('1002', '3300', '1000'),
  ('1003', '3700', '1200'),
  ('1004', '4500', '1600'),
  ('2001', '4000', '1600'),
  ('2002', '3800', '1800'),
  ('2003', '3800', '1500'),
  ('2004', '5100', '1800'),
  ('3001', '4200', '2000'),
  ('3002', '4100', '1800'),
  ('3003', '4600', '1400');
