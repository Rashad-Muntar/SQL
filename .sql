1. 
    1. SELECT population FROM world WHERE name = 'Germany'
    
    2. SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark');

    3. SELECT name, area FROM world WHERE area BETWEEN 20000 AND 250000

2. 
    1. SELECT name, population
        FROM world
        WHERE population BETWEEN 1000000 AND 1250000;

    2.  Albania	3200000
        Algeria	32900000

    3. SELECT name FROM world
        WHERE name LIKE 'a%' OR name LIKE 'l%'
    
    4. 
        name	length(name)
        Italy	5
        Malta	5
        Spain	5
    
    5. Andorra	468

    6. SELECT name, area, population
        FROM world
        WHERE area > 50000 AND population < 10000000
    
    7. SELECT name, population
        FROM world
        WHERE name IN ('China', 'Nigeria', 'France', 'Australia')

3. 
    1. SELECT winner FROM nobel
        WHERE winner LIKE 'C%' AND winner LIKE '%n'

    2. SELECT COUNT(subject) FROM nobel
        WHERE subject = 'Chemistry'
         AND yr BETWEEN 1950 and 1960
    
    3. SELECT COUNT(DISTINCT yr) FROM nobel 
        WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')

    4. SELECT yr FROM nobel
        WHERE subject NOT IN(SELECT subject FROM nobel WHERE subject IN ('Chemistry','Physics')) 
    
    
    5. SELECT yr FROM nobel
        WHERE yr NOT IN (SELECT yr FROM nobel WHERE subject IN ('Physics', 'Chemistry'))
    
    6.SELECT yr FROM nobel
        WHERE subject = 'Medicine'
        AND yr NOT IN (SELECT yr FROM nobel WHERE subject = 'Peace')
        AND yr NOT IN (SELECT yr FROM nobel WHERE subject = 'Literature'))

    7. 
        Chemistry	1
        Literature	1
        Medicine	2
        Peace	    1
        Physics	    1

    8. SELECT continent, name, area FROM world x
        WHERE area >= ALL (SELECT area FROM world y WHERE y.continent=x.continent
        AND area > 0)


4. 
    1. SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)

    2. SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)

    3. SELECT name, region FROM bbc x
        WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region
        AND y.name != x.name)

    4. France
        Germany
        Russia
        Turkey

    5. SELECT name, gdp FROM bbc x
        WHERE gdp > (SELECT MAX(gdp) FROM bbc y WHERE region = 'Africa')
        
    
    6. SELECT name FROM bbc
        WHERE population < (SELECT population FROM bbc WHERE name='Russia')
        AND population > (SELECT population FROM bbc WHERE name='Denmark')

    7. Bangladesh
       India
       Pakistan

5. 
    1. Select the statement that shows the sum of population of all countries in 'Europe'
    SELECT SUM(population) FROM bbc
	WHERE region = 'Europe'

    2. Select the statement that shows the number of countries with population smaller than 150000
    SELECT COUNT(name) FROM bbc
	WHERE population < 150000

    4. Select the result that would be obtained from the following code:
    SELECT region, SUM(area) FROM bbc
	HAVING SUM(area) > 15000000
	GROUP BY region

    5. Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'
    SELECT AVG(population) FROM bbc
	WHERE name IN ( 'Poland', 'Germany', 'Denmark')

    6. Select the statement that shows the medium population density of each region
    SELECT region, SUM(population)/SUM(area) FROM bbc
	GROUP BY region

    7. Select the statement that shows the name and population density of the country with the largest population
    SELECT name, population/area FROM bbc
	WHERE population = (
		SELECT MAX(population) FROM bbc)

    8. Pick the result that would be obtained from the following code:
    SELECT region, SUM(area) FROM bbc
	GROUP BY region
	HAVING SUM(area) <= 20000000

6. 
    1. You want to find the stadium where player 'Dimitris Salpingidis' scored. Select the JOIN condition to use:
    SELECT stadium FROM game JOIN goal ON (id = matchid) WHERE player = 'Dimitris Salpingidis'

    2. You JOIN the tables goal and eteam in an SQL statement. Indicate the list of column names that may be used in the SELECT line:

    3. Select the code which shows players, their team and the amount of goals they scored against Greece(GRE).
    SELECT player, teamid, COUNT(player) FROM
	game JOIN goal ON (id = matchid) WHERE (team1 = 'GRE' OR team2 = 'GRE') AND teamid <> 'GRE' GROUP BY player

    4. Select the result that would be obtained from this code: SELECT teamid, mdate FROM goal JOIN game on (matchid=id) WHERE mdate = '9 June 2012'

    5. Select the code which would show the player and their team for those who have scored against Poland(POL) in National Stadium, Warsaw.
    SELECT DISTINCT player, teamid FROM
	game JOIN goal ON (id = matchid)
	WHERE (team1 = 'POL' OR team2 = 'POL') AND teamid != 'POL' AND stadium = 'National Stadium, Warsaw'

    6. Select the code which shows the player, their team and the time they scored, for players who have played in Stadion Miejski (Wroclaw) but not against Italy(ITA).
    SELECT playre, teamid, gtime FROM
	game JOIN goal ON (id = matchid) WHERE stadium = 'Stadion Miejski (Wroclaw)' AND (teamid = team1 OR teamid = team2) AND ((team1 != 'ITA' AND team2 != 'ITA' AND teamid != 'ITA') OR (teamid = 'ITA'))

