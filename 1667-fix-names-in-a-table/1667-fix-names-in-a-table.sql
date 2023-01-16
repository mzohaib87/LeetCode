/* Write your T-SQL query statement below */

Select user_id,Upper(Left(name,1))+Lower(substring(name,2,len(name))) as name
from Users
order by user_id;
