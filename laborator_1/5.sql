ALTER TABLE Drawn_By
DROP CONSTRAINT FK_Drawn_By_Artist;

ALTER TABLE Drawn_By
DROP CONSTRAINT FK_Drawn_By_Issue;

DROP TABLE Drawn_By;

ALTER TABLE Member_Of
DROP CONSTRAINT FK_Member_Of_Team;

ALTER TABLE Member_Of
DROP CONSTRAINT FK_Member_Of_Superhero;

DROP TABLE Member_Of;

ALTER TABLE Adapted_To
DROP CONSTRAINT FK_Adapted_To_Superhero;

ALTER TABLE Adapted_To
DROP CONSTRAINT FK_Adapted_To_Movie_Adaptation;

DROP TABLE Adapted_To;

ALTER TABLE Mentored_By
DROP CONSTRAINT FK_Mentored_By_Superhero;

ALTER TABLE Mentored_By
DROP CONSTRAINT FK_Mentored_By_Sidekick;

DROP TABLE Mentored_By;

ALTER TABLE Plays_In
DROP CONSTRAINT FK_Plays_In_Movie_Adaptation;

ALTER TABLE Plays_In
DROP CONSTRAINT FK_Plays_In_Actor;

DROP TABLE Plays_In;

ALTER TABLE Superhero
DROP CONSTRAINT FK_Superhero_Publisher;

ALTER TABLE Villain
DROP CONSTRAINT FK_Villain_Publisher;

ALTER TABLE Sidekick
DROP CONSTRAINT FK_Sidekick_Publisher;

ALTER TABLE Issue
DROP CONSTRAINT FK_Issue_Writer;

ALTER TABLE Issue
DROP CONSTRAINT FK_Issue_Publisher;

DROP TABLE Actor;

DROP TABLE Artist;

DROP TABLE Issue;

DROP TABLE Movie_Adaptation;

DROP TABLE Publisher;

DROP TABLE Sidekick;

DROP TABLE Superhero;

DROP TABLE Team;

DROP TABLE Villain;

DROP TABLE Writer;
