/* Write your T-SQL query statement below */

Select top 1 customer_number from
(Select customer_number,count(*) as order_count
from Orders
group by customer_number) SQ1
order by order_count desc