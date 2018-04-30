CREATE TABLE SourceData (
  key INTEGER PRIMARY KEY,
  periodEnding DATE,
  bankName TEXT,
  bankId INTEGER,
  issuerName TEXT,
  ratingText TEXT,
  ratingId INTEGER,
  FOREIGN KEY(bankId) REFERENCES Banks(bankdId),
  FOREIGN KEY(ratingId) REFERENCES Ratings(ratingId)
);


CREATE TABLE Banks (
  bankId INTEGER PRIMARY KEY,
  cannonicalName TEXT
);

CREATE TABLE Issuers (
  issuerId INTEGER PRIMARY KEY,
  cannonicalName TEXT
);

CREATE TABLE Ratings (
  ratingId INTEGER PRIMARY KEY,
  issuerId INTEGER NOT NULL,
  cannonicalText TEXT,
  ratingScore INTEGER NOT NULL,
  FOREIGN KEY(issuerId) REFERENCES Issuers(issuerId)
);


-- Issuers data
INSERT INTO Issuers (cannonicalName) VALUES ("Moody's");
INSERT INTO Issuers (cannonicalName) VALUES ("Standard and Poor's");
INSERT INTO Issuers (cannonicalName) VALUES ("Fitch");


-- Ratings data for Moody's
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "Aaa", 0);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "Aa1", 1);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "Aa2", 2);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "Aa3", 3);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "A1",  4);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "A2",  5);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "A3",  6);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "Baa1",  7);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "Baa2",  8);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "Baa3",  9);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "Ba1",  10);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "Ba2",  11);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "Ba3",  12);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "B1",  13);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "B2",  14);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "B3",  15);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "Caa",  16);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "Ca",  17);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (1, "C",  19);

-- Ratings data for Standard and Poor's
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "AAA", 0);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "AA+", 1);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "AA",  2);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "AA-", 3);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "A+", 4);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "A",  5);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "A-", 6);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "BBB+", 7);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "BBB",  8);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "BBB-", 9);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "BB+", 10);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "BB",  11);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "BB-", 12);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "B+", 13);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "B",  14);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "B-", 15);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "CCC", 16);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "CC",  17);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "C",   18);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (2, "D",   19);

-- Ratings data for Fitch's
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "AAA", 0);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "AA+", 1);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "AA",  2);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "AA-", 3);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "A+", 4);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "A",  5);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "A-", 6);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "BBB+", 7);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "BBB",  8);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "BBB-", 9);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "BB+", 10);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "BB",  11);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "BB-", 12);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "B+", 13);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "B",  14);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "B-", 15);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "CCC", 16);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "CC",  17);
INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "C",   18);

INSERT INTO Ratings (issuerID, cannonicalText, ratingScore) VALUES (3, "D",   19);



