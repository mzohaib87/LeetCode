
With Calls1 as(
    Select caller_id,recipient_id,call_time,first_value(call_time) over(partition by caller_id,Convert(date,call_time) order by call_time) as first_value_call_time,last_value(call_time) over(partition by caller_id,Convert(date,call_time) order by call_time) as last_value_call_time from Calls
    Union All
    Select recipient_id as caller_id,caller_id as recipient_id,call_time,first_value(call_time) over(partition by recipient_id,Convert(date,call_time) order by call_time) as first_value_call_time,last_value(call_time) over(partition by recipient_id,Convert(date,call_time) order by call_time) as last_value_call_time from Calls
),
DayCalls as(

   Select caller_id,Convert(date,call_time) as day,count(*) as count1
   from Calls1
    group by caller_id,Convert(date,call_time)
)

-- Select * from Calls1 order by call_time;
-- Select * from DayCalls;

Select distinct c1.caller_id as user_id
from Calls1 c1 join Calls1 c2 
on Convert(date,c1.call_time)=Convert(date,c2.call_time) 
join DayCalls d on Convert(date,c1.call_time)=d.day and c1.caller_id=d.caller_id
and ((d.count1=1 
and (c1.caller_id=c2.recipient_id and c1.recipient_id=c2.caller_id)) OR (c1.caller_id=c2.caller_id and c1.recipient_id=c2.recipient_id and c1.call_time!=c2.call_time)) and (c1.call_time=c1.first_value_call_time and c2.call_time=c2.last_value_call_time) 


