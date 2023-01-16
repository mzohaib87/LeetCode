/* Write your T-SQL query statement below */




-- Select sum(Case when datename(weekday,submit_date) IN ('Saturday','Sunday') then 1 else 0 end) as weekend_cnt,sum(Case when datename(weekday,submit_date) not IN ('Saturday','Sunday') then 1 else 0 end) as working_cnt
-- from Tasks

Select sum(Case when datepart(weekday,submit_date) IN (7,1) then 1 else 0 end) as weekend_cnt,sum(Case when datepart(weekday,submit_date)  IN (2,3,4,5,6) then 1 else 0 end) as working_cnt
from Tasks





