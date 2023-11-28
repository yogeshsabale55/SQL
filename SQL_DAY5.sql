use college;

-- DDL : create,alter,truncate,drop -- strcture
-- create : create db or db objects
-- create database db_name;
-- create table table_name(columns datatypes);

-- alter:
-- alter table table_name add column/modify column/rename column/drop column 
					--    col_defi/new_col_defi/exi to new/column_name;
                    
-- truncate : 
-- truncate table table_name;

-- drop:
-- drop table table_name;
-- drop database db_name;

-- DML : insert,update,delete -- data
-- DQL : select               -- data

-- CRUD operations : create data(insert), read data(select), update data(update),delete data (delete)
-- create data 
-- insert into table_name(column names) values (set of values);
-- insert into table_name values (set of values);

-- read data :select 
-- select : columns in the output
-- *      : all columns
-- from   : specify a data source

-- select * from table_name;
-- select column_names from table_name;

-- where : 
-- works on row level data
-- access specific rows of the table either to read ,to update or to delete them

-- using AND & OR, we can combine multiple where conditions

-- select */column_names from table_name where condition;

-- update data (update):
-- update table_name set column_name=new value,column2= new value;
-- update table_name set column_name=new value,column2= new value where condition;

-- case statement: it helps us update records based on a condition
/*
update table_name set column_name=
case condition_col_name
when val1 then val
when val2 then val
else single value/column_name
end;
*/

-- delete data (delete) :
-- delete from table_name;
-- truncate table table_name;
-- delete from table_name where condition;

-- data gathering :
-- 40 tables
-- read all 40 tables
-- only 5 tables have the imp data -- based on the primary domain knowledge
/*
table1   10 columns -- 5 col are imp
table2.  5 columns. -- 5 are imp
table3.  8 columns. -- 8 are imp
table4.  10 columns -- 7 are imp
table5.  15 columns -- 10 are imp

-- 48 columns  >> 35 columns 

-- get the output of the join query in a dataframe
-- feature analysis
-- update the select to have only 30 imp columns after feature analysis
-- EDA

emp 
empid,empname

project
proj_id,proj_name,emp_id

-- empid,empname,proj_id,proj_name
-- 1001. rohit.   10.     migration

*/

-- constraints : rules/limitations
-- unique              : restricts the entry of duplicates,but here NULLs are allowed
-- not null            : restricts the entry of null values
-- primary key         : not null + unique,identify a row/entity uniquely
-- foreign key         : define relationship between tables
-- default             : used to set a default value for a column
-- check               : checks for a condition before inserting data into a table
-- auto_increment      : increment a col value by 1,mandatory to define it as a key

-- NOT NULL: 
create table emp_nn(empid int NOT NULL,empname varchar(10),salary int NOT NULL);
DESC emp_nn;
desc student;

insert into emp_nn values(1001,'akash',70000);
select * from emp_nn;
insert into emp_nn values(null,'akash',70000);
insert into emp_nn values(1002,'akash',null);

select * from student;
alter table student modify column roll_no int NOT NULL;

-- drop NOT NULL:
alter table student modify column roll_no int;
alter table emp_nn modify column empid int;

-- unique : 
create table emp_unq(empid int UNIQUE,empname varchar(10),salary int,contact varchar(10) UNIQUE);
desc emp_unq;

insert into emp_unq values(1001,'rohit',70000,'12345');
select * from emp_unq;

insert into emp_unq values(1001,'rohit',70000,'12345');
insert into emp_unq values(1002,'rohit',70000,'12345');
insert into emp_unq values(null,'rohit',70000,'12347');

alter table student modify column roll_no int UNIQUE;

alter table emp_unq drop index empid;
alter table student drop index roll_no;

-- primary key : not null + unique
create table emp_pk(empid int PRIMARY KEY,empname varchar(10),salary int,contact varchar(10));

insert into emp_PK values(1001,'rohit',70000,'12345');
Select * from emp_pk;

insert into emp_PK values(1001,'rohit',70000,'12345');
insert into emp_PK values(null,'rohit',70000,'12345');
insert into emp_PK (empname,salary,contact) values('rohit',70000,'12345');

alter table student modify column roll_no int PRIMARY KEY;

desc emp;
alter table emp modify column emp_id int unique not null;
alter table student drop primary key;

-- empid contact 
-- 1001  1234
-- 1002  3456

-- primary key(empid,contact) : composite key

-- foreign key : 
-- one to one relationship
-- one to many relationship
-- many to one relationship
-- many to many relationship

/*
student                       course.                              faculty
roll_no,stud_name,loc         course_id,course_name,rollno,id      id,name,course
101      rohit.   pune.       10         data sci.    101.  1       1.  abc. data sci
                              11.        sql          101
roll_no : pk                  rollno : fk.                          id : pk
                              id.    : fk
parent table                  child table
referenced table.             referencing table
*/

/*
101,102,103,104,105 >> 101,102,103,  106(not allowed)
102,103,104,105 >> 101,102,103       
*/

select * from student;
desc student;

-- foreign key(child table column name) references parent_tbl_name(parent_tbl_pk);

create table course (course_id int,course_name varchar(20),rollno int,
foreign key(rollno)  references student(roll_no));


insert into course values(10,'data sci',101);

-- cannot add or update a child row
-- can not add a value in child which is not there in parent pk
insert into course values(10,'data sci',106);

-- can not delete or update a parent row
delete from student where roll_no=101;

delete from course where rollno=101;
delete from student where roll_no=101;

-- cascade the deletion of pk value to all related tables
-- on delete cascade
-- on update cascade

create table course (course_id int,course_name varchar(20),rollno int,
foreign key(rollno)  references student(roll_no)
on delete cascade
on update cascade);

select * from student;
select * from course;

-- on delete cascade
insert into course values(10,'data sci',102);
delete from student where roll_no=102;

-- on update cascade
insert into course values(10,'data sci',103);
update student set roll_no=113 where roll_no=103;

-- fk can have duplicate values in case of one to many relationship
-- we can have multiple foreign keys in a single table

