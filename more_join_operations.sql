#1
SELECT id, title
FROM movie
WHERE yr=1962
;

#2
select yr
from movie
where title='Citizen Kane'
;

#3
select id,title,yr
from movie
where title like '%Star Trek%'
order by yr
;

#4
select id
from actor
where name like '%Glenn Close%'

#5
select id
from movie
where title='Casablanca'
;

#6
select name
from casting join actor on actorid=id
where movieid=11768
;

#7
select distinct name
from movie join (casting join actor on actorid=actor.id) on movie.id=movieid
where title= 'Alien'
;

#8
select title
from movie join (casting join actor on actorid=actor.id) on movie.id=movieid
where name= 'Harrison Ford'
;

#9
select title
from movie join (casting join actor on actorid=actor.id) on movie.id=movieid
where name= 'Harrison Ford' and ord<>1
;

#10
select title, name
from movie join (casting join actor on actorid=actor.id) on movie.id=movieid
where yr='1962' and ord=1
;

#11
SELECT yr,COUNT(title)
FROM movie JOIN casting ON movie.id=movieid JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
;

#12
select title, name
from
movie JOIN casting ON movie.id=movieid JOIN actor   ON actorid=actor.id
where movie.id in (
                    SELECT movieid FROM casting
                    WHERE actorid IN (
                                        SELECT id FROM actor
                                        WHERE name='Julie Andrews'
                                      )
                  )
and ord=1
;

#13
select distinct name
from actor
where id in (
              select actorid
              from casting join actor on movieid=id
              where ord=1
              group by actorid
              having count(actorid)>=15
             )
order by name
;

#14
select distinct title,count(actorid)
from movie join casting on movie.id=movieid
where yr='1978'
group by title
order by count(actorid) desc,title
;

#15
select name
from casting join actor on id=actorid
where movieid in (
                    select movieid
                    from casting
                    where actorid in (
                                        select id
                                        from actor
                                        where name ='Art Garfunkel'
                                      )
                  )
and actorid not in (
                      select id
                      from actor
                      where name ='Art Garfunkel'
                    )
;
