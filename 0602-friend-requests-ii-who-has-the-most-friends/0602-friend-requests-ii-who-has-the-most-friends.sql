/* Write your T-SQL query statement below */

With request_count as(
    Select requester_id,count(*) as count1
    from RequestAccepted
    group by requester_id
),
 accepter_count as(
    Select accepter_id,count(*) as count1
    from RequestAccepted
    group by accepter_id
)

Select Top 1 ST3.id as id,ST3.res as num from
(Select 
      case when ST1.requester_id is not null and 
                 ST2.accepter_id is not null then ST1.requester_id
            when ST1.requester_id is null then ST2.accepter_id
            when ST2.accepter_id is null then ST1.requester_id end as id
     ,case when ST1.requester_id is not null and 
                 ST2.accepter_id is not null then ST1.count1 + ST2.count1
            when ST1.requester_id is null then ST2.count1
            when ST2.accepter_id is null then ST1.count1 end as res
from (Select * from request_count) ST1 full join (Select * from accepter_count) ST2 
on ST1.requester_id=ST2.accepter_id) ST3
order by num desc
