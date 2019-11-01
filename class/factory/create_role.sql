-- 1．创建角色ProgramerRole，拥有创建表，存储过程，视图权限，拥有对Salary表的查询、修改、插入权限
use factory;
create role programmer_role; 

-- 对Salary表的查询、修改、插入权限
grant select,insert,alter
on salary
to programmer_role;

-- 创建表,存储过程权限
grant create table,execute  
to programmer_role;

-- 2．创建一个登录账号Testlogin
create login testlogin with password = '123456';

-- 3．创建对应于这个登录账号的数据库用户TestUser
create user testuser from login testlogin ;

-- 登录user,检测权限
use factory;
select * from salary;


-- 4．将用户TestUser添加到TestRole角色中
use factory;
exec sp_addrolemember programmer_role , testuser;


-- 登录user,检测权限
use factory;
select * from salary;