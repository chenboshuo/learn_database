use university;

-- The % character maches any substring
-- The _(underscore) character maches any character

select dept_name, building
from department
where building like '%Watson%';

/*
  output

  dept_name,building
  Biology,Watson
  Physics,Watson
*/

-- The asterisk symbol '*' can be used in the select clause to denote "all attributes"

select instructor.*
from instructor, teaches
where instructor.ID = teaches.ID;

/*
  ID,name,dept_name,salary
  10101,Srinivasan,Comp. Sci.,65000.00
  10101,Srinivasan,Comp. Sci.,65000.00
  10101,Srinivasan,Comp. Sci.,65000.00
  12121,Wu,Finance,90000.00
  15151,Mozart,Music,40000.00
  22222,Einstein,Physics,95000.00
  32343,El Said,History,60000.00
  45565,Katz,Comp. Sci.,75000.00
  45565,Katz,Comp. Sci.,75000.00
  76766,Crick,Biology,72000.00
  76766,Crick,Biology,72000.00
  83821,Brandt,Comp. Sci.,92000.00
  83821,Brandt,Comp. Sci.,92000.00
  83821,Brandt,Comp. Sci.,92000.00
  98345,Kim,Elec. Eng.,80000.00
*/

-- Odering The Display Of Tuples
/*
  The order by clause casuses the tuples in the results
  of a query to appear in sorted order.

  By default, the order by clause lists items in acending order.
  To specify the sort order,
  we may specify dec or asc for ascending order.
*/

select name
from instructor
where dept_name = 'Physics'
order by name;

/*
  name
  Einstein
  Gold
*/

select *
from instructor;

/*
  ID,name,dept_name,salary
  10101,Srinivasan,Comp. Sci.,65000.00
  12121,Wu,Finance,90000.00
  15151,Mozart,Music,40000.00
  22222,Einstein,Physics,95000.00
  32343,El Said,History,60000.00
  33456,Gold,Physics,87000.00
  45565,Katz,Comp. Sci.,75000.00
  58583,Califieri,History,62000.00
  76543,Singh,Finance,80000.00
  76766,Crick,Biology,72000.00
  83821,Brandt,Comp. Sci.,92000.00
  98345,Kim,Elec. Eng.,80000.00
*/

select *
from instructor
order by salary desc, name asc;
/*
  ID,name,dept_name,salary
  22222,Einstein,Physics,95000.00
  83821,Brandt,Comp. Sci.,92000.00
  12121,Wu,Finance,90000.00
  33456,Gold,Physics,87000.00
  98345,Kim,Elec. Eng.,80000.00
  76543,Singh,Finance,80000.00
  45565,Katz,Comp. Sci.,75000.00
  76766,Crick,Biology,72000.00
  10101,Srinivasan,Comp. Sci.,65000.00
  58583,Califieri,History,62000.00
  32343,El Said,History,60000.00
  15151,Mozart,Music,40000.00
*/

-- 3.4.5 Where clause predicates
/*
  SQL includes a between comparision operator 
  to simplify where clause that specify 
  that a values be less than or equal to some value
  or greater than or equal to some other value.
*/
select name, salary
from instructor
where salary between 90000 and 950000;
/*
  name,salary
  Wu,90000.00
  Einstein,95000.00
  Brandt,92000.00
*/

select name, course_id
from instructor, teaches
where instructor.ID = teaches.ID and dept_name = 'Biology';

/*
  name,course_id
  Crick,BIO-101
  Crick,BIO-301
*/

/* 
SQLSERVER not spport this syntax

select name, course_id
from instructor, teaches
where (instructor.ID ,dept_name)= (teaches.ID
'Biology');
