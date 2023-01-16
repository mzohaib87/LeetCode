/* Write your T-SQL query statement below */

SELECT DISTINCT F.user1_id,F.user2_id
FROM Listens L1 INNER JOIN Listens L2
ON L1.song_id=L2.song_id AND L1.day=L2.day
INNER JOIN Friendship F
ON L1.user_id=F.user1_id AND L2.user_id=F.user2_id
GROUP BY F.user1_id,F.user2_id,L1.day
HAVING COUNT(distinct L1.song_id)>=3

