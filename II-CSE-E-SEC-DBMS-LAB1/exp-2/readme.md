# DBMSLAB WEEK2
# Sailors table creation
```
CREATE TABLE Sailors (
    sid NUMBER PRIMARY KEY,
    sname VARCHAR2(50) NOT NULL,
    rating NUMBER NOT NULL,
    age NUMBER(4,1) NOT NULL
);
```
![output 1](<output week2/create sailors.jpeg>)
# Boats table creation
```
CREATE TABLE Boats (
 bid NUMBER PRIMARY KEY,
 bname VARCHAR2(20) NOT NULL,
 color VARCHAR2(10) NOT NULL
);
```
![output 2](<output week2/create boats.jpeg>)
# reserves table creation
```
CREATE TABLE Reserves (
    sid NUMBER NOT NULL,
    bid NUMBER NOT NULL,
    day DATE NOT NULL,
    PRIMARY KEY (sid, bid, day),
    FOREIGN KEY (sid) REFERENCES Sailors(sid),
    FOREIGN KEY (bid) REFERENCES Boats(bid)
);
```
![output 3](<output week2/create reserves.jpeg>)
```
INSERT INTO Sailors VALUES (22, 'Dustin', 7, 45.0);
INSERT INTO Sailors VALUES (29, 'Brutus', 1, 33.0);
INSERT INTO Sailors VALUES (31, 'Lubber', 8, 55.5);
INSERT INTO Sailors VALUES (32, 'Andy', 8, 25.5);
INSERT INTO Sailors VALUES (58, 'Rusty', 10, 35.0);
INSERT INTO Sailors VALUES (64, 'Horatio', 7, 35.0);
INSERT INTO Sailors VALUES (71, 'Zorba', 10, 16.0);
INSERT INTO Sailors VALUES (74, 'Horatio', 9, 35.0);
INSERT INTO Sailors VALUES (85, 'Art', 3, 25.5);
INSERT INTO Sailors VALUES (95, 'Bob', 3, 63.5);
```
![output 4](<output week2/insert sailors.jpeg>)
![output 5](<output week2/insert sailors.jpeg>)
```
INSERT INTO Reserves VALUES (22, 101, TO_DATE('10/10/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (22, 102, TO_DATE('10/10/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (22, 103, TO_DATE('10/8/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (22, 104, TO_DATE('10/7/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (31, 102, TO_DATE('11/10/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (31, 103, TO_DATE('11/6/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (31, 104, TO_DATE('11/12/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (31, 104, TO_DATE('11/12/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (64, 101, TO_DATE('9/5/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (64, 102, TO_DATE('9/8/98','MM/DD/RR'));
INSERT INTO Reserves VALUES (74, 103, TO_DATE('9/8/98','MM/DD/RR'));
```
![output 6](<output week2/insert reserves.jpeg>)
![output 7](<output week2/insert reserves.jpeg>)
```
INSERT INTO Boats VALUES (101, 'Interlake', 'blue');
INSERT INTO Boats VALUES (102, 'Interlake', 'red');
INSERT INTO Boats VALUES (103, 'Clipper', 'green');
INSERT INTO Boats VALUES (104, 'Marine', 'red');
```
![output 8](<output week2/insert boats.jpeg>)
```
DESC sailors;
```
![output](<output week2/desc sailors.jpeg>)
```
DESC reserves;
```
![output](<output week2/desc reserves.jpeg>)
```
DESC boats;
```
![output](<output week2/desc boats.jpeg>)
```
SELECT * FROM Sailors;
```
![output](<output week2/output sailors.jpeg>)
```
SELECT * FROM Reserves;
```
![output](<output week2/output reserves.jpeg>)
```
SELECT * FROM Boats;
```
![output](<output week2/output boats.jpeg>)
```
SELECT sname,age FROM Sailors;
```
![output](<output week2/qs1.jpeg>)
```
SELECT sname FROM Sailors WHERE rating>7;
```
![output](<output week2/qs2.jpeg>)
```
SELECT s.sname FROM Sailors s,Reserves r
WHERE s.sid=r.sid
AND r.bid=103;
```
![output](<output week2/qs3.jpeg>)
```
SELECT DISTINCT r.sid
FROM Reserves r,Boats b
WHERE r.bid=b.bid
AND b.color='red';
```
![output](<output week2/qs4.jpeg>)
```
SELECT  DISTINCT s.sname FROM Sailors s,Reserves r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red';
```
![output](<output week2/qs5.jpeg>)
```
SELECT b.color FROM Sailors s,Reserves r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND s.sname='Lubber';
```
![output](<output week2/qs6.jpeg>)
```
SELECT DISTINCT s.sname FROM Sailors s,Reserves r
WHERE s.sid=r.sid;
```
![output](<output week2/qs7.jpeg>)
```
SELECT DISTINCT s.sname,rating+1 AS incremented_rating
FROM Sailors s,Reserves r1,Reserves r2
WHERE s.sid=r1.sid AND r1.sid=r2.sid
AND r2.day=r2.day AND r1.bid < > r2.bid;
```
![output](<output week2/qs8.jpeg>)
```
SELECT age
FROM Sailors
WHERE sname LIKE 'B%b'
AND LENGTH(sname) >= 3;
```
![output](<output week2/qs9.jpeg>)
```
SELECT s.sname FROM Sailors s,Reserves r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND(b.color='red' OR b.color='green');
```
![output](<output week2/qs10.jpeg>)
```
SELECT s.sname
FROM Sailors s
WHERE s.sid IN
(
    SELECT r.sid
    FROM Reserves r, Boats b
    WHERE r.bid = b.bid
    AND b.color = 'red'
)
AND s.sid IN
(
    SELECT r.sid
    FROM Reserves r, Boats b
    WHERE r.bid = b.bid
    AND b.color = 'green'
);
```
![output](<output week2/qs11.jpeg>)
```
SELECT DISTINCT r.sid
FROM Reserves r, Boats b
WHERE r.bid = b.bid
AND b.color = 'red'
AND r.sid NOT IN
(
    SELECT r2.sid
    FROM Reserves r2, Boats b2
    WHERE r2.bid = b2.bid
    AND b2.color = 'green'
);
```
![output](<output week2/qs12.jpeg>)
```
SELECT sid
FROM Sailors
WHERE rating = 10

UNION

SELECT sid
FROM Reserves
WHERE bid = 104;
```
![output](<output week2/qs13.jpeg>)
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;
```
![output](<output week2/qs14.jpeg>)
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red';
```
![output](<output week2/qs15.jpeg>)
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;
```
![output](<output week2/qs16.jpeg>)
```
SELECT *
FROM Sailors
WHERE rating > ANY
(
    SELECT rating
    FROM Sailors
    WHERE sname = 'Horatio'
);
```
![output](<output week2/qs17.jpeg>)
```
SELECT * FROM Sailors
(
    SELECT rating
    FROM Sailors
    WHERE sname = 'Horatio'

);
```
![output](<output week2/qs18.jpeg>)
```
SELECT * FROM Sailors
WHERE rating =
(
    SELECT MAX(rating)
    FROM Sailors
);
```
![output](<output week2/qs19.jpeg>)
```
SELECT s.sname
FROM Sailors s
WHERE s.sid IN
(
    SELECT r.sid
    FROM Reserves r, Boats b
    WHERE r.bid = b.bid
    AND b.color = 'red'
)
AND s.sid IN

