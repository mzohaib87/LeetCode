/* Write your T-SQL query statement below */

Select x,y,z, case 
                    when x<y+z and y<x+z and z<y+x then 'Yes'
                    else 'No' end as triangle
from Triangle