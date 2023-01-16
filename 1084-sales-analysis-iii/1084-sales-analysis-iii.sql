/* Write your T-SQL query statement below */

Select distinct s.product_id,p.product_name from Sales s join Product p
        on s.product_id=p.product_id
where s.product_id not IN
(Select product_id
from Sales s 
where sale_date not between '2019-01-01' and '2019-03-31');
