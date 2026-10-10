
## Sailors, Boats and Reserves

### Table Creation

#### Create Sailors

```sql
CREATE TABLE Sailors (
    sid NUMBER PRIMARY KEY,
    sname VARCHAR2(50) NOT NULL,
    rating NUMBER NOT NULL,
    age NUMBER(4,1) NOT NULL
);
```

![output2](output2.jpeg)

#### Create Boats

```sql
CREATE TABLE Boats (
    bid NUMBER PRIMARY KEY,
    bname VARCHAR2(20) NOT NULL,
    color VARCHAR2(10) NOT NULL
);
```

![output1](output1.jpeg)

#### Create Reserves

```sql
CREATE TABLE Reserves (
    sid NUMBER NOT NULL,
    bid NUMBER NOT NULL,
    day DATE NOT NULL,
    PRIMARY KEY (sid, bid, day),
    FOREIGN KEY (sid) REFERENCES Sailors(sid),
    FOREIGN KEY (bid) REFERENCES Boats(bid)
);
```

![output3](output3.jpeg)

```sql
SELECT * FROM tab;
```

### Data Insertion

#### Insert into Boats

```sql
INSERT INTO Boats VALUES (101, 'Interlake', 'blue');
INSERT INTO Boats VALUES (102, 'Interlake', 'red');
INSERT INTO Boats VALUES (103, 'Clipper', 'green');
INSERT INTO Boats VALUES (104, 'Marine', 'red');
```

![insert1](insert1.jpeg)

#### Insert into Sailors

```sql
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

![insert2](insert2.jpeg)

#### Insert into Reserves

```sql
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

![insert3](insert3.jpeg)

### Describe Tables

#### DESC Sailors

```sql
DESC sailors;
```

![desc_sailors](desc_sailors.jpeg)

#### DESC Boats

```sql
DESC boats;
```

![desc_boats](desc_boats.jpeg)

#### DESC Reserves

```sql
DESC reserves;
```

![desc_reserves](desc_reserves.jpeg)

### Display Tables

```sql
SELECT * FROM Sailors;
SELECT * FROM Reserves;
SELECT * FROM Boats;
```

# DBMS LAB - EXPERIMENT 2

## Query 1

```sql
SELECT sname,age FROM Sailors;
```

![q1](q1.jpeg)

---

## Query 2

```sql
SELECT sname FROM Sailors WHERE rating>7;
```

![q2](q2.jpeg)

---

## Query 3

```sql
SELECT s.sname FROM Sailors s,Reserves r
WHERE s.sid=r.sid
AND r.bid=103;
```

![q3](q3.jpeg)

---

## Query 4

```sql
SELECT DISTINCT r.sid
FROM Reserves r,Boats b
WHERE r.bid=b.bid
AND b.color='red';
```

![q4](q4.jpeg)

---

## Query 5

```sql
SELECT DISTINCT s.sname FROM Sailors s,Reserves r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red';
```

![q5](q5.jpeg)

---

## Query 6

```sql
SELECT b.color FROM Sailors s,Reserves r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND s.sname='Lubber';
```

![q6](q6.jpeg)

---

## Query 7

```sql
SELECT DISTINCT s.sname FROM Sailors s,Reserves r
WHERE s.sid=r.sid;
```

![q7](q7.jpeg)

---

## Query 8

```sql
SELECT DISTINCT s.sname,rating+1 AS incremented_rating
FROM Sailors s,Reserves r1,Reserves r2
WHERE s.sid=r1.sid AND r1.sid=r2.sid
AND r2.day=r2.day AND r1.bid < > r2.bid;
```

![q8](q8.jpeg)

---

## Query 9

```sql
SELECT age
FROM Sailors
WHERE sname LIKE 'B%b'
AND LENGTH(sname) >= 3;
```

![q9](q9.jpeg)

---

## Query 10

```sql
SELECT s.sname FROM Sailors s,Reserves r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND(b.color='red' OR b.color='green');
```

![q10](q10.jpeg)

---

## Query 11

```sql
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

![q11](q11.jpeg)

---

## Query 12

```sql
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

![q12](q12.jpeg)

---

## Query 13

```sql
SELECT sid
FROM Sailors
WHERE rating = 10

UNION

SELECT sid
FROM Reserves
WHERE bid = 104;
```

![q13](q13.jpeg)

---

## Query 14

```sql
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;
```

![q14](q14.jpeg)

---

## Query 15

```sql
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red';
```

![q15](q15.jpeg)

---

## Query 16

```sql
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;
```

![q16](q16.jpeg)

---

## Query 17

```sql
SELECT *
FROM Sailors
WHERE rating > ANY
(
    SELECT rating
    FROM Sailors
    WHERE sname = 'Horatio'
);
```

![q17](q17.jpeg)

---

## Query 18

```sql
SELECT *
FROM Sailors
WHERE rating > ALL
(
    SELECT rating
    FROM Sailors
    WHERE sname = 'Horatio'
);
```

![q18](q18.jpeg)

---

## Query 19

```sql
SELECT * FROM Sailors
WHERE rating =
(
    SELECT MAX(rating)
    FROM Sailors
);
```

![q19](q19.jpeg)

---

## Query 20

```sql
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

![q20](q20.jpeg)

---

## Query 21

```sql
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

![q21](q21.jpeg)

---

## Query 22

```sql
SELECT AVG(age)
FROM Sailors;
```

![q22](q22.jpeg)

---

## Query 23

```sql
SELECT AVG(age)
FROM Sailors
```

![q23](q23.jpeg)

---

## Query 24

```sql
SELECT sname, age
FROM Sailors
WHERE age =
(
    SELECT MAX(age)
);
```

![q24](q24.jpeg)

---

## Query 25

```sql
SELECT COUNT(*)
FROM Sailors;
```

![q25](q25.jpeg)

---

## Query 26

```sql
SELECT COUNT(DISTINCT sname)
FROM Sailors;
```

![q26](q26.jpeg)

---

## Query 27

```sql
SELECT sname
FROM Sailors
WHERE age >
(
    SELECT MAX(age)
    FROM Sailors
    WHERE rating = 10
);
```

![q27](q27.jpeg)

---

## Query 28

```sql
SELECT rating, MIN(age)
FROM Sailors
GROUP BY rating;
```

![q28](q28.jpeg)

---

## Query 29

```sql
SELECT rating, MIN(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```

![q29](q29.jpeg)

---

## Query 30

```sql
SELECT b.bid, COUNT(r.sid) AS reservations
FROM Boats b
LEFT JOIN Reserves r
ON b.bid = r.bid
WHERE b.color = 'red'
GROUP BY b.bid;
```

![q30](q30.jpeg)

---

## Query 31

```sql
SELECT rating, AVG(age)
FROM Sailors
GROUP BY rating
HAVING COUNT(*) >= 2;
```

![q31](q31.jpeg)

---

## Query 32

```sql
SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```

![q32](q32.jpeg)

---

## Query 33

```sql
SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```

![q33](q33.jpeg)

---

## Query 34

```sql
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

![q34](q34.jpeg)
