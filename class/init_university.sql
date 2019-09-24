create database university;
/*use university;*/
create table student(
	stu_id char(9) primary key, /* �洢ѧ������ */
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
	primary key (stu_id, course_id), /* �������������Թ���, ������Ϊ�������Խ��ж��� */
	foreign key (stu_id) references student(stu_id),
		/* ��������Լ������, stu_id������, �����ձ���student */
	foreign key (course_id) references course(course_id)
);