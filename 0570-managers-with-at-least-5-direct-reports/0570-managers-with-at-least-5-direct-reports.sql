/* Write your T-SQL query statement below */



Select name from Employee
where id IN
(Select managerId
from Employee
group by managerId
having count(*) >= 5 )


