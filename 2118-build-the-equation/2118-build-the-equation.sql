/* Write your T-SQL query statement below */

WITH all_terms AS
(SELECT 
    CASE WHEN (power = 0) AND (factor >0) THEN CONCAT('+',factor)
        WHEN (power = 0) AND (factor <0) THEN CONCAT('-',ABS(factor))
        WHEN (power = 1) AND (factor >0) THEN CONCAT('+',factor,'X')
        WHEN (power = 1) AND (factor <0) THEN CONCAT('-',ABS(factor),'X')
        WHEN (ABS(power) >1) AND (factor > 0) THEN CONCAT('+',factor,'X^', power)
        ELSE CONCAT('-',ABS(factor),'X^', power)
    END AS terms,
    power
FROM Terms)

SELECT CONCAT(STRING_AGG(terms,'') WITHIN GROUP (ORDER BY power DESC),'=0') AS equation
FROM all_terms;

