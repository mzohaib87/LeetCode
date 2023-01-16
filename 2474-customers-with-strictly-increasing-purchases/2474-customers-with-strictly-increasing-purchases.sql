/* Write your T-SQL query statement below */


With YearlyPrice as(
    Select customer_id,year(order_date) as order_year,sum(price)  as price
    from Orders
    group by customer_id,year(order_date)
    
),
MinMaxOrderYear as(
    Select customer_id,Min(year(order_date)) as min_year,Max(year(order_date)) as max_year
    from Orders
    group by customer_id
),
Years as(
    Select 2000 as year
    Union All
    Select y.year+1
    from Years y where y.year<2023
)



Select  y1.customer_id
from YearlyPrice y1 
left join YearlyPrice y2 on y1.customer_id=y2.customer_id
and y1.order_year+1=y2.order_year and y1.price < y2.price
group by y1.customer_id
having count(*)-count(y2.customer_id)=1


