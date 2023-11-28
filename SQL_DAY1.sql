-- data
-- database : collection of data

-- Apolo
-- IRCTC
-- Accenture
-- bank

-- large amount of data
-- manage the data
-- access the data
-- concurrency
-- security
-- fast search

-- relational database    : stores the structured data in table format
-- non relational database: stores the unstructured data in json /dictionary format

/*
emp:     table name/csv/dataframe
empid,empname,salary,loc  CONTACT    -- columns/attributes/features
1001  abc      5000  pune 12345-- row/record
*/

-- mysql,oracle,sql server,teradata,postgresql,db2

-- DBMS : database management system
-- RDBMS: relational database management system

-- goal od dbms: 
-- to store and manage the data
-- to read the data for analysis

-- MySQL: application /RDBMS
-- database server
-- user interface - workbench
-- connection

-- SQL : structured query language
-- domain specific language : relational databases
-- query : any sql statement
-- non procedural programming language : what to do
-- english like statements , syntax
-- every query should end with a semicolan
-- sequal : simple english query language

-- databases : database : tables/views/stored procedures/functions    : rows and columns


-- SQL commands : 
-- DDL(data definition language)    : CREATE,ALTER,TRUNCATE,DROP -- auto saved/auto committed
-- DML(data manipulation language)  : INSERT,UPDATE,DELETE     
-- DCL(data control language)       : GRANT- give acccess,REVOKE -- remove an access -- DBA
-- TCL(transaction control language): COMMIT(save),ROLLBACK(undo),SAVEPOINT
-- DQL(data query language)         : SELECT

-- emp 
-- 1001 abc 
-- project
-- etl 1001
-- dept
-- 10 etl

/*
customer :
cust_id,cust_name,ac_no,ac_balance
1               1234.   95000 -- update

transaction:
tran_id,tran_type,tran_amt,cust_id
10.       credit   100000    1
11        debit    5000     1     -- insert
*/

/*
insert
insert
update
delete
insert
commit; -- to save the changes
insert
update
rollback; -- to revert the changes till last commit
insert
insert
update
savepoint A;
delete
rollback to savepoint A; -- to revert the changes till a particular savpoint

-- ETL : 
-- 1000 >> 901 th record >> savepoints created at every 200 records
*/

































