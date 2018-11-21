/* 
	UNION: Select the Alias of the Superheroes that are either Enhanced Humans or part of The X-Men
*/

SELECT DISTINCT S.Alias
FROM Superhero S
WHERE S.Species = 'Enhanced Human'
UNION
SELECT M.Hero_Alias
FROM Member_Of M
WHERE M.Team_Name = 'The X-Men';

/*
	OR: Select the Alias of the Superheroes that are either part of the Avengers or The X-Men
*/

SELECT S.Alias
FROM Superhero S, Team T, Member_Of M
WHERE S.SuperheroID = M.SuperheroID AND M.TeamID = T.TeamID AND
	( T.Team_Name = 'The X-Men'  OR T.Team_Name = 'The Avengers' )

/*
	INTERSECT: Find the Name and the ID of actors who play both in Avengers and Infinity war
*/

SELECT P.ActorID, P.Actor_Name
FROM Plays_In P, Movie_Adaptation M
WHERE P.MovieID = M.MovieID AND M.Title = 'The Avengers'
INTERSECT
SELECT P2.ActorID, P2.Actor_Name
FROM Plays_In P2, Movie_Adaptation M2
WHERE P2.MovieID = M2.MovieID AND M2.Title = 'Avengers: Infinity War Part I';

/*
	IN: Find the Name and the ID of the Superheroes who are members of both The Justice League of America and The Birds Of Prey
*/

SELECT M.SuperheroID, M.Hero_Alias
FROM Member_Of M, Team T
WHERE (T.Team_Name = 'Justice League of America' AND M.TeamID = T.TeamID) AND M.SuperheroID IN
	( SELECT M2.SuperheroID
	  FROM Member_Of M2, Team T2
	  WHERE M2.TeamID = T2.TeamID AND T2.Team_Name = 'Birds of Prey' );

/*
	IN: Find the Title, Number and Author of Issues published by DC between 01-01-2000 and 01-01-2018; 
*/

SELECT I.Title, I.Number, W.First_Name, W.Last_Name
FROM Issue I, Writer W
WHERE (I.PublisherID = 'PB2' AND I.WriterID = W.WriterID) AND I.Release_Date IN 
	( SELECT I1.Release_Date
	  FROM Issue I1
	  WHERE I1.Release_Date >= '2000-01-01' AND I1.Release_Date <= '2018-01-01' );

/*
	EXCEPT: Find the Name and the Creator of the Superheroes that are member of the Justice League of America, but not of the Justice Society of America
*/

SELECT S.Alias, S.Creator
FROM Superhero S, Member_Of M
WHERE S.SuperheroID = M.SuperheroID AND M.Team_Name = 'Justice League of America'
EXCEPT
SELECT S1.Alias, S1.Creator
FROM Superhero S1, Member_Of M1
WHERE S1.SuperheroID = M1.SuperheroID AND M1.Team_Name = 'Birds of Prey'

/* 
	NOT IN: Find the Number, Title and Author of the Issues that are published by DC but not written by Frank Miller.
*/

SELECT I.Title, I.Number, W.First_Name, W.Last_Name 
FROM Issue I, Writer W
WHERE I.PublisherID = 'PB2' AND I.WriterID = W.WriterID AND W.WriterID NOT IN
	( SELECT W1.WriterID
	  FROM Writer W1
	  WHERE W1.First_Name = 'Frank' AND W1.Last_Name = 'Miller'
	)

/*
	INNER JOIN: Actor - Plays_In - Movie_Adaptiation; Only show actors that have starred in at least one movie and do not show duplicates
*/

SELECT DISTINCT A.Actor_Name, A.Net_Worth + M.Box_Office*20/100 + M.Budget*10/100 AS New_Net_Worth
FROM Actor A
INNER JOIN Plays_In P ON A.ActorID = P.ActorID
INNER JOIN Movie_Adaptation M ON P.MovieID = M.MovieID

