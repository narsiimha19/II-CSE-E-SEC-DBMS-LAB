## 1.Find the names and ages of all sailors. 
```
SELECT sname,age FROM sailors;
```

![output](2b1.png)

## 2.Find all sailors with a rating above 7.
```
SELECT *FROM sailors
WHERE rating>7;
```

![output](2b2.png)

## 3.Find the names of sailors who have reserved boat number 103
```
SELECT sname
FROM sailors s,Reserves r
WHERE s.sid = r.sid
AND r.bid=103;
```

![output](2b3.png)

## 4.Find the sids of sailors who have reserved a red boat.
```
SELECT DISTINCT r.sid FROM Reserves r, Boat b
WHERE r.bid=b.bid 
AND b.color='red';
SELECT DISTINCT r.sid FROM Reserves r, Boat b
WHERE r.bid = b.bid
AND b.color = 'red';
```

![output](2b4.png)

## 5.Find the names of sailors who have reserved a red boat.
```
SELECT DISTINCT sname FROM
sailors s, Reserves r,Boat b
WHERE s.sid=r.sid
AND r.bid=b.bid AND
b.color='red';
```
## 6.Find the colors of boats reserved by Lubber.

```
SELECT DISTINCT b.color
FROM sailors s,Reserves r,
Boat b
WHERE s.sid=r.bid
AND r.bid=b.bid
AND sname='Lubber';
````
![output](2b6.png)

## 9.Compute increments for the ratings of persons who have sailed two different boats on the same day.
``` 
SELECT age FROM sailors
WHERE sname LIKE 'B-%B';
```
![output](2b9.png)

## 12.Find the sids of all sailors who have reserved red boats but not green boats.
```
SELECT DISTINCT r.sid
FROM Reserves r,Boat b
WHERE r.bid = b.bid
AND b.color = 'red'
MINUS
SELECT DISTINCT r.sid FROM Reserves r,Boat b
AND b.color = 'green';
```

![output](2b12.png)

## 13.Find all sids of sailors who have a rating of 10 or have reserved boat 104
```
SELECT sid FROM sailors
WHERE rating = 10 UNION
SELECT sid FROM Reserves 
WHERE bid=104;
```

![output](2b13.png)

## 14.Find the names of sailors who have reserved boat 103
```
SELECT sname FROM sailors 
WHERE sid IN(
SELECT sid FROM Reserves
WHERE bid=103 );
```

![output](2b14.png)

## 15.Find the names of sailors who have reserved a red boat
```
SELECT DISTINCT sname
FROM sailors s,Reserves r,Boat b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red';
```

![output](2b15.png)
## 16.Find the names of sailors who have reserved boat number 103
```
SELECT sname FROM Sailors
WHERE sid IN (
SELECT sid FROM Reserves
WHERE bid = 103 );
```

![output](2b16.png)

## 17.Find sailors whose rating is better than some sailor called Horatio.
```
SELECT * FROM Sailors
WHERE rating > ANY (
SELECT rating FROM Sailors
WHERE sname = 'Horatio' );
```

![output](2b17.png)

## 18.Find sailors whose rating is better than every sailor called Horatio.
```
SELECT * FROM Sailors
WHERE rating > ALL (
SELECT rating FROM Sailors
WHERE sname = 'Horatio' );
```

![output](2b18.png)

## 19.Find the sailors with the highest rating.
```
SELECT * 
FROM Sailors
WHERE rating = (
SELECT MAX(rating) 
FROM Sailors );
```

![output](2b19.png)

## 20.Find the names of sailors who have reserved both a red and a green boat.
```
SELECT s.sname
FROM Sailors s
WHERE EXISTS (
SELECT * 
FROM Reserves r, Boat b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red')
AND EXISTS (
SELECT * 
FROM Reserves r, Boat b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'green' );
```

![output](2b20.png)

## 21.Find the names of sailors who have reserved all boats.
```
SELECT sname
FROM Sailors s
WHERE NOT EXISTS (
SELECT bid 
FROM Boat
MINUS
SELECT bid 
FROM Reserves
WHERE sid = s.sid);
```

![output](2b21.png)

## 22.Find the average age of all sailors.
```
SELECT AVG(age) FROM Sailors;
```

![output](2b22.png)

## 23.Find the average age of sailors with a rating of 10.
```
SELECT AVG(age) FROM Sailors
WHERE rating = 10;
```

![output](2b23.png)

## 24.Find the name and age of the oldest sailor.
```
SELECT sname, age FROM Sailors
WHERE age = (
SELECT MAX(age) FROM Sailors);
```

![output](2b24.png)
## 25.Count the number of sailors.
```
SELECT COUNT(*) FROM Sailors;
```

![output](2b25.png)

## 26.Count the number of different sailor names.
```
SELECT COUNT(DISTINCT sname) FROM Sailors;
```

![output](2b26.png)

## 27.Find the names of sailors who are older than the oldest sailor with a rating of 10.
```
SELECT sname FROM Sailors
WHERE age > (
SELECT MAX(age) FROM Sailors
WHERE rating = 10);
```

![output](2b27.png)

## 28.Find the age of the youngest sailor for each rating level.
```
SELECT rating, MIN(age)
FROM Sailors
GROUP BY rating;
```

![output](2b28.png)

## 29.Find the age of the youngest sailor who is eligible to vote (i.e., is at least 18 years old) for each rating level with at least two such sailors.
```
SELECT rating, MIN(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```

![output](2b29.png)
## 30.For each red boat, find the number of reservations for this boat.
```
SELECT b.bid, COUNT(*)
FROM Boat b, Reserves r
WHERE b.bid = r.bid
AND b.color = 'red'
GROUP BY b.bid;
```

![output](2b30.png)

## 31.Find the average age of sailors for each rating level that has at least two sailors.
```
SELECT rating, AVG(age)
FROM Sailors
GROUP BY rating
HAVING COUNT(*) >= 2;
```

![output](2b31.png)

## 32.Find the average age of sailors who are of voting age (i.e., at least 18 years old) for each rating level that has at least two sailors.
```
SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```

![output](2b32.png)

## 33.Find the average age of sailors who are of voting age (i.e., at least 18 years old) for each rating level that has at least two such sailors.
```
SELECT rating, AVG(age)
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```

![output](2b33.png)

## 34.Find those ratings for which the average age of sailors is the minimum over all ratings.
```
SELECT rating FROM Sailors
GROUP BY rating
HAVING AVG(age) <= ALL (
SELECT AVG(age) FROM Sailors
GROUP BY rating);
```
![output](2b34.png)
 
## 11.Find the names of sailors who have reserved both a red and a green boat.
```
SELECT s.name
FROM sailors s
WHERE EXISTS(
SELECT*FROM Reserves,Boat
b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red')
AND EXISTS(
SELECT*FROM Reserves r,Boat
b
WHERE s.sid=r.bid
AND r.bid=b.bid
AND b.color='green');
```
![output](2b11.png)

## 10.Find the names of Sailors who reserved a red boat or a green boat.
```
SELECT DISTINCT bname
FROM sailors s,Reserves
r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color
IN('red','green');
```
![output](2b10.png)

## 8.Compute increments for the ratings of persons who have sailed two different boats on the same day.
```
UPDATE sailors
SET ratimg=rating+1
WHERE sid IN (
SELECT r1.sid FROM Reserves
r1,Reserves r2
WHEREr1.sid=r2.sid
AND r1.day=r2.day
AND r1.bid.<>r2.bid
);
```
![output](2b8.png)

## 7.Find the names of sailors who have reserved at least one boat.
```
SELECT DISTINCT s.name
FROMsailors s, Reserves r
WHEREs s.sid=r.sid;
```
![output](2b7.png)
