/* Write your T-SQL query statement below */


Select user_id,max(window) as biggest_window from
(Select user_id,visit_date,datediff(day,visit_date,lead_visit_date) as window from
(Select user_id,visit_date,
    Case
        when lead_visit_date is null then cast('2021-01-01' as date)
        else lead_visit_date
    End as lead_visit_date
from 
(Select user_id,visit_date,lead(visit_date) over(partition by user_id order by visit_date ) as lead_visit_date
from UserVisits)ST1) ST2)ST3
group by user_id 



