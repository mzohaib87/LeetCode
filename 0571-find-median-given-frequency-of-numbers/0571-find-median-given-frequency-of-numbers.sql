

WITH cte(num, frequency,ids) as
(select num,frequency,1 as ids from Numbers
union all
select num, frequency,ids+1 from cte where ids<frequency ),

cte2 as
(select num, ids,row_number() over(order by num,ids) rn from cte ) ,

cte3 as
( select ceiling(max(cast(rn as float))/2) as num1
, case when max(rn) %2 = 0 then (max(rn)/2)+1 else 0 end as num2
from cte2

)

select case when ((select num2 from cte3) = 0) then (select num from cte2 where rn = (select num1 from cte3))
else cast(((select num from cte2 where rn = (select num1 from cte3)) + ISNULL((select num from cte2 where rn = (select num2 from cte3)),0)) as float)/2
end as median