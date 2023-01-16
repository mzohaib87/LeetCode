/* Write your T-SQL query statement below */


Select id from
(Select id,recordDate,temperature,lag(temperature) over(order by recordDate asc) as prev_temperature, lag(recordDate) over(order by recordDate asc) as prev_recordDate
from Weather) SQ1
where prev_temperature<temperature and prev_temperature is not null
    and DATEDIFF(day,prev_recordDate ,recordDate) = 1;


