use factory_;

-- 对单表查询插入
select * from employee_basic_info;

insert into employee_basic_info
values('404', '霍金', '1942-1-8');

select * from employee_basic_info;

-- 对多表视图更新
select * from employee_dept_salary;

update employee_dept_salary
set name = '李勇_'
where name = '李勇'

select * from employee_dept_salary;

-- 尝试通过视图不存在信息进行修改
select * from employee_dept_salary;

update employee_dept_salary
set name = '王敏'
where employee_id = (
  select employee_id
  from employee
  where employee.name = '王敏'
)

select * from employee_dept_salary;