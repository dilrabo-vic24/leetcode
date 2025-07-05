drop table if EXISTS Logs
Create table  Logs (id int, num int)
Truncate table Logs
insert into Logs (id, num) values ('1', '1')
insert into Logs (id, num) values ('2', '1')
insert into Logs (id, num) values ('3', '1')
insert into Logs (id, num) values ('4', '2')
insert into Logs (id, num) values ('5', '1')
insert into Logs (id, num) values ('6', '2')
insert into Logs (id, num) values ('7', '2')

select * from Logs



SELECT DISTINCT
    t.num AS ConsecutiveNums
FROM
(
    SELECT
        num, 
        LAG(num, 1) OVER (ORDER BY id) AS prev,
        LEAD(num, 1) OVER (ORDER BY id) AS next
    FROM Logs
) t
WHERE t.num = t.prev AND t.num = t.next;