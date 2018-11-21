CREATE TABLE Publisher (
	PublisherID varchar(10) PRIMARY KEY,
	Title varchar(100) UNIQUE,
	Current_Status varchar(10) DEFAULT 'Active', 
	Founder varchar(50) NOT NULL,
	HQ_City varchar(100),
	HQ_Country varchar(100),
	Website varchar(100),
	Year_of_Founding int NOT NULL 
)

CREATE TABLE Writer (
	WriterID varchar(10) PRIMARY KEY,
	First_Name varchar(100),
	Last_Name varchar(100) NOT NULL,
	Date_Of_Birth date,
	Nationality varchar(100)
)

CREATE TABLE Artist (
	ArtistID varchar(10) PRIMARY KEY,
	First_Name varchar(100),
	Last_Name varchar(100) NOT NULL,
	Nationality varchar(100),
	Date_of_Birth date,
	Medium varchar(50) NOT NULL 
)

CREATE TABLE Superhero (
	SuperheroID varchar(10) PRIMARY KEY,
	Secret_Identity varchar(100) UNIQUE,
	Alias varchar(100) DEFAULT 'Civillian',
	Creator varchar(100) NOT NULL,
	Debut_Year int check (Debut_Year > 1900),
	Debut_Issue varchar(100) NOT NULL,
	Headquarters_Location varchar(100) DEFAULT 'Unknown',
	Dayjob varchar(100) DEFAULT 'Unknown',
	Species varchar(100) NOT NULL
)

CREATE TABLE Sidekick (
	SidekickID varchar(10) PRIMARY KEY,
	Secret_Identity varchar(100) UNIQUE,
	Alias varchar(100) DEFAULT 'Civillian',
	Creator varchar(100) NOT NULL,
	Debut_Year int check (Debut_Year > 100),
	Debut_Issue varchar(100) NOT NULL,
	Species varchar(100)
)

CREATE TABLE Team (
	TeamID varchar(10) PRIMARY KEY,
	Team_Name varchar(100) UNIQUE,
	Headquarters varchar(100) DEFAULT 'Unknown',
	Affiliation char(10),
	First_Appearance_Issue varchar(100) NOT NULL,
	First_Appearance_Year int,
	Creator varchar(100) NOT NULL
)

CREATE TABLE Villain (
	VillainID varchar(10) PRIMARY KEY,
	Secret_Identity varchar(100) UNIQUE,
	Alias varchar(100) NOT NULL,
	Creator varchar(100) NOT NULL,
	First_Appearance_Issue varchar(100) NOT NULL,
	First_Appearance_Year int,
	Prison varchar(100) DEFAULT 'At Large',
	Crime varchar(100),
	Species varchar(100)
)

CREATE TABLE Issue (
	IssueID varchar(10) PRIMARY KEY,
	Number int NOT NULL, 
	Title varchar(100) NOT NULL,
	Release_Date date DEFAULT 'TBA',
	Number_of_Pages int DEFAULT 'TBA',
	Units_Sold int DEFAULT 'Unknown',
	Price int,
	Avail varchar(50)
)

CREATE TABLE Movie_Adaptation (
	MovieID varchar(10) PRIMARY KEY,
	Title varchar(100) DEFAULT 'TBA',
	Director varchar(100) NOT NULL,
	Music_Director varchar(100),
	Cinematography varchar(100),
	Distributor varchar(100),
	Running_Time int,
	Budget int DEFAULT 'Unknown',
	Box_Office int DEFAULT 'Undetermined',
	Premiere date DEFAULT 'TBA'
)

CREATE TABLE Actor (
	ActorID varchar(10) PRIMARY KEY,
	Actor_Name varchar(100) UNIQUE NOT NULL,
	Date_Of_Birth date,
	Net_Worth int DEFAULT 'Undisclosed',
	Nationality char(20)
)

