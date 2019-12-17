use mytimetable
go
create procedure teacher_timetable @name varchar(10)   
as   
select * 
from
  section 
  join course on course.course_id = section.course_id 
  join instructor on course.instructor_id = instructor.ID 
  join department on department.dept_id = instructor.dept_id
where 
  instructor.name='上帝'
  and semester=0 
  and year_ = 2019