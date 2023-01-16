/* Write your T-SQL query statement below */

-- SELECT player_id, p_rnk - rnk AS diff, COUNT(p_rnk - rnk) AS cnt
-- 	FROM (
-- SELECT *, 	
-- 			RANK () OVER (PARTITION BY player_id, result ORDER BY match_day) AS rnk,
-- 			RANK () OVER (PARTITION BY player_id ORDER BY match_day) AS p_rnk
-- 		FROM Matches
--     )t
--     WHERE result = 'Win'
-- 	GROUP BY player_id, diff

with greatTable AS (
select m1.player_id,m1.match_day,m1.result
,(select count(*) from matches m2 
where m2.result='Win' and m2.player_id = m1.player_id and m1.result='Win'
		and m2.match_day between
		ISNULL(
		(select max(m3.match_day) from matches m3 where m3.player_id = m1.player_id and 
		m3.match_day<=m1.match_day and m3.result!='Win'),'1100-1-1')
	
	and m1.match_day
	)
AS win_count
from  matches m1)
select player_id,max(win_count) longest_streak  from greatTable group by player_id;
