/* Write your T-SQL query statement below */
with cte as(
    select fail_date as date,'failed' as state
    from Failed
    union all
    select success_date as date,'succeeded' as state
    from Succeeded
), cte2 as(
    select  date,
            state,
            row_number() over(partition by state order by date) as rk,
            row_number() over(order by date) as id
    from cte
    where date between '2019-01-01' and '2019-12-31'
)select state as period_state,min(date) as start_date,max(date) as end_date
from cte2
group by state,(id-rk)
order by min(date);