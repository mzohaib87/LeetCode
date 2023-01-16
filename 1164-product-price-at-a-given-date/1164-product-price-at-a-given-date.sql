/* Write your T-SQL query statement below */


With X as (
    Select product_id,new_price as price from
    (Select product_id,new_price, Row_Number() over(partition by product_id order by change_date desc) as RN from Products
    where change_date<= '2019-08-16') ST1
    where RN=1
)

Select distinct product_id,10 as price from Products where product_id not IN
(Select product_id from X)
Union all
Select distinct product_id,price from X


