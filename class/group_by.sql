use school;

-- 求每个课程号的选课人数
select *
from elective_course;
/*
  stu_id,course_id,grade
  200215121,"1   ",92
  200215121,"2   ",85
  200215121,"3   ",88
  200215122,"2   ",90
  200215122,"3   ",80

*/

select course_id, count(stu_id) as number
from elective_course
group by course_id;

/*
course_id,number
"1   ",1
"2   ",2
"3   ",2
*/
/* 可以理解为分组统计 */

-- 查询选修三及门以上课程的学号
select stu_id
from elective_course
group by stu_id
having count(*) >= 3;

/*
stu_id
200215121
*/

-- 查询平均成绩大于80学号和平均成绩
select stu_id, avg(grade) as averge_number
from elective_course
group by stu_id
having avg(grade) >= 80;
/*
  stu_id,averge_number
  200215121,88
  200215122,85
*/

select course_id, avg(grade) as average
from elective_course
group by course_id;


-- 查询每个系平均年龄
select stu_dept, avg(stu_age)
from student
group by stu_dept;

select *
from course;

