drop table if EXISTS Insurance
Create Table  Insurance (pid int, tiv_2015 float, tiv_2016 float, lat float, lon float)
Truncate table Insurance
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('1', '10', '5', '10', '10')
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('2', '20', '20', '20', '20')
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('3', '10', '30', '20', '20')
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('4', '10', '40', '40', '40')

select * from Insurance

SELECT
    tiv_2015
from Insurance
GROUP BY tiv_2015
having COUNT(tiv_2015) > 1

SELECT
    lat, lon 
from Insurance
GROUP by lat, lon 
having COUNT(*) = 1

SELECT
    SUM(tiv_2016) as tiv_2016
from Insurance i
WHERE 
    tiv_2015 IN (
        SELECT tiv_2015
        FROM Insurance
        GROUP BY tiv_2015
        HAVING COUNT(*) > 1
    )
    AND exists(
        select 1
        from Insurance
        WHERE lat = i.lat and lon = i.lon
        GROUP by lat, lon
        HAVING COUNT(*) = 1
    )