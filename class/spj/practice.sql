use sapre_parts_supply;
-- 1．在S表中插入元组“s6，华誉，40，广州”
insert into supply
values
  ('S6', '华誉', '40', '广州');

-- 检验
select *
from supply;
/*
  supply_id,supply_name,status,city
  S1,精益,20,天津
  S2,盛锡,10,北京
  S3,东方红,30,北京
  S4,丰泰盛,20,天津
  S5,为民,30,上海
  S6,华誉,40,广州
*/

-- 2．在J表中插入元组“j8，传感器厂”
insert into project
values('J8', '传感器厂', NULL);

select *
from project;

-- 3．对每一个供应商，求他为各种工程供应零件的总数量，并将此结果存入数据库
create table supply_parts_quantity
(
  supply_id varchar(4),
  total_qantity int
);
insert into supply_parts_quantity
select supply_id, sum(quantity)
from quantity
group by supply_id;

-- 检验
select *
from supply_parts_quantity;
-- 4．将P表中PNO值为p6的元组的color属性值改为绿，weight属性值改为60
select *
from parts
where part_id = 'P6'

update parts
set color = '绿', weight = '60'
where part_id = 'P6'

select *
from parts
where part_id = 'P6'

-- 5．将SPJ表中前4个元组的qty属性值统一修改为300
select *
from quantity

update quantity
set quantity = 300 
where supply_id = 'S1'

select *
from quantity

-- 6．将S表中city属性名含有“京”或“津”的相应status属性值增加100
select *
from supply

update supply
set status = status + 100 
where city like '%京%' or city like '%津%'

select *
from supply
-- 7．将供应商s2为“一汽”工程项目所供应的零件数量修改为2000
select *
from quantity

update quantity
set quantity = 2000
where exists(
  select *
  from project
  where quantity.project_id = project.project_id and project_name = '一汽'
) and supply_id = 'S2'

select *
from quantity

-- 8．将全部红色零件的颜色修改为浅红色
select *
from parts;

update parts
set color = '浅红'
where color = '红'

select *
from parts;

-- 9．由s5供给j4的零件p6改为由s3供应
select *
from quantity

update quantity
set supply_id='S3'
where supply_id = 'S5' and project_id = 'J4'

select *
from quantity

-- 10．在SPJ表中新增一名为SDATE的属性列，对该表中的每一元组在SDATE属性列上填上实验当时的日期和时间
alter table quantity add time datetime
update quantity
set time = getdate()

select *
from quantity;
-- 11．删除所在城市为“广州”的供应商记录
select *
from supply;

delete from supply 
where city = '广州'

select *
from supply;

-- 12．删除所有零件名称中第一个字为“螺”字的零件记录，并在供应情况表中删除相应的记录
select * 
from parts

select * 
from quantity

delete from quantity
where exists (
  select *
  from parts
  where parts.part_id = quantity.part_id and part_name like '螺%'
)

delete from parts
where part_name like '螺%'

select * 
from parts

select * from quantity

--  还原删除内容
insert into parts
values('P1', '螺母', '红', 12);
insert into parts
values('P2', '螺栓', '绿', 12);
insert into parts
values('P3', '螺丝刀', '蓝', 12);
insert into parts
values('P4', '螺丝刀', '红', 12);
insert into quantity(supply_id, part_id, project_id, quantity)
values
('S1', 'P1', 'J1', 200),
('S1', 'P1', 'J3', 100),
('S1', 'P1', 'J4', 700),
('S1', 'P2', 'J2', 100),
('S2', 'P3', 'J1', 400),
('S2', 'P3', 'J2', 200),
('S2', 'P3', 'J3', 500),
('S2', 'P3', 'J4', 400),
('S3', 'P1', 'J1', 200),
('S3', 'P3', 'J1', 200),
('S5', 'P2', 'J4', 100),
('S5', 'P3', 'J1', 200);

-- 13．删除s3和s4两供应商为“三建”工程供应“螺母”或“螺丝刀”零件的相应供应情况数据信息

select * from quantity
select * from parts
select * from project

delete from quantity
where (supply_id = 'S3' or supply_id = 'S4') and project_id = (
  select project_id
  from project
  where project_name = '三建'
) and part_id in (
  select part_id
  from parts 
  where part_name = '螺母' or part_name = '螺丝刀'
)

select * from quantity
select * from parts
select * from project
