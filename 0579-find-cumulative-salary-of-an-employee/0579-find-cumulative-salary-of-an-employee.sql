/* Write your T-SQL query statement below */

-- With Employee1 as(
--     Select id,month,salary from
--     (Select id,month,salary, Row_Number() over(partition by id order by month desc) as RN from Employee) ST1
--     where RN>1
-- )


-- Select e1.id,e1.month, (isnull(e1.salary,0)+isnull(e2.salary,0)+isnull(e3.salary,0)) as Salary 
-- from Employee1 e1 left join Employee1 e2 on e1.id=e2.id and e1.month-1=e2.month left join Employee1 e3 on e1.id=e3.id and e1.month-2=e3.month
-- order by e1.id asc, e1.month desc;

SELECT ID,MONTH,sum(Salary) over (PARTITION BY id, (Month+RN) ORDER BY MONTH DESC ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) AS Salary
FROM (
SELECT ID,MONTH,Salary,ROW_NUMBER() OVER (PARTITION BY ID ORDER BY MONTH DESC) RN
FROM Employee
) T1
WHERE RN > 1
ORDER BY 1,2 DESC




