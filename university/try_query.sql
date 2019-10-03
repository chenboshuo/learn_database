use university;

-- query instructor's name
select name
from instructor;

-- Find the department names of all instructors
select dept_name
from instructor;

-- force the elmination of duplicates
select distinct dept_name
from instructor;

-- sql allows us to use the keywards all to 
-- specify explictly that duplicates are not removed
select all dept_name
from instructor;

-- The where clause allows us to select only those rows 
-- in the results relation of the from clause that specified predicate

select name
from instructor
where dept_name = 'Comp. Sci.' and salary > 70000;

-- Queries on Multiple Relations
select name, instructor.dept_name, building
from instructor, department
where instructor.dept_name=department.dept_name;

-- The select clause is used to list the attributes desired in the result of a query; 
-- The from clause is a list of the relations to accessed in the evaluation of the query.
-- The where cluse is a predicate involving attributes of the relation in the from clause.

-- natural join

select name, course_id
from instructor, teaches
where instructor.ID = teaches.ID;

-- Additional Basic Operations

-- SQL provides a way of renaming the attributes of a result relation. It use as cluse.

select name as instructor_name, course_id
from instructor, teaches
where instructor.ID = teaches.ID;

-- The as clause is particularly useful in renaming relations

select T.name, S.course_id
from instructor as T, teaches as S
where T.ID = S.ID;