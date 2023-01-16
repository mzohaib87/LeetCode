/* Write your T-SQL query statement below */

With Avg_Activity as
(
    Select event_type,avg(occurences) as occurences
    from Events
    group by event_type
)

Select business_id
from Events join Avg_Activity
on Events.event_type=Avg_Activity.event_type
and Events.occurences > Avg_Activity.occurences
group by business_id
having count(*) >1;

