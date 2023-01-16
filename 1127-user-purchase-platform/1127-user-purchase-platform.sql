/* Write your T-SQL query statement below */

-- Select spend_date,user_id,
--     case when platform_count >1 then 'both'
--          when platform_count =1 then platform end
--      as platform1,sum_amount,userid_count
-- from
-- (Select spend_date,user_id,count(platform) as platform_count,max(platform) as platform,sum(amount) as sum_amount,count(distinct user_id) as userid_count
-- from Spending
-- group by spend_date,user_id) ST1


-- Select  s1.spend_date,s1.user_id,max('both'),max(
--     case when s1.user_id=s2.user_id and s1.spend_date=s2.spend_date then s1.amount+s2.amount end
-- ),count(distinct s1.user_id)
-- from Spending s1 
-- group by s1.spend_date,s1.user_id


with t as(
select distinct spend_date, 'mobile' as platform from Spending
union
select distinct spend_date, 'desktop' as platform from Spending
union
select distinct spend_date, 'both' as platform from Spending)


select t.spend_date, t.platform, isnull(sum(amount),0) as total_amount, isnull(count(distinct user_id),0) as total_users
from
(select spend_date, case when cnt = 2 then 'both' else platform end as platform, user_id, amount, cnt
from
(select spend_date, platform, user_id, amount, count(platform)over(partition by spend_date, user_id) as cnt
from Spending) t3) t4
right join t on t4.spend_date = t.spend_date and t.platform = t4.platform
group by t.spend_date, t.platform



