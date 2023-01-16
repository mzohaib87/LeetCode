/* Write your T-SQL query statement below */


Select d.dept_name, isnull(ST1.student_number,0) as student_number
from Department d left join 
    (
        Select dept_id, count(*) as student_number
        from Student
        group by dept_id
    ) ST1
on d.dept_id=ST1.dept_id
order by student_number desc, d.dept_name

