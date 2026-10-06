CREATE TABLE sailor(
sid NUMBER PRIMARY KEY,
sname VARCHAR2(20),
rating NUMBER,
age REAL );

DESC Sailor;

INSERT INTO sailor
VALUES(22,'DUSTIN',7,45.0);
DESC sailor;
INSERT INTO sailor
VALUES (95,'BOB',3,63.5);
INSERT INTO sailor
VALUES(29,'Brutus',1,33);
INSERT INTO sailor
VALUES(31,'LUBBER',8,55.50);
INSERT INTO sailor
VALUES(32,'ANDY',8,25.5);
INSERT INTO sailor
VALUES(58,'Rusty',10,35.5);
INSERT INTO sailor
VALUES(74,'horatio',9,35);
INSERT INTO sailor
VALUES(85,'art',3,25.5);

SELECT * FROM sailor;
SELECT * FROM sailor;
COMMIT;





CREATE TABLE boats(
bid NUMBER PRIMARY KEY,
bname VARCHAR2(20),
color VARCHAR2(10));


DESC boats;





CREATE TABLE reserves(
sid NUMBER,
bid NUMBER,
day DATE,
PRIMARY KEY(sid,bid,day),
FOREIGN KEY(sid)REFERENCES sailors(sid),
FOREIGN KEY(bid)REFERENCES boats(bid));

DESC reserves;