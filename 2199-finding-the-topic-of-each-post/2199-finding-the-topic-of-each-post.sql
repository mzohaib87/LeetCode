/* Write your T-SQL query statement below */

With PostsKeywords as(
    Select post_id,value as word
    from Posts cross apply string_split(content,' ')
)

Select post_id,case when topic is null then 'Ambiguous!' else cast(topic as nvarchar(100)) end as topic from
(Select post_id,string_agg(topic_id,',') within group(order by topic_id) as topic
from
(
    Select distinct p.post_id, k.topic_id
from PostsKeywords p left join Keywords k on p.word=k.word
group by p.post_id, k.topic_id
)ST1
group by post_id)ST2

