/* Write your T-SQL query statement below */

With MinMaxScoring as(
    Select exam_id,max(score) as max_score,min(score) as min_score
    from Exam 
    group by exam_id
)

Select distinct s.student_id, s.student_name
from Exam join Student s on Exam.student_id=s.student_id
where Exam.student_id not IN
(Select e.student_id
from MinMaxScoring m join Exam e on m.exam_id=e.exam_id
where e.score=m.max_score OR e.score=m.min_score)
order by s.student_id;






