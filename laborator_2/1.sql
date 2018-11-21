/*
	FUNCTIONAL QUERIES THAT ADD DATA
*/

INSERT INTO Publisher VALUES 
( 'PB1', 'Marvel Comics', 'Active', 'Martin Goodman', 'New York City', 'United States of America', 'https://www.marvel.com/', 1939),
( 'PB2', 'DC Comics, Inc.', 'Active', 'Malcolm Wheeler-Nicholson', 'Burbank', 'United States of America', 'https://www.dccomics.com/', 1934),
( 'PB3', 'Harap Alb Continua', 'Active', 'Mihai Ionascu', 'Bucharest', 'Romania', 'http://www.harapalbcontinua.ro/', 2012),
( 'PB4', 'Ace Magazines', 'Defunct', 'Aaron A. Wyn', 'Springfield', 'United States of America', NULL, 1940),
( 'PB5', 'Dark Horse Comics', 'Active', 'Mike Richardson', 'Milwaukie', 'United States of America', 'https://www.darkhorse.com/', 1986),
( 'PB6', 'Image Comics', 'Active', 'Jim Lee', 'Portland', 'United States of America', 'https://imagecomics.com/', 1992),
( 'PB7', 'Academy Comics', 'Defunct', 'Mark Paniccia', 'Indiana', 'United States of America', NULL, 1986),
( 'PB8', 'Conrad Editora', 'Defunct', 'Unknown', 'Rio de Janeiro', 'Brazil', NULL, 1993),
( 'PB9', 'Asahi Sonorama', 'Active', 'Takashi Iida', 'Tokyo', 'Japan','http://publications.asahi.com/', 1959);

INSERT INTO Writer VALUES
( 'WR1', 'Frank', 'Miller', '1957-01-27', 'American'),
( 'WR2', 'Gail', 'Simone', '1974-07-29', 'American'), 
( 'WR3', 'Stanley Martin', 'Lee', '1922-12-28', 'American'), 
( 'WR4', 'Milton', 'Finger', '1914-02-08', 'American'),
( 'WR5', 'Marian', 'Coman', '1977-05-21', 'Romanian'),
( 'WR6', 'Masashi', 'Kimshimoto', '1974-11-08', 'Japanese');

INSERT INTO Superhero VALUES
( 'SH1', 'Diana Prince', 'Wonder Woman', 'William Moulton Marston', 1941, 'All Star Comics #8', 'Themyscira, Greece', 'Art historian; Abassadoor', 'Amazon', 'PB2'),
( 'SH2', 'Bruce Wayne', 'Batman', 'Bob Kane', 1939, 'Detective Comics #27', 'Gotham, United States of America', 'Philanthropist', 'Human', 'PB2'),
( 'SH3', 'Thomas Wayne', 'Batman', 'Geoff Johns', 2011, 'Flashpoint #1', 'Gotham, United States of America', 'Surgeon', 'Human', 'PB2'),
( 'SH4', 'Peter Parker', 'Spider-Man', 'Stan Lee', 1962, 'Amazing Fantasy #15', 'New York, United States of America', 'Reporter', 'Enhanced Human', 'PB1'),
( 'SH5', 'Jean Grey', 'Phoenix', 'Stan Lee', 1963, 'The X-Men #1', 'Unknown', NULL, 'Human Mutant', 'PB1'),
( 'SH6', 'Ororo Munroe', 'Storm', 'Len Wein', 1975, 'Giant-Size X-Men #1', 'Wakanda, Africa', NULL, 'Human Mutant', 'PB1'),
( 'SH7', 'Scott Summers', 'Cyclops', 'Stan Lee', 1963, 'The X-Men #1', 'Unknown', NULL, 'Human Mutant', 'PB1'),
( 'SH8', 'Emma Frost', 'White Queen', 'Chris Claremont', 1980, 'The Uncanny X-Men #129', 'Boston, United States of America', 'CEO of Frost Enterprises', 'Human Mutant', 'PB1'),
( 'SH9', 'Silver Sablianova', 'Silver Sable', 'Tom DeFalco', 1985, 'The Amazing Spider-Man #265', 'Symkaria, Eastern Europe', 'Mercenary', 'Human', 'PB1'),
( 'SH10', 'Clark Kent', 'Superman', 'Jerry Siegel', 1938, 'Action Comics #1', 'Metropolis, United States of America', 'Journalist', 'Kryptonian', 'PB2'),
( 'SH11', 'Carol Danvers', 'Captain Marvel', 'Roy Thomas', 1968, 'Marvel Super-Heroes #13', NULL, NULL, 'Enhanced Human', 'PB1'),
( 'SH12', 'Tony Stark', 'Iron Man', 'Stan Lee', 1963, 'Tales of Suspense #39', 'New York, United Sates of America', 'CEO of Stark Industries', 'Human', 'PB1'),
( 'SH13', 'Natalia Alianova Romanova', 'Black Widow', 'Stan Lee', 1964, 'Tales of Suspense #52', 'Moscow, Russia', 'Infiltration Agent', 'Enhanced Human', 'PB1'),
( 'SH14', 'Dinah Lauren Lance', 'Black Canary', 'Robert Kanigher', 1947, 'Flash Comics #87', 'Gotham, United States of America', 'Lead singer in a Rock Band', 'Enhanced Human', 'PB2'),
( 'SH15', 'Matt Murdock', 'Daredevil', 'Stan Lee', 1964, 'Daredevil #1', 'New York, United States of America', 'Lawyer', 'Enhanced Human', 'PB2');

