/* Write your T-SQL query statement below */

/*Select Left(t.trans_date,7) as month,country,
       sum(Case when state='approved' then 1 else 0 end) as approved_count, 
       sum(Case when state='approved' then t.amount else 0 end) as approved_amount,
       sum(Case when c.trans_id is not null and t.id=c.trans_id then 1 else 0 end) as chargeback_count,
       sum(Case when c.trans_id is not null and t.id=c.trans_id then t.amount else 0 end) as chargeback_amount
from Transactions t full join Chargebacks c
on t.id=c.trans_id
group by Left(t.trans_date,7),country */

With CB as(
    Select left(c.trans_date,7) as trans_date,t.country as country,count(*) as chargeback_count,sum(isnull(amount,0)) as chargeback_amount
    from Chargebacks c left join Transactions t
    on c.trans_id=t.id
    group by left(c.trans_date,7),t.country
),
T_approved as(
    Select left(t.trans_date,7) as trans_date,t.country as country,count(*) as approved_count,sum(amount) as approved_amount
    from Transactions t
    where t.state='approved'
    group by left(t.trans_date,7),t.country
)

Select case when c.trans_date is null then t.trans_date else c.trans_date end as month,
case when c.country is null then t.country else c.country end as country,isnull(t.approved_count,0) as approved_count,isnull(t.approved_amount,0) as approved_amount,isnull(c.chargeback_count,0) as chargeback_count,isnull(c.chargeback_amount,0) as chargeback_amount
from T_approved t full join CB c
on t.trans_date=c.trans_date and t.country=c.country

