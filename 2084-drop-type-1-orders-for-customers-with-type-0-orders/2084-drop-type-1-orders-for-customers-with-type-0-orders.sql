/* Write your T-SQL query statement below */

With Orders1 as(
    Select order_id,customer_id,order_type,sum(order_type) over(partition by customer_id order by order_id rows between unbounded preceding and unbounded following) as sum_order_type,count(order_type) over(partition by customer_id order by order_id rows between unbounded preceding and unbounded following) as count_order_type
from Orders
)

Select order_id,customer_id,order_type
from Orders1
where (sum_order_type=count_order_type) OR (order_type=0)
