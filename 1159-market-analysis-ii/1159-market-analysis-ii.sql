/* Write your T-SQL query statement below */

With Users2ndItem as(
    Select user_id,item_id
    from
    (Select u.user_id,o.item_id,Rank() over(partition by u.user_id order by o.order_date) as RNK
    from Users u left join Orders o on u.user_id=o.seller_id)ST1
    where RNK=2
)
 

Select u1.user_id as seller_id,
    case 
        when i.item_brand is null OR u1.favorite_brand != i.item_brand 
        then 'no' 
        when u1.favorite_brand=i.item_brand then 'yes' end as [2nd_item_fav_brand]
from Users u1 left join Users2ndItem u2 on u1.user_id=u2.user_id
left join Items i on u2.item_id=i.item_id