INSERT INTO Sidekick VALUES
( 'SK1', 'Damian Wayne', 'Robin', 'Grant Morrison', 2006, 'Batman #655', 'Human', 'PB2'),
( 'SK2', 'Cassandra Sandsmark', 'Wonder Girl','Robert Kanigher', 1996, 'Wonder Woman (Vol. 2) #105', 'Amazon', 'PB2'),
( 'SK3', 'Donna Troy', 'Troia', 'Rober Kanigher', 1965, 'The Brave and the Bold #60', 'Amazon', 'PB2'),
( 'SK4', 'Gwen Stacy', 'Spider-Gwen', 'Jason Latour', 2014, 'Into the Spider-Verse', 'Enhanced Human', 'PB1');

INSERT INTO Mentored_By VALUES
( 'SH2', 'SK1', 'Batman', 'Robin', 'Combat; Hacking; Infiltrating;'),
( 'SH1', 'SK2', 'Wonder Woman', 'Wonder Girl', 'Mentorship');

INSERT INTO Actor VALUES
( 'AC1', 'Robert Downey Jr.', '1965-04-04', 260, 'American'),
( 'AC2', 'Gal Gadot', '1985-04-30', 10, 'Israeli'),
( 'AC3', 'Scarlett Johansson', '1984-11-22', 140, 'American'),
( 'AC4', 'Benedict Cumberbatch', '1976-07-19', 30, 'British'),
( 'AC5', 'Christian Bale', '1974-01-30', 80, 'American'),
( 'AC6', 'Ben Affleck', '1972-08-15', 130, 'American');

INSERT INTO Artist VALUES
( 'AR1', 'Jack', 'Kirby', 'American', '1917-08-28', 'Traditional'),
( 'AR2', 'Jim', 'Lee', 'Korean', '1964-08-11', 'Digital'),
( 'AR3', 'Adam', 'Hughes', 'American', '1967-05-05', 'Traditional'),
( 'AR4', 'Amanda', 'Conner', 'American', '1967-08-18', 'Digital'),
( 'AR5', 'Darwyn', 'Cooke', 'Canadian', '1962-11-16', 'Traditional'),
( 'AR6', 'Bruce', 'Timm', 'American', '1961-02-05', 'Digital'),
( 'AR7', 'Stephen', 'Ditko', 'American', '1927-11-02', 'Traditional');

INSERT INTO Issue VALUES
( 'IS1', 1, 'All Star Batman and Robin, The Boy Wonder', '2008-06-25', 130, 160000000, 25, 'Available', 'WR1', 'PB2'),
( 'IS2', 2, 'The Dark Knight Returns Vol. 1', '1986-07-12', 50, 250000000, 5, 'Digital Only', 'WR1', 'PB2'),
( 'IS3', 1, 'The Amazing Spider-Man', '1963-03-10', 75, 500000000, 2, 'Digital Only', 'WR3', 'PB1'),
( 'IS4', 3, 'Batgirl Vol. 1: The Darkest Reflection', '2013-02-12', 15, 500000, 15, 'Available', 'WR2', 'PB2'),
( 'IS5', 12, 'Avengers: This Hostage Earth!', '1965-01-14', 20, NULL, 3, 'Unavailable', 'WR3', 'PB1'),
( 'IS6', 5, 'Wonder Woman: The Circle', '2008-09-30', 160, 30000, 38, 'Available', 'WR2', 'PB2'),
( 'IS7', 3, 'Superman and the Men of Steel', '2013-03-07', 256, 5000000, 14, 'Available', 'WR2', 'PB2'),
( 'IS8', 1, 'Red Sonja: Queen of Plagues', '2014-03-04', 160, NULL, 15, 'Available', 'WR2', 'PB5');

