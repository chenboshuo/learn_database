use mytimetable 

-- 查询老师所有的课程
select
  name as 教师名,
  course.title as 课程名,
  type as 课程类型
from
  instructor
  join course on course.instructor_id = instructor.ID
where
  name = '图灵'

-- 查询某个班级所有课程
select 
  title as 课程名,
  type as 课程类型
from 
  section 
  join class on class.class_id = section.class_id 
  join course on course.course_id = section.course_id
where 
  class_name = '数学1801'