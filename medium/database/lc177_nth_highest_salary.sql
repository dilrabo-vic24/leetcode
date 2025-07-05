drop TABLE if EXISTS Employee;

Create table Employee (id int, salary int)

insert into Employee (id, salary) values ('1', '100')
insert into Employee (id, salary) values ('2', '200')
insert into Employee (id, salary) values ('3', '300')

select * from Employee


CREATE FUNCTION getNthHighestSalary2(@N INT)
RETURNS INT
AS
BEGIN
    IF @N < 1
        RETURN NULL;

    RETURN (
        SELECT Salary
        FROM (
            SELECT DISTINCT Salary
            FROM Employee
        ) AS DistinctSalaries
        ORDER BY Salary DESC
        OFFSET @N - 1 ROWS FETCH NEXT 1 ROWS ONLY
    );
END;
GO

select dbo.getNthHighestSalary(2) as SecondHighestSalary