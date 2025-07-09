drop TABLE if EXISTS Orders

Create table  Orders (order_number int, customer_number int)
Truncate table orders
insert into orders (order_number, customer_number) values ('1', '1')
insert into orders (order_number, customer_number) values ('2', '2')
insert into orders (order_number, customer_number) values ('3', '3')
insert into orders (order_number, customer_number) values ('4', '3')
insert into orders (order_number, customer_number) values ('4', '2')


select * from Orders

SELECT
    customer_number
from Orders
GROUP by customer_number
HAVING COUNT(*) = (
    SELECT
        MAX(t.order_count)
    from(
        SELECT
            COUNT(*) as order_count
        from Orders
        GROUP BY customer_number
    )t
)