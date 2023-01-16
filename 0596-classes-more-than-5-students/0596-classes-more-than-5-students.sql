/* Write your T-SQL query statement below */

Select class
from Courses
group by class
having count(*) >=5