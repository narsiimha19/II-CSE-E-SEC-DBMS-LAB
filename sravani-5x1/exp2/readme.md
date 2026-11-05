## CREATE BOATS TABLE
```
CREATE TABLE boat(
sid NUMBER,
bname VARCHAR2(20),
color VARCHAR2(20));
```
## DESCRIBE BOATS TABLE
```
DESC boat;
```
## INSERT INTO BOATS TABLE
```
INSERT INTO boat VALUES(101,'interlake','blue');
INSERT INTO boat VALUES(102,'interlake','red');
INSERT INTO boat VALUES(103,'clipper','green');
INSERT INTO boat VALUES(104,'marine','red');
```
## DISPLAY BOATS TABLE
```
SELECT *FROM boat;
```
![output](boats output)
## CREATE RESERVES TABLE 
```
CREATE TABLE Reserves1 (
 sid NUMBER,
 bid NUMBER,
 day DATE
);
```
## DESCRIBE RESERVES TABLE 
```
DESC Reserves;
```
## INSERT INTO RESERVES TABLE 
```
INSERT INTO Reserves1 VALUES (22,101,'10-OCT-1998');
INSERT INTO Reserves1 VALUES (22,102,'10-OCT-1998');
INSERT INTO Reserves1 VALUES (22,103,'08-OCT-1998');
INSERT INTO Reserves1 VALUES (22,104,'07-OCT-1998');
INSERT INTO Reserves1 VALUES (31,102,'10-NOV-1998');
INSERT INTO Reserves1 VALUES (31,103,'06-NOV-1998');
INSERT INTO Reserves1 VALUES (31,104,'12-NOV-1998');
INSERT INTO Reserves1 VALUES (64,101,'05-SEP-1998');
INSERT INTO Reserves1 VALUES (64,102,'08-SEP-1998');
INSERT INTO Reserves1 VALUES (74,103,'08-SEP-1998');
```
## DISPLAY RESERVES TABLE
``` 
SELECT * FROM Reserves1;
```
![output](reserves output)
## CREATE SAILORS TABLE 
```
CREATE TABLE sailors(
sid NUMBER PRIMARY KEY,
sname VARCHAR2(30) NOT NULL,
rating NUMBER NOT NULL,
age REAL NOT NULL
);
```
## DESCRIBE SAILORS TABLE 
```
 DESC sailors;
```
## INSERT INTO SAILORS  TABLE 
```
INSERT INTO sailors VALUES(22,'dustin',7,45.0);
INSERT INTO sailors VALUES(29,'brutus',1,33.0);
INSERT INTO sailors VALUES(31,'lubber',8,55.5);
INSERT INTO sailors VALUES(32,'andy',8,25.5);
INSERT INTO sailors VALUES(58,'rusty',10,35.0);
INSERT INTO sailors VALUES(64,'horatio',7,35.0);
INSERT INTO sailors VALUES(71,'zorba',10,16.0);
INSERT INTO sailors VALUES(74,'horatio',9,35.0);
INSERT INTO sailors VALUES(85,'art',3,25.5);
INSERT INTO sailors VALUES(95,'bob',3,63.5);
```
## DISPLAY SAILORS TABLE 
```
SELECT * FROM sailors;
```
![output](sailors output)


##Q1 Names and ages of all sailors
```
SELECT sname, age
FROM Sailors;
```
![output](exp2 output1)
##Q2 Sailors with a rating above 7
```
SELECT * FROM sailors
WHERE rating > 7;
```
![output](exp2 output2)
##Q3 Names of sailors who reserved boat 103
```
SELECT DISTINCT S.sname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
WHERE R.bid = 103;
```
![output](exp2 output3)

##Q4 SIDs of sailors who reserved a red boat
```
SELECT DISTINCT R.sid
FROM Reserves R
JOIN Boats B ON R.bid = B.bid
WHERE B.color = 'red';
```

##Q5 Names of sailors who reserved a red boat
```
SELECT DISTINCT S.sname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
JOIN Boats B ON R.bid = B.bid
WHERE B.color = 'red';
```
##Q6 Colors of boats reserved by Lubber
```
SELECT DISTINCT B.color
FROM Sailors 
JOIN Reserves R ON S.sid = R.sid
JOIN Boats B ON R.bid = B.bid
WHERE S.sname = 'Lubber';
```
##Q7 Names of sailors who have reserved at least one boat
```
SELECT DISTINCT S.sname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid;
```
![output](exp2 output4)

##Q8 Increment ratings of sailors who reserved two different boats on the same day
```
UPDATE Sailors
SET rating = rating + 1
WHERE sid IN (
    SELECT R1.sid
    FROM Reserves R1
    JOIN Reserves R2
      ON R1.sid = R2.sid
     AND R1.day = R2.day
     AND R1.bid <> R2.bid
);
```
##Q9 Ages of sailors whose name begins and ends with B and has at least 3 characters
```
SELECT age
FROM Sailors
WHERE sname LIKE 'B%B'
  AND LENGTH(sname) >= 3;
```
![output](exp2 output5)

