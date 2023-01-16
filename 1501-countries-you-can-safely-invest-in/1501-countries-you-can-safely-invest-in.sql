/* Write your T-SQL query statement below */

Select c.name as country from 
    (Select caller_id as id,duration from Calls 
    Union all
    Select callee_id as id,duration from Calls 
    ) ST1   join Person p on ST1.id=p.id
            join Country c on Left(p.phone_number,3)=c.country_code
            group by c.name
            having avg(cast(duration as float)) > (Select avg(cast(duration as float)) from Calls);

