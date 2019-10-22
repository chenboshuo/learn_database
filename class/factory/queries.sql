use factory;
-- 2. 练习下面简单的查询语句：
-- a) 查询每个雇员的所有信息
select *
from employee;
/*
  employee_id,name,birthday,sex,adress,zip,phonenumber,email_adress,dept_id
  1001,李勇,78-3-12,0,河南,475001,3880378,ly@henu.edu.cn,1
  1002,王敏,80-11-2,1,河南,475002,0378311,wm@henu.edu.cn,1
  1003,刘晨,78-6-22,0,河南,475003,0378322,lc@henu.edu.cn,1
  1004,周宏,83-10-3,1,河北,475004,7865987,zh@ henu.edu.cn,1
  2001,张立,78-8-1,0,河南,475005,0378333,zl@henu.edu.cn,2
  2002,刘毅,82-1-23,0,河南,475006,0378344,ly@henu.edu.cn,2
  2003,张玫,81-3-15,1,河南,475007,0378355,zm@henu.edu.cn,2
  2004,王军,79-5-12,0,山东,475008,5687967,wj@henu.edu.cn,2
  3001,徐静,76-8-12,1,河南,475009,0378366,xj@henu.edu.cn,3
  3002,赵军,79-2-19,0,河南,475010,0378377,zj@henu.edu.cn,3
  3003,王霞,82-8-18,1,湖南,475011,7556677,wx@henu.edu.cn,3

*/
-- b) 查询每个雇员的地址和电话
select name, adress, phonenumber
from employee;
/*
  name,adress,phonenumber
  李勇,河南,3880378
  王敏,河南,0378311
  刘晨,河南,0378322
  周宏,河北,7865987
  张立,河南,0378333
  刘毅,河南,0378344
  张玫,河南,0378355
  王军,山东,5687967
  徐静,河南,0378366
  赵军,河南,0378377
  王霞,湖南,7556677
*/
-- c) 查询EmployeeID为2001的雇员的地址和电话。
select employee_id, name, adress, phonenumber
from employee
where employee_id = '2001';
/*
  employee_id,name,adress,phonenumber
  2001,张立,河南,0378333
*/
-- d) 查询女雇员地址和电话，并用AS子句将结果中各列的标题分别指定为“地址”和“电话”。
select name as 姓名, adress as 地址, phonenumber as 电话
from employee
where sex = 0;
-- 假设0代表女
/*
  姓名,地址,电话
  李勇,河南,3880378
  刘晨,河南,0378322
  张立,河南,0378333
  刘毅,河南,0378344
  王军,山东,5687967
  赵军,河南,0378377
*/
-- e) 计算每个雇员的实际收入。
select employee_id as 员工号, income - outcome as 实际收入
from salary;
/*
  员工号,实际收入
  1001,2100
  1002,2300
  1003,2500
  1004,2900
  2001,2400
  2002,2000
  2003,2300
  2004,3300
  3001,2200
  3002,2300
  3003,3200
*/
-- f) 找出所有姓王的雇员的部门号。
select name, dept_id
from employee
where name like '王%';
/*
  name,dept_id
  王敏,1
  王军,2
  王霞,3

*/
-- 思考：找出所有地址中含有“河南”的雇员的号码和部门号。
select employee_id, dept_id, adress
from employee
where adress like '%河南%';
/*
  employee_id,dept_id,adress
  1001,1,河南
  1002,1,河南
  1003,1,河南
  2001,2,河南
  2002,2,河南
  2003,2,河南
  3001,3,河南
  3002,3,河南
*/
-- 3.   练习多表连接查询和嵌套查询：
-- a)查询每个雇员的情况及工资情况（工资=Income - Outcome）
select employee.*, salary.income - salary.outcome as salary
from employee, salary
where employee.employee_id = salary.employee_id;
/*
  employee_id,name,birthday,sex,adress,zip,phonenumber,email_adress,dept_id,salary
  1001,李勇,78-3-12,0,河南,475001,3880378,ly@henu.edu.cn,1,2100
  1002,王敏,80-11-2,1,河南,475002,0378311,wm@henu.edu.cn,1,2300
  1003,刘晨,78-6-22,0,河南,475003,0378322,lc@henu.edu.cn,1,2500
  1004,周宏,83-10-3,1,河北,475004,7865987,zh@ henu.edu.cn,1,2900
  2001,张立,78-8-1,0,河南,475005,0378333,zl@henu.edu.cn,2,2400
  2002,刘毅,82-1-23,0,河南,475006,0378344,ly@henu.edu.cn,2,2000
  2003,张玫,81-3-15,1,河南,475007,0378355,zm@henu.edu.cn,2,2300
  2004,王军,79-5-12,0,山东,475008,5687967,wj@henu.edu.cn,2,3300
  3001,徐静,76-8-12,1,河南,475009,0378366,xj@henu.edu.cn,3,2200
  3002,赵军,79-2-19,0,河南,475010,0378377,zj@henu.edu.cn,3,2300
  3003,王霞,82-8-18,1,湖南,475011,7556677,wx@henu.edu.cn,3,3200

*/
-- b)查询财务部工资在2200元以上的雇员姓名及工资情况
select name, income - outcome as salary
from employee, salary
where employee.employee_id = salary.employee_id and income - outcome > 2200;
/*
  name,salary
  王敏,2300
  刘晨,2500
  周宏,2900
  张立,2400
  张玫,2300
  王军,3300
  赵军,2300
  王霞,3200
*/
-- c)查询研发部在1966年以前出生的雇员姓名及其工资详情
select name, birthday, income, outcome
from employee, salary
where employee.employee_id = salary.employee_id and birthday < '96-1-1';
/*
  name,birthday,income,outcome
  李勇,78-3-12,3600,1500
  王敏,80-11-2,3300,1000
  刘晨,78-6-22,3700,1200
  周宏,83-10-3,4500,1600
  张立,78-8-1,4000,1600
  刘毅,82-1-23,3800,1800
  张玫,81-3-15,3800,1500
  王军,79-5-12,5100,1800
  徐静,76-8-12,4200,2000
  赵军,79-2-19,4100,1800
  王霞,82-8-18,4600,1400
*/

