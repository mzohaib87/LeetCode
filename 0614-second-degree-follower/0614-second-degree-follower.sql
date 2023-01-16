/* Write your T-SQL query statement below */



/*Select distinct f1.follower,count(*) as num
from (Select distinct follower from Follow) f1 join Follow f2
on f1.follower =f2.followee 
group by f1.follower; */


Select f1.follower,count(distinct f2.follower) as num
from Follow f1 join Follow f2
on f1.follower =f2.followee 
group by f1.follower; 
