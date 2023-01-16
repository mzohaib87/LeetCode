/* Write your T-SQL query statement below */

Select distinct viewer_id as id
from Views
group by viewer_id,view_date
having count(distinct article_id) > 1