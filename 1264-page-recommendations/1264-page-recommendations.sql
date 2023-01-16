/* Write your T-SQL query statement below */

With Friends as (
    Select Case when user1_id=1 then user2_id
                when user2_id=1 then user1_id end as friends
    from Friendship
    where user1_id=1 or user2_id=1
)

Select distinct page_id as recommended_page
from Friends f join Likes l
on f.friends=l.user_id and l.page_id not in (select page_id from Likes where user_id=1);
;



