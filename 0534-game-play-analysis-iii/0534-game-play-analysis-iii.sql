/* Write your T-SQL query statement below */


Select player_id, event_date, sum(games_played) over(partition by player_id order by event_date asc) as games_played_so_far
from Activity
order by player_id asc, event_date asc;