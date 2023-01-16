/* Write your T-SQL query statement below */


With Matches1 as(
    Select home_team_id,home_team_goals,away_team_goals,
    case 
    when home_team_goals > away_team_goals then 3 
    when home_team_goals = away_team_goals then 1
    when home_team_goals < away_team_goals then 0
    end as home_team_points
    from Matches

    Union All

    Select away_team_id as home_team_id,away_team_goals as home_team_goals,home_team_goals as away_team_goals,
    case 
    when home_team_goals < away_team_goals then 3 
    when home_team_goals = away_team_goals then 1
    when home_team_goals > away_team_goals then 0
    end as home_team_points
    from Matches
)


Select t.team_name,count(m.home_team_id) as matches_played, sum(m.home_team_points) as points,sum(home_team_goals) as goal_for,sum(away_team_goals) as goal_against,sum(home_team_goals)-sum(away_team_goals) as goal_diff
from Teams t join Matches1 m on t.team_id=m.home_team_id
group by t.team_name
order by points desc,goal_diff desc,team_name


