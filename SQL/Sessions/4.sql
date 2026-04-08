# if
#if(condition, output when True, output when false)

# ifnull, coalesce

# ifnull(col, new_value)

select * from employees;

# WAQ to display the comission against each employee id
# If commission is null assign comission % to be 0.02 
# as default

select employee_id, ifnull(commission_pct, 'NA' ) as cms_pct
from employees;

select employee_id, coalesce(commission_pct, 0.02 ) as cms_pct
from employees;

select employee_id, coalesce(commission_pct,
manager_id, 0 ) as cms_pct
from employees;

select employee_id, 
ifnull(commission_pct, 'NA' ) as cms_pct,
ifnull(manager_id, 'NA') as mgr_id
from employees;


# WAQ to group employees 
# into 2 brackets based on salary
# salary >= 10000 "highly paid" 
# otherwise "moderately paid"
# Employee id, salary, salary_bucket

#case statements
select employee_id, salary, 
case  
when salary < 5000 then 'low paid'
when salary between 5000 and 10000
then 'moderately paid' 
else 'highly paid'
end as salary_bucket
from employees;

# WAQ to apply a bonus of 10% to 
# people whose salary is more than 20K
# 20% to people whose salary is between 10K - 20K
# 25% to people earning b/w 5k - 10k
# otherwise 30% bonus

select employee_id, salary,
case 
when salary > 20000 then salary * 0.1
when salary > 10000 and salary <= 20000 then salary * 0.2
when salary > 5000 and salary <= 10000 then salary * 0.25
else salary * 0.3
end as bonus
from employees;


# WAQ to display the employee_id, salary, commission_pct
# if salary is more than 20K and comission is more than
# 0.2 , then apply bonus as 5%
# else follow the above condition

select employee_id, salary,
case 
when salary > 20000 and commission_pct > 0.2 then 
salary * 0.05
when salary > 20000 then salary * 0.1 
when salary > 10000 and salary <= 20000 then salary * 0.2
when salary > 5000 and salary <= 10000 then salary * 0.25
else salary * 0.3
end as bonus
from employees;


# WAQ to display the work_domain 
# If job id has IT then Info Tech, 
# if job id has sa then sales,
# if job id has hr then human resource
# otherwise 'others'

select distinct job_id from employees;

select employee_id, job_id,
case when job_id  like '%it%' then 'info tech'
when job_id  like '%sa%' then 'sales'
when job_id like '%hr%' then 'human resource'
else 'others'
end as domain
from employees;

##  
#WAQ to display total pay -  
#total pay is salary plus the comission
#if commission in not there then commission is 0

select employee_id,
salary + salary * coalesce(commission_pct, 0) as total_pay
from employees;

# basis total_pay categorize them into 3 buckets
# low pay -  less than 5K
# moderate pay - >5 and less than 10K
# high pay >= 10K

select employee_id,
case 
when (salary + salary * coalesce(commission_pct, 0) ) < 5000 
then 'low pay'
when (salary + salary * coalesce(commission_pct, 0) ) >= 5000 
and (salary + salary * coalesce(commission_pct, 0) ) < 10000
then 'moderate pay'
else
'high pay'
end as total_pay_bracket
from employees;

# aggregate functions -
# count, min, max, sum, avg

# count - gives the count of records


select count(*) as cnt from employees;
select count(employee_id) as cnt from employees;
select count(manager_id) as cnt from employees;
select count(commission_pct) from employees;
select count(distinct job_id) from employees;

-- 
-- count with group by

select department_id, count(*)
from employees 
group by department_id;


select department_id, 
count(employee_id)
from employees 
group by department_id;

# WAQ to display count of employees under each manager_id
select manager_id, count(*)
from employees
group by manager_id;

select job_id, count(*)
from employees
group by job_id;


#WAQ to find the count of people against job id
# it_prog and AD_Pres

select job_id, count(*) 
from employees where  job_id in ('it_prog', 'AD_PRES')
group by job_id;

# order of execution
# FROM -> WHERE -> group by -> selection

# Find the count of employees hired each year

select year(hire_date), count(*) 
from employees
group by year(hire_date);

select year(hire_date), count(*) cnt
from employees
group by year(hire_date) order by cnt;

select year(hire_date), count(*) cnt
from employees
group by year(hire_date) order by cnt desc;

select year(hire_date) as hire_year, 
count(*) as cnt, 
count(manager_id) as mgr_cnt
from employees
group by hire_year order by cnt desc;

select * from employees where manager_id is null;


select year(hire_date) as hire_year, 
count(*) as cnt, 
count(manager_id) as mgr_cnt
from employees
group by hire_year order by cnt desc ;


select department_id,  
salary from 
employees order by department_id asc, salary asc;


select  count(*) cnt, year(hire_date) as hire_year 
from employees
group by year(hire_date);


select col1,col2, count(*)
from employees
group by col1;


select year(hire_date), job_id, count(*)
from employees 
group by year(hire_date), job_id
order by year(hire_date);


select year(hire_date), job_id, count(*)
from employees 
group by year(hire_date), job_id
order by year(hire_date), count(*) asc;


select count(*), year(hire_date), job_id
from employees 
group by year(hire_date), job_id
order by year(hire_date), count(*) asc;

select salary 
from employees 
order by salary desc, commission_pct asc limit 10;

select salary 
from employees 
order by salary desc limit 10, 5;


select department_id,job_id, count(*) cnt
from employees
group by department_id order by cnt desc limit 1;

# order of execution 
# FROM -> WHERE -> group by -> selection -> order by -> limit

select department_id, 
avg(salary) min_sal
from employees
group by department_id
having cnt > 20;

use hr;
select * from employees;
select * from departments;
#waq to find ,in, max and avg salary from employees
select min(salary), max(salary), round(avg(salary)), '90' as section from employees; 

#count(*) - 
select count(*) from employees;
select * from employees;
#union - Same number of columns, maintain correct row order of the first table or query precedence, Data type

select min(salary), max(salary), round(avg(salary)), 'overall' as section from employees
union 
select min(salary), max(salary), round(avg(salary)), '90' as section from employees where department_id = 90;

select min(salary), max(salary), round(avg(salary)), 'overall' as section from employees
union 
select max(salary), min(salary), round(avg(salary)), '90' as section from employees where department_id = 90;






