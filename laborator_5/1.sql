CREATE TABLE Padawans (
	PID integer PRIMARY KEY,
	Age integer,
	Full_name varchar(100),
	Planet varchar(80),
	Species varchar(80)
)

CREATE TABLE Knights (
	KID integer PRIMARY KEY,
	Rank_Within_Order integer UNIQUE,
	Full_Name varchar(100),
	Species varchar(100),
	Lightsaber varchar(20)
)

CREATE TABLE Mentored_By (
	MID integer PRIMARY KEY,
	PID integer,
	KID integer

	CONSTRAINT FK_Padawans_Mentored_By FOREIGN KEY(PID) REFERENCES Padawans(PID),
	CONSTRAINT FK_Knights_Mentored_By FOREIGN KEY(KID) REFERENCES Knights(KID)
) 
