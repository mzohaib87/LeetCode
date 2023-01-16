/* Write your T-SQL query statement below */

With Company_Avg as(
    Select CONVERT(VARCHAR(7), s.pay_date, 126) as pay_month,avg(amount) as avg_sal
    from Employee e join Salary s
    on e.employee_id=s.employee_id
    group by CONVERT(VARCHAR(7), s.pay_date, 126)
)


Select ST4.pay_month, ST4.department_id,
case 
    when ST4.avg_sal > Comp.avg_sal then 'higher' 
    when ST4.avg_sal < Comp.avg_sal then 'lower'
    when ST4.avg_sal = Comp.avg_sal then 'same' end as comparison 
from 
(Select CONVERT(VARCHAR(7), s.pay_date, 126) as pay_month,e.department_id,avg(s.amount) as avg_sal
from Employee e join Salary s
on e.employee_id=s.employee_id
group by CONVERT(VARCHAR(7), s.pay_date, 126),e.department_id) ST4
join (Select pay_month,avg_sal from Company_Avg) Comp
on ST4.pay_month=Comp.pay_month


