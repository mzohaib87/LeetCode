/* Write your T-SQL query statement below */

With X as(
    Select order_id,avg(quantity) as avg_quantity,max(quantity) as max_quantity
    from OrdersDetails
    group by order_id
),
MaxAvgOrder as(
    Select Max(avg_quantity) as max_avg_quantity from X
)

Select distinct X.order_id
from X cross join MaxAvgOrder M
group by X.order_id
having max(X.max_quantity) > max(M.max_avg_quantity)

