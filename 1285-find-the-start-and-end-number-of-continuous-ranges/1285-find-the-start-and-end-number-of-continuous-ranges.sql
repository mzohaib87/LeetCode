/* Write your T-SQL query statement below */

select 
min(log_id) as start_id
,max(log_id) as end_id
from 
(select 
 log_id
 ,abs(log_id-row_number() over (order by log_id)) as seq
from Logs) a 
group by seq
