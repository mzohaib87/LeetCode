/* Write your T-SQL query statement below */

Select count(s.account_id) as accounts_count
from Subscriptions s join Streams st on s.account_id=st.account_id
where 2021 between year(s.start_date) and year(s.end_date)
and year(stream_date)!=2021;

