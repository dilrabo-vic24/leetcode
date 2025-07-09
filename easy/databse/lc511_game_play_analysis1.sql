drop table if EXISTS Activity
Create table  Activity (player_id int, device_id int, event_date date, games_played int)
Truncate table Activity
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5')
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6')
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1')
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0')
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5')

select * from Activity


SELECT
    t.player_id,
    t.event_date as first_login
from(
    SELECT
        player_id,
        event_date,
        ROW_NUMBER() OVER(partition by player_id order by event_date) as rn
    from Activity
)t
where t.rn = 1

select * from Activity

;with firstLogin as(
    SELECT 
        player_id,
        MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
),
nextLogin as(
    SELECT
        a.player_id
    from firstLogin f
    join Activity a on a.player_id = f.player_id
    where DATEDIFF(DAY, f.first_login_date, a.event_date) = 1
    GROUP by a.player_id
)
select 
    round(cast(COUNT(*) as float) / (select count(distinct player_id) from Activity), 2) as fraction
from nextLogin 