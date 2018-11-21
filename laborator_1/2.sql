ALTER TABLE Superhero
ADD PublisherID varchar(10); 

ALTER TABLE Superhero
ADD CONSTRAINT FK_Superhero_Publisher FOREIGN KEY(PublisherID) REFERENCES Publisher(PublisherID) ON DELETE CASCADE;

ALTER TABLE Villain
ADD PublisherID varchar(10);

ALTER TABLE Villain
ADD CONSTRAINT FK_Villain_Publisher FOREIGN KEY(PublisherID) REFERENCES Publisher(PublisherID) ON DELETE CASCADE;

ALTER TABLE Sidekick
ADD PublisherID varchar(10);

ALTER TABLE Sidekick
ADD CONSTRAINT FK_Sidekick_Publisher FOREIGN KEY(PublisherID) REFERENCES Publisher(PublisherID) ON DELETE CASCADE;

ALTER TABLE Issue
ADD WriterID varchar(10);

ALTER TABLE Issue
ADD CONSTRAINT FK_Issue_Writer FOREIGN KEY(WriterID) REFERENCES Writer(WriterID) ON DELETE CASCADE;

ALTER TABLE Issue
ADD PublisherID varchar(10);

ALTER TABLE Issue
ADD CONSTRAINT FK_Issue_Publisher FOREIGN KEY(PublisherID) REFERENCES Publisher(PublisherID) ON DELETE CASCADE;
