-- a)

-- clustered index scan
SELECT Knights.Full_name
FROM Knights
WHERE Knights.Species = 'Human'

-- clustered index seek
SELECT Knights.Full_Name
FROM Knights
WHERE Knights.KID = 2

-- nonclustered index seek + key lookup
CREATE NONCLUSTERED INDEX 
	INDEX_IDX_NC_Knights_Rank
ON Knights(Rank_Within_Order)

SELECT Knights.KID, Knights.Full_Name
FROM Knights
WHERE Knights.Rank_Within_Order = 1

-- nonclustered index scan
CREATE NONCLUSTERED INDEX
	INDEX_IDX_NC_Knights_Lightsaber
ON Knights(Lightsaber)

SELECT DISTINCT(Knights.Lightsaber)
FROM Knights

-- b) write a query on table Padawans with a WHERE clause of the form WHERE b2 = value

SELECT DISTINCT COUNT(Padawans.Species)
FROM Padawans
WHERE Padawans.Species != 'Human'

CREATE NONCLUSTERED INDEX 
	INDEX_IDX_NC_Padawans_Species
ON Padawans(Species)

GO

-- c)

CREATE VIEW View1
AS
	SELECT DISTINCT Knights.Lightsaber
	FROM Knights
	INNER JOIN Mentored_By ON Knights.KID = Mentored_By.KID


