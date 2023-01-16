/* Write your T-SQL query statement below */

Select ST1.player_id,ST1.player_name,sum(year_sum) as grand_slams_count
from
(Select p.player_id,p.player_name,
    (Case when p.player_id=c.Wimbledon then 1 else 0 End +
    Case when p.player_id=c.Fr_open then 1 else 0 End +
    Case when p.player_id=c.US_open then 1 else 0 End +
    Case when p.player_id=c.Au_open then 1 else 0 End) as year_sum 
from Players p cross join Championships c) ST1 
group by ST1.player_id,ST1.player_name
having sum(year_sum) > 0

