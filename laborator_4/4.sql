CREATE VIEW VAmericanPublishers
AS
	SELECT Pub.Title, Pub.Founder, Pub.Website
	FROM Publisher Pub
	WHERE Pub.HQ_Country = 'United States of America' AND Pub.PublisherID IN
		(
			SELECT Pub1.PublisherID
			FROM Publisher Pub1
			WHERE Pub1.Current_Status = 'Active'
		)

GO

CREATE VIEW VStanLeeCharacters
AS
	SELECT Sup.Secret_Identity
	FROM Superhero Sup
	WHERE Sup.Creator = 'Stan Lee'
	GROUP BY Sup.Species

GO

CREATE VIEW VRDMovies 
AS
	SELECT DISTINCT Mov.Title, Mov.Box_Office, Mov.Premiere
	FROM Movie_Adaptation Mov INNER JOIN Plays_In Play ON Mov.MovieID = Play.MovieID
	WHERE Play.Actor_Name = 'Robert Downey Jr.'

GO

INSERT INTO Viewss (ViewName) VALUES ('VAmericanPublishers'), ('VStanLeeCharacters'), ('VRJDMovies')

INSERT INTO TestViews (TestID, ViewID) VALUES (1, 1), (1, 2), (1, 3)

INSERT INTO Tabless (TableName) VALUES ('Artist') -- table with a single column primary key and no foreign keys
INSERT INTO Tabless (TableName) VALUES ('Superhero') -- table with a single column primary key and at least one foreign key
INSERT INTO Tabless (TableName) VALUES ('Member_Of') -- table with a multicolumn primary key

INSERT INTO Tests (TestName) VALUES ('select_view'), 
									('insert_artists'),
									('delete_artists'),
									('insert_superhero'),
									('delete_superhero'),
									('insert_member_of'),
									('delete_member_of')


INSERT INTO TestTables (TestID, TableID, NoOfRows, Position) VALUES (2, 1, 25, 1),
																	(3, 1, 25, 2),
																	(4, 2, 100, 1),
																	(5, 2, 100, 1),
																	(6, 3, 100, 1),
																	(7, 3, 100, 1)


GO

CREATE PROC insert_artists
AS
	DECLARE @current_row INT = 8
	DECLARE @NoOfRows int
	SELECT @NoOfRows = NoOfRows FROM TestTables WHERE TestID = 2
	WHILE @current_row < @NoOfRows
		BEGIN
			DECLARE @artistID VARCHAR(15) = 'AR' + convert(varchar(5), @current_row)
			INSERT INTO Artist VALUES (@artistID, 'test_value', 'test_value', 'test_value', '1900-01-01', 'test_value')
			SET @current_row = @current_row + 1
		END
GO

CREATE PROC delete_artists
AS
	DECLARE @current_row INT = 8
	DECLARE @NoOfRows int 
	SELECT @NoOfRows = NoOfRows FROM TestTables WHERE TestID = 3 
	WHILE @current_row < @NoOfRows
		BEGIN 
			DECLARE @artistID VARCHAR(15) = 'AR' + convert(varchar(5), @current_row)
			DELETE FROM Artist WHERE ArtistID = @artistID
			SET @current_row = @current_row + 1
		END

GO

CREATE PROC insert_superhero 
AS
	DECLARE @current_row INT = 17
	DECLARE @NoOfRows int
	SELECT @NoOfRows = NoOfRows FROM TestTables WHERE TestID = 4
	WHILE @current_row < @NoOfRows
		BEGIN
			DECLARE @superheroID VARCHAR(15) = 'SH' + convert(varchar(5), @current_row)
			DECLARE @fk_placeholder VARCHAR(10) = 'PB1'
			DECLARE @alias_placeholder VARCHAR(100) = 'test_value' + convert(varchar(5), @current_row)
			INSERT INTO Superhero VALUES(@superheroID, @alias_placeholder, 'test_value', 'test_value', 2000, 'test_value', 'test_value', 'test_value', 'test_value', @fk_placeholder)
			SET @current_row = @current_row + 1
		END
GO

CREATE PROC delete_superhero
AS
	DECLARE @current_row INT = 17
	DECLARE @NoOfRows int
	SELECT @NoOfRows = NoOfRows FROM TestTables WHERE TestID = 5
	WHILE @current_row < @NoOfRows
		BEGIN 
			DECLARE @superheroID VARCHAR(15) = 'SH' + convert(varchar(5), @current_row)
			DELETE FROM Superhero WHERE SuperheroID = @superheroID
			SET @current_row = @current_row + 1
		END

GO

