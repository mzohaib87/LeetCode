/* Write your T-SQL query statement below */


Select e.employee_id
from Employees e left join Logs l on e.employee_id=l.employee_id
group by e.employee_id
having sum(case when l.employee_id is null then 0 else ceiling(cast(datediff(second,l.in_time,l.out_time) as float)/60) end) < Max(e.needed_hours * 60)

