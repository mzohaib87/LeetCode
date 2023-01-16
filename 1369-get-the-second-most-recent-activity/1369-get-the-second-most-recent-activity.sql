/* Write your T-SQL query statement below */


Select username,activity,startDate,endDate from
(Select username,activity,startDate,endDate,Row_Number() over(partition by username order by startDate) as RN1 from 
(Select username,activity,startDate,endDate, Row_Number() over(partition by username order by startDate desc) as RN
from UserActivity) ST1
where RN <= 2) ST2
where RN1=1;
