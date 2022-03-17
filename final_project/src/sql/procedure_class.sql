use mytimetable
go

create procedure class_timetable @class_name varchar(10),
@semester bit,
/* 上半年或下半年 */
@year_ int
/* 开课年份 */
as
select
  build.name as 教学楼,
  room_number as 教室,
  day as 星期,
  begin_time as 开始时间,
  end_time as 结束时间,
  course.title as 课程,
  instructor.name as 授课教师,
  class_name as 班级,
  dept_name as 开课学院
from
  section
  join course on course.course_id = section.course_id
  join instructor on course.instructor_id = instructor.ID
  join department on department.dept_id = instructor.dept_id
  join build on build.build_id = section.build_id
  join time_slot on time_slot.time_slot_id = section.time_slot_id
  join class on class.class_id = section.class_id
where
  class.class_name = @class_name
  and semester = @semester
  and year_ = @year_

go
exec class_timetable '计科1801', 0, 2019

