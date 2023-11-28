-- dbms : database management system

-- goal :
-- to store the data and manage the data
-- to retrive or read the data
-- get that data into a dataframe

-- mysql : application/software/dbms/rdbms
-- sql   : structured query language

-- sql commands :
-- DDL : create,alter,truncate,drop >> related to structure
-- DML : insert,update,delete       >> related to data
-- DCL : grant,revoke               >> DBA
-- TCL : commit,rollback,savepoint
-- DQL : select 

-- comments in sql :
-- single line comment
/*
multiline
comment
*/

-- databases : database : tables/views : rows and columns
-- folders   : folder   : csv files    : rows and columns

-- DDL : create,alter,truncate,drop
-- CREATE : create database or any db objects
-- create database
-- create database db_name; -- syntax
-- db_test
create database db_test; 
show databases;

-- create table
-- create table table_name(column1 datatype, column2 datatype,column3 datatype); -- table difinition/table ddl
/*
emp:
empid,empname,salary,loc
*/

-- use db_name;
use db_test;
create table db_test.emp(empid int,empname varchar(10),salary int,loc varchar(20));
show tables;
show create table emp;
-- desc table_name; 
desc emp;

/*
create database db_name;
create table table_name(columns datatype);
show databases; -- list of dbs on the server
show tables; -- list of tables from a db
show create table table_name; -- get the table DDL
desc table_name ;-- structural details of a table
*/

-- char(size)   : used to store alphanumeric values,fixed length datatype,occupy memory space according to the given size
-- varchar(size): used to store alphanumeric values,variable length datatype,occupy memory space according the actual data
-- range of int datatype : -2147483648 to +2147483647

-- ALTER : modify the structure
/*
emp:
empid,empname,salary,loc
*/
-- add column
-- rename column
-- change datatype
-- drop column
-- rename table
-- add or drop constraints

-- 1. add column
/*
emp:
empid,empname,salary,loc,CONTACT
*/
-- alter table table_name ADD COLUMN column_name datatype/column definition;
alter table emp add column contact int;
desc emp;

-- rowid as the first column of the table
alter table emp add column rowid int FIRST;

-- gender after empname
alter table emp add column gender char(1) AFTER empname;

-- 2. modify column
-- alter table table_name MODIFY COLUMN new_column_definition;
alter table emp modify column contact varchar(10);
desc emp;
alter table emp modify column empname varchar(15);

-- 3. rename column
-- alter table table_name rename column exi_col to new_col;
alter table emp rename column loc to address;
alter table emp rename to emp_info;

desc emp_info;

-- 4. drop column
-- alter table table_name DROP COLUMN column_name;
alter table emp_info drop column contact;

alter table emp_info drop column gender,drop column rowid;

/*
alter table table_name add column col_defi,add column col_defi;
alter table table_name modify column new_col_defi,modify column new_col_defi;
alter table table_name rename column exi to new,rename column exi to new;
alter table table_name drop column col_name,drop column col_name;
*/

-- flask
-- data gathering

-- TRUNCATE : empty the table/delete entire data 
-- truncate table table_name;
truncate table emp_info;

select * from engg_data.join_new;
truncate table engg_data.join_new;
desc engg_data.join_new;

-- DROP : delete the structure
-- drop table table_name;
drop table emp_info; -- delete data as well as structure of the table
desc emp_info;

-- drop database
drop database db_test;

-- truncate : deletes the entire data
-- drop     : delete data along with the structure






























