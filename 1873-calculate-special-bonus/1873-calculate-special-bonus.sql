/* Write your T-SQL query statement below */

Select employee_id, case when employee_id%2!=0 and LEFT(name,1) != 'M' then salary 
            else 0 end as bonus
from Employees
order by employee_id


