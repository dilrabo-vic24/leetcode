drop TABLE if EXISTS Employee;

Create table Employee (id int, salary int)

insert into Employee (id, salary) values ('1', '100')
insert into Employee (id, salary) values ('2', '200')
insert into Employee (id, salary) values ('3', '300')

select * from Employee

---------------------------------------------------
SELECT  
t.salary as SecondHighestSalary 
from
(
    SELECT
        *,
        ROW_NUMBER() OVER(order by Salary) as rn
    from Employee
) t
where t.rn = 2

SELECT
(
    select distinct Salary from Employee
    ORDER By salary Desc 
    OFFSET 1 Row FETCH NEXT 1 ROW ONLY
) as SecondHighestSalary
