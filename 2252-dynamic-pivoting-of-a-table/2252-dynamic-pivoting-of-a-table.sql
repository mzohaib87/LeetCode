

CREATE PROCEDURE PivotProducts AS
BEGIN
    /* Write your T-SQL query statement below. */
    DECLARE @query NVARCHAR(MAX) = '
      SELECT pvt.*
      FROM Products
      PIVOT (
          MAX(Products.price) FOR Products.store IN (
              '
         + STUFF(
              (
              SELECT DISTINCT ', ' + QUOTENAME(Products.store)
              FROM Products
              ORDER BY ', ' + QUOTENAME(Products.store)
              FOR XML PATH('')
              )
            , 1
            , 2 -- length of separator; I used ', ' which is 2 characters long, a lot of people use ',' and would put a 1 here.
            , ''
            )
         +'
              )
          ) AS pvt
      '
    
    EXEC(@query);
    
END