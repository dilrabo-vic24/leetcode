drop table if EXISTS Stadium

Create table Stadium (id int, visit_date DATE NULL, people int)
Truncate table Stadium
insert into Stadium (id, visit_date, people) values ('1', '2017-01-01', '10')
insert into Stadium (id, visit_date, people) values ('2', '2017-01-02', '109')
insert into Stadium (id, visit_date, people) values ('3', '2017-01-03', '150')
insert into Stadium (id, visit_date, people) values ('4', '2017-01-04', '99')
insert into Stadium (id, visit_date, people) values ('5', '2017-01-05', '145')
insert into Stadium (id, visit_date, people) values ('6', '2017-01-06', '1455')
insert into Stadium (id, visit_date, people) values ('7', '2017-01-07', '199')
insert into Stadium (id, visit_date, people) values ('8', '2017-01-09', '188')

select * from Stadium
------------------------------------------------------------------------
;with cte as (
    SELECT
        *
    from Stadium
    where people >= 100
),
cte2 as(
    SELECT
        t.id
    from(
        select 
            LAG(id, 1, 0) OVER(order by id) as prevId,
            id,
            Lead(id, 1, 0) OVER(order by id) as nextId
        from cte
    )T
    WHERE t.prevId + t.nextId = 2*t.id
),
cte3 as(
    select * from cte2
    union ALL
    select min(id) - 1 from cte2
    union all
    select max(id) + 1from cte2
)
select 
    s.id,
    s.visit_date,
    s.people
from cte3
join Stadium s 
    on s.id = cte3.id


------------------------------------------------------------------------
;with filtered as (
    select 
        *,
        id - row_number() over(order by id) as island_id
    from Stadium
    where people >= 100
),
islands as(
    select island_id
    from filtered
    GROUP BY island_id
    having COUNT(*) >= 3
)
select 
    f.id,
    f.visit_date,
    f.people
from islands as i 
join filtered  as f 
    on i.island_id = f.island_id