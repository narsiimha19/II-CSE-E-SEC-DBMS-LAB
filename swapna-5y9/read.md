--sailors
#create table:
CREATE TABLE sailors(
sid NUMBER PRIMARY KEY,
sname VARCHAR2(30) NOT NULL,
rating number NOT NULL,
age real NOT NULL);

#DESC sailors;
![output(op 1)]
--RESERVES
#create table:
CREATE TABLE reserves(
sid NUMBER not null,
bid NUMBER not null,
day date not null);

#desc reserves;
 ![output(op 2)] 

--boat 
#create table:
CREATE TABLE BOAT(
bid number not null,
bname varchar2(50),
color varchar2(40));

#desc boat;
![output(op 3)]
--INSERT
#insert values:
INSERT INTO BOAT VALUES(101,'INTERLAKE','BLUE');
INSERT INTO BOAT VALUES(102,'INTERLAKE','RED');
INSERT INTO BOAT VALUES(103,'CLIPPER','GREEN');
INSERT INTO BOAT VALUES(104,'MARINE','RED');
![output(b insert)]

INSERT INTO sailors VALUES(22,'dustin',7,45.0);
INSERT INTO sailors VALUES(29,'brutus ',1,33.0);
INSERT INTO sailors VALUES(31,'lubber',8,55.5);
INSERT INTO sailors VALUES(32,'andy',8,25.5);
INSERT INTO sailors VALUES(58,'rust',10,35.0);
INSERT INTO sailors VALUES(64,'horatio',7,35.0);
![output(s insert)]

INSERT INTO reserves values(22,101,TO_DATE('10/10/06','mm/dd/yy'));
INSERT INTO reserves values(22,102,TO_DATE('10/10/06','mm/dd/yy'));
INSERT INTO reserves values(22,103,TO_DATE('10/8/08','mm/dd/yy'));
![output(r insert)]

#output 
 selete* from sailors;
![output(sailors op)]
selete* from reserves;
![output(res op)]
selete* from boat;
![output(boat op)]

1.
SELECT sname,age FROM sailors;

__2.__
SELECT *FROM sailors

__3.__
SELECT sname
FROM sailors s,Reserves3 r
WHERE s.sid = r.sid
AND r.bid=103;

__4.__
SELECT DISTINCT r.sid
FROM Reserves3 r,Boats b
WHERE r.bid=b.bid
AND color='red';

__5.__
FROM sailors s,Reserves3 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red';

__6.__
SELECT DISTINCT b.color
FROM sailors s,Reserves3 r,Boats b
WHERE s.sid=r.sid
AND sname='Lubber';

__7.__
SELECT DISTINCT s.sname
FROM sailors s,Reservese r
WHERE s.sid=r.sid;

__8.__
UPDATE sailors
SET rating=rating+1
WHERE sid IN (
SELECT r1.sid FROM Reserves3 r1,Reserves3 r2
WHERE r1.sid=r2.sid
AND r1.day=r2.day
AND r1.bid<>r2.bid );

__9.__
SELECT age FROM sailors

__10.__
SELECT DISTINCT bname
FROM sailors s,Reserves3 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color IN('red','green');

__11.__
SELECT sname FROM sailors
WHERE EXISTS (
SELECT *FROM Reserves3 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red' )
AND EXISTS (
SELECT *FROM Reserves3 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid

__12.__
SELECT DISTINCT r.sid
FROM Reserves3 r,Boats b
WHERE r.bid=b.bid
AND b.color='red'
MINUS
SELECT DISTINCT r.sid FROM Reserves3 r,Boats b
WHERE r.bid=b.bid
AND b.color='green';

__13.__
SELECT sid FROM sailors
WHERE rating=10 UNION
SELECT sid FROM Reserves3 
WHERE bid=104;

__14.__

WHERE sid IN(
SELECT sid FROM Reserves3
WHERE bid=103 );

__15.__
SELECT DISTINCT sname
FROM sailors s,Reserves3 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red';

16
SELECT s.sname
FROM sailors s, reserves r
WHERE s.sid = r.sid
AND r.bid = 103;

SELECT sname, rating
FROM sailors
WHERE rating > (SELECT rating FROM sailors
                WHERE sname = 'Horatio');
                
18
SELECT sname, rating
FROM sailors
WHERE rating > (SELECT rating FROM sailors
19
SELECT sname, rating
FROM sailors
WHERE rating = (SELECT MAX(rating)
                FROM sailors);
20
select distinct s.sname
FROM sailors s, reserves r, boats b
AND r.bid = b.bid
AND b.color = 'RED'
AND s.sid IN
(SELECT r2.sid
 FROM reserves r2, boats b2
 WHERE r2.bid = b2.bid
 AND b2.color = 'GREEN');


21
SELECT sname FROM sailors
WHERE sid IN
 FROM reserves
 GROUP BY sid
 HAVING COUNT(DISTINCT bid) =
       (SELECT COUNT(*) FROM boats));
22
SELECT AVG(age)FROM sailors;
23
SELECT AVG(age)FROM sailors
WHERE rating = 10;
24
SELECT sname, age FROM sailors
WHERE age = (SELECT MAX(age)
             FROM sailors);
25 
26
SELECT COUNT(DISTINCT sname)FROM sailors;
27 
SELECT snameFROM sailors
WHERE age > (SELECT MAX(age)
             FROM sailors
             WHERE rating = 10)
28
SELECT rating, MIN(age) FROM sailors
GROUP BY rating;
29 
SELECT rating, MIN(age)FROM sailors
WHERE age >= 18
HAVING COUNT(*) >= 2;
30   
SELECT b.bid, b.bname, COUNT(r.sid)FROM boats b
LEFT JOIN reserves r ON b.bid = r.bid
WHERE b.color = 'RED'
GROUP BY b.bid, b.bname;
31  
SELECT rating, AVG(age)FROM sailors
GROUP BY rating
HAVING COUNT(*) >= 2;
32  
SELECT rating, AVG(age)FROM sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
33
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
34  
SELECT ratingFROM sailors
GROUP BY rating
HAVING AVG(age) <= ALL
       (SELECT AVG(age)
        FROM sailors
        GROUP BY rating);
drop table sailors;
drop table reserves;
drop table boat;

