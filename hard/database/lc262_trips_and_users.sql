DROP TABLE IF EXISTS Trips;
DROP TABLE IF EXISTS Users;

CREATE TABLE Trips (
    id INT,
    client_id INT,
    driver_id INT,
    city_id INT,
    status VARCHAR(50), 
    request_at VARCHAR(50)
);

CREATE TABLE Users (
    users_id INT,
    banned VARCHAR(50),
    role VARCHAR(50) 
);

TRUNCATE TABLE Trips;

INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES
(1, 1, 10, 1, 'completed', '2013-10-01'),
(2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01'),
(3, 3, 12, 6, 'completed', '2013-10-01'),
(4, 4, 13, 6, 'cancelled_by_client', '2013-10-01'),
(5, 1, 10, 1, 'completed', '2013-10-02'),
(6, 2, 11, 6, 'completed', '2013-10-02'),
(7, 3, 12, 6, 'completed', '2013-10-02'),
(8, 2, 12, 12, 'completed', '2013-10-03'),
(9, 3, 10, 12, 'completed', '2013-10-03'),
(10, 4, 13, 12, 'cancelled_by_driver', '2013-10-03');

TRUNCATE TABLE Users;

INSERT INTO Users (users_id, banned, role) VALUES
(1, 'No', 'client'),
(2, 'Yes', 'client'),
(3, 'No', 'client'),
(4, 'No', 'client'),
(10, 'No', 'driver'),
(11, 'No', 'driver'),
(12, 'No', 'driver'),
(13, 'No', 'driver');


SELECT * from Trips
SELECT * from Users


;with allTripCount as (
    select 
        request_at as Day,
        cast(COUNT(id) as float) as Count
    from Trips t
    join Users c on t.client_id = c.users_id and c.banned = 'No'
    join Users d on t.driver_id = d.users_id and d.banned = 'No'
    WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03' 
    GROUP By request_at
),
sucTripCount as(
    select 
        request_at as Day,
        cast(COUNT(id) as float) as Count
    from Trips t
    join Users c on t.client_id = c.users_id and c.banned = 'No'
    join Users d on t.driver_id = d.users_id and d.banned = 'No'
    where t.status in ('cancelled_by_driver', 'cancelled_by_client') and  t.request_at BETWEEN '2013-10-01' AND '2013-10-03' 
    GROUP By request_at
)
SELECT 
    atc.[Day],
    Round(isnull(stc.[Count], 0)/atc.Count, 2) as [Cancellation Rate]
from allTripCount atc
left join sucTripCount stc
    on atc.[Day] = stc.[Day]