use school;
-- 查询学生学号与姓名
select stu_id, stu_name
from student;

-- 查询学生学号与姓名与所在系
select stu_id, stu_name, stu_dept
from student;

-- 查询全体学生详细记录
select *
from student;

-- 假定今年是2004年,查询全体学生姓名及出生年份
select stu_name, 2004 - stu_age
from student;

-- 查询全体学生姓名,出生年份和所在系(用小写字母表示)
select stu_name, 'Year of Birth', 2004-stu_age, lower(stu_dept)
from student;

-- 使用别名
select stu_name name, 'Year of Birth' birth,
  2004 - stu_age birth,
  lower(stu_dept) department
from student;

-- 查询选修课程的学生学号
select stu_id
from elective_course;
/*
等价于
select all stu_id
from elective_course;
*/

-- 消除重复行
select distinct stu_id
from elective_course;

-- 查询满足条件的元组
-- 查询计算机系全体学生名单
select stu_name
from student
where stu_dept = 'CS';
/*
  stu_name
  李勇
  刘晨
*/

-- 查询所有年龄20以下的学生名单及年龄
select stu_id, stu_age
from student
where stu_age < 20;

-- 查询考试成绩不及格的学生呢学号
select stu_id
from elective_course
where grade < 60;
/* 没有 */

-- 确定范围
-- 查询年龄在20-23(含20,23) 的学生姓名,院系,年龄
select stu_name, stu_dept, stu_age
from student
where stu_age between 20 and 13;
/* 没有 */

-- 查询年龄不在20-23的学生姓名,院系,年龄
select stu_name, stu_dept, stu_age
from student
where stu_age not between 20 and 13;
/*
  stu_name,stu_dept,stu_age
  李勇,CS,20
  刘晨,CS,19
  王敏,MA,18
  张立,IS,19
*/

-- 确定集合
-- 查询IS, MA, CS 学生的姓名和性别
select stu_name, stu_sex
from student
where stu_dept in ('IS', 'MA', 'CS');
/*
  stu_name,stu_sex
  李勇,男
  刘晨,女
  王敏,女
  张立,男
*/
-- 查询不在IS, MA, CS 学生的姓名和性别
select stu_name, stu_sex
from student
where stu_dept not in ('IS', 'MA', 'CS');
/* 没有 */

-- 字符串匹配
---- 匹配固定字符串

-- 查询学号200215121的详细信息 
select *
from student
where stu_id like '200215121';
/*
  stu_id,stu_name,stu_sex,stu_age,stu_dept
  200215121,李勇,男,20,CS
*/
-- like 不含通配符,与"=" 等价

-- 匹配含有通配符的字符串
-- 查询姓刘的学生姓名,学号,性别
select stu_id, stu_name, stu_sex
from student
where stu_name like '刘%'
/*
  stu_id,stu_name,stu_sex
  200215122,刘晨,女
*/

-- 查询李某的姓名
select stu_name
from student
where stu_name like '李_';
/*
  stu_name
  李勇
*/

-- 查询所有不姓刘的学生
select stu_id, stu_name, stu_sex
from student
where stu_name not like '刘%';
/*
  stu_id,stu_name,stu_sex
  200215121,李勇,男
  200215123,王敏,女
  200215125,张立,男
*/

-- order by 语句
-- 查询全体学生情况,按系号升序,年龄降序
select *
from student
order by stu_dept,stu_age desc;
/*
  stu_id,stu_name,stu_sex,stu_age,stu_dept
  200215121,李勇,男,20,CS
  200215122,刘晨,女,19,CS
  200215125,张立,男,19,IS
  200215123,王敏,女,18,MA

*/

