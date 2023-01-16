/* Write your T-SQL query statement below */


Select c.name as customer_name,ST1.customer_id,order_id,order_date
from
(Select customer_id,order_id,order_date, Row_Number() over(partition by customer_id order by order_date desc) as RN
from Orders) ST1 join Customers c
on ST1.customer_id=c.customer_id
where RN <= 3
order by customer_name asc,ST1.customer_id asc,order_date desc;
