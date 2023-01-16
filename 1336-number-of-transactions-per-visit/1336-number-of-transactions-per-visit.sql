/* Write your T-SQL query statement below */

With TransactionsVisitCount as(
Select TransactionsCount,count(user_id) as visit_count
from
(Select v.user_id,v.visit_date,count(t.user_id) as TransactionsCount
from Visits v left join Transactions t on v.user_id=t.user_id and v.visit_date=t.transaction_date
group by v.user_id,v.visit_date) ST1
group by TransactionsCount
),
MaxTransactions as(
    Select max(TransactionsCount) as max_count
    from TransactionsVisitCount
),
Transactions as(
    Select 0 as TransactionCount
    Union All
    Select t.TransactionCount+1 as TransactionCount
    from Transactions t cross join MaxTransactions m where t.TransactionCount<m.max_count
)

Select t1.TransactionCount as transactions_count,isnull(t2.visit_count,0) as visits_count
from Transactions t1 left join TransactionsVisitCount t2 on t1.TransactionCount=t2.TransactionsCount

