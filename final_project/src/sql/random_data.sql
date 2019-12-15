use mytimetable;

insert into
  build
values
  (0, '实验'),
  (1, '一教'),
  (2, '二教');

insert into
  classroom
values
  (0, 211, 50),
  (2, 251, 200),
  (1, 404, 30);

insert into
  department
values
  (1, '统计'),
  (2, '信息');

insert into
  instructor
values
  (-7138521510282809083, '上帝', '教授', 1, '基础数学'),
  (2296097927463280428, '图灵', '教授', 2, '计算机');

insert into
  course
values
  (
    -5856896218873596306,
    '数学分析',
    '专业基础',
    -7138521510282809083
  ),
  (
    8036260102720528861,
    '密码学',
    '专业选修',
    2296097927463280428
  );

insert into
  class
values
  (-6113785566208997576, '数学1801', 100, 1),
  (150864928736656180, '计科1801', 20, 2);

insert into
  time_slot
values
  (-4897186497759336149, 1, 8, 10, 1, 16, 1, 1),
  (-6176928835455278985, 1, 10, 12, 1, 16, 1, 1)
insert into
  section
values
  (
    -4219243002317194787,
    -5856896218873596306,
    -6113785566208997576,
    0,
    2019,
    0,
    211,
    -4897186497759336149
  ),
  (
    -6600405700568427259,
    8036260102720528861,
    150864928736656180,
    0,
    2019,
    1,
    404,
    -6176928835455278985
  );