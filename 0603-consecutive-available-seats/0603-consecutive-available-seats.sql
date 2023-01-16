/* Write your T-SQL query statement below */

Select * from
(Select Case 
            when free = free_lead and free !=0 then seat_id
            when free = free_lag and free !=0 then seat_id
        end as seat_id
from
(
  Select seat_id, free, lead(free) over(order by seat_id) as free_lead, lag(free) over(order by seat_id) as free_lag
   from Cinema
) ST1) ST2
where seat_id is not null;
