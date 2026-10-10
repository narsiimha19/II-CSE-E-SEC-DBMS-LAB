##1. Find the names and ages of all sailors.
```
SELECT sname, age FROM Sailors;
```
![OUTPUT](exp2 1Q)
##2.Find all sailors with a rating above 7.
```
SELECT * FROM Sailors
WHERE rating > 7;
```
![OUTPUT](exp2 2Q)


##3.Find the names of sailors who have reserved boat number 103.
```
SELECT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;
```
![OUTPUT](exp2 3Q)


##4. Find the sids of sailors who have reserved a red boat.
```
SELECT DISTINCT r.sid
FROM Reserves r, Boats1 b
WHERE r.bid = b.bid
AND b.color = 'red';
```
![OUTPUT](exp2 4Q)

##5. Find the names of sailors who have reserved a red boat.
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats1 b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red';
```
![OUTPUT](exp2 5Q)

##6. Find the colors of boats reserved by Lubber.
```
SELECT DISTINCT b.color
FROM Sailors s, Reserves r, Boats1 b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND s.sname = 'Lubber';
```
![OUTPUT](exp2 6Q)

##7. Find the names of sailors who have reserved at least one boat.
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid;
```
![OUTPUT](exp2 7Q)

##8. Compute increments for the ratings of persons who have sailed two different boats on the same day.
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
```
![OUTPUT](exp2 8Q)

##9. Find the ages of sailors whose name begins and ends with B and has at least three characters.
```
SELECT age
FROM Sailors
WHERE sname LIKE 'B_%B';
```
![OUTPUT](exp2 9Q)

##10. Find the names of sailors who reserved a red boat or a green boat.
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats1 b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color IN ('red','green');
```
![OUTPUT](exp2 10Q)

##11. Find the names of sailors who have reserved both a red and a green boat.
```
SELECT s.sname
FROM Sailors s
WHERE EXISTS (
SELECT *
FROM Reserves r, Boats1 b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red')
FROM Reserves r, Boats1 b
WHERE s.sid = r.sid
AND b.color = 'green');
```
![OUTPUT](exp2 11Q)

##12q
```
SELECT DISTINCT r.sid
FROM Reserves r, Boats1 b
WHERE r.bid = b.bid
MINUS
SELECT DISTINCT r.sid
WHERE r.bid = b.bid
AND b.color = 'green';
```
![OUTPUT](exp2 12Q)

##13. Find all sids of sailors who have a rating of 10 or have reserved boat 104.
```
SELECT sid FROM Sailors
WHERE rating = 10
UNION
SELECT sid FROM Reserves
WHERE bid = 104;
```
![OUTPUT](exp2 13Q)

##14. Find the names of sailors who have reserved boat 103.
```
FROM Sailors
WHERE sid IN (
SELECT sid
FROM Reserves
WHERE bid = 103);
```
![OUTPUT](exp2 14Q)

##15. Find the names of sailors who have reserved a red boat.
```
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats1 b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red';
```
![OUTPUT](exp2 15Q)


##16. Find the names of sailors who have reserved boat number 103.
```
SELECT sname
FROM Sailors
WHERE sid IN (
SELECT sid
FROM Reserves
WHERE bid = 103);
```
![OUTPUT](exp2 16Q)

##17. Find sailors whose rating is better than some sailor called Horatio.
```
SELECT *
FROM Sailors
WHERE rating > ANY (
SELECT rating
FROM Sailors
WHERE sname = 'Horatio');

SELECT sname
```
![OUTPUT](exp2 17Q)

##18. Find sailors whose rating is better than every sailor called Horatio.
```
SELECT *
FROM Sailors
WHERE rating > ALL (
FROM Reserves r, Boats1 b
SELECT rating
FROM Sailors
WHERE sname = 'Horatio');
```
![OUTPUT](exp2 18Q)

##19. Find the sailors with the highest rating.
```
SELECT *
FROM Sailors
WHERE rating = (
SELECT MAX(rating)
FROM Sailors);
```
![OUTPUT](exp2 19Q)

##20. Find the names of sailors who have reserved both a red and a green boat.
```
SELECT s.sname
FROM Sailors s
WHERE EXISTS (
SELECT * FROM Reserves r, Boats1 b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red')
AND EXISTS (
SELECT * FROM Reserves r, Boats1 b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='green');
```
![OUTPUT](exp2 20Q)


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
![OUTPUT](exp2 21Q)

##22. Find the average age of all sailors.
```
SELECT AVG(age)
FROM Sailors;
```
![OUTPUT](exp2 22Q)

##23. Find the average age of sailors with a rating of 10.
```
SELECT AVG(age)
FROM Sailors
WHERE rating = 10;
```
![OUTPUT](exp2 23Q)

##24. Find the name and age of the oldest sailor.
```
SELECT sname, age
FROM Sailors
SELECT MAX(age)
FROM Sailors);
```
![OUTPUT](exp2 24Q)

##25. Count the number of sailors.
```
FROM Sailors;
```
![OUTPUT](exp2 25Q)

##26. Count the number of different sailor names.
```
SELECT COUNT(DISTINCT sname)
FROM Sailors;
```
![OUTPUT](exp2 26Q)
##27q
```
SELECT sname
FROM Sailors
WHERE age > (
SELECT MAX(age)
FROM Sailors
WHERE rating = 10);
```
![OUTPUT](exp2 27Q)

##28. Find the age of the youngest sailor for each rating level.
```
SELECT rating, MIN(age)
FROM Sailors
GROUP BY rating;
```
![OUTPUT](exp2 28Q)

##29. Find the age of the youngest sailor eligible to vote (age ≥ 18) for each rating level with at least two sailors.
```
SELECT rating, MIN(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![OUTPUT](exp2 29Q)

##30. For each red boat, find the number of reservations.
```
SELECT b.bid, COUNT(*)
FROM Boats1 b, Reserves r
WHERE b.bid = r.bid
AND b.color = 'red'
GROUP BY b.bid;
```
![OUTPUT](exp2 30Q)

##31. Find the average age of sailors for each rating level that has at least two sailors.
```
SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
SELECT rating, AVG(age)
FROM Sailors
HAVING COUNT(*) >= 2;
```
![OUTPUT](exp2 31Q)

##34. Find the ratings for which the average age is the minimum.
```
SELECT rating
FROM Sailors
HAVING AVG(age) <= ALL (
SELECT AVG(age)
FROM Sailors
GROUP BY rating);GROUP BY rating
GROUP BY rating
WHERE age >= 18
```
![OUTPUT](exp2 34Q)

##33. Find the average age of voting-age sailors (≥18) for each rating level with at least two such sailors.
```
HAVING COUNT(*) >= 2;
GROUP BY rating
```
![OUTPUT](exp2 33Q)

##32. Find the average age of voting-age sailors (≥18) for each rating level with at least two sailors.
```
FROM Sailors
SELECT rating, AVG(age)
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![OUTPUT](exp2 32Q)


