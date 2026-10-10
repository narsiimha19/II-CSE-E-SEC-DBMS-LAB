<
## Sailors, Boats and Reserves

### Table Creation

```sql
CREATE TABLE Sailors (
    sid NUMBER PRIMARY KEY,
    sname VARCHAR2(50) NOT NULL,
    rating NUMBER NOT NULL,
    age NUMBER(4,1) NOT NULL
);
```
<img width="1600" height="847" alt="output1" src="https://github.com/user-attachments/assets/8b8952e4-5ecb-4325-a1ef-4d4609c94fa2" />

```
CREATE TABLE Boats (
    bid NUMBER PRIMARY KEY,
    bname VARCHAR2(20) NOT NULL,
    color VARCHAR2(10) NOT NULL
);
```
<img width="1600" height="849" alt="output2" src="https://github.com/user-attachments/assets/af02daee-a658-47af-8116-249415063e44" />
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
SELECT * FROM tab;
````
<img width="1600" height="847" alt="output3" src="https://github.com/user-attachments/assets/18f0cf11-0c0a-46b5-9c3f-a5fbad18f309" />

##  insert into boats
```
INSERT INTO Boats
VALUES(22,'Dustin',7,45.0);
```
<img width="1600" height="847" alt="insert1" src="https://github.com/user-attachments/assets/73efa627-124f-4412-ad91-4d2cac7fd81f" />

## insert into sailors
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
<img width="1600" height="847" alt="insert1" src="https://github.com/user-attachments/assets/c9b3caeb-ce91-4f7c-a3af-7dc344013dec" />

## insert into reserves 
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
<img width="1600" height="847" alt="insert2" src="https://github.com/user-attachments/assets/fe27930c-7bf3-4c80-b1b1-7f39552df31d" />


## insert into boats
```
INSERT INTO Boats VALUES (101, 'Interlake', 'blue');
INSERT INTO Boats VALUES (102, 'Interlake', 'red');
INSERT INTO Boats VALUES (103, 'Clipper', 'green');
INSERT INTO Boats VALUES (104, 'Marine', 'red');
```
<img width="1600" height="851" alt="insert3" src="https://github.com/user-attachments/assets/3368dc9c-165e-4f3a-b579-791df0fe55b8" />

## desc tables
```
DESC sailors;
DESC reserves;
DESC boats;
```
<img width="1600" height="848" alt="desc_reserves" src="https://github.com/user-attachments/assets/dab62869-f2d2-4a26-be0f-329e69907002" />

<img width="1600" height="847" alt="desc_boats" src="https://github.com/user-attachments/assets/5183d07e-cd26-42b2-ba16-f78e6f55d24d" />
<img width="1600" height="847" alt="desc_sailors" src="https://github.com/user-attachments/assets/6cc9e82e-ed40-41a0-a7c3-6550fac2a8ab" />

## display
```
SELECT * FROM Sailors;
SELECT * FROM Reserves;
SELECT * FROM Boats;
```
# DBMS LAB - EXPERIMENT 2

## Query 1

```sql
SELECT sname,age FROM Sailors;
```

<img width="1600" height="851" alt="q1" src="https://github.com/user-attachments/assets/06aa2f77-259b-469e-a352-3490105a7c79" />


---

## Query 2

```sql
SELECT sname FROM Sailors WHERE rating>7;
```

<img width="1600" height="851" alt="q2" src="https://github.com/user-attachments/assets/22e1b6f9-300e-4d5b-af54-1beb8a2cd709" />


---

## Query 3

```sql
SELECT s.sname FROM Sailors s,Reserves r
WHERE s.sid=r.sid
AND r.bid=103;
```

<img width="1600" height="848" alt="q3" src="https://github.com/user-attachments/assets/a0c130e0-0772-42a4-85fe-e44c9bb069cb" />


---

## Query 4

```sql
SELECT DISTINCT r.sid
FROM Reserves r,Boats b
WHERE r.bid=b.bid
AND b.color='red';
```

<img width="1600" height="849" alt="q4" src="https://github.com/user-attachments/assets/e58e53e1-f04e-4bf5-b2b2-86bd2c6e13f7" />

---

## Query 5

```sql
SELECT DISTINCT s.sname FROM Sailors s,Reserves r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red';
```

<img width="1600" height="852" alt="q5" src="https://github.com/user-attachments/assets/3d290750-a990-46b7-b7be-ec0f2f69e216" />

---

## Query 6

```sql
SELECT b.color FROM Sailors s,Reserves r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND s.sname='Lubber';
```

<img width="1600" height="851" alt="q6" src="https://github.com/user-attachments/assets/6e187edb-e17a-4e00-94c3-c01164d5792c" />


---

## Query 7

```sql
SELECT DISTINCT s.sname FROM Sailors s,Reserves r
WHERE s.sid=r.sid;
```
<img width="1600" height="849" alt="q7" src="https://github.com/user-attachments/assets/af30409a-8264-4854-b8c1-0b8d3370d8a2" />


---

## Query 8

```sql
SELECT DISTINCT s.sname,rating+1 AS incremented_rating
FROM Sailors s,Reserves r1,Reserves r2
WHERE s.sid=r1.sid AND r1.sid=r2.sid
AND r2.day=r2.day AND r1.bid < > r2.bid;
```

<img width="1600" height="851" alt="q8" src="https://github.com/user-attachments/assets/bbeddac3-c30f-43a7-b544-37ceecbf02dc" />

