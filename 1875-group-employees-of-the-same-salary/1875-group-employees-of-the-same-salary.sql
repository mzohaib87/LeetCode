/* Write your T-SQL query statement below */

Select employee_id,name,salary,Dense_Rank() over(order by salary) as team_id
from 
(Select employee_id,name,salary
from Employees
where salary not IN(Select salary
                        from Employees
                        group by salary
                        having count(employee_id)<2)) ST1
order by team_id,employee_id