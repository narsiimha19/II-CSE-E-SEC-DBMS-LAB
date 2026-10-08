#.1. Find the names and ages of all sailors.
```
SELECT sname, age FROM Sailors;
```
![output](o1.png)
```
```
#2.Find all sailors with a rating above 7.
```
SELECT * FROM Sailors
WHERE rating > 7;

CREATE TABLE Boats (
  bid NUMBER PRIMARY KEY,
  bname VARCHAR2(30),
  color VARCHAR2(20)
);

CREATE TABLE Reserves (
  sid NUMBER,
  bid NUMBER,
  day DATE
);

INSERT INTO Boats VALUES (101, 'Interlake', 'blue');
INSERT INTO Boats VALUES (102, 'Interlake', 'red');
INSERT INTO Boats VALUES (103, 'Clipper', 'green');
INSERT INTO Boats VALUES (104, 'Marine', 'red');

INSERT INTO Reserves VALUES (22, 101, SYSDATE);
INSERT INTO Reserves VALUES (22, 102, SYSDATE);
INSERT INTO Reserves VALUES (22, 103, SYSDATE);
INSERT INTO Reserves VALUES (31, 103, SYSDATE);
INSERT INTO Reserves VALUES (64, 101, SYSDATE);

COMMIT;

SELECT s.sname FROM Sailors s, Reserves r WHERE s.sid = r.sid AND r.bid = 103;
```
![output](o2.png)
```
```

#3.Find the names of sailors who have reserved boat number 103.
```
SELECT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;
```
![output](o3.png)
```
```

#4. Find the sids of sailors who have reserved a red boat.
```
SELECT DISTINCT r.sid
FROM Reserves r, Boats b
WHERE r.bid = b.bid
AND b.color = 'red';
```
![output](o4.png)
```
```

#5. Find the names of sailors who have reserved a red boat.
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red';
```
![output](o5.png)
```
```


#6. Find the colors of boats reserved by Lubber.
```
SELECT DISTINCT b.color
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND s.sname = 'Lubber';
```
![output](o6.png)
```
```

#7. Find the names of sailors who have reserved at least one boat.
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid;
```
![output](o7.png)
```
```

#8. Compute increments for the ratings of persons who have sailed two different boats on the same day.
```
UPDATE Sailors
SET rating = rating + 1

WHERE sid IN (
  SELECT r1.sid
  FROM Reserves r1, Reserves r2
  WHERE r1.sid = r2.sid
  AND r1.day = r2.day
  AND r1.bid <> r2.bid
);
SELECT * FROM Sailors;
```
![output](o8.png)
```
```

#9. Find the ages of sailors whose name begins and ends with B and has at least three characters.
```
SELECT age
FROM Sailors
WHERE sname LIKE 'B_%b';

INSERT INTO Sailors VALUES (99, 'Bob', 5, 30);
COMMIT;

SELECT age FROM Sailors WHERE sname LIKE 'B_%b';
```
![output](o9.png)
```
```

