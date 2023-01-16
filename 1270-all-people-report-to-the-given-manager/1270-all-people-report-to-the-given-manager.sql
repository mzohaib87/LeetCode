/* Write your T-SQL query statement below */


/*With recursive PrintEmployees as
(
    Select employee_id  ,1 as lvl from Employees where manager_id=1 and employee_id!=1;
    Union All
    Select E.employee_id ,P.lvl+1 from PrintEmployees P join Employees E on P.employee_id=E.manager_id where P.lvl <=3;
)

Select * from PrintEmployees;*/


select distinct e1.employee_id from Employees e1 join Employees e2 on e1.manager_id = e2.employee_id
join Employees e3 on e2.manager_id = e3.employee_id
where e1.employee_id != 1 and (e3.manager_id = 1 )


