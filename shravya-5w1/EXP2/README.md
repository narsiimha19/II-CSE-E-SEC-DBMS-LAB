# II-CSE-E-SEC-DBMS-LAB
DBMS LAB FOR AY 2026-27 I SEM
#EXPERIMENT 2 STARTING

##CREATING TABLE OF SAILORS

CREATE TABLE Sailors (
    sid NUMBER PRIMARY KEY,
    sname VARCHAR2(30),
    rating NUMBER,
    age NUMBER(4,1)
);
![OUTPUT](EXP 2 OP SAILORS)

##CREATING TABLE OF BOATS

CREATE TABLE Boats (
    bid NUMBER PRIMARY KEY,
    bname VARCHAR2(30),
    color VARCHAR2(20)
);
![OUTPUT](EXP 2 OP BOATS)

##CREATING TABLE OF RESERVES
CREATE TABLE Reserves (
    sid NUMBER,
    bid NUMBER,
    day DATE,
    PRIMARY KEY (sid, bid),
    FOREIGN KEY (sid) REFERENCES Sailors(sid),
    FOREIGN KEY (bid) REFERENCES Boats(bid)
);
![OUTPUT](EXP 2 OP RESERVES)
![OUTPUT](EXP 2 OP RESERVES 1)


#INSERTING VALUES INTO SAILORS
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

#INSERTING VALUES INTO RESERVES
INSERT INTO Reserves VALUES (22,101,TO_DATE('10/10/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (22,102,TO_DATE('10/10/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (22,103,TO_DATE('10/08/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (22,104,TO_DATE('10/07/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (31,102,TO_DATE('11/10/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (31,103,TO_DATE('11/06/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (31,104,TO_DATE('11/12/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (64,101,TO_DATE('09/05/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (64,102,TO_DATE('09/08/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (74,103,TO_DATE('09/08/98','MM/DD/RR'));
COMMIT;

#INSERTING VALUES INTO BOATS
INSERT INTO Boats VALUES (101,'Interlake','blue');
INSERT INTO Boats VALUES (102,'Interlake','red');
INSERT INTO Boats VALUES (103,'Clipper','green');
INSERT INTO Boats VALUES (104,'Marine','red');
#DISPLAYING VALUES
SELECT * FROM SAILORS;
#DISPLAYING VALUES
SELECT * FROM BOATS;
#DISPLAYING VALUES 
SELECT * FROM RESERVES;

SELECT sname, age
FROM Sailors;
SELECT *
FROM Sailors
WHERE rating > 7;
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;
SELECT DISTINCT r.sid
FROM Reserves r, Boats b
WHERE r.bid = b.bid
AND b.color = 'red';
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red';
SELECT DISTINCT b.color
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND s.sname = 'Lubber';
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid;
UPDATE Sailors
SET rating = rating + 1
WHERE sid IN (
SELECT r1.sid
FROM Reserves r1, Reserves r2
WHERE r1.sid = r2.sid
AND r1.day = r2.day
AND r1.bid <> r2.bid
);
SELECT age
FROM Sailors
WHERE UPPER(sname) LIKE 'B_%B';
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color IN ('red','green');
SELECT DISTINCT s.sname
FROM Sailors s
WHERE s.sid IN (
SELECT r.sid
FROM Reserves r, Boats b
WHERE r.bid = b.bid
INTERSECT
SELECT r.sid

FROM Reserves r, Boats b
WHERE r.bid = b.bid
AND b.color='green'
);

SELECT DISTINCT r.sid

FROM Reserves r, Boats b
WHERE r.bid=b.bid

AND b.color='red'
MINUS
SELECT DISTINCT r.sid
FROM Reserves r, Boats b

WHERE r.bid=b.bid

AND b.color='green';
SELECT sid
FROM Sailors

WHERE rating=10

UNION
SELECT sid
FROM Reserves

WHERE bid=104;
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r

WHERE s.sid=r.sid
AND r.bid=103;
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b

WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red';
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid=r.sid
AND r.bid=103;

SELECT *
FROM Sailors
WHERE rating > SOME
(SELECT rating FROM Sailors WHERE sname='Horatio');
SELECT *
FROM Sailors
WHERE rating > ALL

(SELECT rating FROM Sailors WHERE sname='Horatio');
SELECT *
FROM Sailors
WHERE rating=(SELECT MAX(rating) FROM Sailors);
SELECT DISTINCT s.sname
FROM Sailors s
WHERE s.sid IN (
SELECT r.sid
FROM Reserves r, Boats b
WHERE r.bid=b.bid
AND b.color='red'

INTERSECT
SELECT r.sid
FROM Reserves r, Boats b
WHERE r.bid=b.bid
AND b.color='green'
);
SELECT s.sname
FROM Sailors s
WHERE NOT EXISTS (
SELECT bid FROM Boats
MINUS

SELECT bid FROM Reserves r
WHERE r.sid=s.sid
);
SELECT AVG(age)
FROM Sailors;
SELECT AVG(age)
FROM Sailors
WHERE rating=10;
SELECT sname, age
FROM Sailors
WHERE age=(SELECT MAX(age) FROM Sailors);
SELECT COUNT(*)
FROM Sailors;
SELECT COUNT(DISTINCT sname)
FROM Sailors;
SELECT sname
FROM Sailors
WHERE age>(
SELECT MAX(age)
FROM Sailors
WHERE rating=10
);
SELECT rating, MIN(age)
FROM Sailors
GROUP BY rating;
SELECT rating, MIN(age)
FROM Sailors
WHERE age>=18
GROUP BY rating
HAVING COUNT(*)>=2;
SELECT b.bid, COUNT(*)
FROM Boats b, Reserves r
WHERE b.bid=r.bid
AND b.color='red'
GROUP BY b.bid;
SELECT rating, AVG(age)
FROM Sailors
GROUP BY rating

HAVING COUNT(*)>=2;
SELECT rating, AVG(age)
FROM Sailors
WHERE age>=18
GROUP BY rating
HAVING COUNT(*)>=2;
SELECT rating, AVG(age)
FROM Sailors
WHERE age>=18
GROUP BY rating
HAVING COUNT(age)>=2;
SELECT rating
FROM Sailors
GROUP BY rating
HAVING AVG(age)<=ALL(
SELECT AVG(age)
FROM Sailors
GROUP BY rating
);

