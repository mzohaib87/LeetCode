/* Write your T-SQL query statement below */


Select round(cast(ImmediateOrders as float)*100/TotalOrders,2) as immediate_percentage from
(Select sum(case when order_date=customer_pref_delivery_date then 1 else 0 end) as ImmediateOrders,count(order_date) as TotalOrders
from 
(Select customer_id, order_date,customer_pref_delivery_date, Row_Number() over(partition by customer_id order by order_date asc) as RN
from Delivery)ST1
where RN=1)ST2





