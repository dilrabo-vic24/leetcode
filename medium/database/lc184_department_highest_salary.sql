drop table if EXISTS Employee
drop table if EXISTS Department

Create Table Employee (id int, name varchar(255), salary int, departmentId int)
Create Table Department (id int, name varchar(255))
Truncate table Employee
insert into Employee (id, name, salary, departmentId) values ('1', 'Joe', '70000', '1')
insert into Employee (id, name, salary, departmentId) values ('2', 'Jim', '90000', '1')
insert into Employee (id, name, salary, departmentId) values ('3', 'Henry', '80000', '2')
insert into Employee (id, name, salary, departmentId) values ('4', 'Sam', '60000', '2')
insert into Employee (id, name, salary, departmentId) values ('5', 'Max', '90000', '1')
Truncate table Department
insert into Department (id, name) values ('1', 'IT')
insert into Department (id, name) values ('2', 'Sales')

select * from Employee
select * from Department

select
    distinct departmentId
from Employee


select
    d.name as Department, 
    e.name as Employee, 
    e.salary as Salary
from Employee e 
join Department d 
    on e.departmentId = d.id
join (
    SELECT departmentId, MAX(salary) AS maxSalary
    FROM Employee
    GROUP BY departmentId
)t 
on t.maxSalary = e.salary and t.departmentId = d.id
