/* Write your T-SQL query statement below */


/*Select product_id, store, price from
(
Select product_id, 'store1' as store, store1 as price 
from Products
Union all
Select product_id, 'store2' as store, store2 as price 
from Products
Union all
Select product_id, 'store3' as store, store3 as price 
from Products
) SQ1
where price != 0; */


SELECT product_id, store, price  
FROM   
   (SELECT product_id, store1, store2, store3  
   FROM Products) p  
UNPIVOT  
   (price FOR store IN   
      (store1, store2, store3 )  
)AS unpvt;



