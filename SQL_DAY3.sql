-- DDL
-- create : create db or db objects
-- create database db_name;
-- create table table_name (columns datatypes)  -- table defi or table ddl

-- alter  : modify the structure
-- alter table table_name add column/modify column/rename column/drop column column_defi;

-- truncate : deletes entire data
-- truncate table table_name;

-- drop : delets data as well as structure
-- drop table table_name;
-- drop database db_name;

-- DML + DQL : insert,update,delete + select

-- CRUD operations : create data(insert), read (select), update (update), delete (delete)

create database college;
use college;
/*
student:
rollno,stud_name,gender,cgpa,branch
*/

create table student (rollno int,stud_name varchar(20),gender char(1),cgpa float,branch varchar(20));

-- create data (insert):
-- insert into table_name(columns) values (set of values);
insert into student (rollno,stud_name,gender,cgpa,branch) values(101,'rohit','m',8,'comp');
insert into student values(102,'ronita','f',7,'comp');
insert into student (rollno,stud_name,gender,cgpa) values(103,'neha','f',7.5);
insert into student values(104,'ajay','m',5,NULL);

insert into student values(105,'abhay','m',8,'entc')
                         ,(106,'snehal','f',9,'entc');
                         
desc student;
-- read data (select): 
-- select : will decide the columns in the output
-- *    : all columns of the table
-- from : used to specify a data source, it can be a table, a view or a subquery

-- select * from table_name; -- all columns , all rows
select rollno,stud_name,gender,cgpa,branch from student;
select * from student;
select rollno,stud_name from student; -- specific columns, all rows

-- where : access specific rows of the table based on a condition
-- works on row level data
select * from student where branch='comp'; -- all columns but specific rows

select stud_name,cgpa from student where branch='comp'; -- specific columns of specific rows

/*
select * from table_name; -- all columns all rows
select columns from table_name; -- specific columns all rows
select * from table_name where condition; -- all columns but specific rows
select columns from table_name where condition; -- specific columns of specific rows
*/

/*
= : equal to
!=: not equal to
> : greater than
>=: greater than equal to
<: less than
<=: less than equal to
between: specify a range of values
in : specify multiple possible values /list of values
like : specify a pattern
in null : fetch the rows having null values for a column
*/

select * from student;
select * from student where cgpa>=8;
select * from student where cgpa<8;

-- between :
select * from student where cgpa between 7 and 9; -- <= start value and <= end values
select * from student where cgpa not between 7 and 9;

-- in :
select * from student where rollno=105;
-- 102,104,106
select * from student where rollno in (102,104,106);
select * from student;
select * from student where rollno in (102,104,110);
select * from student where rollno in (110,120,130);

select * from student where rollno not in (110,120,130);
select * from student where rollno not in (102,104,110);

-- like : 
/*
_(underscore) : check for a single char
%(percentage) : check for 0 or more char
*/

select * from student;
-- name starts with ra
select * from student where stud_name like 'ra%';

-- name ends with a
select * from student where stud_name like '%a';

-- name should contain a
select * from student where stud_name like '%a%';

-- name starts with r and have length 5
select * from student where stud_name like 'r____';

select * from student;
select * from student where rollno like '%5';
select * from student where stud_name not like 'r____';

-- regexp

-- pune to mumbai on 15th oct 
-- AND : all the conditions should be satisfied
-- OR  : either of the condition should be satisfied

select * from student;
select * from student where branch='comp' and gender='f';
select * from student where branch='comp' and gender='d';
select * from student where rollno=102 and rollno =104;

select * from student where rollno=102 or rollno =104;
select * from student where branch='comp' or gender='f';

select * from student where rollno>103 and gender='f' or branch='entc';

-- is null :
select * from student where branch is null;
select * from student where rollno is null;

select * from student where branch is not null;
select * from student where rollno is not null;

-- 10 + 20 + 30 >> 60

-- import a csv file into a table
select * from emp;












                        



















