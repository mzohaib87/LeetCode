/* Write your T-SQL query statement below */

Select r1.driver_id,count(r2.passenger_id) as cnt
from (Select distinct driver_id from Rides) r1 left join  Rides r2 on r1.driver_id=r2.passenger_id
group by r1.driver_id

