/* Write your T-SQL query statement below */

Select Top 1 person_name
from
(Select person_name, sum(weight) over(order by turn asc) as sum_weight
from Queue) ST1
where sum_weight <=1000
order by sum_weight desc;

