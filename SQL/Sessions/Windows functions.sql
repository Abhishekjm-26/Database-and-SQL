-- Advanced aggregate functions
-- Basic - Sum, avg, min, max, avg, count


-- over(partition by , order by )
use hr;
select employee_id, salary, department_id, avg(salary)  over(partition by department_id) as dept_avg from employees;
select department_id, avg(salary) as dept_avg from employees group by department_id;

select * from employees;
# rank people based on salary
 select  employee_id, salary, dense_rank() over (order by salary desc) from employees;
 
 #find the employees getting highest salary in the departments(employee_id, name, dept_id, salary)
SELECT * 
FROM (
        SELECT employee_id,
               first_name,
               department_id,
               salary,
               RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk
        FROM employees
     ) t
WHERE rnk = 1;

-- select first_name as emp_name
-- from employees where emp_name like '%j%'; - Order of execution fails

#row number
-- SELECT * 
-- FROM (
        SELECT employee_id,
               first_name,
               department_id,
               salary,
               row_number() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num
        FROM employees;
     -- ) t
-- WHERE rnk = 1;

select employee_id, salary, department_id, ntile(4) over(order by salary) as ntile_10
from employees;
select employee_id, salary, department_id, cume_dist() over(order by salary) as ntile_10
from employees;

-- lead and lag

select employee_id, hire_date,
salary, lag(hire_date) over(order by hire_date) from employees;

SELECT MAX(hire_date - prev_hire_date) AS max_days_between
FROM (
    SELECT hire_date,
           LAG(hire_date) OVER (ORDER BY hire_date) AS prev_hire_date
    FROM employees
)t;
  
  select * ,datediff(hire_date , lead_hire) as days_diff from 
  (SELECT employee_id,  hire_date,
           LAG(hire_date) OVER (ORDER BY hire_date) AS lag_hire
    FROM employees) t1;
    
  select max(datediff(hire_date , lag_hire)) as days_diff from 
  (SELECT employee_id,  hire_date,
           LAG(hire_date) OVER (ORDER BY hire_date) AS lead_hire
    FROM employees) t1;
    
    select employee_id, hire_date,
salary, lead(hire_date) over(order by hire_date) from employees;

#first hiring happenned in each of the department
select employee_id, department_id, salary,  first_value(hire_date) over(partition by department_id order by hire_date) from employees;

select employee_id, department_id, salary,  last_value(salary) over(partition by department_id order by hire_date) from employees;

select employee_id, department_id, hire_date, salary,  last_value(salary) over(partition by department_id order by hire_date rows between 
unbounded preceding and unbounded following)
last_hire_salary from employees; 
    

