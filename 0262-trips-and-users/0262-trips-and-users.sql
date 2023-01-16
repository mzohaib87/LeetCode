/* Write your T-SQL query statement below */
Select * from
(
Select R1.request_at as Day,CONVERT(decimal(10,2), avg(cast (R1.No_of_cancelled_requests as float) / NULLIF(cast (R1.No_of_total_requests as float),0))) as [Cancellation Rate] 
from (Select t2.request_at, (
    Select count(*)
    from Trips t join Users u1 
    on t.client_id=u1.users_id join Users u2 on t.driver_id=u2.users_id
    where t.status IN ('cancelled_by_driver','cancelled_by_client')
          and (u1.banned='No' and u2.banned='No') and
          t.request_at =t2.request_at
) as No_of_cancelled_requests , 
(
    Select count(*)
    from Trips t join Users u1 
    on t.client_id=u1.users_id join Users u2 on t.driver_id=u2.users_id
    where u1.banned='No' and u2.banned='No' and
          t.request_at = t2.request_at
) as No_of_total_requests
from Trips t2
where t2.request_at between '2013-10-01' and '2013-10-03') R1
group by R1.request_at
) R3 where [Cancellation Rate] is not null;
