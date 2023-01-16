/* Write your T-SQL query statement below */


With CompanyMaxSal as (
    Select company_id,max(salary) as Sal
    from Salaries
    group by company_id
)

Select s.company_id,s.employee_id,s.employee_name, 
        round(case when c.Sal < 1000 then s.salary
             when c.Sal >= 1000 and c.Sal <=10000 then s.salary - (s.salary * 0.24)
             when c.Sal > 10000  then s.salary - (s.salary * 0.49) end,0) as salary
from Salaries s join CompanyMaxSal c on s.company_id =c.company_id 



