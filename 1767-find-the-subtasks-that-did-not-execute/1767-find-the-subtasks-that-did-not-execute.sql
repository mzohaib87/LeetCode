/* Write your T-SQL query statement below */


With AllTasks as(
    Select task_id,1 as subtask_id
    from Tasks

    Union all

    Select a.task_id,a.subtask_id+1
    from AllTasks a join Tasks t on a.task_id=t.task_id 
    where a.subtask_id < t.subtasks_count
)

Select * from AllTasks
except
Select * from Executed;
