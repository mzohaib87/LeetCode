

With TotalCount as (
    Select count(distinct player_id) as count1
     from Activity
     
     ),
     PLayersCount as (
         Select  count(distinct SQ1.player_id) as count2
         from (Select player_id,Lead(player_id) over(order by player_id asc, event_date asc) as lead_player_id,event_date,Lead(event_date) over(order by player_id asc, event_date asc) as lead_event_date, Row_Number() over(partition by player_id order by event_date asc) as RN from Activity) SQ1
         where SQ1.player_id=SQ1.lead_player_id and datediff(day,SQ1.lead_event_date,SQ1.event_date) = -1 and RN=1
     )

Select 
 convert(Decimal(5,2),cast((Select count2 from PLayersCount)as float) / (Select count1 from TotalCount))  
as fraction 

/*Select * from PLayersCount; */