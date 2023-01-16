/* Write your T-SQL query statement below */


Select round(avg(count1),2) as average_daily_percent
from 
(Select (cast(count(distinct r.post_id) as float) * 100)/count(distinct a.post_id) as count1
from Actions a left join Removals r
on a.post_id=r.post_id 
where a.action='report' and a.extra='spam'
group by a.action_date) ST1

