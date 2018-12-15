
-- Tests = holds data about different test configurations
CREATE TABLE Tests (
	TestID int IDENTITY(1,1) PRIMARY KEY,
	TestName nvarchar(50) NOT NULL
)

-- Tables = holds data about tables that might take part in a test
CREATE TABLE Tabless (
	TableID int IDENTITY(1,1) PRIMARY KEY,
	TableName nvarchar(50) NOT NULL
)

-- TestTables = link table between Tests and Tables (which tables take part in which tests)
CREATE TABLE TestTables (
	TestID int,
	TableID int,
	NoOfRows int NOT NULL,
	Position int NOT NULL,

	PRIMARY KEY(TestId, TableId)
)

-- Views = holds data about a set of views from the database, used to assess the performance of certain select queries
CREATE TABLE Viewss (
	ViewID int IDENTITY(1, 1 ) PRIMARY KEY,
	ViewName nvarchar(50),
)

-- TestViews = link table between Tests and Views (which views take part in which tests)
CREATE TABLE TestViews (
	TestID int,
	ViewID int,

	PRIMARY KEY(TestID, ViewID)
)

-- TestRuns = contains data about different test runs; deleting data from tables, inserting data in tables, evaluating views
CREATE TABLE TestRuns (
	TestRunID int IDENTITY(1,1) PRIMARY KEY,
	TestRunDescription nvarchar(2000),
	StartAt datetime NULL,
	EndAt datetime NULL
)

-- TestRunTables = contains performance data for all tables affected by insert operations
CREATE TABLE TestRunTables (
	TestRunID int,
	TableID int,
	StartAt [datetime] NOT NULL,
	EndAt [datetime] NOT NULL,

	PRIMARY KEY(TestRunID, TableID)
)

-- TestRunViews = contains performance data for every view in every test
CREATE TABLE TestRunViews (
	TestRunID int,
	ViewID int,
	StartAt datetime NOT NULL,
	EndAt datetime NOT NULL

	PRIMARY KEY(TestRunID, ViewID)
)

