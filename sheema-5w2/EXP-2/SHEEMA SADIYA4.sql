CREATE TABLE sailors(
sid NUMBER PRIMARY KEY,
sname VARCHAR2(20) NOT NULL,
rating NUMBER,
age REAL 
);

DESC Sailors;

INSERT INTO sailors
VALUES(22,'Dustin',7,45.0);
INSERT INTO sailors
VALUES(29,'Brutus',1,33);
INSERT INTO sailors
VALUES(31,'Lubber',8,55.50);
INSERT INTO sailors
VALUES(32,'Andy',8,25.5);
INSERT INTO sailors
VALUES(58,'Rusty',10,35.5);
INSERT INTO sailors
VALUES(64,'Horatio',7,35);
INSERT INTO sailors
VALUES(74,'horatio',9,35);
INSERT INTO sailors
VALUES(85,'art',3,25.5);
INSERT INTO sailors
VALUES(95,'Bob',3,63.5);

SELECT * FROM sailors;

CREATE TABLE boats(
bid NUMBER PRIMARY KEY,
bname VARCHAR2(20),
color VARCHAR2(10)
);

DESC boats;

INSERT INTO boats
VALUES(101,'Interlake','blue'),(102,'Interlake','red'),(103,'Clipper','green'),(104,'Marine','red');

SELECT * FROM boats;

CREATE TABLE reserves(
sid NUMBER,
bid NUMBER,
day DATE,
PRIMARY KEY(sid,bid,day),
FOREIGN KEY(sid)REFERENCES sailors(sid),
FOREIGN KEY(bid)REFERENCES boats(bid)
);

DESC reserves;

INSERT INTO reserves
VALUES(22,101,TO_DATE('10/10/98','MM/DD/YY')),(22,102,TO_DATE('10/10/98','MM/DD/YY')),(22,103,TO_DATE('10/8/98','MM/DD/YY'));
INSERT INTO reserves
VALUES(22,104,TO_DATE('10/7/98','MM/DD/YY'));
INSERT INTO reserves
VALUES(31,102,TO_DATE('11/10/98','MM/DD/YY'));
INSERT INTO reserves
VALUES(31,103,TO_DATE('11/6/98','MM/DD/YY'));
INSERT INTO reserves
VALUES(31,104,TO_DATE('11/12/98','MM/DD/YY'));
INSERT INTO reserves
VALUES(64,101,TO_DATE('9/5/98','MM/DD/YY'));
INSERT INTO reserves
VALUES(64,102,TO_DATE('9/8/98','MM/DD/YY'));
INSERT INTO reserves
VALUES(74,103,TO_DATE('9/8/98','MM/DD/YY'));


SELECT * FROM reserves;