INSERT INTO Movie_Adaptation VALUES
( 'MV1', 'Wonder Woman', 'Patty Jenkins', 'Pupert Gregson-Williams', 'Matthew Jensen', 'Warner Bros. Pictures', 141, 150, 831, '2017-06-02'),
( 'MV2', 'Batman Begins', 'Christopher Nolan', 'Hans Zimmer', 'Wally Pfister', 'Warner Bros. Pictures', 140, 150, 372, '2005-06-15'),
( 'MV3', 'The Dark Knight', 'Christopher Nolan', 'Hans Zimmer', 'Wally Pfister', 'Warner Bros. Pictures', 152, 185, 1005, '2008-07-14' ),
( 'MV4', 'The Dark Knight Rises', 'Christopher Nolan', 'Hans Zimmer', 'Wally Pfister', 'Warner Bros. Pictures', 165, 230, 1008, '2012-07-20'),
( 'MV5', 'The Avengers', 'Joss Whedon', 'Alan Silvestri', '	Seamus McGarvey', 'Walt Disney Studios Motion Pictures', 143, 220, 1519, '2012-04-11'),
( 'MV6', 'The Avengers: Age of Ultron', 'Joss Whedon', 'Brian Tyler', 'Ben Davis', 'Walt Disney Studios Motion Pictures', 141, 365, 1405, '2015-05-01'),
( 'MV7', 'Batman', 'Tim Burton', 'Danny Elfman', 'Roger Pratt', 'Warner Bros. Pictures', 126, 35, 411, '1989-06-23'),
( 'MV8', 'Avengers: Infinity War Part I', 'Anthony Russo', 'Allan Silverstry', 'Trent Opaloch', 'Walt Disney Studios Motion Pictures', 149, 316, 2048, '2018-04-27'),
( 'MV9', 'Daredevil', 'Mark Steven Johnson', 'Graeme Revell', 'Ericson Core', '20th Century Fox', 133, 78, 180, '2003-02-14'),
( 'MV10', 'Batman v Superman: Dawn of Justice', 'Zack Snyder', 'Hans Zimmer', 'Larry Fong', 'Warner Bros. Pictures', 151, 300, 874, '2016-03-25');

INSERT INTO Plays_In VALUES
( 'AC1', 'MV5', 'Robert Downey Jr.', 'The Avengers', 40),
( 'AC1', 'MV6', 'Robert Downey Jr.', 'The Avengers: Age of Ultron', 35),
( 'AC2', 'MV1', 'Gal Gadot', 'Wonder Woman', 20),
( 'AC3', 'MV5', 'Scarlett Johansson', 'The Avengers', 20),
( 'AC3', 'MV6', 'Scarlett Johansson', 'The Avengers: Age of Ultron', 30),
( 'AC5', 'MV2', 'Christian Bale', 'Batman Begins', 10),
( 'AC5', 'MV3', 'Christian Bale','The Dark Knight', 15),
( 'AC5', 'MV4', 'Christian Bale', 'The Dark Knight Rises', 30),
( 'AC4', 'MV8', 'Benedict Cumbermbatch', 'Avengers: Infinity War Part I', 5),
( 'AC1', 'MV8', 'Robert Downey Jr.', 'Avengers: Infinity War Part I', 40),
( 'AC3', 'MV8', 'Scarlett Johansson', 'Avengers: Infinity War Part I', 20),
( 'AC6', 'MV9', 'Ben Affleck', 'Daredevil', 5),
( 'AC6', 'MV10', 'Ben Affleck', 'Batman v Superman: Dawn of Justice', 20);

