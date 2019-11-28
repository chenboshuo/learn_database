use school;

-- 建立触发器
/*
  create trigger
  on table|view 
  {for | after| instead of}
  
  after 触发器在语句之后进行, 进行约束检查等动作在after触发器之前发生.
  After 触发器只能用于表
  如果违反约束, after 触发器不会执行

  Insead fo 可以用于视图
*/

go
create trigger 学生表修改通知
on student
instead of insert 
as 
  print '学生表变化'
  select * from deleted
  select * from inserted
  select * from student

go
-- 尝试插入
insert into student
values('201215016', '大神', '女', 18,'IS')

/*
  delted 
  inserted 

    stu_id,stu_name,stu_sex,stu_age,stu_dept
    201215016,大神,女,18,IS

  student 
    stu_id,stu_name,stu_sex,stu_age,stu_dept
    200215121,李勇,男,20,CS
    200215122,刘晨,女,19,CS
    200215123,王敏,女,18,MA
    200215125,张立,男,19,IS

*/

-- 防止成绩大于100
-- TODO 不使用触发器
go
if object_id('grade_warn') is not null
  drop trigger grade_warn
go 
  create trigger grade_warn
  on elective_course
  after insert, update 
  as 
  declare @grade_ int 
  select @grade_ = grade from inserted
  if @grade_ > 100 
    begin 
      print '成绩不能大于100'
      rollback
    end

-- 检测触发器
go 
insert into elective_course 
values('200215122', '1', 210)


-- 不使用变量实现
if object_id('grade_warn') is not null
  drop trigger grade_warn
go 
  create trigger grade_warn
  on elective_course
  after insert, update 
  as 
  if exists (select grade from inserted where grade > 100) 
    begin 
      print '成绩不能大于100'
      rollback
    end

-- 检测触发器
go 
insert into elective_course 
values('200215122', '1', 210)

-- 使用 instead of
if object_id('grade_warn') is not null
  drop trigger grade_warn
go 
  create trigger grade_warn
  on elective_course
  after insert, update 
  as 
  if exists (select grade from inserted where grade > 100) 
    begin 
      print '成绩不能大于100'
      rollback
    end

-- 限制将不及格改为及格
if object_id('update_grade_warn') is not null
  drop trigger update_grade_warn
go
create trigger update_grade_warn
on elective_course after update
as
  if update(grade)
    if exists(select * from inserted, deleted
      where inserted.stu_id = deleted.stu_id
        and inserted.grade >= 60 
        and deleted.grade < 60)
    begin 
      print '不能将不及格改成及格'
      rollback
    end

go 
select * from elective_course

update elective_course
set grade = 59 
where stu_id = '200215121'and course_id = 1

select * from elective_course

update elective_course
set grade = 92 
where stu_id = '200215121'and course_id = 1
/* 语句终止, 结果未修改 */

select * from elective_course

-- 禁用触发器, 恢复原数据
go
alter table elective_course disable trigger update_grade_warn
go
update elective_course 
set grade = 92 
where stu_id = '200215121'and course_id = 1

select * from elective_course
/* 数据已恢复 */
