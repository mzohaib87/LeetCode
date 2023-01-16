/* Write your T-SQL query statement below */


Select project_id, employee_id from
(Select p.project_id, e.employee_id, Rank() over(partition by p.project_id order by e.experience_years desc) as RNK
from Project p join Employee e
on p.employee_id=e.employee_id) ST1
where RNK=1;



