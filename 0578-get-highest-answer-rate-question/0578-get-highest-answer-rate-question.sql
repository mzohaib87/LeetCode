/* Write your T-SQL query statement below */

With showed_question as(
    Select question_id,count(*) as count1
    from SurveyLog
    where [action]='show'
    group by question_id
),
answered_question as(
    Select question_id,count(*) as count1
    from SurveyLog
    where [action]='answer'
    group by question_id
)


Select question_id as survey_log from
(Select Top 1 SQ1.question_id,(cast(SQ1.count1 as float)/SQ2.count1) as res 
from (Select * from answered_question) SQ1 join 
(Select * from showed_question) SQ2
on SQ1.question_id=SQ2.question_id
order by res desc,question_id asc) SQ3