CREATE PROC insert_member_of
AS
	DECLARE @current_row INT = 15
	DECLARE @NoOfRows int
	SELECT @NoOfRows = NoOfRows FROM TestTables WHERE TestID = 6
	EXECUTE insert_superhero
	WHILE @current_row < @NoOfRows
		BEGIN
			DECLARE @superheroID VARCHAR(15) = 'SH' + convert(varchar(5), @current_row)
			DECLARE @teamID VARCHAR(15) = 'TID1'
			INSERT INTO Member_Of VALUES (@superheroID, @teamID, 'test_value', 'test_value', 10)
			SET @current_row = @current_row + 1
		END
GO

CREATE PROC delete_member_of
AS
	EXECUTE delete_superhero
	DELETE FROM Member_Of WHERE Hero_Alias = 'test_value'
GO

CREATE PROC testsViews
AS
	BEGIN
		DECLARE @startAt1 DATETIME;
		DECLARE @endAt1 DATETIME;

		DECLARE @startAt2 DATETIME;
		DECLARE @endAt2 DATETIME;

		DECLARE @startAt3 DATETIME;
		DECLARE @endAt3 DATETIME;

		SET @startAt1 = GETDATE()
		EXEC ('SELECT * FROM VAmericanPublishers')
		PRINT 'test_view_1: SELECT * FROM VAmericanPublishers'
		SET @endAt1 = GETDATE()
		INSERT INTO TestRuns VALUES ('test_run_1', @startAt1, @endAt1)
		INSERT INTO TestRunViews VALUES (@@IDENTITY, 1, @startAt1, @endAt1)

		SET @startAt2 = GETDATE()
		EXEC ('SELECT * FROM VStanLeeCharacters')
		PRINT 'test_view_2: SELECT * FROM VStanLeeCharacters'
		SET @endAt2 = GETDATE() 
		INSERT INTO TestRuns VALUES ('test_run_2', @startAt2, @endAt2)
		INSERT INTO TestRunViews VALUES (@@IDENTITY, 2, @startAt2, @endAt2)

		SET @startAt3 = GETDATE()
		EXEC ('SELECT * FROM VRDMovies')
		PRINT 'test_view_3: SELECT * FROM VRDMovies'
		SET @endAt3 = GETDATE()
		INSERT INTO TestRuns VALUES ('test_run_3', @startAt3, @endAt3)
		INSERT INTO TestRunViews VALUES (@@IDENTITY, 3, @startAt3, @endAt3)
	END

GO

CREATE PROC testsTables
AS
	BEGIN
		DECLARE @startTime1 DATETIME
		DECLARE @endTime1 DATETIME

		DECLARE @startTime2 DATETIME
		DECLARE @endTime2 DATETIME

		DECLARE @startTime3 DATETIME
		DECLARE @endTime3 DATETIME

		DECLARE @startTime4 DATETIME
		DECLARE @endTime4 DATETIME

		DECLARE @startTime5 DATETIME
		DECLARE @endTime5 DATETIME

		DECLARE @startTime6 DATETIME
		DECLARE @endTime6 DATETIME

		SET @startTime1 = GETDATE()
		EXEC insert_artists
		SET @endTime1 = GETDATE()
		INSERT INTO TestRuns VALUES ('test_run_4', @startTime1, @endTime1)
		INSERT INTO TestRunTables VALUES (@@IDENTITY, 1, @startTime1, @endTime1)

		SET @startTime2 = GETDATE()
		EXEC delete_artists
		SET @endTime2 = GETDATE()
		INSERT INTO TestRuns VALUES ('test_run_5', @startTime2, @endTime2)
		INSERT INTO TestRunTables VALUES (@@IDENTITY, 1, @startTime2, @endTime2)

		SET @startTime3 = GETDATE()
		EXEC insert_superhero
		SET @endTime3 = GETDATE()
		INSERT INTO TestRuns VALUES ('test_run_6', @startTime3, @endTime3)
		INSERT INTO TestRunTables VALUES (@@IDENTITY, 2, @startTime3, @endTime3)

		SET @startTime4 = GETDATE()
		EXEC delete_superhero
		SET @endTime4 = GETDATE()
		INSERT INTO TestRuns VALUES ('test_run_7', @startTime4, @endTime4)
		INSERT INTO TestRunTables VALUES (@@IDENTITY, 2, @startTime4, @endTime4)

		SET @startTime5 = GETDATE()
		EXEC insert_member_of
		SET @endTime5 = GETDATE()
		INSERT INTO TestRuns VALUES ('test_run_8', @startTime5, @endTime5)
		INSERT INTO TestRunTables VALUES (@@IDENTITY, 3, @startTime5, @endTime5)
		
		SET @startTime6 = GETDATE()
		EXEC delete_member_of
		SET @endTime6 = GETDATE()
		INSERT INTO TestRuns VALUES ('test_run_9', @startTime6, @endTime6)
		INSERT INTO TestRunTables VALUES (@@IDENTITY, 3, @startTime6, @endTime6)
	END
GO