/*
	LEFT OUTER JOIN: Sidekick - Mentored_By - Superhero; Also displaying the sidekicks having no mentors, sorted alphabetically by the sidekick's name
*/

SELECT Sk.Alias, Sup.Alias 
FROM Sidekick Sk
LEFT OUTER JOIN Mentored_By M ON Sk.SidekickID = M.SidekickID
LEFT OUTER JOIN Superhero Sup ON M.SuperheroID = Sup.SuperheroID
ORDER BY 1

/* 
	RIGHT OUTER JOIN: Team - Member_Of - Superhero; Also displaying the teams having no members
*/

SELECT S.Alias, T.Affiliation, T.Team_Name
FROM Superhero S
RIGHT OUTER JOIN Member_Of M ON S.SuperheroID = M.SuperheroID
RIGHT OUTER JOIN Team T ON M.TeamID = T.TeamID
ORDER BY 3, 1

/*
	FULL OUTER JOIN: Superhero - Adapted_To - Movie_Adaptation - Plays_In - Actor
*/

SELECT S.Alias, S.Secret_Identity, A.Critics_Consensus, M.Title, P.Paycheck, Ac.Actor_Name
FROM Superhero S
FULL OUTER JOIN Adapted_To A ON S.SuperheroID = A.SuperheroID
FULL OUTER JOIN Movie_Adaptation M ON A.MovieID = M.MovieID
FULL OUTER JOIN Plays_In P ON M.MovieID = P.MovieID
FULL OUTER JOIN Actor Ac ON P.ActorID = Ac.ActorID

/*
	IN: using IN operator to introduce a subqueqy in the WHERE clause; the subquery also introduces another subquery in the WHERE clause
	display Alias, Secret Identity and Creator of the Superheroes having been adapted into movies having box office earnings of at least 500 million 
*/

SELECT S.Alias, S.Secret_Identity, S.Creator
FROM Superhero S
WHERE S.SuperheroID IN
	( SELECT A.SuperheroID
	  FROM Adapted_To A
	  WHERE A.MovieID IN
	  ( SELECT M.MovieID
		FROM Movie_Adaptation M
		WHERE M.Box_Office > 500
	  )
	)

/*
	EXISTS: find the name and nationality of all actors having played in Infinity War
*/

SELECT A.Actor_Name, A.Nationality
FROM Actor A
WHERE EXISTS 
	( SELECT *
	  FROM Plays_In P
	  WHERE P.Movie_Name = 'Avengers: Infinity War Part I' AND P.ActorID = A.ActorID
	 )

/*
	EXISTS: find the Alias, Secret Identity and Creator of superheroes belonging to the Justice League
*/ 

SELECT S.Alias, S.Secret_Identity, S.Creator
FROM Superhero S
WHERE EXISTS
	( SELECT *
	  FROM Member_Of M
	  WHERE M.Team_Name = 'Justice League of America' AND M.SuperheroID = S.SuperheroID
	)

/*
	Subquery in the FROM clause: Display all the distinct Superheroes (name + secret identity) that have been members of a team for more than 20 years. 
*/

SELECT DISTINCT S.Alias, S.Secret_Identity
FROM Superhero S INNER JOIN
	( SELECT *
	  FROM Member_Of M
	  WHERE M.Years_Active > 20
	) R
ON S.SuperheroID = R.SuperheroID
ORDER BY 1

/*
	Subquery in the FROM clause: Display all the Teams (name, affiliation) having Superheroes created by Stan Lee
*/

SELECT DISTINCT T.Team_Name, T.Affiliation
FROM Team T INNER JOIN
	( SELECT M.TeamID, S.SuperheroID
	  FROM Member_Of M, Superhero S
	  WHERE M.SuperheroID = S.SuperheroID AND S.Creator = 'Stan Lee'
	) R
ON T.TeamID = R.TeamID

/*
	GROUP BY: Group Available Issues by the publisher (the publisher must have at least one available issue) and display the average cost of an issue for that publisher
*/

