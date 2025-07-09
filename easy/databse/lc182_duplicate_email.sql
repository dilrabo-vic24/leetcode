drop table if EXISTS Person
Create table  Person (id int, email varchar(255))
insert into Person (id, email) values ('1', 'a@b.com')
insert into Person (id, email) values ('2', 'c@d.com')
insert into Person (id, email) values ('3', 'a@b.com')

select * from Person

SELECT email
    FROM Person
    GROUP BY email
    HAVING COUNT(*) > 1

with temp as (
select email,
row_number() over(partition by email ORDER BY (SELECT NULL)) as rnk
from person
)

select distinct email from temp where rnk > 1