---

## Query 9

```sql
SELECT age
FROM Sailors
WHERE sname LIKE 'B%b'
AND LENGTH(sname) >= 3;
```

<img width="1600" height="851" alt="q9" src="https://github.com/user-attachments/assets/5ca780b0-451a-4d34-bd3e-f4d335b12368" />


---

## Query 10

```sql
SELECT s.sname FROM Sailors s,Reserves r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND(b.color='red' OR b.color='green');
```

<img width="1600" height="847" alt="q10" src="https://github.com/user-attachments/assets/3cb8c24f-ec8c-4356-8d48-fb9f3d9209bb" />


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

<img width="1600" height="849" alt="q11" src="https://github.com/user-attachments/assets/6c09eb1b-686b-49d8-89ce-5a0f2d2cf4bb" />


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

<img width="1600" height="851" alt="q12" src="https://github.com/user-attachments/assets/bfcb3aaf-be19-46ae-9504-fb60876ad99e" />


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

<img width="1600" height="852" alt="q13" src="https://github.com/user-attachments/assets/05b466dc-25cc-4796-976d-300b4f93e3ef" />


---

## Query 14

```sql
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;
```

<img width="1600" height="847" alt="q14" src="https://github.com/user-attachments/assets/b17d1d4a-4da8-43bf-88b1-6a47f517b5c8" />


---

## Query 15

```sql
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red';
```

<img width="1600" height="847" alt="q15" src="https://github.com/user-attachments/assets/30c50f72-0151-4e88-858d-44230d842243" />


---

## Query 16

```sql
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;
```

<img width="1600" height="851" alt="q16" src="https://github.com/user-attachments/assets/5698f5c8-04d1-411a-b490-d5100abf06ed" />


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

<img width="1600" height="847" alt="q17" src="https://github.com/user-attachments/assets/940f1d41-348b-4e14-8309-b0819e78fa0e" />

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

<img width="1600" height="852" alt="q18" src="https://github.com/user-attachments/assets/5acd619a-d793-41de-955e-05c4c02eadce" />


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


<img width="1600" height="847" alt="q19" src="https://github.com/user-attachments/assets/ac485a4f-1ba6-4b2a-bede-3ecabb32c327" />


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

<img width="1600" height="847" alt="q20" src="https://github.com/user-attachments/assets/46964cb2-d2fd-470a-bff1-845b7f2fe509" />


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

<img width="1600" height="849" alt="q21" src="https://github.com/user-attachments/assets/65389aa5-e3e5-4554-a867-a261c1880e9d" />


---

## Query 22

```sql
SELECT AVG(age)
FROM Sailors;
```

<img width="1600" height="845" alt="q22" src="https://github.com/user-attachments/assets/3a3e92bf-1308-40f4-9bff-cc4d95c86f66" />

---

## Query 23

```sql
SELECT AVG(age)
FROM Sailors
```

<img width="1600" height="847" alt="q23" src="https://github.com/user-attachments/assets/cce19720-5ddd-4da7-99f2-127473ae00ad" />

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

<img width="1600" height="849" alt="q24" src="https://github.com/user-attachments/assets/7f530798-2a27-4400-8f8a-5880a235a1aa" />


---

## Query 25

```sql
SELECT COUNT(*)
FROM Sailors;
```

<img width="1600" height="851" alt="q25" src="https://github.com/user-attachments/assets/c2b85c41-8f77-47bd-9e99-f667d01b78c0" />


---

## Query 26

```sql
SELECT COUNT(DISTINCT sname)
FROM Sailors;
```

<img width="1600" height="851" alt="q26" src="https://github.com/user-attachments/assets/8dc44d23-04a8-4a15-8616-f7a8a030868e" />


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

<img width="1600" height="849" alt="q27" src="https://github.com/user-attachments/assets/ffe6c4fd-dfc5-4706-a350-9278faf435f3" />

---

## Query 28

```sql
SELECT rating, MIN(age)
FROM Sailors
GROUP BY rating;
```

<img width="1600" height="845" alt="q28" src="https://github.com/user-attachments/assets/a7dd1de6-4166-403a-9d64-26bbebab530c" />


---

## Query 29

```sql
SELECT rating, MIN(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```

<img width="1600" height="847" alt="q29" src="https://github.com/user-attachments/assets/5f2b738d-c6db-415e-9a94-180896a6e0ac" />


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

<img width="1600" height="847" alt="q31" src="https://github.com/user-attachments/assets/873b02ca-e685-41f6-a60f-c6b693c49519" />



---

## Query 31

```sql
SELECT rating, AVG(age)
FROM Sailors
GROUP BY rating
HAVING COUNT(*) >= 2;
```

<img width="1600" height="847" alt="q31" src="https://github.com/user-attachments/assets/1c679a0f-fed6-43ac-8684-1456ecb962f8" />

---

## Query 32

```sql
SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```

<img width="1600" height="848" alt="q32" src="https://github.com/user-attachments/assets/bb6f8264-b076-4627-91a2-0463845f1963" />

---

## Query 33

```sql
SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```

<img width="1600" height="849" alt="q33" src="https://github.com/user-attachments/assets/4a0fb35a-3790-4697-b0fb-c6d826f9d733" />


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
<img width="1600" height="823" alt="q34" src="https://github.com/user-attachments/assets/d4ce1431-1d54-441d-9a36-52ee706d7fdf" />


![Output](q34.jpeg
)
