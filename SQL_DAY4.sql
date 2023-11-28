use college;
-- CRUD : create,read,update,delete
-- create data : insert 
-- insert into table_name (columns) values (set of values);
-- insert into table_name values (set of values);

-- read: select 
-- select */columns from table_name where condition;

-- where : access specific rows based on a condition
-- and & or operator to combine multiple conditions

-- Update data: update 
-- update table_name set column_name = new value;
select * from student;
update student set branch='civil';
update student set branch='entc' where rollno in (105,106);
update student set branch='comp',cgpa=6 where rollno in (103,104);

alter table student add column internship int;
update student set internship=2;

/*
if rollno=101 then internship 1
if rollno=103 then internship 2
if rollno=105 then internship 3
*/

-- case statement :
update student set internship=
case rollno
when 101 then 1
when 103 then 2
when 105 then 3
end;

select * from student;

update student set internship=
case rollno
when 101 then 1
when 103 then 2
when 105 then 3
else 0
end;

/*
if rollno=102 then internship 1
if rollno=104 then internship 1
if rollno=106 then internship 1
*/
update student set internship=
case rollno  
when 102 then 1 
when 104 then 1
when 106 then 1
else internship
end;

-- delete : delete all or specific rows of the table
-- delete from table_name;
-- select */column names from table_name;

delete from student; -- delete all the rows
delete from student where rollno=106;
select * from student;

truncate table student; -- delete all rows

-- DDL : truncate ,auto committed, we can not roll it back
-- DML : delete   , not auto committed, we can rollback

drop table student;
desc student;
desc emp;
-- sql is all non case sensitive

-- constraints    : rules/limitations
-- not null       : restrict the entry of null values
-- unique         : restrict the entry of duplicate values,allows multiple NULL values
-- primary key    : not null + unique , uniquely identify a row
-- foreign key    : define relationship between db tables
-- check          : checks condition before we insert data in a table
-- default        : set a default value for a column
-- auto_increment : auto increment a column value by 1,mandatory to define it as a key

/*
emp: empid as pk
empid,name,salary,loc
1001  abc  70000  pune

project : emp_id as FK
pro_id,proj_name ,emp_id
10      ETL      , 1001
20      migration
*/














