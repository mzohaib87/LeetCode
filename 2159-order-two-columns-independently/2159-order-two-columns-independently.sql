/* Write your T-SQL query statement below */

With FirstColOrdering as(
    Select first_col, Row_Number() over(order by first_col asc) as RNK
    from [Data]
),
SecondColOrdering as(
    Select second_col, Row_Number() over(order by second_col desc) as RNK
    from [Data]
)

Select f.first_col,s.second_col 
from FirstColOrdering f join SecondColOrdering s on f.RNK=s.RNK

