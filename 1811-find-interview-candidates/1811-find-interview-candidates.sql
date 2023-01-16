/* Write your T-SQL query statement below */

With WonConsecutiveAnyMedal as(
    Select distinct u.name,u.mail
    from Users u cross join Contests c1
    join Contests c2 on c1.contest_id+1=c2.contest_id
    join Contests c3 on c1.contest_id+2=c3.contest_id
    where (u.user_id=c1.gold_medal OR u.user_id=c1.silver_medal OR u.user_id=c1.bronze_medal) and (u.user_id=c2.gold_medal OR u.user_id=c2.silver_medal OR u.user_id=c2.bronze_medal) and (u.user_id=c3.gold_medal OR u.user_id=c3.silver_medal OR u.user_id=c3.bronze_medal)
),
WonConsecutiveGoldMedal as(
    Select u.name,u.mail
    from Users u join Contests c1 on u.user_id=c1.gold_medal
    group by u.name,u.mail
    having count(gold_medal) >= 3
)

Select distinct name,mail
from
(Select name,mail from WonConsecutiveAnyMedal
Union All
Select name,mail from WonConsecutiveGoldMedal)ST1
