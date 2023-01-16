/* Write your T-SQL query statement below */


Select e.left_operand,e.operator,e.right_operand,
case 
    when v1.value > v2.value and e.operator='>' then 'true'
    when v1.value < v2.value and e.operator='<' then 'true'
    when v1.value = v2.value and e.operator='=' then 'true'
    else 'false'
    end as [value]

from Expressions e join Variables v1
on e.left_operand=v1.name
join Variables v2
on e.right_operand=v2.name;


