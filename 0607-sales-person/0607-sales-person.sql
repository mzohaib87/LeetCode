/* Write your T-SQL query statement below */

Select name 
from SalesPerson where sales_id not IN
(Select sales_id from Orders o
        where o.com_id IN (Select com_id from Company where name='RED'));





