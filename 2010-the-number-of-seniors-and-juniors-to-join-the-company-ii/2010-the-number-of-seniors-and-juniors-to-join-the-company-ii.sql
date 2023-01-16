/* Write your T-SQL query statement below */

With SCdt as(
    Select employee_id,experience,sum_salary
    from
    (Select employee_id,experience,sum(salary) over(order by salary) as sum_salary
    from Candidates
    where experience='Senior')ST1
    where sum_salary<=70000
),
JCdt as(
    Select employee_id,experience,sum_salary
    from
    (Select employee_id,experience,sum(salary) over(order by salary) as sum_salary
    from Candidates
    where experience='Junior')ST1 cross join (Select max(sum_salary) as Max_SCdt_Salary from SCdt ) S
    where (isnull(S.Max_SCdt_Salary,0)+sum_salary)<=70000
)

Select employee_id from SCdt
Union All
Select employee_id from JCdt;
