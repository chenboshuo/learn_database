use school;
-- 查询学生学号与姓名
select stu_id,stu_name 
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
select stu_name, 'Year of Birth', 2004-stu_age,lower(stu_dept)
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