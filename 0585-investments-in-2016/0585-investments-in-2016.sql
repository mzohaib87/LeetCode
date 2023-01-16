/* Write your T-SQL query statement below */

Select convert(decimal(10,2),sum(ST3.tiv_2016)) as tiv_2016 from
(Select distinct i1.pid, i1.tiv_2016 as tiv_2016
from Insurance i1 join Insurance i2
on i1.lat!=i2.lat and i1.lon!=i2.lon and 
    i1.tiv_2015=i2.tiv_2015 and concat(i1.lat,i1.lon) not IN
    (Select concat(lat,lon) from Insurance
    group by lat,lon 
    having count(*) > 1) ) ST3
