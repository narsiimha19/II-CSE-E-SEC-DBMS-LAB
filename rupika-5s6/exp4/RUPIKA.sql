

CREATE TABLE DEPARTMENT (
DEPT_ID NUMBER PRIMARY KEY,
DEPT_NAME VARCHAR2(30),
LOCATION VARCHAR2(30)
);

CREATE TABLE EMPLOYEE1 (
EMP_ID NUMBER PRIMARY KEY,
EMP_NAME VARCHAR2(30),
DESIGNATION VARCHAR2(30),
SALARY NUMBER, DEPT_ID NUMBER 
);


INSERT INTO EMPLOYEE1 VALUES (101, 'Rahul', 'Manager', 70000,10);

INSERT INTO EMPLOYEE1 VALUES (102, 'Sneha', 'Analyst', 55000,20);

INSERT INTO EMPLOYEE1 VALUES (103, 'Arjun', 'Developer', 60000,30);

INSERT INTO EMPLOYEE1 VALUES (104, 'Kiran', 'Sales Executive', 50000,40);

INSERT INTO EMPLOYEE1 VALUES (105, 'Priya', 'Tester', 45000, NULL);

INSERT INTO EMPLOYEE1 VALUES (106,'Nikhil', 'Developer', 65000,30);


Q1
CREATE TABLE dept1 (
    dno INT,
    dname VARCHAR(50)
);

Q2
ALTER TABLE dept1
ADD CONSTRAINT pk_dept1 PRIMARY KEY (dno);

ALTER TABLE dept1
MODIFY dname VARCHAR(50) NOT NULL;

Q3
CREATE TABLE studentS1 (
    sid INT,
    sname VARCHAR(50),
    did INT
);
Q4
ALTER TABLE studentS1
ADD CONSTRAINT pk_studentS1 PRIMARY KEY (sid);

ALTER TABLE studentS1
MODIFY sname VARCHAR(50) NOT NULL;

ALTER TABLE studentS1
ADD CONSTRAINT fk_studentS1_dept
FOREIGN KEY (did) REFERENCES dept1(dno);

DESC STUDENTS1;

Q5
INSERT  INTO dept1
VALUES(1, 'CSE');
INSERT  INTO dept1
  VALUES  (2, 'ME');
INSERT  INTO dept1
  VALUES(3, 'CE');
INSERT  INTO dept1
  VALUES(4, 'EEE');
INSERT  INTO dept1
  VALUES(5, 'ECE');
INSERT  INTO dept1
  VALUES(6, 'CSM');
INSERT  INTO dept1
  VALUES(7, 'CSD');

Q6
INSERT INTO studentS1
VALUES(101, 'Rahul', 1);
INSERT INTO studentS1
VALUES(102, 'Priya', 2);
INSERT INTO studentS1
VALUES(103, 'Arun', 3);
INSERT INTO studentS1
VALUES(104, 'Sneha', 4);
INSERT INTO studentS1
VALUES(105, 'Kiran', 5);
INSERT INTO studentS1
VALUES(106, 'Anjali', 6);
INSERT INTO studentS1
VALUES(107, 'Ravi', 7);
INSERT INTO studentS1
VALUES(108, 'Teja', 1);
INSERT INTO studentS1
VALUES(109, 'Naveen', 5);
INSERT INTO studentS1
VALUES(110, 'Divya', 6);
Q7
SELECT *
FROM studentS1 s
NATURAL JOIN
(
    SELECT dno AS did, dname
    FROM dept1
) d;
8.
SELECT *
FROM studentS1 s, dept1 d
WHERE s.did = d.dno;
Q9.
SELECT * FROM studentS1 s, dept1 d
WHERE s.did > d.dno;
Q10
SELECT *
FROM studentS1 s
LEFT OUTER JOIN
(
    SELECT dno AS did, dname
    FROM dept1
) d
USING (did);
Q11
SELECT *
FROM studentS1 s
RIGHT OUTER JOIN
(
    SELECT dno AS did, dname
    FROM dept1
) d
USING (did);

Q12
SELECT * FROM studentS1 s
LEFT JOIN
(
    SELECT dno AS did, dname
    FROM dept1
) d
USING (did)
UNION
SELECT * FROM studentS1 s
RIGHT JOIN
(
    SELECT dno AS did, dname
    FROM dept1
) d
USING (did);
Q13
SELECT *
FROM studentS1 s
LEFT OUTER JOIN dept1 d
ON s.did = d.dno;
Q14
SELECT *
FROM studentS1 s
RIGHT OUTER JOIN dept1 d
ON s.did = d.dno;
Q15
SELECT * FROM studentS1 s
LEFT JOIN dept1 d
ON s.did = d.dno
UNION
SELECT * FROM studentS1 s
RIGHT JOIN dept1 d
ON s.did = d.dno;
SELECT * FROM studentS1 s
LEFT JOIN dept1 d
ON s.did = d.dno
UNION
SELECT * FROM studentS1 s
RIGHT JOIN dept1 d
ON s.did = d.dno;
Q16
SELECT *
FROM studentS1 s
LEFT OUTER JOIN dept1 d
ON s.did > d.dno;
Q17
SELECT *
FROM studentS1 s
RIGHT OUTER JOIN dept1 d
ON s.did > d.dno;
Q18
SELECT *
FROM studentS1 s
LEFT JOIN dept1 d
ON s.did > d.dno
UNION
SELECT *
FROM studentS1 s
RIGHT JOIN dept1 d
ON s.did > d.dno;
Q19
SELECT *
FROM students1
CROSS JOIN dept1;
Q21
SELECT s.sid, s.sname, d.dno, d.dname
FROM studentS1 s
JOIN dept1 d
ON s.did = d.dno;

SELECT s.sid, s.sname, d.dno, d.dname
FROM studentS1 s
LEFT JOIN dept1 d
ON s.did = d.dno;

SELECT s.sid, s.sname, d.dno, d.dname
FROM studentS1 s
RIGHT JOIN dept1 d
ON s.did = d.dno;

SELECT s.sid, s.sname, d.dno, d.dname
FROM studentS1 s
JOIN dept1 d
ON s.did > d.dno;

SELECT s.sid, s.sname, d.dno, d.dname
FROM studentS1 s
CROSS JOIN dept1 d;















