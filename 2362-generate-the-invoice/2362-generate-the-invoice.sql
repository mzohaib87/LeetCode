/* Write your T-SQL query statement below */


Select p1.product_id,p1.quantity,p2.price * p1.quantity as price from 
Purchases p1 join Products p2 on p1.product_id=p2.product_id
where p1.invoice_id IN
(Select top 1 p1.invoice_id
from Purchases p1 join Products p2 on p1.product_id=p2.product_id
group by p1.invoice_id
order by sum(p2.price * p1.quantity) desc,p1.invoice_id) 

