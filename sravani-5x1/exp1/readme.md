## CREATE STUDENT TABLE
```
CREATE TABLE student(
name VARCHAR2(20),
student_number NUMBER,
class NUMBER,
major VARCHAR2(30));
```
## DESCRIBE STUDENT TABLE
```
DESC student;
```
## INSERT INTO STUDENT TABLE
```
INSERT INTO student VALUES('smith',17,1,'cs');
INSERT INTO student VALUES('BROWN',8,2,'cs');
```
## DISPLAY STUDENT TABLE
```
SELECT * FROM student;
```
![output](student output)

## CREATE SECTION TABLE
``` 
CREATE TABLE section1(
section_identifier NUMBER,
course_number VARCHAR2(10),
year NUMBER,
instrutor VARCHAR2(30));
```
## DESCRIBE SECTION TABLE
```
DESC section1;
```
## INSERT INTO SECTION TABLE
```
INSERT INTO section1 VALUES(85,'math2410',07,'king');
INSERT INTO section1 VALUES(92,'cs1310',07,'anderson');
INSERT INTO section1 VALUES(102,'cs3320',08,'knuth');
INSERT INTO section1 VALUES(112,'math2410',08,'chang');
INSERT INTO section1 VALUES(119,'cs1310',08,'anderson');
INSERT INTO section1 VALUES(135,'cs3380',08,'stone');
```
## DISPLAY SECTION TABLE
```
SELECT * FROM section1;
```
![output](section output)
## CREATE COURSE TABLE
```
CREATE TABLE course1 (
course_name VARCHAR2(30),
course_number VARCHAR2(20),
credit_hours NUMBER,
department VARCHAR2(20));
```
## DESCRIBE COURSE TABLE
```
DESC course1;
```
## INSERT INTO COURSE TABLE
```
INSERT INTO course1
VALUES('intro to computer science','cs1310',4,'cs');
INSERT INTO course1
VALUES('data structure','cs3320',4,'cs');
INSERT INTO course1
VALUES('discrete mathematics','math2410',3,'math');
INSERT INTO course
VALUES('database','cs3380',3,'cs');
```
## DISPLAY COURSE TABLE
```
SELECT * FROM course1;
```
![output](course output)

