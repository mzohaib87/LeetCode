/* Write your T-SQL query statement below */


Select distinct user_id
from
(Select purchase_id,user_id,purchase_date, Lead(purchase_date) over(partition by user_id order by purchase_date) as lead_purchase_date
from Purchases)ST1
where abs(datediff(day,lead_purchase_date,purchase_date))<=7 and lead_purchase_date is not null

