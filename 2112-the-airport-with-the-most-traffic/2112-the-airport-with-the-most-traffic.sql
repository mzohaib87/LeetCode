/* Write your T-SQL query statement below */

With Flights1 as(
    Select departure_airport as airport, flights_count from Flights
    Union All
    Select arrival_airport as airport, flights_count from Flights
)

Select airport as airport_id from
(Select airport,sum(flights_count) as total_flights_count,Rank() over(order by sum(flights_count) desc) as RNK
from Flights1
group by airport) ST1
where RNK=1;
