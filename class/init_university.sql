create database university
go
use university;
create table student(
	stu_id char(9) primary key, /* 存储学生号码 */
	stu_name char(20) unique,
	stu_sex char(2),
	stu_age smallint,
	stu_dept char(20)
);
create table course(
    course_id char(4) primary key,
    course_name char(40) not null,
    course_pro_id char(4),
    course_credit smallint,
    foreign key (course_pro_id) references course(course_id)
);
create table elective_course(
	stu_id char(9),
	course_id char(4),
	grade smallint,
	primary key (stu_id, course_id), /* 主码有两个属性构成, 必须作为表级完整性进行定义 */
	foreign key (stu_id) references student(stu_id),
		/* 表级完整性约束条件, stu_id是外码, 被参照表是student */
	foreign key (course_id) references course(course_id)
);

/* 录入数据 */
insert into student values ('200215121', '李勇', '男', 20, 'CS');
insert into student values ('200215122', '刘晨', '女', 19, 'CS');
insert into student values ('200215123', '王敏', '女', 18, 'MA');
insert into student values ('200215125', '张立', '男', 19, 'IS');

insert into course values ('6', '数据处理', NULL, 2);
insert into course values('2', '数学', NULL, 2);
insert into course values ('4', '操作系统', '6', 3);
insert into course values ('7', 'PASCAL语言', '6',4);
insert into course values ('5', '数据结构', '7', 4);
insert into course values('1', '数据库', '5', 4);
insert into course values ('3', '信息系统', '1',4);

insert into elective_course values ('200215121', '1', 92);
insert into elective_course values ('200215121', '2', 85);
insert into elective_course values ('200215121', '3', 88);
insert into elective_course values ('200215122', '2', 90);
insert into elective_course values ('200215122', '3', 80);
