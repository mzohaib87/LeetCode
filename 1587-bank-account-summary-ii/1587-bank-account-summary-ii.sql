/* Write your T-SQL query statement below */


Select u.name as name, SQ1.balance
from Users u join
(Select account,sum(amount) as balance
from Transactions
group by account
having sum(amount) > 10000) SQ1
on u.account=SQ1.account;