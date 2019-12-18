use mytimetable;

-- 创建一个登录账号TestUser
create login testuser with password = '123456';

-- 创建对应于这个登录账号的数据库用户TestUser
create user testuser from login testuser ;

-- 给用户授权
grant select,execute,insert,alter  
to testuser;