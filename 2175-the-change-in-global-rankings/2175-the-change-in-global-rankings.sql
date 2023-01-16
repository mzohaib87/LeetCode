/* Write your T-SQL query statement below */

With TeamPointsBeforeChange as(
    Select team_id,name,points, Row_Number() over(order by points desc,name) as RNK
    from TeamPoints
),
TeamPointsAfterChange as(
    Select t.team_id,t.name,t.points+p.points_change as points, Row_Number() over(order by (t.points+p.points_change) desc,t.name) as RNK
    from TeamPoints t join PointsChange p on t.team_id=p.team_id
)
 
Select t1.team_id,t1.name, t1.RNK-t2.RNK as rank_diff
from TeamPointsBeforeChange t1 join TeamPointsAfterChange t2 on t1.team_id=t2.team_id;
