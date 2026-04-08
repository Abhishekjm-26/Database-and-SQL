create database bank1;
use bank;

create table account_info(account_id varchar(20), account_name varchar(20), balance int);
insert into account_info(account_id, account_name, balance)values(101222, 'HDFC', 5000),(101223, 'SBI', 10000);
select * from account_info;
rollback;

start transaction;
update account_info
set balance = balance - 100
where account_id = 101223; #debit

savepoint s1;

update account_info
set balance = balance + 100
where account_id = 101222; 
commit;   #credit

savepoint s2;
-- we can't rollback after commit

commit;  

SET autocommit = 0;

update account_info
set balance = balance - 100
where account_id = 101223; #debit
savepoint s1;
select * from account_info;
update account_info
set balance = balance + 100
where account_id = 101222; 
rollback to s1;

