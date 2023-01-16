/* Write your T-SQL query statement below */

with a as  (
							   SELECT * FROM (
							  VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12)
								                         ) AS X(mm)
				)
,ac_dvr as (
					          SELECT a.mm, ISNULL(COUNT(DISTINCT ac_r.driver_id),0) conts 
							  FROM a 
							  LEFT JOIN Rides r 
													   ON a.mm = month(r.requested_at) and year(r.requested_at) = 2020             
							  LEFT JOIN AcceptedRides  ac_r 
													   ON ac_r.ride_id = r.ride_id
							  GROUP BY a.mm
               )

, av_dvr as (
							   SELECT a.mm, NULLIF(COUNT(DISTINCT d.driver_id),0) conts
							   FROM a 
							   LEFT JOIN Drivers d  
							   ON 2020 * 100 + a.mm  >= year(d.join_date) * 100 +  month(d.join_date)
							   GROUP BY  a.mm
)

							  SELECT a1.mm as month, 
							  ROUND(ISNULL(a1.conts * 1.0 * 100/a2.conts, 0), 2) working_percentage
							  FROM ac_dvr a1 
							  JOIN av_dvr a2  ON a1.mm = a2.mm


