/* Write your T-SQL query statement below */

Select member_id,name, 
case when ConversionRate >=80 then 'Diamond' 
     when ConversionRate >=50 and ConversionRate<80 then 'Gold'
     when ConversionRate <50 then 'Silver'
     when totalpurchases = 0 then 'Bronze' end as category
     from
(Select m.member_id,m.name,count(p.visit_id) as totalpurchases ,((100 * count(p.visit_id))/ 
nullif(count(v.visit_id),0)) as ConversionRate
from Members m left join Visits v on m.member_id=v.member_id
left join Purchases p on v.visit_id=p.visit_id
group by m.member_id,m.name) ST1