7. 
    1. Select the statement which lists the unfortunate directors of the movies which have caused financial loses (gross < budget)
    SELECT director FROM movie
	WHERE gross < budget

    2. Select the correct example of JOINing three tables
    SELECT * FROM actor JOIN casting ON (actor.id = actorid) JOIN movie ON (movie.id = movieid)

    3. Select the statement that shows the list of actors called 'John' by order of number of movies in which they acted
    SELECT name, COUNT(movieid) FROM actor JOIN casting ON (actorid = actor.id) WHERE name LIKE 'John%'
	GROUP BY name ORDER BY COUNT(movieid)

    4. Select the result that would be obtained from the following code:

    5. Select the statement that lists all the actors that starred in movies directed by Ridley Scott
    SELECT name FROM movie JOIN casting ON (moive.id = movieid) JOIN actor ON (actor.id = actorid)
	WHERE director = 'Ridley Scott' AND ord = 1

    6. Select the statement showing all movies with budget bigger than ALL movie with Harrison Ford is incorrect
    SELECT title FROM movie WHERE budget > ALL(SELECT budget FROM movie JOIN casting ON (moive.id = movieid)
	JOIN actor ON (actor.id = actorid)
	WHERE name = 'Harrison Ford'
	)

    7. A Bronx Tale	3
       Bang the Drum Slowly	3
       Limitless	3


8. 1. List the teachers who have NULL for their department.
    SELECT name FROM teacher
	WHERE dept IS NULL

    2. Note the INNER JOIN misses the teacher with no department and the department with no teacher.
    SELECT teacher.name, dept.name FROM
	teacher INNER JOIN dept ON (dept = dept.id)

    3. Use a different JOIN so that all teachers are listed. SELECT teacher.name, dept.name FROM
 	teacher LEFT JOIN dept ON (dept = dept.id)

    4. Use a different JOIN so that all departments are listed. SELECT teacher.name, dept.name FROM
 	teacher RIGHT JOIN dept ON (dept = dept.id)

    5. Use COALESCE to print the mobile number. Use the number '07986 444 2266' there is no number given. Show teacher name and mobile number or '07986 444 2266'
    SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher

    6. Use the COALESCE function and a LEFT JOIN to print the name and department name. Use the string 'None' where there is no department.
    SELECT teacher.name, COALESCE(dept.name, 'None') FROM teacher LEFT JOIN dept ON (dept = dept.id)

    7. Use COUNT to show the number of teachers and the number of mobile phones. select count(id), count(mobile) from teacher

    8. Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.
    SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON (dept = dept.id) GROUP BY dept.name

    9. Use CASE to show the name of each teacher followed by 'Sci' if the the teacher is in dept 1 or 2 and 'Art' otherwise.
    SELECT teacher.name, CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' ELSE 'Art' END FROM teacher

    10. Use CASE to show the name of each teacher followed by 'Sci' if the the teacher is in dept 1 or 2 show 'Art' if the dept is 3 and 'None' otherwise.
    SELECT teacher.name, CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' WHEN dept = 3 THEN 'Art' ELSE 'None' END FROM teacher


9.  1. SELECT DISTINCT a.name, b.name
    FROM stops a JOIN route z ON a.id=z.stop JOIN route y ON y.num = z.num JOIN stops b ON y.stop=b.id
    WHERE a.name='Craiglockhart' AND b.name ='Haymarket';

    2. SELECT S2.id, S2.name, R2.company, R2.num
    FROM stops S1, stops S2, route R1, route R2
    WHERE S1.name='Haymarket' AND S1.id=R1.stop
    AND R1.company=R2.company AND R1.num=R2.num

    3. SELECT a.company, a.num, stopa.name, stopb.name
    FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
    JOIN stops stopa ON (a.stop=stopa.id)
    JOIN stops stopb ON (b.stop=stopb.id)
    WHERE stopa.name='Tollcross';
