-- use master;
-- drop database mytimetable;
create database mytimetable;
go

use mytimetable;

create table build(
  build_id tinyint,
  name char(5) not null,
  primary key (build_id),
);

create table classroom(
  build_id tinyint,
  room_number smallint not null,
  capacity smallint,
  primary key (build_id, room_number),
  foreign key (build_id) references build,
);

create table department(
  dept_id tinyint,
  dept_name char(8),
  primary key (dept_id),
);

 create table course(
   course_id char(19),
   title varchar(20),
   type varchar(10),
   depart_id tinyint,

   primary key (course_id),
   foreign key (depart_id) references department,
);

create table instructor(
  ID char(19),
  name varchar(10),
  title char(2), /* 职称*/
  depart_id tinyint,
  direction varchar(10), /* 研究所或者所属系 */

  primary key (ID),
  foreign key (depart_id) references department,
);

create table class(
  class_id char(19),
  class_name varchar(8),
  population tinyint,
  depart_id tinyint,

  primary key (class_id),
  foreign key (depart_id) references department,
);

create table time_slot(
  time_slot_id char(19),
  day tinyint,
  begin_time tinyint,
  end_time tinyint,
  begin_week tinyint,
  end_week tinyint,

  is_in_odd bit default 1, /* 单周是否上课 */
  is_in_even bit default 1, /* 双周是否上课 */

  primary key (time_slot_id),
);

create table section(
  sect_id char(19),
  course_id char(19),
  semester bit, /* 上半年或下半年 */
  year int, /* 开课年份 */
  building_id tinyint,
  room_number smallint,
  time_slot_id char(19),

  primary key (sect_id),
  foreign key (course_id) references course,
  foreign key (building_id,room_number) references classroom,
  foreign key (time_slot_id) references time_slot,
);
