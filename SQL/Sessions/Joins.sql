#query the data from different tables
select * from departments;
select * from employees;
#inner join or equi join, join
#waq to display department name , employee id, salary from employees and department tables
select department_name, employee_id, salary from employees e
join departments d
on e.department_id = d.department_id;
select department_name, employee_id, salary from employees e
join departments d
using(department_id); #column name is same in both tables with same primary key or foreign key

#waq to find the employee_id, department, name and cities they work
select department_name, employee_id, salary , city from employees e
join departments as d
on e.department_id = d.department_id
join locations as l
on d.location_id = l.location_id;
help curdate;
#waq to display details of employees and names of department and also department where no employee is working
select employee_id, department_name, first_name, salary from employees e
right join departments as d
on e.department_id = d.department_id;
#where department_name is null;

select employee_id, first_name, department_name, salary from departments d
right join employees as e
on e.department_id = d.department_id;
#where salary is null;


select employee_id, first_name, department_name, salary from employees e
left join departments as d
on e.department_id = d.department_id
union
select employee_id, first_name, department_name, salary from employees e
right join departments as d
on e.department_id = d.department_id;

-- from, join, where, group by, having, select, orderby, limit
select * from departments;
select * from employees;
#waq to display the details of employees and names of the department they work in
select e.department_id, employee_id, department_name, salary from employees e
inner join departments d
on e.department_id = d.department_id;
#waq to display the details of employees and the names of the department they work in who are not alloted any department.
select e.department_id, employee_id, department_name, salary from employees e
left join departments d
on e.department_id = d.department_id
where department_name is null;
#waq to display the details of employees and the names of the department where no employee is working
select e.department_id, employee_id, department_name, salary from employees e
right join departments d
on e.department_id = d.department_id
where employee_id is null;

#waq for combination of both
select e.department_id, employee_id, department_name, salary from employees e
left join departments d
on e.department_id = d.department_id
where department_name is null
union
select e.department_id, employee_id, department_name, salary from employees e
right join departments d
on e.department_id = d.department_id
where employee_id is null;

#waq to list the details of employees and their job titles
select * from jobs;
select * from employees;
select employee_id,first_name, job_title from employees e
join jobs j
on e.job_id = j.job_id;

select * from departments;
#waq to list the details of the employees , name of their departments and job titles
select employee_id, first_name, department_name, job_title from employees e
 join departments d
on e.department_id = d.department_id
 join jobs j
on e.job_id = j.job_id;

#waq to employees, department and cities
select * from locations;
select employee_id, first_name, department_name, city from employees e
 join departments d
on e.department_id = d.department_id
 join locations l
 on d.location_id = l.location_id;
 
#waq to employees and job_titles
select employee_id, job_title from employees e
join jobs j
on e.job_id = j.job_id
where job_title like '%Manager%';

select employee_id, job_title from employees e
join jobs j
on e.job_id = j.job_id
where manager_id is null;

# department, number of employees and avg salary drawn by its employees
select * from employees;
SELECT d.department_name, count(employee_id) as cnt,
       AVG(e.salary) AS avg_salary
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id order by cnt desc;

SELECT d.department_name, count(employee_id) as cnt,
       AVG(e.salary) AS avg_salary
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id having avg_salary>10000 order by cnt desc;

-- Skeleton -  select from join on where group by having order by limit
-- execution - from join on where group by having select order by limit

use hr;
select * from employees;
-- cross join : cartesian product
select e.department_id, employee_id, department_name, salary from employees e
cross join departments d
on e.department_id = d.department_id;
-- Self join
#waq to display employee id salary manager id and manager salary of the same table.
select a.employee_id, a.salary, a.manager_id, b.salary as mgr_salary from employees a
join employees b
on a.manager_id = b.employee_id;
#where b.salary is null;
#waq to display manager name and count of employees under each manager
select * from employees;
SELECT 
    m.first_name  AS manager_name,
    COUNT(*)
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id
GROUP BY m.employee_id;

#waq to find the employees who are earning more than managers
select * from employees;
SELECT 
    e.first_name ,
    e.salary as employee_average ,
    m.first_name ,
    m.salary as manager_average 
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id
where e.salary > m.salary;

SELECT 
    e.first_name ,
    avg(e.salary) as employee_average ,
    m.first_name ,
    avg(m.salary) as manager_average 
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id
group by m.first_name, e.first_name;

