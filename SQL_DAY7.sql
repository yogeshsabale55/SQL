use stud_data;
-- clauses : 

-- where   : access specific rows of the table based on a condition

-- order by: sort the data in either ascending or descending order
-- select * from table_name where condition order by column1,column2 asc/desc;

-- limit   : limit the no of rows in the output,it does not need any condition
-- limit no of rows to skip from top,no of rows to read

select * from emp_data;
-- rows from 15 to 25
select * from emp_data limit 14,11;

-- nth highest salary
-- select distinct salary from table_name order by salary desc limit n-1,1;

-- distinct: to fetch the unique values/records from a table
-- select distinct column1,column2 from table_name;

-- aggregate functions: 
-- min,max,sum,avg,count

select salary from emp;
select sum(salary) from emp;
select min(salary) from emp;
select max(salary) from emp;
select avg(salary) from emp;

select count(*) from emp; -- count of total no of records
select count(1) from emp; -- count of total no of records
select * from emp;
select count(emp_id) from emp; -- count of non null values 

select * from cars;
insert into cars values('car4',null,null);

select count(*) from cars;
select count(1) from cars;
select count(cars) from cars;
select count(days) from cars; -- non null values in the column
select count(distance_travlled) from cars;

select * from movies;
-- avg budget of movies released during normal days
-- back ticks `string`  - the key above tab key on keyboard
select avg(budget) from movies where `release period`='normal';

-- total no of screens on which drama movies were released
select sum(`number of screens`),count(`number of screens`) from movies where genre='drama';

select * from placement;
-- avg cgpa of mech male students
select avg(cgpa) from placement 
where branch='mechanical'
and gender='male';

-- unique genre values 
select distinct genre from movies;

-- count of these distinct values
select count(distinct genre) from movies;

-- count of emp of emp table
select count(*) from emp;

-- count of emp from each dept
select distinct dept_name from emp;
select count(*) from emp where dept_name='admin'; -- 4
select count(*) from emp where dept_name='hr';    -- 6
select count(*) from emp where dept_name='finance';-- 4
select count(*) from emp where dept_name='it'; -- 10

-- group by : groups rows that have simillar values
	        -- it devides the data into multiple groups based on a criteria
            -- we can select only columns which are there in group by clause
            
select count(*) from emp; -- 24

select count(*) from emp group by dept_name;
select dept_name,count(emp_id),sum(salary) from emp group by dept_name;

select dept_name,count(*) from emp group by dept_name;

select * from emp_data;

-- count of emp from each loc 
-- dallas  :37    
-- new york:19 
-- chicago : 44

select loc,count(empid) from emp_data group by loc;

select * from emp_data;

-- get the count of only female emp from each loc

select loc,count(empid) from emp_data 
where gender='f'
group by loc;

-- dallas  :37 - count of m emp and count of f emp   
-- new york:19 - count of m emp and count of f emp
-- chicago : 44- count of m emp and count of f emp

select loc,gender,count(*) from emp_data
group by loc,gender
order by loc;

select * from movies;
-- count of movies along with their avg revenue which are released during holidyas for each genre
select genre,count(`movie name`),avg(revenue)
from movies
where `release period`='holiday'
group by genre;

/*
100 :
branch      : comp(20),entc(20),mech(20),civil(20),it(20) -- 5
work_details:
comp(20): working(10) ,not working(10)     -- 10
shift_details:
working(20): day_shift(5),night_shift(5)   -- 20

group by branch,work_details,shift_details;
*/

select * from student_mark;

-- percentage for each student
-- sum(marks)/sum(out_of)*100

select rollno,sum(marks)/sum(out_of)*100
from student_mark
group by rollno;

select * from placement;

-- count of all students
select count(*) from placement; -- 2966

-- list of students cgpa>5,no backlogs and have done atleast one internship
select * from placement
where cgpa>5
and historyofbacklogs=0
and internships>=1;

-- count of these students
select count(*) from placement
where cgpa>5
and historyofbacklogs=0
and internships>=1;  -- 1293

-- branchwise count
select branch,count(*) from placement
where cgpa>5
and historyofbacklogs=0
and internships>=1
group by branch;


-- comp sci: 446 : 200 are placed and 246 are not placed

-- how many are already placed and how many are not
select * from placement;

select branch,placedornot,count(*) from placement
where cgpa>5
and historyofbacklogs=0
and internships>=1
group by branch,placedornot
order by branch;

-- groups where count of students >100
select branch,placedornot,count(*) from placement
where cgpa>5
and historyofbacklogs=0
and internships>=1
group by branch,placedornot
having count(*)>100
order by branch;

-- where :row level data,needs to be added before group by in a query
-- having:group level data, needs to be added after group by in a query

select branch,placedornot,count(*) from placement
where cgpa>5
and historyofbacklogs=0
and internships>=1
group by branch,placedornot
having count(*)>100
order by branch
limit 1,2;

-- select from where group by having order by limit

-- union and union all
-- append the result sets/append the data from different tables
-- 5 features and 10 rows
-- 5 features and 20 rows
-- >> 5 features and 30 rows


-- you need to have same number of columns in all select statements
-- you also need to have same datatypes - for other dbs
-- same sequence of the columns

-- union all : appends the data 
select * from tbl1
union all
select * from tbl2;
-- 5 rows + 5 rows >> 10 rows in op

-- union: removes duplicate after appending the data
select * from tbl1
union 
select * from tbl2;
-- 5 rows + 5 rows(3are common) >> 7 rows

select * from tbl2
union 
select * from tbl1;

select * from student;
select * from course;

-- append the roll numbers from student and course
select roll_no from student
union all
select roll_no from course;

select roll_no from student
union 
select roll_no from course;

select roll_no,stud_name from student
union 
select course_name,roll_no from course;

/*
select columns from tbl1
union/union all
select columns from tbl2
union/union all
select coumns from tbl3
.....
*/

-- import csv into a db table
select * from family;




















