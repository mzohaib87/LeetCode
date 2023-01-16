/* Write your T-SQL query statement below */


Select sell_date,count(*) as num_sold,string_agg( product,',') WITHIN GROUP (ORDER BY product) as products
from 
(Select distinct sell_date,product
from Activities
) SQ1
group by sell_date
order by sell_date;