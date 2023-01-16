/* Write your T-SQL query statement below */

Select b.bus_id, count(p.passenger_id) as passengers_cnt
from (Select *,Lag(arrival_time) over(order by arrival_time) as Lg_arrival_time from Buses) b left join Passengers p on p.arrival_time <= b.arrival_time and (p.arrival_time > b.Lg_arrival_time or b.Lg_arrival_time is null)
group by b.bus_id
order by b.bus_id
