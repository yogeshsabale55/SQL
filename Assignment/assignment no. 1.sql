
-- 11. Create a database named ‘first_db’.
create database first_db;

-- 12. Fetch the List of available databases
show databases;

-- 13. How to start using a database from all available databases
use first_db;
-- double click on desirable database.

-- 14. What is the syntax for creating a table?
-- create table table_name;

-- 15.How to create below table with no data in database named ‘first_db’
create table student (roll_no int, fname varchar(10), mock_score int, remarks varchar(10));

-- 16. A table named 123_A is created for storing the number of employees in an organisation.What is wrong in the name of the table?
	   -- As per the object naming conventions, table name must start with an alphabet.
       
/*17 Suppose you create a table as shown below:
Create table employee (empid int , Fname varchar(30));
How much space will database allocate to the FNAME column?
*/
      -- 30 spaces
      
-- 18. Which command is used to see the structure of a table?
desc student;
-- desc col_name;

-- 20. How to add multiple columns in a table
alter table student 
add column col_1 int, 
add column col2 varchar(20),
add column col_1 char(10);

/* 21. How to add a column LNAME after fname and grade at the last in below table
Table name: student
Columns : roll_no, fname, mock_score, remarks
*/
alter table student add column Lname varchar(10) after fname;
alter table student add column grade varchar(20);

 -- 22. How to rename a table student to stud_data
 alter table student rename to stud_data;
 show tables ;
 
-- 23. How to drop column remarks from the student table above
alter table stud_data drop column remarks;
desc stud_data;

-- 24. How to drop table student from database
drop table stud_data;
show tables ;

-- 25. What is truncate command
/* 1. The truncate command deletes all of a table's rows
   2. It is a DDL(Data Definition Language) command.
   3. It is use to delete all the data from the table.

-- 26. What is the difference between truncate and drop command

-- 27.Can we revert creating a table or dropping it
 
 


























