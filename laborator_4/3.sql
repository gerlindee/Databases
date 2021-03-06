ALTER TABLE TestRunTables ADD 
	CONSTRAINT FK_TestRunTables_Tabless FOREIGN KEY(TableID) REFERENCES Tabless(TableID) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE TestRunTables ADD
	CONSTRAINT FK_TestRunTables_TestRuns FOREIGN KEY(TestRunID) REFERENCES TestRuns(TestRunID) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE TestRunViews ADD
	CONSTRAINT FK_TestRunViews_TestRuns FOREIGN KEY(TestRunID) REFERENCES TestRuns(TestRunID) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE TestRunViews ADD
	CONSTRAINT FK_TestRunViews_Viewss FOREIGN KEY(ViewID) REFERENCES Viewss(ViewID) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE TestTables ADD
	CONSTRAINT FK_TestTables_Tabless FOREIGN KEY(TableID) REFERENCES Tabless(TableID) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE TestTables ADD
	CONSTRAINT FK_TestTables_Tests FOREIGN KEY(TestID) REFERENCES Tests(TestID) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE TestViews ADD
	CONSTRAINT FK_TestViews_Tests FOREIGN KEY (TestID) REFERENCES Tests(TestID)

ALTER TABLE TestViews ADD
	CONSTRAINT FK_TestViews_Views FOREIGN KEY(ViewID) REFERENCES Viewss(ViewID)
