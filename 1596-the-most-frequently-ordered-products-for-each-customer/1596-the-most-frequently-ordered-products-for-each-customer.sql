/* Write your T-SQL query statement below */

Select ST2.customer_id,ST2.product_id,p.product_name
from
(Select ST1.customer_id,ST1.product_id, Rank() over (partition by customer_id order by product_count desc) as RNK
from
(Select distinct customer_id,product_id, count(product_id) over(partition by customer_id,product_id order by order_id rows between unbounded preceding and unbounded following) as product_count
from Orders) ST1) ST2 join Products p on ST2.product_id=p.product_id
where ST2.RNK=1;




