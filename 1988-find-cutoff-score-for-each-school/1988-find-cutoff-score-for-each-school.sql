/* Write your T-SQL query statement below */


-- Select ST1.school_id,case when Min(isnull(e1.score,0))=0 then -1 else Min(e1.score) end as score
-- from 
-- (
    Select s.school_id,case when min(isnull(e.score,0))=0 then -1 else min(e.score) end as score
from Schools s left join Exam e on e.student_count <= s.capacity
group by s.school_id 

-- )ST1 left join Exam e1 on ST1.student_count=e1.student_count
-- group by ST1.school_id
-- order by ST1.school_id
