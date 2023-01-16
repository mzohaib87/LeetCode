/* Write your T-SQL query statement below */

With cte as (
    Select id,student, lag(student) over(order by id asc) as lag_student,lead(student) over(order by id asc) as lead_student 
    from Seat
)

Select id,(case when id%2!=0 and lead_student is null then student 
        when id%2!=0 then lead_student
       else lag_student end) as student
from cte;
