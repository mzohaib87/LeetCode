/* Write your T-SQL query statement below */

Select c.candidate_id
from Candidates c join Rounds r on c.interview_id=r.interview_id
where c.years_of_exp>=2
group by c.candidate_id,r.interview_id
having sum(r.score) > 15



