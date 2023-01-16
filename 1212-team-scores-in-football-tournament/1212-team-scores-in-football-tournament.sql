/* Write your T-SQL query statement below */

With Team_Points as(
    Select match_id,host_team,guest_team,
    Case when host_goals > guest_goals then 3
         when host_goals = guest_goals then 1
         else 0 
    end as host_points,
    Case when host_goals < guest_goals then 3
         when host_goals = guest_goals then 1
         else 0 
    end as guest_points
    from Matches 
),Res as (
Select match_id, host_team as team, host_points as points from Team_Points
  Union all
Select match_id, guest_team as team, guest_points as points from Team_Points)

Select t.team_id,t.team_name,sum(isnull(Res.points,0)) as num_points
from Res right join Teams t
on Res.team=t.team_id
group by t.team_id,t.team_name
order by num_points desc, t.team_id asc;
