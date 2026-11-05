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
![output 1](week2(outputs)/sailors.jpeg)
# Boats table creation
```
CREATE TABLE Boats (
 bid NUMBER PRIMARY KEY,
 bname VARCHAR2(20) NOT NULL,
 color VARCHAR2(10) NOT NULL
);
```
![output 2](week2(outputs)/boats.jpeg)

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
![output 3](week2(outputs)/reserves.jpeg)
 
 # insert sailors
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
![output 4](week2(outputs)/insert-sailors.jpeg)
# insert reverves
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
![output 5](week2(outputs)/insert-reserves.jpeg)
# insert boats
```
INSERT INTO Boats VALUES (101, 'Interlake', 'blue');
INSERT INTO Boats VALUES (102, 'Interlake', 'red');
INSERT INTO Boats VALUES (103, 'Clipper', 'green');
INSERT INTO Boats VALUES (104, 'Marine', 'red');
```
![output 7](week2(outputs)/insert-boats.jpeg)
# desc sailors
```
DESC sailors;
```
![output](week2(outputs)/desc-sailors.jpeg)
# desc reserves
```
DESC reserves;
```
![output](week2(outputs)/desc-reserves.jpeg)
# desc boats
```
DESC boats;
```
![output](week2(outputs)/desc-boats.jpeg)
# select sailors
```
SELECT * FROM Sailors;
```
![output](week2(outputs)/output-a.jpeg)
# select reserves
```
SELECT * FROM Reserves;
```
![output](week2(outputs)/output-b.jpeg)
# select boats
```
SELECT * FROM Boats;
```
![output](week2(outputs)/output-c.jpeg)
# q1
```
SELECT sname,age FROM Sailors;
```
![output](week2(outputs)/que-1.jpeg)
# q2
```
SELECT sname FROM Sailors WHERE rating>7;
```
![output](week2(outputs)/que-2.jpeg)
# q3
```
SELECT s.sname FROM Sailors s,Reserves r
WHERE s.sid=r.sid
AND r.bid=103;
```
![output](week2(outputs)/que-3.jpeg)
# q4
```
SELECT DISTINCT r.sid
FROM Reserves r,Boats b
WHERE r.bid=b.bid
AND b.color='red';
```
![output](week2(outputs)/que-4.jpeg)
# q5
```
SELECT  DISTINCT s.sname FROM Sailors s,Reserves r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red';
```
![output](week2(outputs)/que-5.jpeg)
# q6
```
SELECT b.color FROM Sailors s,Reserves r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND s.sname='Lubber';
```
![output](week2(outputs)/que-6.jpeg)
# q7
```
SELECT DISTINCT s.sname FROM Sailors s,Reserves r
WHERE s.sid=r.sid;
```
![output](week2(outputs)/que-7.jpeg)
# q8
```
SELECT DISTINCT s.sname,rating+1 AS incremented_rating
FROM Sailors s,Reserves r1,Reserves r2
WHERE s.sid=r1.sid AND r1.sid=r2.sid
AND r2.day=r2.day AND r1.bid < > r2.bid;
```
![output](week2(outputs)/que-8.jpeg)
# q9
```
SELECT age
FROM Sailors
WHERE sname LIKE 'B%b'
AND LENGTH(sname) >= 3;
```
![output](week2(outputs)/que-9.jpeg)
# q10
```
SELECT s.sname FROM Sailors s,Reserves r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND(b.color='red' OR b.color='green');
```
![output](week2(outputs)/que-10.jpeg)
# q11
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
![output](week2(outputs)/que-11.jpeg)
# q12
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
![output](week2(outputs)/que-12.jpeg)
# q13
```
SELECT sid
FROM Sailors
WHERE rating = 10

UNION

SELECT sid
FROM Reserves
WHERE bid = 104;
```
![output](week2(outputs)/que-13.jpeg)
# q14
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;
```
![output](week2(outputs)/que-14.jpeg)
# q15
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red';
```
![output](week2(outputs)/que-15.jpeg)
# q16
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;
```
![output](week2(outputs)/que-16.jpeg)
# q17
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
![output](week2(outputs)/que-17.jpeg)
# q18
```
SELECT * FROM Sailors
(
    SELECT rating
    FROM Sailors
    WHERE sname = 'Horatio'

);
```
![output](week2(outputs)/que-18.jpeg)
# q19

```
SELECT * FROM Sailors
WHERE rating =
(
    SELECT MAX(rating)
    FROM Sailors
);
```
![output](week2(outputs)/que-19.jpeg)
# q20
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
![output](week2(outputs)/que-20.jpeg)
# q21
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
![output](week2(outputs)/que-21.jpeg)
# q22
```
SELECT AVG(age)
FROM Sailors;
```
![output](week2(outputs)/que-22.jpeg)
# q23
```
SELECT AVG(age)
FROM Sailors
WHERE rating = 10;
```
![output](week2(outputs)/que-23.jpeg)
#q24
```
SELECT sname, age
FROM Sailors
WHERE age =(SELECT MAX (age)FROM Sailors);
```
![output](week2(outputs)/que-24.jpeg)
# q25
```
SELECT COUNT(*)
FROM Sailors;
```
![output](week2(outputs)/que-25.jpeg)
# Q26
```
SELECT COUNT(DISTINCT sname)
FROM Sailors;
```
![output](week2(outputs)/que-26.jpeg)
# Q27
```
SELECT Sname
FROM Sailors
WHERE age >
(
    SELECT MAX(age)
FROM Sailors
WHERE rating=10;
);
```
![output](week2(outputs)/que-27.jpeg)
# Q28
```
SELECT rating, MIN(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](week2(outputs)/que-28.jpeg) 
 
# q29
```
SELECT rating, AVG(age)
FROM Sailors
WHERE age>=18
GROUP BY rating HAVING COUNT(*)>=2;
```
![output](week2(outputs)/que-29.jpeg)
# q30
```
SELECT b.bid,b.name
COUNT(*) FROM Boats b, Reserves r
WHERE b.bid = r.bid
AND b.color = 'red'
GROUP BY b.bid,b.name;
```
![output](week2(outputs)/que-30.jpeg)
# q31
  ```
    SELECT rating, MIN(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](week2(outputs)/que-31.jpeg)
# q32
```
SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](week2(outputs)/que-32.jpeg)
# q33
```
    SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](week2(outputs)/que-33.jpeg)

# q34
```
SELECT rating FROM Sailors
GROUP BY rating
HAVING AVG(age)<=ALL
(
SELECT MIN(avg_age)
FROM
)
SELECT AVG(age) AS avg_age
FROM Sailors
GROUP BY rating
);
```
![output](week2(outputs)/que-34.jpeg)