INSERT INTO Team VALUES
( 'TID1', 'Justice League of America', 'The Hall of Justice', 'Good', 'The Brave and the Bold #28', 1960, 'Gardner Fox'),
( 'TID2', 'Birds of Prey', 'Clocktower', 'Good', 'Black Canary/Oracle: Birds of Prey', 1995, 'Chuck Dixon'),
( 'TID3', 'Justice Society of America', 'Unknown', 'Good', 'All Star Comics #3', 1940, 'Gardner Fox'),
( 'TID4', 'The Avengers', 'Avengers Tower', 'Good', 'The Avengers #1', 1963, 'Stan Lee'),
( 'TID5', 'The X-Men', 'The X-Mansion', 'Good', 'The X-Men #1', 1963, 'Stan Lee'), 
( 'TID6', 'Crime Syndicate of America', 'The Flying Fortress', 'Evil', 'Justice League of America #29', 1964, 'Gardner Fox'),
( 'TID7', 'Sinister Six', 'New York', 'Evil', 'The Amazing Spider-Man Annual #1', 1964, 'Stan Lee');

INSERT INTO Member_Of VALUES
( 'SH1', 'TID1', 'Wonder Woman', 'Justice League of America', 20),
( 'SH1', 'TID2', 'Wonder Woman', 'Birds of Prey', 50),
( 'SH6', 'TID5', 'Storm', 'The X-Men', 10),
( 'SH8', 'TID5', 'White Queen', 'The X-Men', 20),
( 'SH5', 'TID5', 'Phoenix', 'The X-Men', 30),
( 'SH11', 'TID4', 'Captain Marvel', 'The Avengers', 10),
( 'SH7', 'TID5', 'Cyclops', 'The X-Men', 30),
( 'SH12', 'TID4', 'Iron Man', 'The Avengers', 30),
( 'SH13', 'TID4', 'Black Widow', 'The Avengers', 30),
( 'SH10', 'TID1', 'Superman', 'Justice League of America', 20),
( 'SH1', 'TID3', 'Wonder Woman', 'Justice Society of America', 30),
( 'SH2', 'TID1', 'Batman', 'Justice League of America', 20),
( 'SH14', 'TID1', 'Black Canary', 'Justice League of America', 20),
( 'SH14', 'TID2', 'Black Canary', 'Birds of Prey', 50),
( 'SH14', 'TID3', 'Black Canary', 'Justice Society of America', 50);

INSERT INTO Adapted_To VALUES
( 'SH1', 'MV1', 'Wonder Woman', 'Wonder Woman', 'Largely positive response'),
( 'SH2', 'MV2', 'Batman', 'Batman Begins', 'Mixed reviews'),
( 'SH2', 'MV3', 'Batman', 'The Dark Knight', 'Universal acclaim'),
( 'SH2', 'MV4', 'Batman', 'The Dark Knight Rises', 'Mixed reviews'),
( 'SH2', 'MV7', 'Batman', 'Batman', 'Largely positive response'),
( 'SH13', 'MV8', 'Black Widow', 'Avengers: Infinity War Part I', 'Mixed reviews'), 
( 'SH15', 'MV9', 'Daredevil', 'Daredevil', 'Mixed to negative reviews'),
( 'SH2', 'MV10', 'Batman', 'Batman v Superman: Dawn of Justice', 'Largely positive response');
/*

	QUERIES THAT WILL VIOLATE INTEGRITY CONSTRAINTS

	1. Creator cannot have NULL values:

INSERT INTO Superhero VAlUES 
( 'SH40', 'Bruce Wayne', 'Batman', NULL, NULL, 'Detective Comics #27', NULL, NULL, NULL, 'PB2'); 

	2. The primary key must be unique:

INSERT INTO Superhero Values
( 'SH2', 'Bruce Wayne', 'Batman', 'Bob Kane', 1938, 'Detective Comics #27', 'Gotham, United States of America', 'Philanthropist', 'Human', 'PB2');

	3. The Alias values must be unique:

INSERT INTO Superhero VALUES
( 'SH40', 'Bruce Wayne', 'Batman', 'Bob Kane', 1939, 'Detective Comics #27', 'Gotham, United States of America', 'Philanthropist', 'Human', 'PB2');

	4. Debut_Year must be > 1900:

INSERT INTO Superhero VALUES
( 'SH49', 'Bruce Thomas Wayne', 'Batman', 'Bob Kane', 1570, 'Detective Comics #27', 'Gotham, United States of America', 'Philanthropist', 'Human', 'PB2');

*/
