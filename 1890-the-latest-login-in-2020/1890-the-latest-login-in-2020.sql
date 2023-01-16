/* Write your T-SQL query statement below */


/*Select user_id, max(time_stamp) as last_stamp
from Logins
where year(time_stamp)=2020
group by user_id; */


Select user_id, time_stamp as last_stamp from
(Select user_id,time_stamp,Row_Number() over (partition by user_id order by time_stamp desc) as RowNum
from Logins
where year(time_stamp)=2020) SQ1
where RowNum=1;




