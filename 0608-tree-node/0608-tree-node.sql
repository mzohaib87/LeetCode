/* Write your T-SQL query statement below */


Select id, 'Root' as type
from Tree 
where p_id is null
Union All
Select distinct p_id as id, 'Inner' as type from Tree 
where p_id not in (select id from Tree where p_id is null)
Union All
Select id, 'Leaf' as type from Tree 
where id not in (Select p_id from Tree where p_id is not null)
      and p_id is not null;

