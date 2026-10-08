## CREATE SAILORS TABLE
```
CREATE TABLE sailors (
sid NUMBER PRIMARY KEY,
sname VARCHAR2(20) NOT NULL,
rating NUMBER NOT NULL,
age REAL NOT NULL );
```

## CREATE RESERVES TABLE
```
CREATE TABLE reserves1(
sid NUMBER PRIMARY KEY,
bid NUMBER,
day DATE );
```

## CREATE BOATS TABLE
```
CREATE TABLE Boats (
bid NUMBER PRIMARY KEY,
bname VARCHAR2(30) NOT NULL,
color VARCHAR2(15) NOT NULL );
```

## INSERT INTO SAILORS TABLE
```
INSERT INTO sailors
VALUES(22,'Dustin',7,45.0);
SELECT * FROM sailors;
INSERT INTO sailors
VALUES(29,'Brutus',1,33.0);
SELECT * FROM sailors;
INSERT INTO sailors
VALUES(31,'Lubber',8,55.5);
SELECT * FROM sailors;
INSERT INTO sailors
VALUES(32,'Andy',8,25.5);
SELECT * FROM sailors;
INSERT INTO sailors
VALUES(58,'Rusty',10,35.0);
SELECT * FROM sailors;
INSERT INTO sailors
VALUES(64,'Horatio',7,35.0);
SELECT * FROM sailors;
INSERT INTO sailors
VALUES(71,'Zorba',10,16.0);
SELECT * FROM sailors;
INSERT INTO sailors
VALUES(74,'Horatio',9,35.0);
SELECT * FROM sailors;
INSERT INTO sailors
VALUES(85,'Art',3,25.5);
SELECT * FROM sailors;
INSERT INTO sailors
VALUES(95,'Bob',3,63.5);
SELECT * FROM sailors;
```
![output](sailors output)
## INSERT RESERVES TABLE
```
INSERT INTO reserves1 VALUES (22,101,TO_DATE('10\10\98','MM\DD\RR'));
INSERT INTO reserves1 VALUES (22,102,TO_DATE('10\10\98','MM\DD\RR'));
INSERT INTO reserves1 VALUES (22,103,TO_DATE('10\9\98','MM\DD\RR'));
INSERT INTO reserves1 VALUES (22,104,TO_DATE('10\7\98','MM\DD\RR'));
INSERT INTO reserves1 VALUES (31,102,TO_DATE('11\10\98','MM\DD\RR'));
INSERT INTO reserves1 VALUES (31,103,TO_DATE('11\6\98','MM\DD\RR'));
INSERT INTO reserves1 VALUES (31,104,TO_DATE('11\12\98','MM\DD\RR'));
INSERT INTO reserves1 VALUES (64,101,TO_DATE('9\5\98','MM\DD\RR'));
INSERT INTO reserves1 VALUES (64,102,TO_DATE('9\8\98','MM\DD\RR'));
INSERT INTO reserves1 VALUES (74,103,TO_DATE('9\8\98','MM\DD\RR'));
```

## INSERT BOATS TABLE
```
INSERT INTO Boats
VALUES(101,'Interlake','blue');
SELECT * FROM Boats;
INSERT INTO Boats
VALUES(102,'Interlake','red');
SELECT * FROM Boats;
INSERT INTO Boats
VALUES(103,'Clipper','green');
SELECT * FROM Boats;
INSERT INTO Boats
VALUES(104,'Marine','red');
SELECT * FROM Boats;
```
![output](boats output)
##Q1
```
SELECT sname,age FROM sailors;
```
![output](exp-2 output1)
##Q2
```
SELECT *FROM sailors
WHERE rating>7;
```
![output](exp-2 output2)

##Q3
```
SELECT sname
FROM sailors s,reserves1 r
WHERE s.sid = r.sid
AND r.bid=103;
```
![output](exp-2 output3)

##Q4
```
SELECT DISTINCT r.sid
FROM reserves1 r,Boats b
WHERE r.bid=b.bid
AND color='red';
```
![output](exp-2 output4)


##Q5
```
SELECT DISTINCT sname
FROM sailors s,reserves1 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red';
```
![output](exp-2 output5)

##Q6
```
SELECT DISTINCT b.color
FROM sailors s,reserves1 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND sname='Lubber';
```
![output](exp-2 output6)

##Q7
```
SELECT DISTINCT s.sname
FROM sailors s,reserves1 r
WHERE s.sid=r.sid;
```
![output](exp-2 output7)

##Q8
```
UPDATE sailors
SET rating=rating+1
WHERE sid IN (
SELECT r1.sid FROM reserves1 r1,reserves1 r2
WHERE r1.sid=r2.sid
AND r1.day=r2.day
AND r1.bid<>r2.bid );
```
![output](exp-2 output8)

