/* Write your T-SQL query statement below */


Select name
from Customer
where isnull(referee_id,0) !=2;



