DELETE FROM Publisher
WHERE Current_Status = 'Defunct' AND Year_of_Founding <= 1980;

DELETE FROM Movie_Adaptation
WHERE Title LIKE '% Avengers %' OR Director = 'Joss Whedon';

UPDATE Issue
SET Price = Price - Price*50/100
WHERE Avail = 'Available' OR Avail = 'Digital Only' AND (Price BETWEEN 5 AND 100)

UPDATE Superhero
SET Dayjob = 'Teacher at the Xavier School For The Gifted'
WHERE Species LIKE '% Mutant' AND Dayjob IS NULL;

UPDATE Movie_Adaptation
SET Music_Director = Music_Director + '; James Newton Howard'
WHERE Director = 'Christopher Nolan' AND ( Title LIKE 'Batman %' OR Title LIKE 'The Dark Knight%');


