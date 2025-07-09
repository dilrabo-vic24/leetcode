drop table if exists Person

Create table  Person (Id int, Email varchar(255))
Truncate table Person
insert into Person (id, email) values ('1', 'john@example.com')
insert into Person (id, email) values ('2', 'bob@example.com')
insert into Person (id, email) values ('3', 'john@example.com')

select * from Person

delete from Person
where id not in(
select min(id)
from Person GROUP by Email
)

select * from PErson
