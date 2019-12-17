use mytimetable;
go
create trigger room_check on section
after
insert, update
  as 
  if exists(
    select *
    from
      section as s
      join inserted as i 
      on i.time_slot_id = s.time_slot_id
    where
      s.build_id = i.build_id
      and s.room_number = i.room_number
  ) 
  begin 
  print 'the room is not empty' ;rollback;
end

go 
select * from section;
select * from course;
update section 
set time_slot_id = 
	 	 	 	 	 	 	-6176928835455278985,
build_id = 1,
room_number = 404 
where course_id = (
  select course_id 
  from course 
  where title='数学分析')

-- DONE