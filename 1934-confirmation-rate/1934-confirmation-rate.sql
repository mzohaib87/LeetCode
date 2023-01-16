/* Write your T-SQL query statement below */


Select user_id,round((cast(confirmed as float)/total),2) as confirmation_rate
from
(Select s.user_id,count(*) as total, sum(case when c.action='confirmed' then 1 else 0 end) as confirmed
from Signups s left join Confirmations c on s.user_id=c.user_id
group by s.user_id)ST1


