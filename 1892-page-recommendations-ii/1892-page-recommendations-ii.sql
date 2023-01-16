/* Write your T-SQL query statement below */

With AllUsers as(
    Select user1_id,user2_id  from Friendship
    Union All
    Select user2_id as user1_id,user1_id as user2_id from Friendship
),
SuggestedPages as(
Select F.user1_id as user_id,L.page_id,count(*) as friends_likes
from AllUsers F join Likes L on F.user2_id=L.user_id
and L.page_id not IN(Select page_id from Likes where user_id=F.user1_id)
group by F.user1_id,L.page_id
)

Select * from SuggestedPages;