use stud_data;

-- joins : combine data from multiple database tables

-- inner join: common records
-- left join : everything from left table and matching data from right table
               -- inner join + remaining records from left table
-- right join: everything from right table and matching data from left table
               -- inner join + remaining records from right table
-- full join : right join union left join

-- self join: joining a table with itself
select * from family;

-- fetch a child name,age along with his parent name and age

select c.fname,c.age,p.fname,p.age
from 
family p
join
family c
on c.parent_id=p.member_id;

-- subquery: 
-- query within query
-- select-- outer query  (select -- inner query >> subquery

-- scalar subqueries : inner query returns a single value

-- details of an emp earning max salary
select max(salary) from emp; -- 11000
select * from emp where salary=11000; -- static query

select * from emp where salary=(select max(salary) from emp); -- dynamic query

-- fetch the second highest salary using max function
/*
90
80 -- second highest salary
70
60
50
*/

select max(salary) from emp where salary <(select max(Salary) from emp);

-- details of an emp earning second highest salary
select * from emp where salary=
(select max(salary) from emp where salary <(select max(Salary) from emp));

-- details of an emp earning 5th highest salary
-- 5th highest salary
-- row where salary=above salary

select * from emp where salary=(
select distinct salary from emp order by salary desc limit 4,1);

-- fetch name,salary of an emp whose salary is > avg salary of all emp
-- avg salary
-- fetch a row where salary>above salary
select * from emp where salary>(select avg(salary) from emp);

select * from emp_data;

-- fetch the list of emp from dept 30 whose salary is < avg salary of dept 20 emp
-- avg salary of dept 20 emp
-- compare salary of dept 30 emp with above output

select * from emp_data where
 salary<(select avg(salary) from emp_data where dept_id=20)
 and dept_id=30;
 
 -- fetch a movie name which has min budget and max revenue
 -- min budget
 -- max revenue
 -- movie name a row satisfying both above conditions
 
 select * from movies where budget=(select min(budget) from movies);
 select * from movies where revenue=(select max(revenue) from movies);
 
 select `movie name` from movies
 where budget =(select min(budget) from movies)
 and   revenue=(select max(revenue) from movies);

-- movie name a row satisfying either of above conditions
 
select `movie name` from movies
 where budget =(select min(budget) from movies)
 or   revenue=(select max(revenue) from movies);

select * from student; -- 101,102,103,104,105
select * from course;  -- 101,102,106,107

-- multirow subqueries: inner query returns more than one value

-- fetch roll numbers from student which are not there in course table
select roll_no from student where roll_no not in (101,102,106,107); -- static query
select roll_no from student where roll_no not in (select roll_no from course); -- dynamic query

-- fetch a movie name,genre,star_rating which has star rating = max star rating of either of the genres
-- star_rating=(9.0,8.9,9.4,9.2,8.5)

-- max star ratings for each geners
select max(star_rating) from movies group by genre;

select `movie name`,genre,star_rating from movies 
where star_rating IN (select max(star_rating) from movies group by genre);

-- fetch the count of records from the output of below query
select count(*) from emp; -- actual table

select count(*) from (
select * from tbl1
union 
select * from tbl2) as sq; -- derived table

select count(*) from
(
select emp_id,emp_name,e.dept_id,d.dept_id as id,dept_name,mgr_name,p.proj_name
from employee e
left join
department d
on e.dept_id=d.dept_id
inner join 
manager m
on e.mgr_id=m.mgr_id
left join 
project p
on e.emp_id=p.team_member_id
) sq;  -- derived table

-- Fetch total amount of sales, along with the no of paintings sold for each artist
-- with their name who have sold at least one painting in gallery

select * from artists;
select * from sales;

select artist_id,sum(sales_price),count(*) from sales group by artist_id;

select * 
from artists  -- actual table
inner join 
(select artist_id,sum(sales_price),count(painting_id) from sales group by artist_id) sq -- derived table
on artists.id=sq.artist_id;

select id,fname,total_sales,no_of_paintings
from artists
inner join 
(select artist_id,sum(sales_price) as total_sales,count(painting_id) no_of_paintings
from sales group by artist_id) sq
on artists.id=sq.artist_id;

-- window functions/analytical functions:
-- over() : helping clause being used to define a window of records
-- partition by : define a partition of data
-- order by     : sort the data within partitions

select max(Salary) from emp;
select salary,salary+100,salary*0.50,max(salary) from emp;

select *,max(Salary) over () as max_sal from emp;

select dept_name,max(salary) from emp group by dept_name;

select *,max(salary) over (partition by dept_name),
salary-max(Salary) over (partition by dept_name) as diff 
from emp;

-- row_number() : assigns a row number or seq number to each row of the partition
select *,
row_number() over () as rn
from emp;

select *,
row_number() over (partition by dept_name) as rn
from emp;

-- fetch the oldest 2 emp from each dept(consider the min emp id)

select salary,salary+100 as sal
from emp
where salary+100>5000;

select * from (
select *,
row_number() over (partition by dept_name order by emp_id) as rn
from emp ) sq -- derived table
where rn<3;