##Q9
```
SELECT age FROM sailors
WHERE sname LIKE 'B-%B';
```

##Q10
```
SELECT DISTINCT bname
FROM sailors s,reserves1 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color IN('red','green');
```
![output](exp-2 output9)

##Q11
```
SELECT sname FROM sailors
WHERE EXISTS (
SELECT *FROM reserves1 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red' )
AND EXISTS (
SELECT *FROM reserves1 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='green' );
```

##Q12
```
SELECT DISTINCT r.sid
FROM reserves1 r,Boats b
WHERE r.bid=b.bid
AND b.color='red'
MINUS
SELECT DISTINCT r.sid FROM reserves1 r,Boats b
WHERE r.bid=b.bid
AND b.color='green';
```
![output](exp-2 output10)

##Q13
```
SELECT sid FROM sailors
WHERE rating=10 UNION
SELECT sid FROM reserves1
WHERE bid=104;
```
![output](exp-2 output11)

##Q14
```
SELECT sname FROM sailors
WHERE sid IN(
SELECT sid FROM reserves1
WHERE bid=103 );
```
![output](exp-2 output12)

##Q15
```
SELECT DISTINCT sname
FROM sailors s,reserves1 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red';
```
![output](exp-2 output13)

##Q16
```
SELECT sname FROM sailors WHERE SID IN (
SELECT sid FROM reserves1 WHERE bid=103 );
```
![output](exp-2 output14)

##Q17
```
SELECT *FROM sailors WHERE rating >ANY (
SELECT rating FROM sailors WHERE s.name='Horatio');
```

##Q18
```
SELECT * FROM sailors WHERE rating > ALL (
SELECT rating FROM sailors WHERE sname = 'Horatio');
```
![output](exp-2 output15)

##Q19
```
SELECT * FROM sailors WHERE rating = (
SELECT MAX(rating) FROM sailors);
```
![output](exp-2 output16)

##Q20
```
SELECT s.name FROM saikors WHERE EXISTS (
SELECT * FROM reserves1 r,Boats b
WHERE s.sid=r.sid AND r.bid=b.bid AND b.color='red') AND
EXISTS (SELECT * FROM reserves1 r,Boats b
WHERE s.sid=r.sid AND r.bid=b.bid AND b.color='green');
```

##Q21
```
SELECT s.name FROM sailors WHERE NOT EXISTS (
SELECT bid FROM boats MINUS
SELECT bid FROM reserves1 WHERE sid=s.sid );
```

##Q22
```
SELECT AVG(age) FROM sailors;
```
![output](exp-2 output17)

##Q23
```
SELECT AVG(age) FROM sailors WHERE rating = 10;
```
![output](exp-2 output18)

##Q24
```
SELECT sname, age FROM sailors WHERE age =
(SELECT MAX(age) FROM sailors);
```
![output](exp-2 output19)

##Q25
```
SELECT COUNT(*) FROM sailors;
```
![output](exp-2 output20)

##Q26
```
SELECT COUNT(DISTINCT sname) FROM sailors;
```
![output](exp-2 output21)

##Q27
```
SELECT sname FROM sailors WHERE age > (
SELECT MAX(age)FROM sailors WHERE rating = 10);
```
![output](exp-2 output22)

##Q28
```
SELECT rating, MIN(age) FROM sailors
GROUP BY rating;
```
![output](exp-2 output23)

##Q29
```
SELECT rating, MIN(age) FROM sailors WHERE age >= 18
GROUP BY rating HAVING COUNT(*) >= 2;
```
![output](exp-2 output24)

##Q30
```
SELECT b.bid, b.bname, COUNT(r.sid)
FROM boats b
LEFT JOIN reserves1 r ON b.bid = r.bid
WHERE b.color = 'RED'
GROUP BY b.bid, b.bname;
```

##Q31
```
SELECT rating, AVG(age) FROM sailors
GROUP BY rating HAVING COUNT(*) >= 2;
```
![output](exp-2 output25)

##Q32
```
SELECT rating, AVG(age) FROM sailors
GROUP BY rating HAVING COUNT(*) >= 2;
```
![output](exp-2 output26)

##Q33
```
SELECT rating, AVG(age) FROM sailors WHERE age >= 18
GROUP BY rating HAVING COUNT(*) >= 2;
```
![output](exp-2 output27)

##Q34
```
SELECT rating FROM sailors GROUP BY rating
HAVING AVG(age) <= ALL
(SELECT AVG(age) FROM sailors
        GROUP BY rating);
```
![output](exp-2 output28)
