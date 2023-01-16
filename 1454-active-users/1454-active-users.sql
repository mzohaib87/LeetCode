/* Write your T-SQL query statement below */

With Logins1 as (
    Select id,login_date,Row_Number() over(order by login_date) as RN
    from Logins
)

Select distinct l1.id,a.name
from Logins1 l1 join Logins1 l2 
on datediff(day,l2.login_date,l1.login_date) = 1 and l1.id=l2.id
join Logins1 l3 on l2.RN<l1.RN and datediff(day,l3.login_date,l2.login_date) = 1 and l2.id=l3.id
join Logins1 l4 on l3.RN<l2.RN and  datediff(day,l4.login_date,l3.login_date) = 1 and l3.id=l4.id
join Logins1 l5 on l4.RN<l3.RN and  datediff(day,l5.login_date,l4.login_date) = 1 and l4.id=l5.id
join Accounts a on l5.RN<l4.RN and  l5.id=a.id;
