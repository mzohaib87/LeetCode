/* Write your T-SQL query statement below */

Select name as results from 
(Select Top 1 m.user_id,u.name,count(movie_id) as rating_count
from MovieRating m join Users u on m.user_id= u.user_id
group by m.user_id,u.name
order by rating_count desc,u.name asc) ST1 

Union all 

Select title as results from
(Select Top 1 m2.movie_id,m2.title as title,avg(cast(rating as float)) as avg_rating
from MovieRating m1 join Movies m2 on m1.movie_id=m2.movie_id
where left(created_at,7)='2020-02'
group by m2.movie_id,m2.title
order by avg_rating desc,title asc) ST1



