## CREATE STUDENT TABLE
```
CREATE TABLE Student2 (
Name VARCHAR2(20),
Student_number NUMBER,
Class NUMBER,
Major VARCHAR2(10) );
```
![OUTPUT](Student output.png)
## DESCRIBE STUDENT TABLE
```
DESC Student2;
```
## INSERT STUDENT TABLE
```
INSERT INTO Student2
VALUES('Smith',17,1,'CS');
INSERT INTO Student2
VALUES('Brown',8,2,'CS');
```
## DISPLAY STUDENT TABLE
```
SELECT *FROM Student2;
```


## CREATE COURSE TABLE
```
CREATE TABLE Course2 (
Course_name VARCHAR2(50),
Course_number NUMBER,
Credit_hours NUMBER,
Department VARCHAR2(20) );
```
![OUTPUT](course output.png)
## DESCRIBE COURSE TABLE
```
DESC Course2;
```
## INSERT COURSE TABLE
```
INSERT INTO Course2
VALUES('Intro to Computer Science',1301,4,'CS');
INSERT INTO Course2
VALUES('Data Structures',1321,4,'CS');
```
## DISPLAY COURSE TABLE
```
SELECT * FROM Course2;
```

## CREATE SECTION TABLE
```
CREATE TABLE Section3 (
Section_identifier NUMBER,
Course_number VARCHAR(20),
Semester VARCHAR2(10),
Year NUMBER,
Instructor VARCHAR2(30) );
```
![OUTPUT](section output.png)
 
## DESCRIBE SECTION TABLE
```
DESC Section3;
```
## INSERT SECTION TABLE
```
INSERT INTO Section3
VALUES(85,'MATH2410','fall',2007,'king');
SELECT * FROM Section3;
INSERT INTO Section3
VALUES(92,'CS1310','spring',2008,'stone');
SELECT * FROM Section3;
```
## DISPLAY SECTION TABLE
```
SELECT *FROM Section3;
```


## CREATE GRADE_REPORT TABLE
```
CREATE TABLE Grade_Report2 (
Student_number NUMBER,
Section_identifier NUMBER,
Grade VARCHAR2(5) );
```
![OUTPUT](grade output.png)
## DESCRIBE GRADE_REPORT TABLE 
```
DESC Grade_Report2;
```
## INSERT GRADE_REPORT TABLE
```
INSERT INTO Grade_Report2
VALUES(17,112,'B');
SELECT * FROM Grade_Report2;
INSERT INTO Grade_Report2
VALUES(8,83,'C');
SELECT * FROM Grade_Report2;
```
## DISPLAY GRADE_REPORT TABLE
```
SELECT *FROM Grade_Report2;
```
