/* Write your T-SQL query statement below */

Select product_id,year as first_year,quantity,price from
(Select product_id,year,quantity,price, Rank() over(partition by product_id order by year asc) as RN
from Sales) ST1
where RN=1;
