use stud_data;
select * from emp;

-- like :
/*
_(underscore): single char
%(percentage) : 0 or multiple char
*/

-- regexp:
/*
. : single char
+ : 1 or more char
* : 0 or more char
$ : end of string
^ : start of string
? : o or 1 instance
[abc] : anmy char between list
[^abc]: not in the list
{n} : n instances
{m,n} : m to n instances
*/

select * from emp where emp_name regexp '^s';
select * from emp;
select * from emp where emp_name regexp 'a$';

select * from emp where emp_name regexp '^r[a-i]';

-- pan card : abcde1234y
-- [a-z]{5}[0-9]{4}[a-z]{1}



