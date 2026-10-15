# 1(a) 1.CREATE TABLES OF THE ABOVE DATABASE WITHOUT CONSTRAINTS.
```

CREATE TABLE student
(
 "name" VARCHAR2(20),
 student_number NUMBER,
 "class"  NUMBER,
 major varchar2(20)
 );
  
CREATE TABLE course
(
 course_name varchar(30),
 course_number NUMBER,
 credit_hours NUMBER,
 department VARCHAR2(30)
 );
 
CREATE TABLE section1
(
 section_identifier NUMBER,
 course_number VARCHAR2(20),
 semester VARCHAR2(30),
 "year" NUMBER,
 instructor VARCHAR2(30)
); 

CREATE TABLE grand_report
(
 student_number NUMBER,
 section_identifier NUMBER,
 grade VARCHAR2(10)
);
```

![OUTPUT](OP-1.png)

#1(a) 2.INSERT All Values inside the table.
```

INSERT INTO Student VALUES ('Smith',17,1,'CS');
INSERT INTO Student VALUES ('Brown',8,2,'CS');

INSERT INTO Courses VALUES('Intro to Computer Science','CS1310',4,'CS');
INSERT INTO Courses VALUES('Data Structures','CS3320',4,'CS'); 
INSERT INTO Courses VALUES('Discrete Mathematics','MATH2410',3,'MATH');
INSERT INTO Courses VALUES('Database','CS3380',3,'CS');

INSERT INTO Section VALUES(85,'MATH2410','Fall',07,'King');
INSERT INTO Section VALUES(92,'CS1310','Fall',07,'Anderson');
INSERT INTO Section VALUES(102,'CS3320','Spring',08,'Knuth');
INSERT INTO Section VALUES(112,'MATH2410','Fall',08,'Chang');
INSERT INTO Section VALUES(119,'CS1310','Fall',08,'Anderson');
INSERT INTO Section VALUES(135,'CS3380','Fall',08,'Stone');

INSERT INTO Grade_report VALUES(17,112,'B');
INSERT INTO Grade_report VALUES(17,119,'C');
INSERT INTO Grade_report VALUES(8,85,'A');
INSERT INTO Grade_report VALUES(8,92,'A');
INSERT INTO Grade_report VALUES(8,102,'B');
INSERT INTO Grade_report VALUES(8,135,'A');
```
![OUTPUT](OP-2.png)

#1(a) 3.DESCRIBE All Tables.
```
DESC Student;
DESC Course;
DESC Section;
DESC Grade_report;
```
![OUTPUT](OP-3.png)

#1(a) 4.List the created tables.
```
SELECT * FROM tab;
```
![OUTPUT](OP-4.png)

#1(a) 5.Display the Values of each table.
```
SELECT * FROM Student;
SELECT * FROM Courses;
SELECT * FROM Section;
SELECT * FROM Grade_report;
```
![OUTPUT](OP-5a.png)
![OUTPUT](OP-5b.png)
![OUTPUT](OP-5c.png)
![OUTPUT](OP-5d.png)

#1(a) 6.Delete All Tables.
```
DROP TABLE Student;
DROP TABLE Course;
DROP TABLE Section;
DROP TABLE Grade_report;
```
![OUTPUT](OP-6.png)

#1(b) 1.Implimentation of the tables using constraints.
```
CREATE TABLE Student(
Name VARCHAR2(20)NOT NULL,
Student_no NUMBER PRIMARY KEY,
class NUMBER,
Major VARCHAR2(10) NOT NULL);

CREATE TABLE Course(
Course_name VARCHAR2(20),
Course_no VARCHAR2(10) PRIMARY KEY,
Credit_hours NUMBER NOT NULL,
Department VARCHAR2(10));

CREATE TABLE Section(
Section_identifier NUMBER PRIMARY KEY,
Course_no VARCHAR2(10),
Semester VARCHAR2(10) NOT NULL,
"Year" NUMBER,
Instructor VARCHAR2(20));

CREATE TABLE Grade_report(
Student_no NUMBER,
Section_id NUMBER,
Grade VARCHAR2(2),
PRIMARY KEY (Student_no,Section_id));

```
![OUTPUT](OT-1.png)

#1(b) 2.Display the description of each table.
```
DESC Student;
DESC Course;
DESC Section;
DESC Grade_report;
```
![OUTPUT](OT-2.png)