-- d)查询人力资源部雇员的最高和最低工资
select max(income - outcome) as 最高工资, min(income - outcome) as 最低工资
from salary
where exists (
  select *
from employee
where employee.employee_id = salary.employee_id and exists(
    select *
  from department
  where employee.dept_id = department.dept_id
    and dept_name = '人力资源部'
  )
)
/*
  最高工资,最低工资
  3300,2200
*/

-- e)将各雇员的情况按工资由低到高排列
select employee.*, income - outcome as employee_salary
from employee, salary
where employee.employee_id = salary.employee_id
order by employee_salary;
/*
  employee_id,name,birthday,sex,adress,zip,phonenumber,email_adress,dept_id,employee_salary
  2002,刘毅,82-1-23,0,河南,475006,0378344,ly@henu.edu.cn,2,2000
  1001,李勇,78-3-12,0,河南,475001,3880378,ly@henu.edu.cn,1,2100
  3001,徐静,76-8-12,1,河南,475009,0378366,xj@henu.edu.cn,3,2200
  3002,赵军,79-2-19,0,河南,475010,0378377,zj@henu.edu.cn,3,2300
  2003,张玫,81-3-15,1,河南,475007,0378355,zm@henu.edu.cn,2,2300
  1002,王敏,80-11-2,1,河南,475002,0378311,wm@henu.edu.cn,1,2300
  2001,张立,78-8-1,0,河南,475005,0378333,zl@henu.edu.cn,2,2400
  1003,刘晨,78-6-22,0,河南,475003,0378322,lc@henu.edu.cn,1,2500
  1004,周宏,83-10-3,1,河北,475004,7865987,zh@ henu.edu.cn,1,2900
  3003,王霞,82-8-18,1,湖南,475011,7556677,wx@henu.edu.cn,3,3200
  2004,王军,79-5-12,0,山东,475008,5687967,wj@henu.edu.cn,2,3300

*/

-- f)求各部门的雇员数
select dept_id as 部门编号, count(employee_id) as 雇员数
from employee
group by dept_id;
/*
  部门编号,雇员数
  1,4
  2,4
  3,3
*/

-- g)找出所有在财务部和人力资源部工作的雇员的编号
select employee_id, dept_id
from employee
where exists (
  select *
from department
where employee.dept_id = department.dept_id and (dept_name = '财务部' or dept_name = '人力资源部')
)
/*
  employee_id,dept_id
  1001,1
  1002,1
  1003,1
  1004,1
  3001,3
  3002,3
  3003,3
*/

-- h)统计人力资源部工资在2500以上雇员的人数
select count(employee_id)
from employee
where exists(
  select *
from salary
where employee.employee_id = salary.employee_id and income - outcome > 2500 and exists(
    select *
  from department
  where dept_name = '人力资源部'
  ) 
)
/*
  (No column name)
  3
*/
-- i)求财务部雇员的总人数
select count(employee_id)
from employee
where exists (
  select *
from department
where employee.dept_id = department.dept_id and dept_name = '财务部'
);
/*
  (No column name)
  4
*/

-- j)求财务部雇员的平均工资
select avg(income - outcome)
from salary
where exists(
  select *
from employee
where employee.employee_id = salary.employee_id
  and exists(
    select *
  from department
  where employee.dept_id = department.dept_id and dept_name = '人力资源部'
  )
)
/*
  (No column name)
  2566.66666666667
*/

-- k)查找比所有财务部的雇员工资都高的雇员的姓名
select name
from employee
where exists(
  select *
from salary as salary_t
where employee.employee_id = salary_t.employee_id and not exists(
    select *
  from salary as  account
  where account.income - account.outcome >= salary_t.income - salary_t.outcome and exists(
      select *
    from employee
    where employee.employee_id = account.employee_id and dept_id = (
        select dept_id
      from department
      where dept_name = '财务部'
      )
    )
  )
)
/*
  name
  王军
  王霞
*/

-- l)查找财务部年龄不低于研发部所有雇员年龄的雇员的姓名
select name
from employee as output
where not exists(
  select *
  from employee as ref
  where output.birthday > ref.birthday and exists(
    select *
    from department
    where ref.dept_id = department.dept_id and dept_name = '研发部'
  )
) and exists(
  select *
  from department as r
  where output.dept_id = r.dept_id and dept_name = '财务部'
)
-- m)查找在财务部工作的雇员的情况
select employee.employee_id, name, birthday, sex, adress, zip, phonenumber, email_adress, income, outcome, employee.dept_id, dept_name, note
from employee, salary, department
where employee.employee_id = salary.employee_id
  and employee.dept_id = department.dept_id;










