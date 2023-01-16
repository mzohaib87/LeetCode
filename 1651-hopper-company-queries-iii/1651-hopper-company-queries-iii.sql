/* Write your T-SQL query statement below */

With Months as(
    Select 1 as month
    Union All
    Select m.month+1 as month from Months m where m.month<12
),
 MonthlyRides as(
    Select m.month as month,sum(isnull(a.ride_distance,0)) as ride_distance,sum(isnull(a.ride_duration,0)) as ride_duration
    from AcceptedRides a join Rides r on a.ride_id=r.ride_id and year(r.requested_at)=2020
    right join Months m on month(r.requested_at)=m.month 
    group by m.month
)

Select Top 10 month, round((1.0*average_ride_distance)/3,2) as average_ride_distance,round((1.0 * avg_ride_duration)/3,2) as average_ride_duration from
  (
      Select month,sum(isnull(ride_distance,0)) over(order by month rows between current row and 2 following) as average_ride_distance,sum(isnull(ride_duration,0)) over(order by month rows between current row and 2 following) as avg_ride_duration
  from MonthlyRides
  ) ST1



-- Select * from MonthlyRides ;
 
