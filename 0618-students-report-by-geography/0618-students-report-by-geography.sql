/* Write your T-SQL query statement below */


/*Select [America],[Asia],[Europe] from
(Select [name],continent from Student) as ST1
Pivot
(
   avg([name]) for continent IN ([America],[Asia],[Europe])
) as ST2; */






SELECT America, Asia, Europe
FROM(
SELECT *,
ROW_NUMBER()OVER(PARTITION BY continent ORDER BY name asc) AS continentorder
FROM student
) AS SOURCE
PIVOT
(min(name) FOR continent in (America, Asia, Europe)) AS PVT





/*SELECT
  a.name AS America
  ,b.name AS Asia
  ,c.name AS Europe
FROM
(SELECT ROW_NUMBER() OVER (ORDER BY name) AS ID, name FROM student WHERE continent = 'America') a
FULL JOIN
(SELECT ROW_NUMBER() OVER (ORDER BY name) AS ID, name FROM student WHERE continent = 'Asia') b
ON a.ID = b.ID
FULL JOIN
(SELECT ROW_NUMBER() OVER (ORDER BY name) AS ID, name FROM student WHERE continent = 'Europe') c
ON c.ID = b.ID
OR c.ID = a.ID */







