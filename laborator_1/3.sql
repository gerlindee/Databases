CREATE TABLE Drawn_By (
	ArtistID varchar(10),
	IssueID varchar(10),
	Pages_Drawn int CHECK(Pages_Drawn > 0),
	CONSTRAINT PK_Drawn_By PRIMARY KEY(ArtistID,IssueID)
)

CREATE TABLE Member_Of (
	SuperheroID varchar(10),
	TeamID varchar(10),
	Hero_Alias varchar(100),
	Team_Name varchar(100),
	Years_Active int CHECK(Years_Active > 0),
	CONSTRAINT PK_Member_Of PRIMARY KEY(SuperheroID,TeamID)
)

CREATE TABLE Mentored_By (
	SuperheroID varchar(10),
	SidekickID varchar(10),
	Hero_Name varchar(100),
	Side_Name varchar(100),
	Training_Regimen varchar(100) DEFAULT 'Combat'
	CONSTRAINT PK_Mentored_By PRIMARY KEY(SuperheroID,SidekickID)
)

CREATE TABLE Adapted_To (
	SuperheroID varchar(10),
	MovieID varchar(10),
	Hero_Name varchar(100),
	Movie_Name varchar(100),
	Critics_Consensus varchar(100),
	CONSTRAINT PK_Adapted_To PRIMARY KEY(SuperheroID,MovieID)
)

CREATE TABLE Plays_In (
	ActorID varchar(10),
	MovieID varchar(10),
	Actor_Name varchar(100),
	Movie_Name varchar(100),
	Paycheck int DEFAULT 'Undisclosed'
	CONSTRAINT PK_Plays_In PRIMARY KEY(ActorID,MovieID)
)



