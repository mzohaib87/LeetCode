/* Write your T-SQL query statement below */


Select min(round(sqrt(square(p2.y-p1.y)+square(p2.x-p1.x)),2)) as shortest
from Point2D p1 join Point2D p2
on p1.x!=p2.x or p1.y!=p2.y;

