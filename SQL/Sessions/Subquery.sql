use hr;
-- Single row subquery
select * from employees;
#waq to find the employees who are getting highest salary
select * from employees where salary = (select max(salary) from employees);
select * from employees where salary = (select min(salary) from employees);
select * from employees where salary > (select avg(salary) from employees);
select max(salary) from employees;

select * from employees where salary = (select max(salary) from employees where salary < (select max(salary) from employees));

#find the departments from employees table which are also in department table
select * from employees where department_id in (
select department_id from departments); #it is just taking out null values

select * from departments where department_id in
(select department_id from employees);

select * from departments where department_id not in
(select department_id from employees where department_id);

select * from employees;
select * from departments;

#waq to find employees working in administration and marketing
select * from employees where department_id in (
select department_id from departments where department_name in( 'Marketing', 'Administration'));

select * from employees where department_id in (
select department_id from departments where department_name like '%zx%' and department_name like '%ze%');

# Multi row
select employee_id, salary from employees where salary > any (
select salary from employees where department_id = 50);
select * from employees;
select * from departments;

select department_name from departments where department_id not in (select department_id from employees);

select employee_id, salary, job_id, department_id from employees where (job_id, salary) in (select distinct job_id , salary from employees
where department_id = 50 and salary is not null);

#correlated query
-- outer(inner) dependence

select * from employees;
select department_id, employee_id, salary
from employees e where salary>
(select avg(salary)
from employees e1
where e1.department_id = e.department_id);

select * from employees;
SELECT e.department_id, e.employee_id, e.salary
FROM employees e
JOIN (SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id ) t1
ON e.department_id = t1.department_id
WHERE e.salary > t1.avg_salary;

select * from employees;
SELECT e.department_id, e.employee_id, e.salary
FROM employees e
right JOIN (SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id ) t1
ON e.department_id = t1.department_id
WHERE e.salary > t1.avg_salary;
select e.department_id, e.employee_id,e.manager_id, e.salary
from employees e
inner join ( select manager_id, avg(salary) as avg_salary
from employees
group by manager_id) t1
on e.employee_id = t1.manager_id
where e.salary > t1.avg_salary;

use hr;
#any(atleast one should be true)
#all(all should be true)

select * from employees;
select * from departments;

select employee_id, salary , (select avg(salary) from employees) from employees ;
select employee_id, salary , (select avg(salary) from employees) from employees ;

SELECT employee_id, t1.department_id, salary, dept_avg
FROM employees t1
JOIN (
    SELECT department_id, AVG(salary) AS dept_avg
    FROM employees
    GROUP BY department_id
) t2
ON t1.department_id = t2.department_id; #avg of each department

select employee_id, department_id,  salary, (select avg(salary) from employees e2 where e2.department_id = e1.department_id) as 
dept_avg from employees e1;

select * from employees;
#exists and not exists
#find the departmets with no employees

SELECT department_id, department_name
FROM departments d
WHERE  EXISTS (
    SELECT department_id
    FROM employees e
    WHERE e.department_id = d.department_id
);



