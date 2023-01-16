/* Write your T-SQL query statement below */

-- Select b.bus_id,count(p.passenger_id) as passengers_cnt
-- from (Select *,Lag(arrival_time) over(order by arrival_time) as Lg_arrival_time from Buses) b left join Passengers p on p.arrival_time<=b.arrival_time and (b.Lg_arrival_time is null or p.arrival_time>b.Lg_arrival_time)
-- group by b.bus_id
-- having count(p.passenger_id)<=max(b.capacity)

With cte as 
(
    Select b.bus_id, Coalesce(passengers_cnt, 0) passengers_cnt, capacity,
    arrival_time, row_number() OVER (Order By arrival_time) rn -- We number the buses according to the time of arrival
    From
    (
        Select bus_id, Count(passenger_id) passengers_cnt
        From
        (
            Select bus_id, passenger_id,
            row_number() OVER (PArtition By passenger_id Order By p.arrival_time, b.arrival_time) rn
            From Buses b inner join Passengers p
            on p.arrival_time <= b.arrival_time  --Finding all eligible passengers for each bus
        ) x
        Where rn = 1  --A passenger who fits on time for several buses, 
		--choose number 1 as this is the first available bus for this passenger and does not take this passenger into account for other buses.
        Group By bus_id
    ) y right join Buses b -- We add the missing buses, since after the previous filter there may not be all buses
    on y.bus_id = b.bus_id
),

cte2 as
(
	-- We find how many passengers are waiting for the bus, and how many can fit on the bus, and how many is left to wait for the next one for the first bus.
    Select bus_id, IIF(passengers_cnt >= capacity, capacity, passengers_cnt) passengers_cnt,
    IIF(passengers_cnt > capacity, passengers_cnt - capacity , 0) lft, 1 as n
    From cte
    Where rn = 1
	Union All
	--The same for the next bus, only add the number of remaining passengers from previous times.
    Select cte.bus_id, IIF(cte.passengers_cnt + lft >= cte.capacity, cte.capacity, cte.passengers_cnt + lft) passengers_cnt,
    IIF(cte.passengers_cnt + lft > cte.capacity, cte.passengers_cnt + lft - cte.capacity , 0) lft, n + 1
    From cte, cte2 -- Recursion of selecting only the bus we need
	Where rn = n + 1
)

Select bus_id, passengers_cnt
from cte2
Order By bus_id