#10. Find the names of sailors who reserved a red boat or a green boat.
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color IN ('red','green');
```
![output](o10.ong)
```
```
#11. Find the names of sailors who have reserved both a red and a green boat.
```
SELECT s.sname
FROM Sailors s
WHERE EXISTS (
SELECT *
FROM Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red')
AND EXISTS (
SELECT *
FROM Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'green');
```
![output](o11.png)
```
```

#12. Find the sids of sailors who have reserved red boats but not green boats.
```
DELETE FROM Boats;
DELETE FROM Reserves;

INSERT INTO Boats VALUES (101, 'Interlake', 'blue');
INSERT INTO Boats VALUES (102, 'Interlake', 'red');
INSERT INTO Boats VALUES (103, 'Clipper', 'green');
INSERT INTO Boats VALUES (104, 'Marine', 'red');

INSERT INTO Reserves VALUES (22, 102, SYSDATE);
INSERT INTO Reserves VALUES (64, 102, SYSDATE);

COMMIT;
SELECT DISTINCT r.sid FROM Reserves r, Boats b WHERE r.bid = b.bid AND b.color = 'red'
MINUS
SELECT DISTINCT r.sid FROM Reserves r, Boats b WHERE r.bid = b.bid AND b.color = 'green';
```
![output](o12.png)
```
```
#13. Find all sids of sailors who have a rating of 10 or have reserved boat 104.
```
SELECT sid FROM Sailors
WHERE rating = 10
UNION
SELECT sid FROM Reserves
WHERE bid = 104;
```
![output](o13.png)
```
```
#14. Find the names of sailors who have reserved boat 103.
```
DELETE FROM Reserves;
INSERT INTO Reserves VALUES (22, 101, SYSDATE);
INSERT INTO Reserves VALUES (22, 102, SYSDATE);
INSERT INTO Reserves VALUES (22, 103, SYSDATE);
INSERT INTO Reserves VALUES (31, 103, SYSDATE);
INSERT INTO Reserves VALUES (64, 104, SYSDATE);
COMMIT;
SELECT sname FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid = 103);
```
![output](o14.png)
```
```
#15. Find the names of sailors who have reserved a red boat.
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red';
```
![output](o15.png)
```
```
#16. Find the names of sailors who have reserved boat number 103.
```
SELECT sname
FROM Sailors
WHERE sid IN (
SELECT sid
FROM Reserves
WHERE bid = 103);
```
![output](o16.png)
```
```
#17. Find sailors whose rating is better than some sailor called Horatio.
```
SELECT *
FROM Sailors
WHERE rating > ANY (
SELECT rating
FROM Sailors
WHERE sname = 'Horatio');
```
![output](o17.png)
```
```
#18. Find sailors whose rating is better than every sailor called Horatio.
```
SELECT *
FROM Sailors
WHERE rating > ALL (
SELECT rating
FROM Sailors
WHERE sname = 'Horatio');
```
![output](o18.png)
```
```
#19. Find the sailors with the highest rating.
```
SELECT *
FROM Sailors
WHERE rating = (
SELECT MAX(rating)
FROM Sailors);
```
![output](o19.png)
```
```
#20. Find the names of sailors who have reserved both a red and a green boat.
```
SELECT s.sname
FROM Sailors s
WHERE EXISTS (
SELECT * FROM Reserves r, Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red')
AND EXISTS (
SELECT * FROM Reserves r, Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='green');
```
![output](o20.png)
```
```
#21. Find the names of sailors who have reserved all boats.
```
INSERT INTO Reserves VALUES (22, 101, SYSDATE);
INSERT INTO Reserves VALUES (22, 102, SYSDATE);
INSERT INTO Reserves VALUES (22, 103, SYSDATE);
INSERT INTO Reserves VALUES (22, 104, SYSDATE); -- Dustin antha reserve chesadu
INSERT INTO Reserves VALUES (31, 103, SYSDATE);
COMMIT;
SELECT sname FROM Sailors s 
WHERE NOT EXISTS (
  SELECT bid FROM Boats
  MINUS
  SELECT bid FROM Reserves WHERE sid = s.sid);
 ```
![output](o21.png)
```
```
#22. Find the average age of all sailors.
```
SELECT AVG(age)
FROM Sailors;
```
![output](o22.png)
```
```

#23. Find the average age of sailors with a rating of 10.
```
SELECT AVG(age)
FROM Sailors
WHERE rating = 10;
```
~[output](o23.png)
```
```
#24. Find the name and age of the oldest sailor.
```
SELECT sname, age
FROM Sailors
WHERE age = (
SELECT MAX(age)
FROM Sailors);
```
![output](O24.png)
```
```
#25. Count the number of sailors.
```
SELECT COUNT(*)
FROM Sailors;
```
![output](o25.png)
```
```
#26. Count the number of different sailor names.
```
SELECT COUNT(DISTINCT sname)
FROM Sailors;
```
![output](o26.png}
```
```
#27. Find the names of sailors older than the oldest sailor with a rating of 10.
```
SELECT sname
FROM Sailors
WHERE age > (
SELECT MAX(age)
FROM Sailors
WHERE rating = 10);
```
![output](o27.png)
```
```
#28. Find the age of the youngest sailor for each rating level.
```
SELECT rating, MIN(age)
FROM Sailors
GROUP BY rating;
```
![output](o28.png)
```
```
#29. Find the age of the youngest sailor eligible to vote (age ≥ 18) for each rating level with at least two sailors.
```
SELECT rating, MIN(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](o29.png)
```
```
#30. For each red boat, find the number of reservations.
```
SELECT b.bid, COUNT(*)
FROM Boats b, Reserves r
WHERE b.bid = r.bid
AND b.color = 'red'
GROUP BY b.bid;
```
![output](o30.png)
```
```
#31. Find the average age of sailors for each rating level that has at least two sailors.
```
SELECT rating, AVG(age)
FROM Sailors
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](o31.png)
```
```
#32. Find the average age of voting-age sailors (≥18) for each rating level with at least two sailors.
```
SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](o32.png)
```
```
#33. Find the average age of voting-age sailors (≥18) for each rating level with at least two such sailors.
```
SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](o33.png)
```
```
#34. Find the ratings for which the average age is the minimum.
```
SELECT rating
FROM Sailors
GROUP BY rating
HAVING AVG(age) <= ALL (
SELECT AVG(age)
FROM Sailors
GROUP BY rating);
```
![output](o34.png)
```
```




