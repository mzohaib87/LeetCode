/* Write your T-SQL query statement below */


Select *
from Patients
where conditions like 'DIAB1%' OR conditions like '% DIAB1%'