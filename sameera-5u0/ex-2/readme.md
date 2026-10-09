#DBMSLAB WEEK2

#Sailors table creation
```
CREATE TABLE Sailors (
    sid NUMBER PRIMARY KEY,
    sname VARCHAR2(50) NOT NULL,
    rating NUMBER NOT NULL,
    age NUMBER(4,1) NOT NULL
);
```
![output 1](output%201.png)

#Boats table creation
```
CREATE TABLE Boats (
 bid NUMBER PRIMARY KEY,
 bname VARCHAR2(20) NOT NULL,
 color VARCHAR2(10) NOT NULL
);
```
![output 2](output-2.png)

#reserves table creation
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
![output 3](output-3.png)
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
![output 4](insert-1.png)
![output 5](insert-2.png)
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
![output 6](insert-3.png)
![output 7](insert-4.png)
```
INSERT INTO Boats VALUES (101, 'Interlake', 'blue');
INSERT INTO Boats VALUES (102, 'Interlake', 'red');
INSERT INTO Boats VALUES (103, 'Clipper', 'green');
INSERT INTO Boats VALUES (104, 'Marine', 'red');
```
![output 8](insertboats.png)
```
DESC sailors;
```
![output](desc-sailors.png)
```
DESC reserves;
```
![output](desc-reserves.png)
```
DESC boats;
```
![output](desc-boats.png)
```
SELECT * FROM Sailors;
```
![output](sailorstable.png)
```
SELECT * FROM Reserves;
```
![output](reservestable.png)
```
SELECT * FROM Boats;
```
![output](boatstable.png)
```
SELECT sname,age FROM Sailors;
```
![output](q1.png)
```
SELECT sname FROM Sailors WHERE rating>7;
```
![output](q2.png)
```
SELECT s.sname FROM Sailors s,Reserves r
WHERE s.sid=r.sid
AND r.bid=103;
```
![output](q3.png)
```
SELECT DISTINCT r.sid
FROM Reserves r,Boats b
WHERE r.bid=b.bid
AND b.color='red';
```
![output](q4.png)
```
SELECT  DISTINCT s.sname FROM Sailors s,Reserves r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red';
```
![output](q5.png)
```
SELECT b.color FROM Sailors s,Reserves r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND s.sname='Lubber';
```
![output](q6.png)
```
SELECT DISTINCT s.sname FROM Sailors s,Reserves r
WHERE s.sid=r.sid;
```
![output](q7.png)
```
SELECT DISTINCT s.sname,rating+1 AS incremented_rating
FROM Sailors s,Reserves r1,Reserves r2
WHERE s.sid=r1.sid AND r1.sid=r2.sid
AND r2.day=r2.day AND r1.bid < > r2.bid;
```
![output](q8.png)
```
SELECT age
FROM Sailors
WHERE sname LIKE 'B%b'
AND LENGTH(sname) >= 3;
```
![output](q9.png)
```
SELECT s.sname FROM Sailors s,Reserves r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND(b.color='red' OR b.color='green');
```
![output](q10.png)
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
![output](q11.png)
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
![output](q12.png)
```
SELECT sid
FROM Sailors
WHERE rating = 10
UNION
SELECT sid
FROM Reserves
WHERE bid = 104;
```
![output](q13.png)
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;
```
![output](q14.png)
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red';
```
![output](q15.png)
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;
```
![output](q16.png)
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
![output](q17.png)
```
SELECT * FROM Sailors
WHERE rating > ALL
(
    SELECT rating
    FROM Sailors
    WHERE sname = 'Horatio'
);
```
![output](q18.png)
```
SELECT * FROM Sailors
WHERE rating =
(
    SELECT MAX(rating)
    FROM Sailors
);
```
![output](q19.png)
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
![output](q20.png)
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
![output](q21.png)

```
SELECT AVG(age)
FROM Sailors;
```
![output](q22.png)
```
SELECT AVG(age)
FROM Sailors
WHERE rating = 10;
```
![output](q23.png)
```
SELECT sname, age
FROM Sailors
WHERE age =
(
    SELECT MAX(age)
    FROM Sailors
);
```
![output](q24.png)
```
SELECT COUNT(*)
FROM Sailors;
```
![output](q25.png)
```
SELECT COUNT(DISTINCT sname)
FROM Sailors;
```
![output](q26.png)
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
![output](q27.png)
```
SELECT rating, MIN(age)
FROM Sailors
GROUP BY rating;
```
![output](q28.png)
```
SELECT rating, MIN(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](q29.png)
```
SELECT b.bid, COUNT(r.sid) AS reservations
FROM Boats b
LEFT JOIN Reserves r
ON b.bid = r.bid
WHERE b.color = 'red'
GROUP BY b.bid;
```
![output](q30.png)
```
SELECT rating, AVG(age)
FROM Sailors
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](q31.png)
```
SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](q31.png)
```
SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](q32.png)
```
SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](q33.png)
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
![output](q34.png)
