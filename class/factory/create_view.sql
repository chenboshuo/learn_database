use factory;
go

-- 1）基于单个表按投影操作定义视图。
-- 举例：定义一个视图用以查看所有员工的编号、姓名和出生日期。
create view employee_basic_info
as 
  select employee_id, name,birthday
  from employee;

go
select * 
from employee_basic_info;
-- 2）基于单个表按选择操作定义视图。
-- 举例：定义一个满足sex=’true’的员工的所有信息的视图。
-- 假设0 代表女
go
create view male_employee 
as 
  select *
  from employee
  where sex = 1;

go 
select * 
from male_employee;

-- 3）基于单个表按选择和投影操作定义视图。
-- 举例：定义一个视图用以查看部门号码为‘2’的所有员工的姓名、电话和邮件地址。
go 
create view employee_dept_2
as 
  select name,phonenumber,email_adress
  from employee
  where dept_id = '2';

go
select * 
from employee_dept_2

-- 4）基于多个表根据连接操作定义视图。
-- 举例：定义一个视图用以查看所有员工的姓名、部门名及工资。
go 
create view employee_dept_salary
as
  select employee.name, department.dept_name, income - outcome as salary
  from employee,department,salary
  where employee.employee_id = salary.employee_id 
        and employee.dept_id = department.dept_id

go
select * from employee_dept_salary;

-- 5）基于多个表根据嵌套查询定义视图。
-- 举例：定义一个比所有财务部的雇员工资都高的雇员的信息的视图
go 
create view well_paid_employee
as 
  select employee.* , dept_name, salary
  from employee, employee_dept_salary as someone
  where employee.name = someone.name
  and not exists(
    select * 
    from employee_dept_salary as account 
    where someone.salary <= account.salary
      and account.dept_name = '财务部'
  )

go
select * from well_paid_employee;

-- 6）定义含有虚字段（即基本表中原本不存在的字段）的视图。
-- 举例：定义一个视图用以查看所有雇员的编号、姓名、年龄
go
create view employee_age 
as 
  select employee_id, name, year(getdate()) - year(birthday) as age 
  from employee

go
select * from employee_age; 