drop table if EXISTS Employee
Create table  Employee (id int, name varchar(255), department varchar(255), managerId int)
Truncate table Employee
insert into Employee (id, name, department, managerId) values ('101', 'John', 'A', NULL)
insert into Employee (id, name, department, managerId) values ('102', 'Dan', 'A', '101')
insert into Employee (id, name, department, managerId) values ('103', 'James', 'A', '101')
insert into Employee (id, name, department, managerId) values ('104', 'Amy', 'A', '101')
insert into Employee (id, name, department, managerId) values ('105', 'Anne', 'A', '101')
insert into Employee (id, name, department, managerId) values ('106', 'Ron', 'B', '101')

select * from Employee



SELECT
    e.name
from (
    SELECT
        t.managerId
    from (
        SELECT
            *,
            ROW_NUMBER() over(partition by managerId order by id) as rn
        from Employee
    )t
    where rn >= 5
    )t2
join Employee e on e.id = t2.managerId

SELECT
    e.name
from (
    select managerId from Employee
    WHERE managerId is not null
    GROUP by managerId
    HAVING COUNT(*) >= 5
)t
join Employee e on e.id = t.managerId