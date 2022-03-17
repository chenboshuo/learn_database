use mytimetable;

go
create view class_timetable
as
  select
    build.name as 教学楼,
    room_number as 教室号,
    course.title as 课程名,
    day as 星期,
    begin_time as 上课时间,
    end_time as 下课时间,
    instructor.name as 教师名,
    class_name as 上课班级
  from
    section,
    course,
    time_slot,
    instructor,
    build,
    class
  where
  section.course_id = course.course_id
    and section.time_slot_id = time_slot.time_slot_id
    and course.instructor_id = instructor.ID
    and section.build_id = build.build_id
    and section.class_id = class.class_id
    and semester = 0 -- 表示第一学期
    and year_ = 2019 -- 2019年
    and (3 between begin_week
  and end_week)
    and is_in_odd = 1
    and class_name = '数学1801'

go 
select * from class_timetable


