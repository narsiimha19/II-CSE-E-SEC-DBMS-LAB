## 1. Find the names and ages of all sailors.
```
SELECT sname, age FROM Sailors;
```
![output](exp-2 output1)
##2.Find all sailors with a rating above 7.
```

SELECT * FROM Sailors
WHERE rating > 7;
```

##3.Find the names of sailors who have reserved boat number 103.
```
SELECT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;
```


##4. Find the sids of sailors who have reserved a red boat.
```

SELECT DISTINCT r.sid
FROM Reserves r, Boats1 b
WHERE r.bid = b.bid
AND b.color = 'red';
```
![output](exp-2 output2)

##5. Find the names of sailors who have reserved a red boat.
```

SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats1 b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red';
```
![output](exp-2 output3)

##6. Find the colors of boats reserved by Lubber.
```

SELECT DISTINCT b.color
FROM Sailors s, Reserves r, Boats1 b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND s.sname = 'Lubber';
```

##7. Find the names of sailors who have reserved at least one boat.
```

SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid;
```
![output](exp-2 output4)

##8. Compute increments for the ratings of persons who have sailed two different boats on the same day.

```
UPDATE Sailors
SET rating = rating + 1
WHERE sid IN (
SELECT r1.sid
FROM Reserves r1, Reserves r2
WHERE r1.sid = r2.sid
AND r1.day = r2.day
);

```
![output](exp-2 output5)

##9. Find the ages of sailors whose name begins and ends with B and has at least three characters.
```

SELECT FROM Sailors
WHERE sname LIKE 'B_%B';
```
![output](exp-2 output6)

##10. Find the names of sailors who reserved a red boat or a green boat.
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats1 b
AND r.bid = b.bid
AND b.color IN ('red','green');
```
![output](exp-2 output7)

##11. Find the names of sailors who have reserved both a red and a green boat.
```

SELECT s.sname
FROM Sailors s
SELECT *
FROM Reserves r, Boats1 b
WHERE s.sid = r.sid
AND b.color = 'red')
AND EXISTS (
FROM Reserves r, Boats1 b
WHERE s.sid = r.sid
AND r.bid = b.bid
SELECT DISTINCT r.sid
FROM Reserves r, Boats1 b
AND b.color = 'red'
SELECT DISTINCT r.sid
AND b.color = 'green';
```
##12. Find the sids of sailors who have reserved red boats but not green boats.
```
SELECT DISTINCT r.sid
FROM Reserves r, Boats1 b
WHERE r.bid = b.bid
AND b.color = 'red'
MINUS
SELECT DISTINCT r.sid
FROM Reserves r, Boats1 b
WHERE r.bid = b.bid
AND b.color = 'green';
```

![output](exp-2 output8)

##13. Find all sids of sailors who have a rating of 10 or have reserved boat 104.
```

SELECT sid FROM Sailors
WHERE rating = 10
UNION
SELECT sid FROM Reserves
WHERE bid = 104;
```
![output](exp-2 output9)

##14. Find the names of sailors who have reserved boat 103.
```

SELECT sname
FROM Sailors
WHERE sid IN (
SELECT sid
FROM Reserves
WHERE bid = 103);
```
![output](exp-2 output10)

##15. Find the names of sailors who have reserved a red boat.
```

SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats1 b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red';

```
![output](exp-2 output11)


##16. Find the names of sailors who have reserved boat number 103.
```

SELECT sname
FROM Sailors
WHERE sid IN (
SELECT sid
FROM Reserves
WHERE bid = 103);
```


##17. Find sailors whose rating is better than some sailor called Horatio.
```

SELECT *
FROM Sailors
WHERE rating > ANY (
SELECT rating
FROM Sailors
WHERE sname = 'Horatio');
```

##18. Find sailors whose rating is better than every sailor called Horatio.
```

SELECT *
FROM Sailors
WHERE rating > ALL (
SELECT rating
FROM Sailors
WHERE sname = 'Horatio');
```

##19. Find the sailors with the highest rating.
```

SELECT *
FROM Sailors
WHERE rating = (
SELECT MAX(rating)
FROM Sailors);
```
![output](exp-2 output12)

##20. Find the names of sailors who have reserved both a red and a green boat.
```

SELECT s.sname
FROM Sailors s
WHERE EXISTS (
FROM Sailors);

SELECT COUNT(*)
FROM Sailors;
```
##21. Find the names of sailors who have reserved all boats.
```
SELECT sname
FROM Sailors s
WHERE NOT EXISTS (
SELECT bid FROM Boats
MINUS
SELECT bid FROM Reserves
WHERE sid = s.sid);
```

![output](exp-2 output13)

##22. Find the average age of all sailors.
```
SELECT AVG(age)
FROM Sailors;
```

![output](exp-2 output14)

##23.  Find the average age of sailors with a rating of 10.
```
SELECT AVG(age)
FROM Sailors
WHERE rating = 10;
```

![output](exp-2 output15)

##24. Find the name and age of the oldest sailor.
```
SELECT sname, age
FROM Sailors
WHERE age = (
SELECT MAX(age)
FROM Sailors);
```

![output](exp-2 output16)

##25. Count the number of sailors.
```
SELECT COUNT(*)
FROM Sailors;
```

![output](exp-2 output17)

##26. Count the number of different sailor names.
```

SELECT COUNT(DISTINCT sname)
FROM Sailors;
```
![output](exp-2 output18)

#27. Find the names of sailors older than the oldest sailor with a rating of 10.
```

SELECT sname
FROM Sailors
WHERE age > (
SELECT MAX(age)
FROM Sailors
GROUP BY rating;
```
![output](exp-2 output19)


##28Find the age of the youngest sailor for each rating level.
```
SELECT rating, MIN(age) FROM sailors;
```
![output](exp-2 output20)

##29. Find the age of the youngest sailor eligible to vote (age ≥ 18) for each rating level with at least two sailors.
```

WHERE age >= 18
GROUP BY rating
```
![output](exp-2 output21)

##30. For each red boat, find the number of reservations.
```

FROM Boats1 b, Reserves r
WHERE b.bid = r.bid
AND b.color = 'red'
GROUP BY b.bid;
```
![output](exp-2 output22)

##31. Find the average age of sailors for each rating level that has at least two sailors.
```

SELECT rating, AVG(age)
FROM Sailors
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](exp-2 output23)

##32. Find the average age of voting-age sailors (≥18) for each rating level with at least two sailors.
```

SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![output](exp-2 output24)

##33. Find the average age of voting-age sailors (≥18) for each rating level with at least two such sailors.
```

SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
GROUP BY rating);HAVING COUNT(*) >= 2;
```
![output](exp-2 output25)

##34. Find the ratings for which the average age is the minimum.
```

SELECT rating
FROM Sailors
GROUP BY rating
HAVING AVG(age) <= ALL (
SELECT AVG(age)
FROM Sailors
SELECT b.bid, COUNT(*)
HAVING COUNT(*) >= 2;
SELECT rating, MIN(age)
FROM Sailors
SELECT rating, MIN(age)
FROM Sailors
WHERE rating = 10);
```
![output](exp-2 output26)

