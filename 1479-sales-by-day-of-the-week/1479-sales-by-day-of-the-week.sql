/* Write your T-SQL query statement below */

With Orders1 as(
    Select datename(weekday,o.order_date) as day,i.item_category,sum(isnull(o.quantity,0)) as quantity
    from Orders o right join Items i on o.item_id=i.item_id
    group by datename(weekday,o.order_date),i.item_category
)


Select item_category as CATEGORY,isnull([Monday],0) AS MONDAY,isnull([Tuesday],0) AS TUESDAY,isnull([Wednesday],0) AS WEDNESDAY,isnull([Thursday],0) AS THURSDAY,isnull([Friday],0) AS FRIDAY,isnull([Saturday],0) AS SATURDAY,isnull([Sunday],0) AS SUNDAY from 
(Select day,item_category,quantity from Orders1) as ST1
pivot
(
    sum(quantity) for day IN ([Monday],[Tuesday],[Wednesday],[Thursday],[Friday],[Saturday],[Sunday])

) As ST2
order by Category;