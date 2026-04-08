# create a database bank
# create table customers with custID, custname, phone_no, email
# insert 2 rows in customer table

create database bank;
use bank;
create table customers(custdid int, 
custname varchar(25), phone_no int, email varchar(50) );

insert into customers(custdid, custname, phone_no, email)
values(101, 'Manvendra', 99999, 'msingh@gmail.com'),
(102, 'Aman', 888888, 'asingh@gmail.com');

insert into customers(custdid, custname, phone_no, email)
values(103, 'Rahul', 87878, 'rsingh@gmail.com');


select * from customers;
# update the email address of cust 101 - to c1@gmail.com
update customers
set email = 'c1@gmail.com'
where custdid = 101;

# delete the record of customer 103
delete from customers where custdid = 103 ;

select * from customers;

# ALTER, RENAME, MODIFY, CHANGE

# change colname from phone_no to mobile_no


ALTER table customers change phone_no mobile_no bigint;
select * from customers;
desc customers;
ALTER table customers add pan varchar(20) after custdid;

ALTER table customers modify mobile_no  varchar(10);
desc customers;

# rename  table
rename table customers to customer_info;
select * from customer_info;

# constraints - 
# primary key, foregin key, unique key, default,
# not null, check 

create table customer_master(custid int primary key,
custname varchar(20) not null,
email varchar(20) unique, age int check(age > 10),
active_status varchar(20) default 'no');

desc customer_master;
insert into customer_master(custid, custname, email, age) 
values( 101, 'Manvendra', 'ms@gmail.com', 36);

select * from customer_master;

select * from customer_master;



create table department (dept_id int, dept_name varchar(30));

ALTER table department modify dept_id int primary key;

insert into department(dept_id, dept_name) 
values ( 10, 'HR'), (20, 'IT'), (30,'Sales');

select * from department;
create table employees(emp_id int, emp_name varchar(20), 
dept_id int, 
foreign key (dept_id) references department(dept_id));

insert into employees(emp_id, emp_name, dept_id) 
values (101, 'Manvendra', 10);

insert into employees(emp_id, emp_name, dept_id) 
values (101, 'Aman', 100);


# DQL - data query language - SELECT 
use hr;

# WHERE command 
select * from employees;
desc employees;

# WHERE - it is used to filter the data
# =, !=, >, <, >=, <=

# WAQ to find the employees earning more than 10000
select * from employees where salary > 10000;

# WAQ to find the employees earning less than 5000
select * from employees where salary < 5000;

# WAQ to find the employees hired after '1997-06-25'
# WAQ to find the employees whose job_id is IT_PROG
# WAQ to find the employees whose job_id is not IT_PROG

select * from employees where hire_date > '1997-06-25';
select * from employees where job_id = 'IT_PROG';
select * from employees where job_id != 'IT_PROG';

# between, in, not in, and, or, is null, is not null
# WAQ to find the employees hired b/w '1997-06-25' to '1989-09-21'

select * from employees 
where hire_date not between 19890921 and 19970625 ;
# WAQ to find employees whose salary is b/w 5000 to 10000
select * from employees where salary between 5000 and 10000;

# WAQ to find the employees whose dept is 60, 100 and 10
# in 
select * from employees where department_id in (60, 100, 10);

# find the employees whose job_id is in 'IT_PROG', 'FI_ACCOUNT'

select * from employees where job_id in ('IT_prog', 'FI_ACCOUNT');

select * from employees where 
hire_date >= 19890921 and hire_date<= 19970625;

# and 
# WAQ to find the employees who belongs to dept 10 and salary is 
# more than 3000

select * from employees where department_id = 10 and salary > 3000;
select * from employees where department_id = 10 or salary > 3000;

# between, in, and, or, is null

# is null 
# WAQ to find the employees who does not have any manager
Select * from employees where manager_id is null;

# not between, not in, is not null

# WAQ to find the employees whose salary is not b/w 5000 and 10000
# WAQ to find the employees who don't belong to dept (10,100, 90)
# WAQ to find the employees who has manager assigned

select * from employees where salary not between 5000 and 10000;
select * from employees where department_id not in (10,100,90);
select * from employees where manager_id != null;

select * from employees where salary < 3000 and salary >10000;


# Like operator - used on string data types
# We use like operator to filter records based on patterns

select * from employees;

# WAQ to find the employees whose name start with d

select * from employees where first_name like 'd%';

# name should start with d and after d it should have 4 characters
select * from employees where first_name like 'd____';

# WAQ ro find the employees whose first_name ends with e
select * from employees where first_name like '%e';

# WAQ to find the employees who has 'uc' in their name
select * from employees where first_name like '%uc%';

# WAQ to find the employees who has VP in thier job_id
select * from employees where job_id like '%vp%';

# distinct - gives unique values in a column
# WAQ to find unique department_ids

select distinct department_id from employees;

# Find the unique job_id
select distinct job_id from employees;

# Find the unique department_id in departments table
select distinct department_id from departments;

# functions - single row functions
# numeric functions
-- abs - absolute value
select abs(-80);
select abs(salary) from employees;
select employee_id, first_name, last_name from employees;
select employee_id, first_name, last_name, 
abs(salary) from employees;

-- round
select round(10.878,1);
select employee_id, round(salary, 1) from employees;

-- ciel
select ceil(10.89);
select ceil(10.09);

-- floor
select floor(10.9999);
select floor(10.00001);

-- power
select power(2, 3);
select pow(2,3);

-- sqrt
select sqrt(10);
select sqrt(100);

-- truncate
select truncate(10.89567342, 1);

select truncate(salary, 1) from employees; 

# string functions - 
-- upper
select UPPER('pes_university');
SELECT upper(first_name) from employees;

-- lower
select lower('PES_university');

-- length
select length('PES_university');
select char_length('PES university');

select length(hire_date) from employees;
-- char_length

-- reverse
select reverse('sql programming');

-- replace

select replace('data science', 'science', 'analysis');
select replace(job_id, 'AD', 'ED') from employees;

-- concat()
select concat('data' , '_', 'science');
select concat(first_name, ' ', last_name) from employees;


-- substr(value, s, e)
select substr('data science',1 , 4 );
select substr('data science',6 , 7);
select substr('data science',6 , 3);

-- substring(value,s,e)
select substring('data science',6 , 7);

-- instr('value',p)
select instr('data science', 'a');

-- lpad
-- rpad
-- trim
-- trim(lead '#' from 'data')
-- trim(trailing '#' from 'data')

use hr;









