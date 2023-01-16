/* Write your T-SQL query statement below */


Select Person.firstName,Person.lastName,[Address].city,[Address].state
from [Address] right join Person
on [Address].personId=Person.personId;