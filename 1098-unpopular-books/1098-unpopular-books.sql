

Select ST3.book_id,ST3.name from
(Select b.book_id as book_id,b.name,
    case when (o.dispatch_date between '2018-06-23' and '2019-06-23') 
         then quantity
         else 0 end as quantity
from Orders o right join Books b
on o.book_id=b.book_id
where b.available_from not between '2019-05-23' and '2019-06-23') ST3
group by ST3.book_id,ST3.name
having sum(ST3.quantity) < 10;




