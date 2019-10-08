use school;

-- 连接查询
-- 查询每个学生及选修课情况
select student.*, elective_course.*
from student, elective_course
where student.stu_id = elective_course.stu_id;
/*
  stu_id,stu_name,stu_sex,stu_age,stu_dept,stu_id,course_id,grade
  200215121,李勇,男,20,CS,200215121,"1   ",92
  200215121,李勇,男,20,CS,200215121,"2   ",85
  200215121,李勇,男,20,CS,200215121,"3   ",88
  200215122,刘晨,女,19,CS,200215122,"2   ",90
  200215122,刘晨,女,19,CS,200215122,"3   ",80
*/

-- 等值连接 链接运算符为 `=`
/*
实现方法
  循环嵌套法(nested-loop)
    从第一个表的第一条开始循环,对应表二的第一条,
    符合条件的链接.
  排序合并法(sorted-merge)
    首先按属性1和属性2排序.

    之后对表一的第一个元组,从头扫描表二,
    当表二大于表二的值时,停止扫描.

    找到表二中断元组, 从中断处开始扫描,值表二的值大于表一的值中断.
  
  索引链接(index-jion)
    对表二链接字段建立索引.

    对表一的元组, 依次查询其链接字段查询表二的索引,
    从中找到满足条件的元组,
    找到后链接,形成最终元组.
*/


-- 自然链接
/*
  自然链接会消除重复的列
*/
---- 对上一个实现自然链接
select student.stu_id, stu_name, stu_sex, stu_age, stu_dept, course_id, grade
from student, elective_course
where student.stu_id = elective_course.stu_id;

/*
  stu_id,stu_name,stu_sex,stu_age,stu_dept,course_id,grade
  200215121,李勇,男,20,CS,1,92
  200215121,李勇,男,20,CS,2,85
  200215121,李勇,男,20,CS,3,88
  200215122,刘晨,女,19,CS,2,90
  200215122,刘晨,女,19,CS,3,80
*/

/* 一条sql语句可以同时完成选择连接 */
-- 查询选修2号课程且成绩在90以上的学生和姓名
select student.stu_id, stu_name
from student, elective_course
where student.stu_id = elective_course.stu_id
  and elective_course.course_id = '2'
  and elective_course.grade >= 90;
/*
stu_id,stu_name
200215122,刘晨
*/

-- 自身链接
/* 需要给别名表示区别, 属性名要有别名前缀 */
select *
from course;
/*
  course_id,course_name,course_pro_id,course_credit
  1,数据库,5,4
  2,数学,NULL,2
  3,信息系统,1,4
  4,操作系统,6,3
  5,数据结构,7,4
  6,数据处理,NULL,2
  7,PASCAL语言,6,4
*/

---- 查询每门课的间接先修课(先修课的先修课)

select cur.course_id,
  cur.course_name, pre.course_pro_id
from course as cur, course as pre
where  cur.course_pro_id = pre.course_id;
/*
  course_id,course_name,course_pro_id
  1,数据库,7
  3,信息系统,5
  4,操作系统,NULL
  5,数据结构,6
  7,PASCAL语言,NULL

*/
--  TODO: 查询先修课的名字

-- 外连接
-- 查询每个学生与选修课情况
select student.stu_id, stu_name, stu_sex, stu_age, stu_dept, course_id, grade
from student left outer join elective_course on(student.stu_id=elective_course.stu_id
);
/*
stu_id,stu_name,stu_sex,stu_age,stu_dept,course_id,grade
200215121,李勇,男,20,CS,1,92
200215121,李勇,男,20,CS,2,85
200215121,李勇,男,20,CS,3,88
200215122,刘晨,女,19,CS,2,90
200215122,刘晨,女,19,CS,3,80
200215123,王敏,女,18,MA,NULL,NULL
200215125,张立,男,19,IS,NULL,NULL
*/

-- full 表示全外连接
select student.stu_id, stu_name, stu_sex, stu_age, stu_dept, course_id, grade
from student full outer join elective_course on(student.stu_id=elective_course.stu_id
);
/*
stu_id,stu_name,stu_sex,stu_age,stu_dept,course_id,grade
200215121,李勇,男,20,CS,1,92
200215121,李勇,男,20,CS,2,85
200215121,李勇,男,20,CS,3,88
200215122,刘晨,女,19,CS,2,90
200215122,刘晨,女,19,CS,3,80
200215123,王敏,女,18,MA,NULL,NULL
200215125,张立,男,19,IS,NULL,NULL
*/

