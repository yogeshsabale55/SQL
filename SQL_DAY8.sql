use stud_data;
-- clauses : 
-- where ,order by,distinct,limit,group by,having,union,union all
-- group by : groups the data based on simillar values
select * from emp;

-- min and max salary from each dept
select min(salary),max(salary) from emp group by dept_name;
select dept_name,min(salary),max(salary) from emp group by dept_name;

select * from sales;
-- total sales and no of paintings an artist have done
select artist_id,count(painting_id),sum(sales_price) from sales group by artist_id;

-- joins: combine data from multiple database tables
-- emp_id empname proj_id proj_name 

-- inner join : common records

select * 
from tbl1 -- base table
inner join
tbl2
on tbl1.col1=tbl2.col2;

select col2,col1 
from tbl1 -- base table
inner join
tbl2
on tbl1.col1=tbl2.col2;

select col1 
from tbl1 -- base table
inner join
tbl2
on tbl1.col1=tbl2.col2;

select * from student;
select * from course;

select *
from student
inner join
course
on student.roll_no=course.roll_no;

select student.roll_no,course.roll_no,student.stud_name,course_name,address
from student
inner join
course
on student.roll_no=course.roll_no;

-- left join : inner join + remaining values from left table
-- a left join b : a is the left table and b is the right table

select * 
from tbl1 -- base table
left join
tbl2
on tbl1.col1=tbl2.col2;

select col2,col1
from tbl1 -- base table
left join
tbl2
on tbl1.col1=tbl2.col2;

select student.roll_no,course.roll_no,student.stud_name,course_name,address
from student
left join
course
on student.roll_no=course.roll_no;

-- right join : inner join + remaining values from right table
-- a right join b : a is the left table and b is the right table

select col2,col1
from tbl1 -- base table
right join
tbl2
on tbl1.col1=tbl2.col2;

select student.roll_no,course.roll_no,student.stud_name,course_name,address
from student
right join
course
on student.roll_no=course.roll_no;

-- full join : left join union right join

select * from tbl1
union 
select * from tbl2;

select col2,col1
from tbl1 
right join
tbl2
on tbl1.col1=tbl2.col2
union 
select col2,col1
from tbl1 
left join
tbl2
on tbl1.col1=tbl2.col2;

select student.roll_no,course.roll_no,student.stud_name,course_name,address
from student
right join
course
on student.roll_no=course.roll_no
union 
select student.roll_no,course.roll_no,student.stud_name,course_name,address
from student
left join
course
on student.roll_no=course.roll_no;

/*
select * or column names
from base_table
type of join
table2
on condition
*/

/*
a join b and b join c
a join b and a join c
*/

select * from employee;

select emp_id,emp_name,employee.dept_id,department.dept_id,dept_name,mgr_name,proj_name
from employee
left join
department
on employee.dept_id=department.dept_id
inner join 
manager
on employee.mgr_id=manager.mgr_id
left join 
project 
on employee.emp_id=project.team_member_id;

-- alias : 
-- can be given to a column, a table, or a subquery
-- import pandas as pd

select salary as sal,salary*0.25 per_Sal from emp e;

select emp_id,emp_name,e.dept_id,d.dept_id,dept_name,mgr_name,proj_name
from employee e
left join
department d
on e.dept_id=d.dept_id
inner join 
manager m
on e.mgr_id=m.mgr_id
left join 
project p
on e.emp_id=p.team_member_id;







