drop table if EXISTS Weather 
Create table  Weather (id int, recordDate date, temperature int)
Truncate table Weather
insert into Weather (id, recordDate, temperature) values ('1', '2015-01-01', '10')
insert into Weather (id, recordDate, temperature) values ('2', '2015-01-02', '25')
insert into Weather (id, recordDate, temperature) values ('3', '2015-01-03', '20')
insert into Weather (id, recordDate, temperature) values ('4', '2015-01-04', '30')

select * from Weather

select
    w1.id
from Weather w1 
right join Weather w2
    on w1.recordDate = DATEADD(day, 1, w2.recordDate) 
where w1.temperature > w2.temperature