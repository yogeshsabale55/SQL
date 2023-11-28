use college;

-- not null    : restricts the entry of null values
-- unique      : restricts the entry of duplicate values, but nulls are allowed
-- primary key : not null + unique
-- foreign key : define the relationship between tables

/*
student                   course                               faculty
rollno,sname,loc          course_id,course_name,roll_no,id     id ,name,salary
101.   abc.  pune.        10.        datasci.   101
						  11.        sql.       101
rollno: pk                roll_no: fk.                         1.   xyz. 70000
							id:fk							   id : pk

student                             course 
rollno,sname,loc,course_id          course_id,course_name
101    abc   pune  10               10.        data science
101.   abc.  pune. 20			    20.         sql
102.   neha. pune. 10
course_id: fk                       course_id: pk
*/

-- a table can have multiple foreign keys
-- fk can have duplicate values in acse of one to many relationship

/*
emp:
empid,empname
1001.  abc

proj:
proj_id,proj_name,emp_id
10.     etl.       1001
20.     migration. 1001
*/

-- check: 
create table emp_chk(empid int,ename varchar(10),empage int check(empage>25),
gender char(1) check(gender in ('m','f')));

insert into emp_chk values(1001,'neha',30,'f');
select * from emp_chk;

insert into emp_chk values(1001,'neha',20,'f');
insert into emp_chk values(1001,'neha',30,'d');

select * from student;
alter table student modify column address varchar(20) check(address in ('pune','mumbai'));

-- alter table table_name drop constraint constraint_name;
-- to get the constraint name
show create table emp_chk;
-- to remove the check constraint
alter table emp_chk drop constraint emp_chk_chk_1,drop constraint emp_chk_chk_2;

-- default : 
desc student;
create table emp_dflt(empid int,ename varchar(20),
project varchar(10) DEFAULT 'bench',
loc varchar(10) default 'pune');

desc emp_dflt;

insert into emp_dflt values(1001,'neha','etl','mumbai');
select * from emp_dflt;

insert into emp_dflt(empid,ename) values(1002,'nishant');

alter table student modify column address varchar(20) default 'pune'; 

alter table student alter address drop default;
alter table emp_dflt alter loc drop default,alter project drop default;

-- auto_increment : 
create table emp_auc (empid int AUTO_INCREMENT PRIMARY KEY,ename varchar(10));

insert into emp_auc (ename) values ('abc');
select * from emp_auc;

insert into emp_auc (ename) values ('xyz');

insert into emp_auc (empid,ename) values (1001,'xyz');
insert into emp_auc (empid,ename) values (1002,'neha');

insert into emp_auc (ename) values ('xyz');

alter table emp_auc auto_increment=10000;

/*
not null      : does not allow null values
unique        : does not allow the duplicate values,multiple null values are allowed
primary key   : not null + unique
foreign key   : define a relation between tables by refering to the FK column of another table
check         : checks for a condition
default       : used to set a dafault value for a column
auto_increment: increment a col value by 1,by default it starts with 1,it is mandatory to define an auto increment column as a key
*/

/*
create table table_name(col1 datatype,col2 datatype,
constraint constraint_name primary key(col1));
*/

-- syntax to add multiple constraints with user defined names 

-- my_pk,my_fk : constarint name
create table emp2 (empid int,ename varchar(10),
                  constraint my_pk primary key(empid),
                  constraint my_fk foreign key(proj_id) references proj(proj_id));
				
-- clauses : help us retrieve a set of records
-- order by : used to sort the data
-- the default sort order is ascending

select * from emp;
select * from emp order by salary; -- sort in ascending order
select * from emp order by salary asc; -- sort in ascending order

select * from emp order by salary desc;
-- desc table_name: describe a table
-- order by desc  : sort the data in descending order

select * from emp order by dept_name;
select * from emp order by dept_name,salary;

select * from emp order by dept_name,salary desc;
select * from emp order by dept_name desc,salary desc;

-- get the info of IT employees in sorted order of their salaries
select * from emp where dept_name='it' order by salary;

-- distinct : fetch unique values from a column
select * from emp order by dept_name;
select dept_name from emp;
select distinct dept_name from emp;

/*
admin 4000
admin 4000
admin 2000
admin 5000
>
admin 4000
admin 2000
admin 5000

*/
select distinct dept_name,salary from emp order by dept_name;

/*
1001 rohit
1002 rohit
1002 rohit
1002 neha
*/
select * from emp;
/*
101,mohan,admin,4000
101,mohan,admin,4000
101,mohan,admin,4000
*/

-- used to fetch unique record/row

select distinct emp_id,emp_name,dept_name,salary from emp;
select distinct * from emp;

-- limit : limit the no of rows in the output
-- where : limit the no of rows in the output based on a condition

-- limit(offset,no of rows to read)
-- offset : no of rows to skip,default value for offset is 0

-- top 5 rows of the table
select * from emp limit 0,5;
select * from emp limit 5;

-- top 10 rows of the table
select * from emp limit 10;

-- read rows from 5 to 10
select * from emp limit 4,6;

-- read rows from 9 to 15
select * from emp limit 8,7;

-- 7th record
select * from emp limit 6,1;

-- 2nd highest salary of the table
select * from emp order by salary desc;
select * from emp order by salary desc limit 1,1;

-- 3rd highest salary
/*
when we have order by and limit in one query, 
it will change the order of rows having same values in a column we have in order by clause.
to keep the order intact even after adding limit, we need to add a column in order by which has unique values
*/

select * from emp order by salary desc,emp_id limit 2,1;

select distinct salary from emp order by salary desc limit 2,1;





















