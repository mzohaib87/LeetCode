/* Write your T-SQL query statement below */

Select Convert(varchar(7),trans_date,126) as month,
       country,
       count(*) as trans_count,
       sum(case when [state]='approved' then 1 else 0 end) as approved_count,
       sum(amount) as trans_total_amount,
       sum(case when [state]='approved' then amount else 0 end) as approved_total_amount
from Transactions
group by Convert(varchar(7),trans_date,126),country;



