/* Write your T-SQL query statement below */


Select gender,day,sum(score_points) over (partition by gender order by day) as total
from Scores
order by gender,day;
