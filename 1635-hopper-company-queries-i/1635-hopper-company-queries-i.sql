/* Write your T-SQL query statement below */

-- With Months as(
--     Select 1 as month
--     Union All
--     Select m.month+1 as month from Months m where m.month<12
-- )

-- Select m.month,count(distinct d.driver_id) as active_drivers,count(distinct ar.ride_id) as accepted_rides
-- from Months m left join Drivers d on month(d.join_date) <= m.month and year(d.join_date)=2020
-- left join AcceptedRides ar on d.driver_id=ar.driver_id
-- --  join Rides r on ar.ride_id=r.ride_id where year(r.requested_at)=2020 and month(r.requested_at)=m.month
-- group by m.month

/*with a as  (
           SELECT * FROM (
          VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12)
                                     ) AS X(mm)
				)
                
                
SELECT a.mm AS month,  
       ISNULL(COUNT(DISTINCT d.driver_id),0) AS active_drivers, 
       ISNULL(COUNT(DISTINCT ac_r.ride_id), 0) AS accepted_rides  
FROM a 
LEFT JOIN Drivers d on 
                      2020 * 100 + a.mm  >= year(d.join_date) * 100 +  month(d.join_date)
LEFT JOIN Rides r ON 
                      a.mm = month(r.requested_at) and year(r.requested_at) = 2020           
LEFT JOIN AcceptedRides ac_r ON 
                      ac_r.ride_id = r.ride_id
GROUP BY a.mm
ORDER BY 1 */

with Months as 
(
select 1 as Current_Month 
    union all 
    select 1+Current_Month
    from Months 
    where Current_month < 12

), drivers1 as ( 
    
      select Month, sum(Driver_CNT) Driver_CNT
            from (  Select  
                Case when year(d1.join_date ) < 2020 then 1 else month(d1.join_date ) END as Month,
                 count(driver_id) as Driver_CNT  
                from   Drivers  d1  
                where  year(d1.join_date ) <= 2020
                 group by  year(d1.join_date ),month(d1.join_date )) tds
        group by Month
    
    ) 
, months_Drivers as 
    (
    Select   m.current_month,
        sum(driver_cnt) over (order by m.current_month) driver_cnt
        
        from months m left outer join drivers1 d1 on m.current_month = d1.Month
         --group by m.current_month
    
    
    ), Accepted_rides as 
    (
       Select 
        Month(r.requested_at ) Month_requested,
         count(ar.ride_id) ride_cnt
        
        from 
        Rides r  
         JOIN AcceptedRides  ar on 
          ar.ride_id = r.ride_ID and year(requested_at )  = 2020 
        
         group by Month(requested_at ) 
    )
   select current_month as month, 
    sum(isnull(driver_cnt,0)) as active_Drivers, 
    SUM(isnull( ride_cnt  ,0)) as accepted_rides
    
    From  months_Drivers LEFT OUTER JOIN Accepted_rides on Month_requested=current_month
           group by current_month
           order by current_month


