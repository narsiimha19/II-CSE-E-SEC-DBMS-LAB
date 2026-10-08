

## 1.Find the names and ages of all sailors
```
SELECT sname,age FROM sailors;
```

## 2.Find all sailors with a rating above 7
```
SELECT *FROM sailors
WHERE rating>7;
```

## 3.Find the names of sailors who have reserved boat number 103
```
SELECT sname
FROM sailors s,Reserves3 r
WHERE s.sid = r.sid
AND r.bid=103;
```

## 4.Find the sids of sailors who have reserved a red boat
```
SELECT DISTINCT r.sid
FROM Reserves3 r,Boats b
WHERE r.bid=b.bid
AND color='red';
```

## 5.Find the names of sailors who have reserved a red boat.
```
SELECT DISTINCT sname
FROM sailors s,Reserves3 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red';
```

## 6.Find the colors of boats reserved by Lubber.
```
SELECT DISTINCT b.color
FROM sailors s,Reserves3 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND sname='Lubber';
```

## 7.Find the names of sailors who have reserved at least one boat.
```
SELECT DISTINCT s.sname
FROM sailors s,Reserves3 r
WHERE s.sid=r.sid;
```

## 8.Compute increments for the ratings of persons who have sailed two different boats on the same day.
```
UPDATE sailors
SET rating=rating+1
WHERE sid IN (
SELECT r1.sid FROM Reserves3 r1,Reserves3 r2
WHERE r1.sid=r2.sid
AND r1.day=r2.day
AND r1.bid<>r2.bid );
```

## 9.Find the ages of sailors whose name begins and ends with B and has at least three characters
```
SELECT age FROM sailors
WHERE sname LIKE 'B-%B';
```


## 10.Find the names of Sailors who reserved a red boat or a green boat
```
SELECT DISTINCT bname
FROM sailors s,Reserves3 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color IN('red','green');
```

## 11.Find the names of sailors who have reserved both a red and a green boat
```
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
AND b.color='green' );
```

## 12.Find the sids of all sailors who have reserved red boats but not green boats
```
SELECT DISTINCT r.sid
FROM Reserves3 r,Boats b
WHERE r.bid=b.bid
AND b.color='red'
MINUS
SELECT DISTINCT r.sid FROM Reserves3 r,Boats b
WHERE r.bid=b.bid
AND b.color='green';
```
## 13.Find all sids of sailors who have a rating of 10 or have reserved boat 104
```
SELECT sid FROM sailors
WHERE rating=10 UNION
SELECT sid FROM Reserves3
WHERE bid=104;
```

## 14.Find the names of sailors who have reserved boat 103
```
SELECT sname FROM sailors
WHERE sid IN(
SELECT sid FROM Reserves3
WHERE bid=103 );
```

## 15.Find the names of sailors who have reserved a red boat
```
SELECT DISTINCT sname
FROM sailors s,Reserves3 r,Boats b
WHERE s.sid=r.sid
AND r.bid=b.bid
AND b.color='red';
```
