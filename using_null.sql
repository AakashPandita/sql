#1
select name
from teacher
where dept is null
;

#2
SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept ON (teacher.dept=dept.id)
;

#3
select teacher.name,dept.name
from teacher left join dept on teacher.dept=dept.id
;

#4
select teacher.name, dept.name
from teacher right join dept on teacher.dept=dept.id
;

#5
select name,coalesce(mobile,'07986 444 2266')
from teacher
;

#6
select teacher.name,coalesce(dept.name,'None')
from teacher left join dept on dept.id=teacher.dept
;

#7
select count(teacher.name),count(teacher.mobile)
from teacher
;

#8
select dept.name, count(teacher.name)
from teacher right join dept on teacher.dept=dept.id
group by dept.name
;

#9
select name,
            case when dept=1 or dept=2 then 'Sci'
            else 'Art' end as a
from teacher
;

#10
select name,
            case when dept=1 or dept=2 then 'Sci'
                 when dept=3 then 'Art'
            else 'None' end as a
from teacher
;
