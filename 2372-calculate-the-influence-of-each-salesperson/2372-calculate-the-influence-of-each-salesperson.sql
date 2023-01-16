/* Write your T-SQL query statement below */

Select s.salesperson_id,s.name,sum(isnull(price,0)) as total
from Salesperson s left join Customer c on s.salesperson_id=c.salesperson_id
left join Sales sal on c.customer_id=sal.customer_id
group by s.salesperson_id,s.name

