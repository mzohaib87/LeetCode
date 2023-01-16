/* Write your T-SQL query statement below */

With Users as(
    Select user1_id,user2_id from Friendship
    Union All
    Select user2_id as user1_id,user1_id as user2_id from Friendship
)

Select f1.user1_id,f1.user2_id,count(*) as common_friend
from Friendship f1 join Users f2 on f1.user1_id=f2.user1_id
join Users f3 on f1.user2_id=f3.user1_id and f2.user2_id=f3.user2_id
group by f1.user1_id,f1.user2_id
having count(*)>=3
