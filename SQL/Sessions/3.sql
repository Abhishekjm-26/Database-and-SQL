# string - sequence of characters

# trim - remove the white spaces by default from start and end of string

select trim('  mysql database  ');

select  trim( leading '+91' from '+91799999999');
select  trim( trailing '#' from '+91799999999####' );

select  ltrim( '    mysql database  ' );
select  rtrim( '   mysql databse    ' );

# padding - 
select lpad('90123', 10, 'X');
select lpad('901233333333333333333333', 10, 'X');
select rpad('9012', 10, 'X');

select * from employees;
# - WAQ to display emp_id, name (first and last name combined in single column)

select employee_id as emp_id, concat(first_name, ' ', last_name) as full_name 
from employees;

# - WQA to display emp_id , name (first and last name in lower case)
select employee_id as emp_id, 
lower(concat(first_name, ' ', last_name)) as full_name 
from employees;

# - WAQ to display the job_id with left padding 
# of 'x' to match the character lenght of 10

select lpad(job_id, 10, 'x') from employees;

# datetime 
select curdate();   # tells the current date
select now();  # tells the current date as well as time
# year, month, day, week, montname, quarter
select year(now());
select month(curdate());
select monthname(curdate());
select week(curdate());
select quarter(curdate());
select weekofyear(curdate());
select hour(now());
select minute(now());
select second(now());

# WAQ to display the emp_id, hired year 
select employee_id, year(hire_date) as hired_year from employees;

# WAQ to display the emp_id, hired year filter the employees hired in year 1996

select employee_id, 
year(hire_date) as hired_year 
from employees where year(hire_date) = 1996;

select employee_id, 
year(hire_date) as hired_year 
from employees where year(hire_date) = 1996;

select employee_id, year(hire_date) 
from employees where year(hire_date) = 1996;

# way sql query is written and executed is different
-- The way of Writing select -> From
-- The way of execution -FROM (filters rows) -> select

# column alias cannot be used in the where command

select * from employees where month(hire_date) = 10;


# datediff, dateadd, datesub

select datediff( curdate() , '2025-10-25' );  # given the difference b/w two dates (# days)
select datediff( '2025-10-25', curdate() );

# WAQ to find the no of years passed since the employees were hired
# for each employee in the database

select employee_id, hire_date, 
datediff(curdate() , hire_date) / 360
from employees;

# dateadd

select adddate(curdate(), interval 30 day);

select adddate(curdate(), interval 1 year);

select adddate(curdate(), interval 1 month);

select adddate(curdate(), interval -10 week);

select subdate(curdate(), interval 10 week);


# WAQ to display Employeed_id, first_name, hire_date, probation_completion_date
# the probation completion date would be 6 months from hired date

select employee_id, first_name, hire_date,
adddate(hire_date, interval 6 month) as probation_completion_date
from employees;

# date_format

select curdate();  # '%Y-%m-%d'
select date_format( curdate(), '%d-%m-%Y');  # %Y full year, %d - day, %m - month number
select date_format( curdate(), '%d-%m-%y');  # y short year
select date_format( curdate(), '%d-%b-%y');  # %b month name (short form)
select date_format( curdate(), '%D %M %y');
select date_format( curdate(), '%M %Y');  
# %D - Day with suffix (st, nd, rd, th), 
# %M - Full month name

# WAQ to display the employee id , first_name, hire_date in 
# Month Name-YYYY
select employee_id, first_name, date_format(hire_date, '%M-%Y') as hired_date
from employees;

# str_to_date

select str_to_date('2025-06-26', '%Y-%m-%d' );
select str_to_date('2025-06-26', '%y-%m-%d' );

select str_to_date('2025/06/26', '%Y/%m/%d' );
select str_to_date('31 jan 2026', '%d  %b %Y' );

select date_format(str_to_date('2026  31 jan', '%Y  %d %b' ), '%m-%Y');

-- select str_to_date('2025/06' , '%Y/%m') 
# 
select date_format( now(), '%M-%Y %H : %i : %s'); 
select date_format( now(), '%M-%Y %h: %i : %s'); 
# H - 24 hour format, h - it is 12 hour format


# stand alone functions


select convert( '10.24', decimal(10,2));
select convert('2026-01-15', date);
select cast( -10 as unsigned);
select cast( -10 as signed);
select cast( 10 as char);
select cast( '2026' as decimal);

### convert - used to convert the data type on the fly
select lpad(convert(employee_id, char), 10, 'x') from employees;

# WAQ to concat the employee_id_manager_id give alias emp_mgr_id
# display emp_mgr_id, first_name

# 101_102

select '10' + '20';
select concat(10, 20);

select employee_id, manager_id, 
concat( convert(employee_id, char), '_', 
convert(manager_id, char)) as emp_mgr_id, first_name
from employees;

select if( 10 > 15, 'highest value 10', 'highest value 15');
select if( salary >= 5000, 'GTEQ5K', 'LT5K') as sal_bracket , salary
from employees;








