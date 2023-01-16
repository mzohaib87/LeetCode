/* Write your T-SQL query statement below */

With Matches1 as (
    Select match_id,first_player as player_id,first_score as score from Matches
    Union All
    Select match_id,second_player as player_id,second_score as score from Matches
)

Select group_id,player_id
from 
(Select p.group_id,p.player_id,Rank() over(partition by p.group_id order by sum(m.score) desc,p.player_id) as RNK
from Players p join Matches1 m on p.player_id=m.player_id
group by p.group_id,p.player_id)ST1
where RNK=1

