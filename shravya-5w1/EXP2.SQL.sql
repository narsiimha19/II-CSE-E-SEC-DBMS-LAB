CREATE TABLE Sailors (
    sid NUMBER PRIMARY KEY,
    sname VARCHAR2(30),
    rating NUMBER,
    age NUMBER(4,1)
);

CREATE TABLE Boats (
    bid NUMBER PRIMARY KEY,
    bname VARCHAR2(30),
    color VARCHAR2(20)
);

CREATE TABLE Reserves (
    sid NUMBER,
    bid NUMBER,
    day DATE,
    PRIMARY KEY (sid, bid),
    FOREIGN KEY (sid) REFERENCES Sailors(sid),
    FOREIGN KEY (bid) REFERENCES Boats(bid)
);

INSERT INTO Sailors VALUES (22,'Dustin',7,45.0);
INSERT INTO Sailors VALUES (29,'Brutus',1,33.0);
INSERT INTO Sailors VALUES (31,'Lubber',8,55.5);
INSERT INTO Sailors VALUES (32,'Andy',8,25.5);
INSERT INTO Sailors VALUES (58,'Rusty',10,35.0);
INSERT INTO Sailors VALUES (64,'Horatio',7,35.0);
INSERT INTO Sailors VALUES (71,'Zorba',10,16.0);
INSERT INTO Sailors VALUES (74,'Horatio',9,35.0);
INSERT INTO Sailors VALUES (85,'Art',3,25.5);
INSERT INTO Sailors VALUES (95,'Bob',3,63.5);
SELECT * FROM Sailors
