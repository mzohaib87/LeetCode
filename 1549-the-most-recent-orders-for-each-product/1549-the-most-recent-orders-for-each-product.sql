/* Write your T-SQL query statement below */


Select p.product_name,ST1.product_id,order_id,order_date
from 
(Select product_id,order_id,order_date, Rank() over(partition by product_id order by order_date desc) as RNK
from Orders) ST1 join Products p
    on ST1.product_id=p.product_id
where RNK=1
order by p.product_name asc,ST1.product_id asc,order_id asc;



