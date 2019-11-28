-- 视图
-- 3.7.1 定义视图
use school;
select * from course;
select * from elective_course
select * from student

-- 建立信息系学生视图
create view IS_student
as 
  select student.stu_id, stu_name, stu_age
  from student 
  where stu_dept = 'IS'
/*
  视图不储存数据
*/

-- 查看视图
SELECT TOP (1000) [stu_id]
      ,[stu_name]
      ,[stu_age]
  FROM [school].[dbo].[IS_student]

drop view IS_student;


create view IS_student
as 
  select student.stu_id, stu_name, stu_age
  from student 
  where stu_dept = 'IS'
  with check option

/*
  with check option 子句对视图插入,修改,删除时自动加上 from 的条件
*/

-- 建立信息系选了1 号课程的视图
create view CS_C1(stu_id, stu_name, grade)
as 
  select student.stu_id, stu_name,grade 
  from student, elective_course
  where stu_dept = 'CS' and student.stu_id = elective_course.stu_id and elective_course.course_id = '1';

-- 查看结果
SELECT TOP (1000) [stu_id]
      ,[stu_name]
      ,[grade]
  FROM [school].[dbo].[CS_C1]
/*
  stu_id,stu_name,grade
  200215121,李勇,92
*/

-- 查询计算机系选修1号课程成绩在90以上的学生
create view CS_C1_90
as 
  select stu_id, stu_name,grade 
  from CS_C1 
  where grade >= 90;

-- 查看
SELECT TOP (1000) [stu_id]
      ,[stu_name]
      ,[grade]
  FROM [school].[dbo].[CS_C1_90]

/*
  stu_id,stu_name,grade
  200215121,李勇,92
*/

select * 
from CS_C1;