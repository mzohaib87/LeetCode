/* Write your T-SQL query statement below */


Select distinct p1.id as P1, p2.id as P2,abs(p2.x_value-p1.x_value) * abs(p2.y_value-p1.y_value) as AREA 
from Points p1 join Points p2 on p1.id < p2.id
where (abs(p2.x_value-p1.x_value) * abs(p2.y_value-p1.y_value)) !=0 
order by area desc,p1.id,p2.id;


