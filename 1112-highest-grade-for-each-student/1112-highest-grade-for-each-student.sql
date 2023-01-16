/* Write your T-SQL query statement below */


Select student_id, course_id, grade from
(Select student_id, course_id, grade, Row_Number() over(partition  by student_id order by grade desc,course_id asc) as RNK 
from Enrollments) ST1
where RNK=1;


