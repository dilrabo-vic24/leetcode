drop table if EXISTS RequestAccepted

Create table RequestAccepted (requester_id int not null, accepter_id int null, accept_date date null)
Truncate table RequestAccepted
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '2', '2016/06/03')
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '3', '2016/06/08')
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('2', '3', '2016/06/08')
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('3', '4', '2016/06/09')
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('3', '5', '2016/06/09')

select * from RequestAccepted

-- ;with cte as(
--     select 
--         COUNT(*) as count,
--         accepter_id as accepter_id1
--     from RequestAccepted
--     GROUP by accepter_id
-- ),
-- cte2 as (
--     select * from cte
--     join RequestAccepted ra
--         on ra.requester_id = cte.accepter_id1
-- )

;with cte as(
    select accepter_id as id from RequestAccepted
    union all
    select requester_id as id from RequestAccepted
),
cte2 as(
    select
        id, COUNT(*) as count
    from cte
    GROUP BY id
),
cte3 as(
    SELECT MAX(count) as max from cte2
)
select 
    cte2.id,
    cte3.[max] as number
from cte3
join cte2
    on cte2.[count] = cte3.[max]