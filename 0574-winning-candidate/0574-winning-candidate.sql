/* Write your T-SQL query statement below */


Select name from Candidate c join
(Select Top 1 candidateId, count(*) as vote_count
from Vote
group by candidateId
order by vote_count desc)SQ1
on c.id=SQ1.candidateId;
