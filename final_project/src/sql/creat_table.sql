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
  dept_name char(8) not null,
  primary key (dept_id),
);

create table instructor(
  ID char(20),
  name varchar(10) not null,
  title char(3), /* 职称*/
  depart_id tinyint not null,
  direction varchar(10), /* 研究所或者所属系 */

  primary key (ID),
  foreign key (depart_id) references department,
);

create table course(
  course_id char(20),
  title char(10) not null,
  type char(10),
  instructor_id char(20) not null,

  primary key (course_id),
  foreign key (instructor_id) references instructor(ID),
);

create table class(
  class_id char(20),
  class_name char(10) not null,
  population tinyint,
  depart_id tinyint,

  primary key (class_id),
  foreign key (depart_id) references department,
);

create table time_slot(
  time_slot_id char(20),
  day tinyint not null,
  begin_time tinyint not null,
  end_time tinyint not null,
  begin_week tinyint default 1,
  end_week tinyint,

  is_in_odd bit default 1, /* 单周是否上课 */
  is_in_even bit default 1, /* 双周是否上课 */

  primary key (time_slot_id),
);

create table section(
  sect_id char(20),
  course_id char(20),
  semester bit, /* 上半年或下半年 */
  year int, /* 开课年份 */
  building_id tinyint not null,
  room_number smallint not null,
  time_slot_id char(20),

  primary key (sect_id),
  foreign key (course_id) references course,
  foreign key (building_id,room_number) references classroom,
  foreign key (time_slot_id) references time_slot,
);
