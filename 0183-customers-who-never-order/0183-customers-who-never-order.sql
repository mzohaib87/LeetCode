/* Write your T-SQL query statement below */

Select name as Customers from Customers where id not in
(Select customerId from Orders);