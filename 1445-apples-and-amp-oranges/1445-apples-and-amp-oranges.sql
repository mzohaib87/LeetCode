/* Write your T-SQL query statement below */

With Sales1 as (
    Select sale_date,fruit,sold_num,Row_Number() over(order by sale_date,fruit) as RN
    from Sales
)

Select s1.sale_date,s1.sold_num-s2.sold_num as diff
from Sales1 s1 join Sales1 s2
on s1.sale_date =s2.sale_date and s1.fruit != s2.fruit and s1.RN<s2.RN;


