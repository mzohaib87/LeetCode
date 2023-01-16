/* Write your T-SQL query statement below */

Select SQ1.player_id, SQ1.device_id from
(
Select player_id,device_id, Row_Number() over(partition by player_id order by event_date asc) as RN
from Activity
 ) SQ1
where RN=1;