##Q10 Names of sailors who reserved a red boat or a green boat
```
SELECT DISTINCT S.sname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
JOIN Boats B ON R.bid = B.bid
WHERE B.color IN ('red', 'green');
```
##Q11  Names of sailors who reserved both a red and a green boat
```
SELECT S.sname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
JOIN Boats B ON R.bid = B.bid
WHERE B.color IN ('red', 'green')
GROUP BY S.sid, S.sname
HAVING COUNT(DISTINCT B.color) = 2;
```
##Q12 SIDs of sailors who reserved red boats but not green boats
```
SELECT DISTINCT R.sid
FROM Reserves R
JOIN Boats B ON R.bid = B.bid
WHERE B.color = 'red'
  AND R.sid NOT IN (
      SELECT R2.sid
      FROM Reserves R2
      JOIN Boats B2 ON R2.bid = B2.bid
      WHERE B2.color = 'green'
  );
```
##13  SIDs of sailors with rating 10 or who reserved boat 104
```
SELECT sid
FROM Sailors
WHERE rating = 10

UNION

SELECT sid
FROM Reserves
WHERE bid = 104;
```
![output](exp2 output6)

##Q14 Names of sailors who reserved boat 103
```
SELECT DISTINCT S.sname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
WHERE R.bid = 103;
```
![output](exp2 output7)

##Q15 Names of sailors who reserved a red boat

```SELECT DISTINCT S.sname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
JOIN Boats B ON R.bid = B.bid
WHERE B.color = 'red';
```
##Q16 Names of sailors who reserved boat 103
```
SELECT DISTINCT S.sname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
WHERE R.bid = 103;
```
![output](exp2 output8)

##Q17 Sailors whose rating is better than some sailor named Horatio
```
SELECT *
FROM Sailors S
WHERE S.rating > ANY (
    SELECT H.rating
    FROM Sailors H
    WHERE H.sname = 'Horatio'
);
```
![output](exp2 output9)

##Q18 Sailors whose rating is better than every sailor named Horatio
```
SELECT *
FROM Sailors S
WHERE S.rating > ALL (
    SELECT H.rating
    FROM Sailors H
    WHERE H.sname = 'Horatio'
);
```
![output](exp2 output10)

##Q19 Sailors with the highest rating
```
SELECT *
FROM Sailors
WHERE rating = (
    SELECT MAX(rating)
    FROM Sailors
);
```
![output](exp2 output11)

##20 Names of sailors who reserved both a red and a green boat
```
SELECT S.sname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
JOIN Boats B ON R.bid = B.bid
WHERE B.color IN ('red', 'green')
GROUP BY S.sid, S.sname
HAVING COUNT(DISTINCT B.color) = 2;
```
##Q21 Names of sailors who reserved all boats
```
SELECT S.sname
FROM Sailors S
WHERE NOT EXISTS (
    SELECT B.bid
    FROM Boats B
    WHERE NOT EXISTS (
        SELECT R.bid
        FROM Reserves R
        WHERE R.sid = S.sid
          AND R.bid = B.bid
    )
);
```
##22 Average age of all sailors
```
SELECT AVG(age) AS average_age
FROM Sailors;
```
![output](exp2 output12)

##23 Average age of sailors with rating 10
```
SELECT AVG(age) AS average_age
FROM Sailors
WHERE rating = 10;
```
![output](exp2 output13)

##24 Name and age of the oldest sailor
```
SELECT sname, age
FROM Sailors
WHERE age = (
    SELECT MAX(age)
    FROM Sailors
);
```
![output](exp2 output14)

##25 Number of sailors
```
SELECT COUNT(*) AS number_of_sailors
FROM Sailors;
```
![output](exp2 output15)

##26 Number of different sailor names
```
SELECT COUNT(DISTINCT sname) AS different_names
FROM Sailors;
```
![output](exp2 output16)

##27 Names of sailors older than the oldest sailor with rating 10
```
SELECT sname
FROM Sailors
WHERE age > (
    SELECT MAX(age)
    FROM Sailors
    WHERE rating = 10
);
```
![output](exp2 output17)

##28  Youngest sailor age for each rating level
```
SELECT rating, MIN(age) AS youngest_age
FROM Sailors
GROUP BY rating;
```
![output](exp2 output18)

##29 Youngest voting-age sailor for each rating, only where at least two voting-age sailors exist
```
SELECT rating, MIN(age) AS youngest_voting_age
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](exp2 output19)

##30 For each red boat, find the number of reservations
```
SELECT B.bid, B.bname, COUNT(R.sid) AS reservation_count
FROM Boats B
LEFT JOIN Reserves R ON B.bid = R.bid
WHERE B.color = 'red'
GROUP BY B.bid, B.bname;
```
##31 Average age of sailors for each rating level having at least two sailors
```
SELECT rating, AVG(age) AS average_age
FROM Sailors
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](exp2 output20)

##32 Average age of voting-age sailors for each rating level having at least two voting-age sailors
```
SELECT rating, AVG(age) AS average_age
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](exp2 output21)

##33 Same as #32 — average age of voting-age sailors for each rating with at least two such sailors
```
SELECT rating, AVG(age) AS average_voting_age
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](exp2 output22)

##34 Ratings for which the average sailor age is minimum among all ratings
```
SELECT rating
FROM Sailors
GROUP BY rating
HAVING AVG(age)<= ALL (
SELECT AVG(age)
FROM sailors
GROUP BY 
rating;
);
```
