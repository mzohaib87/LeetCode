/* 
 Please write a DELETE statement and DO NOT write a SELECT statement.
 Write your T-SQL query statement below
 */

Delete from Person where id not in
        (Select Min(id)
        from Person
        group by email);

