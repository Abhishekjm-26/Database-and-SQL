with cte as(
select employee_id, hire_date, lag(hire_date) over (order by hire_date) as lag_hire from employees)
select * from cte where employee_id = 101;

#views to simplify queries

