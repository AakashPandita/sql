#1
SELECT matchid,player
FROM goal
WHERE teamid='GER'
;

#2
SELECT id,stadium,team1,team2
FROM game
where id=1012
;

#3
SELECT player,teamid,stadium,mdate
FROM game JOIN goal ON (id=matchid)
where teamid='GER'
;

#4
select team1,team2, player
from game join goal on (id=matchid)
where player like 'Mario%'
;

#5
SELECT player, teamid, coach, gtime
FROM goal join eteam on teamid=id
where gtime<=10
;

#6
select mdate,a.teamname
from eteam a join game b on a.id=b.team1
where coach='Fernando Santos'

#7
select player
from game join goal on matchid=id
where stadium='National Stadium, Warsaw'

#8
SELECT DISTINCT player
FROM game JOIN goal ON matchid = id
WHERE (team2='GER'OR team1='GER') and teamid!='GER'
;

#9
SELECT teamname, count(player)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
ORDER BY teamname
;

#10
select stadium, count(player)
from game join goal on id=matchid
group by stadium
order by stadium
;

#11
SELECT matchid,mdate, count(player)
FROM game JOIN goal ON matchid = id
WHERE (team1 = 'POL' OR team2 = 'POL')
group by matchid,mdate
;

#12
select matchid, mdate, count(player)
from game join goal on matchid=id
where teamid='GER'
group by matchid, mdate
;

#13
select mdate, team1, sum(scorea) as score1, team2, sum(scoreb) as score2
from
    (
      SELECT mdate, matchid, team2, team1,
             CASE WHEN teamid=team1 THEN 1 ELSE 0 END scorea,
             CASE WHEN teamid=team2 THEN 1 ELSE 0 END scoreb
      FROM game left JOIN goal ON matchid = id
    ) as c
group by mdate,matchid,team1, team2
order by mdate,matchid,team1, team2
;
