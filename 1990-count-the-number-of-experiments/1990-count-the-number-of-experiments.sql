/* Write your T-SQL query statement below */

With Platform as(
    Select * from (
         values('Android'), ('IOS'), ('Web')
    )X(name)
),
Experiment as(
    Select * from (
         values('Reading'), ('Sports'), ('Programming')
    )Y(name)
)

Select p.name as platform,e.name as experiment_name,count(experiment_id) as num_experiments
from Platform p cross join Experiment e 
left join Experiments e1 on p.name=e1.platform and e.name=e1.experiment_name
group by p.name,e.name


