/* Write your T-SQL query statement below */

Select e.name as [Employee]
from Employee e join Employee m
on e.managerId=m.id and e.salary > m.salary 