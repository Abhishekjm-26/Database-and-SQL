select curdate(); # gives current date
select curtime();

create table students5(student_id int, 
student_name char(5) , dob date, birth_time time,
birth_year year);

insert into students5(student_id, student_name, 
dob, birth_time, birth_year )
values (101, 'john', '2026-01-10', '11:34:00', '2026');

select timestamp('2026-01-10' ,'15 : 26 : 00');
SELECT NOW();
SELECT CURRENT_TIMESTAMP();

insert into students5(student_id, student_name)
values(104, 'John'), (102, 'Ram'), (103, 'Joe');
# alter
 alter table students5 drop column c2;
 alter table students5 add c4 int;
 
 #set 
 set SQL_SAFE_UPDATES=0;
 update  students2
 set c4 = 11;

 





