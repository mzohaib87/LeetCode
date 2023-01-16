/* Write your T-SQL query statement below */

WITH cte
AS
(SELECT id AS id, salary AS salary,
DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM Employee
)

SELECT ISNULL(
(SELECT DISTINCT salary FROM cte WHERE salary_rank = 2), NULL )
AS SecondHighestSalary ;
