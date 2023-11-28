use stud_data;
-- inner join : common records
-- outer join :
-- left join/left outer join  : inner join + remaining from left
-- right join/right outer join : inner join + remaining from right
-- union and union all clasue

-- full join/full outer join : left join + right join 

select * from tbl1
union 
select * from tbl2;

select * 
from student
left join 
course
on student.roll_no=course.roll_no
union 
select * 
from student
right join
course
on student.roll_no=course.roll_no;

-- self join : join a table with itself
select * from family;
-- f1 david f5 maryam 40
-- f2 carol f5 maryam 40
-- f3 michel f5 maryam 40
-- f7 rohan f4  johnson 36

select p.fname,p.age,c.fname,c.age
from 
family p
join
family c
on c.parent_id=p.member_id;

-- window functions/analytical functions: 
select max(salary) from emp; -- 11000
select salary,max(Salary) from emp;
select salary,salary*0.25,max(salary) over () from emp;

select salary,min(salary) over (),
salary-min(Salary) over ()  as diff
from emp;

-- row_number(): assigns the index value/row id to each row of the partition
select *,
row_number() over () 
from emp;

-- fetch the first 2 emp to join the company
select * from emp;
select * from emp order by emp_id limit 2;

-- oldest emp from each dept
select dept_name,min(emp_id) from emp group by dept_name;

-- fetch the oldest 2 emp from each dept

select * from(
select * ,
row_number() over (partition by dept_name order by emp_id) as rn
from emp) sq -- derived table will have all col from emp table and rn
where rn<3;

-- rank() and dense_rank(): assign the rank values to each row of the partition
-- rank()       : assigns the rank values with gaps
-- dense_Rank() : assigns rank values without gaps

select *,
rank() over (order by salary) as rnk,
dense_rank() over (order by salary) as dense_rnk
from emp;

-- fetch the top 3 emp from each dept earning the max salary
-- 5000,4000

select * from (
select *,
rank() over (partition by dept_name order by salary desc) as rnk
from emp)a
where rnk<4;

-- fetch all emp who earns top 3 salaries

select * from (
select *,
-- rank() over (partition by dept_name order by salary desc) as rnk,
dense_rank() over (partition by dept_name order by salary desc) as dense_rnk
from emp ) a
where dense_rnk<4;

-- lead and lag
-- lead(column name,offset,default) : fetch a value from preceeding row
-- lag(column name,offset,default)  : fetch a value from previous row

select *,
lead(salary) over () as next_sal,
lag(salary) over () as priv_sal
from emp;

select *,
lead(salary) over (partition by dept_name) as next_sal,
lag(salary) over (partition by dept_name) as priv_sal
from emp;

select *,
lead(salary,1,0) over (partition by dept_name) as next_sal,
lag(salary,1,0) over (partition by dept_name) as priv_sal
from emp;

select *,
lead(salary,2,0) over (partition by dept_name) as next_sal,
lag(salary,2,0) over (partition by dept_name) as priv_sal
from emp;

select * from cars;
-- distance travlled by each car per day
-- 50,100-50,200-100

select *,
lag(distance_travlled,1,0) over (partition by cars order by days) as priv_day_dist,
distance_travlled-lag(distance_travlled,1,0) over (partition by cars order by days) as dist_per_day
from cars;

















