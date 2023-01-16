/* Write your T-SQL query statement below */

Select ST1.customer_id,c.customer_name
from
(Select customer_id,string_agg(product_name,',') as products
from Orders
group by customer_id) ST1 join Customers c
on ST1.customer_id=c.customer_id
where ST1.products like '%A%' and  ST1.products like '%B%' and 
        ST1.products not like '%C%'; 

/*Select ST1.customer_id,c.customer_name
from 
(Select product_name,customer_id,
       Lead(product_name) over(order by customer_id asc,product_name asc) as product_lead_1,
       Lead(customer_id) over(order by customer_id asc,product_name asc) as customer_lead_1,
       Lead(product_name,2) over(order by customer_id asc,product_name asc) as product_lead_2,
       Lead(customer_id,2) over(order by customer_id asc,product_name asc) as customer_lead_2
from Orders) ST1 join Customers c
on ST1.customer_id=c.customer_id
where product_name='A' and product_lead_1='B' and product_lead_2!='C'
    and ST1.customer_id=customer_lead_1 ;*/
      






