-- modify the type of a column

CREATE PROC changedVer1
	AS 
		ALTER TABLE Villain ALTER COLUMN Alias VARCHAR(10)
	GO

CREATE PROC originalVer1
	AS
		ALTER TABLE Villain ALTER COLUMN Alias VARCHAR(100)
	GO

-- add / remove a column

CREATE PROC changedVer2
	AS
		ALTER TABLE Actor ADD Hair_Color VARCHAR(10)
	GO
	
ALTER PROC originalVer2
	AS
		ALTER TABLE Actor DROP COLUMN Hair_Color
	GO 

-- add / remove a DEFAULT constraint

CREATE PROC changedVer3
	AS
		ALTER TABLE Villain ADD CONSTRAINT crime_default DEFAULT 'Murder' FOR CRIME
	GO

CREATE PROC originalVer3
	AS
		ALTER TABLE Villain DROP CONSTRAINT crime_default
	GO

-- add / remove a primary key

CREATE PROC changedVer4
	AS
		ALTER TABLE Drawn_By DROP CONSTRAINT FK_Drawn_By_Issue
		ALTER TABLE Issue DROP CONSTRAINT PK_IssueID
	GO

CREATE PROC originalVer4
	AS
		ALTER TABLE Issue ADD CONSTRAINT PK_IssueID PRIMARY KEY (IssueID)
		ALTER TABLE Drawn_By ADD CONSTRAINT FK_Drawn_By_Issue FOREIGN KEY (IssueID) REFERENCES Issue(IssueID)
	GO

-- add / remove a candidate key

CREATE PROC changedVer5
	AS
		ALTER TABLE Drawn_By ADD Medium VARCHAR(50)
		ALTER TABLE Drawn_By ADD CONSTRAINT UQ_Medium UNIQUE (Medium)
	GO

CREATE PROC originalVer5
	AS
		ALTER TABLE Drawn_By DROP CONSTRAINT UQ_Medium
		ALTER TABLE Drawn_By DROP COLUMN Medium
	GO 

-- add / remove a foreign key

CREATE PROC changedVer6
	AS
		ALTER TABLE Villain DROP CONSTRAINT FK_Villain_Publisher
		ALTER TABLE Villain DROP COLUMN PublisherID
	GO

CREATE PROC originalVer6
	AS
		ALTER TABLE Villain ADD PublisherID VARCHAR(10)
		ALTER TABLE Villain ADD CONSTRAINT FK_Villain_Publisher FOREIGN KEY(PublisherID) REFERENCES Publisher(PublisherID)
	GO

-- add / remove a table

CREATE PROC changedVer7
	AS
		CREATE TABLE Example (
			DummyCol1 VARCHAR(100),
			DummyCol2 DATE,
			DummyCol3 INT
		);
	GO

CREATE PROC originalVer7
	AS
		DROP TABLE Example
	GO

-- create table of versions 

CREATE TABLE Table_Version ( table_version INT ) GO

INSERT INTO Table_Version VALUES ( 0 ) GO

CREATE PROC getVersion(@destination_version INT) 
	AS
		BEGIN
			IF @destination_version < 0 OR @destination_version > 8
				PRINT 'Table versions are between 1 and 7'
			ELSE
				BEGIN
					DECLARE @current_version INT
					DECLARE @procedure_name VARCHAR(20)
					SET @current_version = (	SELECT Tab.table_version FROM Table_Version Tab )
				
					WHILE @current_version < @destination_version
						BEGIN
							SET @current_version = (@current_version+1)
							SET @procedure_name = 'changedVer' + CONVERT(VARCHAR(10), @current_version)
							PRINT @procedure_name
							EXECUTE @procedure_name
						END

					WHILE @current_version > @destination_version
						BEGIN
							SET @procedure_name = 'originalVer' + CONVERT(VARCHAR(10), @current_version)
							PRINT @procedure_name
							EXECUTE @procedure_name
							SET @current_version = (@current_version - 1)
						END

					UPDATE Table_Version SET table_version = @destination_version
				END
		END
	GO


