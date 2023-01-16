/* Write your T-SQL query statement below */

Select u.user_id as buyer_id,u.join_date, isnull(orders_in_2019,0) as orders_in_2019
from (Select buyer_id,count(*) as 'orders_in_2019'
from Orders o
where year(o.order_date) = 2019
group by buyer_id)o
right join Users u on o.buyer_id=u.user_id