SELECT I.PublisherID, AVG(I.Price) AS Average_Price
FROM Issue I
WHERE I.Avail = 'Available'
GROUP BY I.PublisherID
HAVING COUNT(*) >= 1

/*
	GRUP BY: Group Issues by Writer, if said writer has written at least 2 Issues, and also display their sales
*/

SELECT I.WriterID, SUM(I.Units_Sold) AS Total_Sold, MIN(I.Units_Sold) AS Min_Sold, MAX(I.Units_Sold) AS Max_Sold
FROM Issue I
GROUP BY I.WriterID
HAVING 2 <= ( SELECT COUNT(*)
			  FROM Issue I2
			  WHERE I2.WriterID = I.WriterID )

/*
	GROUP BY: Display Actors having played in at least 3 movies and the total amount they made from them
*/

SELECT TOP 3 P.Actor_Name, SUM(P.Paycheck) AS Earnings
FROM Plays_In P
GROUP BY P.Actor_Name
HAVING  ( SELECT COUNT(*)
		  FROM Plays_In P1
		  WHERE P.Actor_Name = P1.Actor_Name
		) >= 3
ORDER BY 2

/*
	GROUP BY: Display the top 3 most prolific creators of superheroes, in order.
*/

SELECT TOP 3 S.Creator, COUNT(*) AS Superheroes_Created
FROM Superhero S
WHERE Debut_Year <= 2000
GROUP BY S.Creator
ORDER BY 2 DESC

/* 
	ANY - ANY rewritten with IN
*/

SELECT A.Actor_Name
FROM Actor A
WHERE A.ActorID = ANY 
	( SELECT P.ActorID
	  FROM Plays_In P
	  WHERE P.Movie_Name = 'The Avengers' )

SELECT A.Actor_Name
FROM Actor A
WHERE A.ActorID IN
	( SELECT P.ActorID
	  FROM Plays_In P
	  WHERE P.Movie_Name = 'The Avengers' )

/*
	ALL - ALL rewritten with NOT IN
*/

SELECT S.Alias, S.Secret_Identity, S.Headquarters_Location
FROM Superhero S
WHERE S.SuperheroID <> ALL 
	( SELECT M.SuperheroID
	  FROM Member_Of M
	  WHERE M.Team_Name = 'The X-Men')

SELECT S.Alias, S.Secret_Identity, S.Headquarters_Location 
FROM Superhero S
WHERE S.SuperheroID NOT IN 
	( SELECT M.SuperheroID
	  FROM Member_Of M
	  WHERE M.Team_Name = 'The X-Men'
	)


/* 
	ANY - Actors that have a higher net worth than some Christian Bale
	ANY - rewritten with aggregator operator
	ALL - Superheroes that are older than ALL Superheroes created by Stan Lee
	ALL - rewritten with aggregator operator
*/

SELECT A.Actor_Name, A.Date_Of_Birth
FROM Actor A
WHERE A.Net_Worth > ANY 
	( SELECT A2.Net_Worth
	  FROM Actor A2
	  WHERE A2.Actor_Name = 'Christian Bale'
	)

SELECT A.Actor_Name, A.Date_Of_Birth
FROM Actor A
WHERE A.Net_Worth > ANY
	( SELECT MAX(A2.Net_Worth)
	  FROM Actor A2
	  GROUP BY A2.Actor_Name
	  HAVING A2.Actor_Name = 'Christian Bale'
	)

SELECT S.Alias, S.Debut_Issue, S.Creator
FROM Superhero S
WHERE S.Debut_Year < ALL
	( SELECT S2.Debut_Year 
	  FROM Superhero S2
	  WHERE S2.Creator = 'Stan Lee'
	)

SELECT S.Alias, S.Debut_Issue, S.Creator
FROM Superhero S
WHERE S.Debut_Year < ALL
	( SELECT MIN(S2.Debut_Year)
	  FROM Superhero S2
	  GROUP BY S2.Creator
	  HAVING S2.Creator = 'Stan Lee'
	)



