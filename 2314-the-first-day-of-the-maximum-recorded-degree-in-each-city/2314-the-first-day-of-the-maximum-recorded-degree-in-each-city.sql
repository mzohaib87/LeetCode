/* Write your T-SQL query statement below */

Select city_id,day,degree
from
(Select city_id,day,degree, Rank() over(partition by city_id order by degree desc,day) as RNK
from Weather) ST1
where RNK=1;
