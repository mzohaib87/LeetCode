/* Write your T-SQL query statement below */

With MonthlyIncome as(
SELECT account_id,year(day) as year1,month(day) as month1,sum(amount) as sum_amount
   from Transactions
   where type='Creditor'
   group by account_id,year(day),month(day)
)


Select distinct a.account_id
from Accounts a join MonthlyIncome t1 on a.account_id=t1.account_id
join MonthlyIncome t2 on t1.account_id=t2.account_id and t1.year1=t2.year1 and t1.month1+1=t2.month1 and t1.sum_amount > a.max_income and t2.sum_amount > a.max_income