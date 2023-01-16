/* Write your T-SQL query statement below */

Select u.name as name, isnull(travelled_distance,0) as travelled_distance
from Users u left join 
(Select user_id ,sum(distance) as travelled_distance
from Rides
group by user_id) SQ1 on u.id=SQ1.user_id
order by travelled_distance desc, name asc;


