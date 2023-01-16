/* Write your T-SQL query statement below */

Select distinct num as ConsecutiveNums from
(Select Lag(num) over(order by id asc) as prev_num,num, LEAD(num) over(order by id asc) as num1, LEAD(num,2) over(order by id asc) as num2
from Logs) SQ1
where num=num1 and num=num2 and (prev_num!=num OR prev_num is null);
        