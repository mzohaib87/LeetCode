/* Write your T-SQL query statement below */


Select * from 
(Select case when e.employee_id is null then s.employee_id
            when s.employee_id is null then e.employee_id end as employee_id
from Employees e full join Salaries s on e.employee_id=s.employee_id) SQ1
where employee_id is not null
order by employee_id asc; 


/*Select case when e.employee_id is null then s.employee_id
            when s.employee_id is null then e.employee_id end as employee_id
from Employees e full join Salaries s on e.employee_id=s.employee_id
where e.employee_id is null or s.employee_id is null
order by employee_id asc; */