(
    SELECT r.sid
    FROM Reserves r, Boats b
    WHERE r.bid = b.bid
    AND b.color = 'green'
);
```
![output](<output week2/qs20.jpeg>)
```
SELECT s.sname FROM Sailors s
WHERE NOT EXISTS
(
    SELECT * FROM Boats b

    WHERE NOT EXISTS
    (
        SELECT *
        FROM Reserves r
        WHERE r.sid = s.sid
        AND r.bid = b.bid
    )
);
```
![output](<output week2/qs21.jpeg>)
```
SELECT AVG(age)
FROM Sailors;
```
![output](<output week2/qs22.jpeg>)
```
SELECT AVG(age)
FROM Sailors
WHERE rating = 10;
```
![output](<output week2/qs23.jpeg>)
```
SELECT sname, age
FROM Sailors
WHERE age =
(
    SELECT MAX(age)
    FROM Sailors
);
```
![output](<output week2/qs24.jpeg>)
```
SELECT COUNT(*)
FROM Sailors;
```
![output](<output week2/qs25.jpeg>)
```
SELECT COUNT(DISTINCT sname)
FROM Sailors;
```
![output](<output week2/qs26.jpeg>)
```
SELECT sname
FROM Sailors
WHERE age >
(
    SELECT MAX(age)
    FROM Sailors
    WHERE rating = 10
);
```
![output](<output week2/qs27.jpeg>)
```
SELECT rating, MIN(age)
FROM Sailors
GROUP BY rating;
```
![output](<output week2/qs28.jpeg>)
```
SELECT rating, MIN(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](<output week2/qs29.jpeg>)
```
SELECT b.bid, COUNT(r.sid) AS reservations
FROM Boats b
LEFT JOIN Reserves r
ON b.bid = r.bid
WHERE b.color = 'red'
GROUP BY b.bid;
```
![output](<output week2/qs30.jpeg>)
```
SELECT rating, AVG(age)
FROM Sailors
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](<output week2/qs31.jpeg>)
```
SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](<output week2/qs31.jpeg>)
```
SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](<output week2/qs32.jpeg>)
```
SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](<output week2/qs33.jpeg>)
```
SELECT rating
FROM Sailors
GROUP BY rating
HAVING AVG(age) =
(
    SELECT MIN(avg_age)
    FROM
    (
        SELECT AVG(age) AS avg_age
        FROM Sailors
        GROUP BY rating
    ) x
);
```
![output](<output week2/qs34.jpeg>)