#1(b) 3.Insert Values in each table.
```
INSERT INTO Student VALUES ('Smith',17,1,'CS');
INSERT INTO Student VALUES ('Brown',8,2,'CS');

INSERT INTO Courses VALUES('Intro to Computer Science','CS1310',4,'CS');
INSERT INTO Courses VALUES('Data Structures','CS3320',4,'CS'); 
INSERT INTO Courses VALUES('Discrete Mathematics','MATH2410',3,'MATH');
INSERT INTO Courses VALUES('Database','CS3380',3,'CS');

INSERT INTO Section VALUES(85,'MATH2410','Fall',07,'King');
INSERT INTO Section VALUES(92,'CS1310','Fall',07,'Anderson');
INSERT INTO Section VALUES(102,'CS3320','Spring',08,'Knuth');
INSERT INTO Section VALUES(112,'MATH2410','Fall',08,'Chang');
INSERT INTO Section VALUES(119,'CS1310','Fall',08,'Anderson');
INSERT INTO Section VALUES(135,'CS3380','Fall',08,'Stone');

INSERT INTO Grade_report VALUES(17,112,'B');
INSERT INTO Grade_report VALUES(17,119,'C');
INSERT INTO Grade_report VALUES(8,85,'A');
INSERT INTO Grade_report VALUES(8,92,'A');
INSERT INTO Grade_report VALUES(8,102,'B');
INSERT INTO Grade_report VALUES(8,135,'A');
```
![OUTPUT](OT-3.png)

#1(b) 4.Display the inserted values of each table.
```
DESC Student;
DESC Course;
DESC Section;
DESC Grade_report;
```
![OUTPUT](OT-4a.png)
![OUTPUT](OT-4b.png)
![OUTPUT](OT-4c.png)
![OUTPUT](OT-4d.png)

#1(b) 5.Add branch attribute in student and describe.
```
ALTER TABLE Student ADD BRANCH VARCHAR2(10);
DESC Student;
```
![OUTPUT](OT-5.png)

#1(b) 6Copy major values into branch.
```
UPDATE Student SET BRANCH=Major;
SELECT * FROM Student;
```
![OUTPUT](OT-6.png)

#1(b) 7.Remove Major attribute.
```
ALTER TABLE Student
DROP COLUMN Major;
```
![OUTPUT](OT-7.png)

#1(b) 8.Change course number to CID and Describe,
```
ALTER TABLE Course RENAME COLUMN Course_no TO CID;
DESC Course;
```
![OUTPUT](OT-8.png)

#1(b) 9.Change credit_hours of database course to 4.
```
UPDATE Course
SET Credit_hours=4
WHERE Course_name='Database';
SELECT  * FROM Course; 
```
![OUTPUT](OT-9.png)

#1(b) 10.Put NOT NULL Constraints on BRANCH.
```
ALTER TABLE Student 
MODIFY BRANCH VARCHAR2(10) NOT NULL;
```
![OUTPUT](OT-10.png)

#1(b) 11.Rename student table to pupil.
```
ALTER TABLE Student RENAME TO Pupil;
```
![OUTPUT](OT-11.png)

#1(b) 12.Remove the student table.
```

DROP TABLE pupil;
```
![OUTPUT](OT-12.png)

#1(b) 13.Remove rows of 'Fall' semester.
```
DELETE FROM Section WHERE Semester='Fall';
SELECT * FROM Section;
```
![OUTPUT](OT-13.png)

#1(b) 14.Remove 'Data Structures' Row.
```
DELETE FROM Course WHERE Course_name='Data Structures';
SELECT * FROM Course;
```
![OUTPUT](OT-14.png)

#1(b) 15.Remove all rows using TRUNCATE.
```
TRUNCATE TABLE Pupil;
TRUNCATE TABLE Course;
TRUNCATE TABLE Section;
TRUNCATE TABLE Grade_report;
```
![OUTPUT](OT-15.png)

#1(b) 16.Remove pupil,course and section.
```
DROP TABLE PUPIL;
DROP TABLE COURSE;
DROP TABLE SECTION;
DROP TABLE GRADE_REPORT;
```
![OUTPUT](OT-16.png)

#1(b) 17.Remove grade_report and PREREQUISITE permanently.
```
DROP TABLE GRADE_REPORT PURGE;
DROP TABLE PREREQUISITE PURGE;
```


