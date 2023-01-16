/* Write your T-SQL query statement below */

Select SQ1.id,SQ1.visit_date,SQ1.people from
(Select id,visit_date,people,lag(people) over(order by id asc) as lag_1,lag(people,2) over(order by id asc) as lag_2,lead(people) over(order by id asc) as lead_1,lead(people,2) over(order by id asc) as lead_2
from Stadium) SQ1
where (people >= 100 and lag_1 >= 100 and lag_2 >=100) OR
      (people >= 100 and lead_1 >=100 and lead_2 >=100) OR
      (lag_1 >=100 and people >= 100 and lead_1 >=100);



