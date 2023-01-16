/* Write your T-SQL query statement below */

Select transaction_id from
(Select transaction_id,Rank() over(partition by convert(date,day) order by amount desc) as RNK
from Transactions) ST1
where RNK=1
order by transaction_id asc;


