/* Write your T-SQL query statement below */


Select person1,person2, count(duration) as call_count,sum(duration) as total_duration
from
(Select from_id as person1, to_id as person2, duration  from Calls
Union All
Select to_id as person1, from_id as person2, duration  from Calls) ST1
where person1<person2
group by person1,person2

