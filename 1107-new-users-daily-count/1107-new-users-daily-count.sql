/* Write your T-SQL query statement below */


/*Select activity_date as login_date,count(distinct user_id) as user_count
from Traffic
where activity = 'login' and 
      activity_date >= DATEADD(day, -90, '2019-06-30')
      and user_id not IN (
          Select user_id from Traffic where activity_date < DATEADD(day, -90, '2019-06-30')
          )
group by activity_date; */


Select last_activity as login_date, count(distinct user_id) as user_count
from
(Select user_id, min(activity_date) as last_activity
from Traffic
where activity='login'
group by user_id ) ST1
where last_activity >= DATEADD(day, -90, '2019-06-30')
group by last_activity; 


