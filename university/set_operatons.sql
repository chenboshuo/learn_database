use university;

-- 3.5 Set operations

/*
  The SQL operations union, intersect, and except operate on relations and correspond to the mathemtical set-theory operation.
*/

-- The set of all course taught in the Fall 2009 semester:

select course_id
from section
where semester='Fall' and year= 2009;

/*
  course_id
  CS-101
  CS-347
  PHY-101
*/

select course_id
from section
where semester='Spring' and year = 2010;
/*
  course_id
  CS-101
  CS-315
  CS-319
  CS-319
  FIN-201
  HIS-351
  MU-199
*/

-- 3.5.1 The Union operation
/*
  The union operation automatically elimates duplicates, unlike select clause.
*/
  (select course_id
  from section
  where semester='Fall' and year= 2009)
union
  (select course_id
  from section
  where semester='Spring' and year = 2010);
/*
  course_id
  CS-101
  CS-315
  CS-319
  CS-347
  FIN-201
  HIS-351
  MU-199
  PHY-101
*/

/*
  If we want to retain all duplicates,
  we must write union all in place of union.
*/
  (select course_id
  from section
  where semester='Fall' and year= 2009)
union all
  (select course_id
  from section
  where semester='Spring' and year = 2010);

/*
  course_id
  CS-101
  CS-347
  PHY-101
  CS-101
  CS-315
  CS-319
  CS-319
  FIN-201
  HIS-351
  MU-199
*/

-- 3.5.2 The Intersect Operation
---- To find the set of all courses taught in the Fall 2009 as well as in Spring 2010 we write:

  (select course_id
  from section
  where semester='Fall' and year= 2009)
intersect
  (select course_id
  from section
  where semester='Spring' and year = 2010);
/*
  course_id
  CS-101
*/

/*
  If we want to retain all duplicates,we must write 
  intersect all 
  in place of untersect
*/
-- 3.5.3 The Except Operation
----To find all course taught in the Fall 2009 semester but not in the Spring semester
  (select course_id
  from section
  where semester='Fall' and year= 2009)
except
  (select course_id
  from section
  where semester='Spring' and year = 2010);
/*
course_id
CS-347
PHY-101
*/

/* Some SQL implementations, notably Oracle,
used the keyward minus in place of except.
*/
