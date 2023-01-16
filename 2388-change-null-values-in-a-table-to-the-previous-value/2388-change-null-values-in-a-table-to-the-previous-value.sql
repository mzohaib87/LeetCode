/* Write your T-SQL query statement below */

With CoffeeShop1 as(
    Select id,drink,Row_Number() over(order by (select NULL)) as RN 
    from CoffeeShop
)

Select ST1.Id,c.drink
from
(
    Select c1.RN as RN1,max(c1.Id) as Id, max(case when c1.drink is not null then c1.RN else c2.RN end) as RN2
from CoffeeShop1 c1 left join CoffeeShop1 c2 on c1.RN>c2.RN and c2.drink is not null
group by c1.RN
)ST1 left join CoffeeShop1 c on ST1.RN2=c.RN



