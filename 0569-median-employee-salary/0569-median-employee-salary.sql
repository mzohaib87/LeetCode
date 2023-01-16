/* Write your T-SQL query statement below */





--  (SELECT MAX(salary) FROM
--    (SELECT TOP 50 PERCENT salary FROM Employee ORDER BY salary) AS BottomHalf
--    )
--  Union All
--  (SELECT MIN(salary) FROM
--    (SELECT TOP 50 PERCENT salary FROM Employee ORDER BY salary DESC) AS TopHalf)

WITH cte as
(
SELECT * , COUNT(*) OVER(PARTITION BY company)*1.0 cnt,
ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary) as rn
from employee
)
SELECT id, company, salary
from cte
WHERE rn in (ceiling((cnt)/2), ceiling((cnt+1)/2))

