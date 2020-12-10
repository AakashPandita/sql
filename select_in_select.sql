#1
SELECT name
FROM world
WHERE population > (
                     SELECT population
                     FROM world
                     WHERE name='Russia'
                   )
;

#2
select name
from world
where continent='Europe' and
      gdp/population > (
                          select gdp/population
                          from world
                          where name='United Kingdom'
                       )
;

#3
select name, continent
from world
where continent in (
                      select continent
                      from world
                      where name='Argentina'or name='Australia'
                   )
order by name
;

#4
select name, population
from world
where population> (
                    select population
                    from world
                    where name='Canada'
                  ) and
      population< (
                        select population
                        from world
                        where name='Poland'
                  )
;

#5
select name, concat(
                      round(
                              population*100/(
                                                select population
                                                from world
                                                where name='Germany'
                                              )
                            ), '%'
                    ) from world where continent='Europe'
;

#6
select name
from world
where gdp> (
              select max(gdp)
              from world
              where continent='Europe'
            )
;

#7
SELECT continent, name, area
FROM world x
WHERE area >= ALL (
                    SELECT area
                    FROM world y
                    WHERE y.continent=x.continent
                    AND area> 0
                  )
;

#8
select continent,name
from world x
where name = (
                select name
                from world y
                where x.continent=y.continent
                order by name
                limit 1
             )

#9
select name,continent,population
from world
where continent not in (
                          select continent
                          from world
                          where population> 25000000
                       )
      and population>0
;

#10
select name,continent
from world x
where population/3 >= ALL(
                            select population
                            from world y
                            where x.continent=y.continent
                            and x.name!=y.name
                         )
