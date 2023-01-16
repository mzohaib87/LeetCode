/* Write your T-SQL query statement below */

With StudentsRank as(
    Select student_id,department_id,mark,Rank() over(partition by department_id order by mark desc) as RNK,count(student_id) over(partition by department_id) as Count
    from Students
),
StudentsCount as(
    Select department_id,count(student_id) as Count 
    from Students
    group by department_id
)

Select r.student_id,r.department_id,isnull(Round(((100.0*(r.RNK-1))/(nullif(r.Count-1,0))),2),0) as percentage
from StudentsRank r 

-- Select r.student_id,r.department_id,Round(((100.0*(r.RNK-1))/(c.Count-1)),2) as percentage
-- from StudentsRank r join StudentsCount c on r.department_id=c.department_id



