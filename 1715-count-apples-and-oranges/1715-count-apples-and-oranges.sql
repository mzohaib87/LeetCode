/* Write your T-SQL query statement below */

Select sum(ST1.box_sum_apple) as apple_count,sum(ST1.box_sum_orange) as orange_count
from
(
    Select (b.apple_count + isnull(c.apple_count,0)) as box_sum_apple, (b.orange_count + isnull(c.orange_count,0)) as box_sum_orange
from Boxes b left join Chests c on b.chest_id=c.chest_id
) ST1
