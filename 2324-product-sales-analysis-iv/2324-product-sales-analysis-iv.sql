/* Write your T-SQL query statement below */

Select user_id,product_id
from
(Select s.user_id,s.product_id,Rank() over(partition by user_id order by sum(s.quantity * p.price) desc) as RNK
from Sales s join Product p on s.product_id=p.product_id
group by s.user_id,s.product_id)ST1
where RNK=1


