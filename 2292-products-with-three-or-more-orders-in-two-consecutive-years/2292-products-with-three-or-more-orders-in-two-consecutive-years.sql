/* Write your T-SQL query statement below */

With Orders1 as
(
Select product_id,year(purchase_date) as year,count(order_id) as order_count
from Orders
group by product_id,year(purchase_date)
)

Select distinct product_id from
(
    Select product_id,order_count,year as year1,Lead(year) over(partition by product_id order by year) as lead_year,Lead(order_count) over(partition by product_id order by year) as lead_order_count
from Orders1
) ST1
where abs(isnull(lead_year,0)-year1)=1 and order_count>=3 and isnull(lead_order_count,0) >=3;



