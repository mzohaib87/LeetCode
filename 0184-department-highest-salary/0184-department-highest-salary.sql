/* Write your T-SQL query statement below */

Select d.name as Department ,SQ1.name as Employee ,salary as Salary  from
(Select name,salary,departmentId,Rank() over(partition by departmentId order by salary desc) as RankNo
from Employee) SQ1 join Department d
on SQ1.departmentId=d.id
where RankNo=1;
