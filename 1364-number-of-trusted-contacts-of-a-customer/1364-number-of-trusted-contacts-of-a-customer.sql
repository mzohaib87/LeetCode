


Select invoice_id,customer_name,price,count(contact_email) as contacts_cnt,
sum(trusted_contact) as trusted_contacts_cnt from
(Select invoice_id,customer_name,price,contact_email,
Case when cn.contact_email is not null and cn.contact_email IN (Select email from Customers) then 1 else 0 end as trusted_contact
from Invoices i join Customers c
    on i.user_id=c.customer_id
    left join Contacts cn
    on i.user_id=cn.user_id
    ) ST1
group by invoice_id,customer_name,price
order by invoice_id;




