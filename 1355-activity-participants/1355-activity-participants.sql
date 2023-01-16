/* Write your T-SQL query statement below */


Select activity
from
(Select activity,count(name) as name_count
from Friends 
group by activity) ST1
where name_count !=
(Select Top 1 count(name) as name_count1
    from Friends 
    group by activity
    order by name_count1 desc)
and
   name_count !=
   (Select Top 1 count(name) as name_count1
    from Friends 
    group by activity
    order by name_count1 asc)


