/* Write your T-SQL query statement below */

With InstallDate as(
    Select player_id,min(event_date) as event_date
    from Activity
    group by player_id
)

Select  event_date as install_dt,installs,round(cast(next_day_install_count as float)/installs,2) as Day1_retention from
(Select i.event_date,count(distinct a.player_id) as installs, 
      sum(case when dateadd(day,1,i.event_date)=a.event_date then 1 else 0 end) as next_day_install_count
from Activity a join InstallDate i on a.player_id=i.player_id 
group by i.event_date) ST1


