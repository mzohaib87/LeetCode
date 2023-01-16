/* Write your T-SQL query statement below */

With Cust as (
    Select visited_on, sum(amount) as amount
    from Customer
    group by visited_on
)

Select visited_on,amount,average_amount from 
(Select visited_on,
    round(sum(cast(amount as float)) over( order by visited_on asc Rows between 6 preceding and current row),2) as amount,
     round(avg(cast(amount as float)) over(order by visited_on asc Rows between 6 preceding and current row),2) as average_amount, Row_Number() over(order by visited_on asc) as RN
     from Cust) ST1
where RN>6;
