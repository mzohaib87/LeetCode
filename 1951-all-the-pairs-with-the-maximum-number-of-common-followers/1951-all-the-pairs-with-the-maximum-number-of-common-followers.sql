/* Write your T-SQL query statement below */


Select user1_id,user2_id from
(Select r1.user_id as user1_id,r2.user_id as user2_id,Rank() over(order by count(*) desc) as RNK
from Relations r1 join Relations r2 on r1.user_id<r2.user_id and r1.follower_id=r2.follower_id 
group by r1.user_id,r2.user_id)ST1
where RNK=1;

