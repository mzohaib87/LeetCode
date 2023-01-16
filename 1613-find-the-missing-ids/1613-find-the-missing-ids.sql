/* Write your T-SQL query statement below */


With CustomerIdRanges as(
    Select ST1.Min_Id, Case when ST1.Max_Id > 100 then 100 else ST1.Max_Id end as Max_Id
    from
    (
        Select 1 as Min_Id, (Select Max(customer_id) from Customers) as Max_Id
    ) ST1
),
All_Ids as(
    Select 1 as ids
    Union All    
    Select a.ids+1 as ids
    from All_Ids a join CustomerIdRanges c on a.ids<c.Max_Id
)

Select ids from All_Ids
except
Select customer_id as ids from Customers;

