/* Write your T-SQL query statement below */

With PaidByTransactions as
(
    Select t.paid_by as user_id,t.amount * (-1) as amount
    from Transactions t
),
PaidToTransactions as
(
    Select t.paid_to as user_id,t.amount 
    from Transactions t
)


Select u.user_id,u.user_name,(isnull(ST2.amount,0)+u.credit) as credit,
Case
    When ST2.amount+u.credit <0 then 'Yes'
    else 'No'  
End as credit_limit_breached
from
(select ST1.user_id,sum(ST1.amount) as amount 
from
(Select user_id,amount from PaidByTransactions
Union All
Select user_id,amount from PaidToTransactions) ST1
group by ST1.user_id) ST2 right join Users u on ST2.user_id=u.user_id



