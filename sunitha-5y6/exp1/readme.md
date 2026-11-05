_STUDENT
CREATE TABLE Student2 (
Name VARCHAR2(20),
Student_number NUMBER,
Class NUMBER,
Major VARCHAR2(10) );


__COURSE
CREATE TABLE Course2 (
Course_name VARCHAR2(50),
Course_number NUMBER,
Credit_hours NUMBER,
Department VARCHAR2(20) );



__SECTION
CREATE TABLE Section3 (
Section_identifier NUMBER,
Course_number VARCHAR(20),
Semester VARCHAR2(10),
Year NUMBER,
Instructor VARCHAR2(30) );



__GRADE_REPORT
CREATE TABLE Grade_Report2 (
Student_number NUMBER,
Section_identifier NUMBER,
Grade VARCHAR2(5) );


INSERT INTO Student2
VALUES('Smith',17,1,'CS');
SELECT *FROM Student2;
INSERT INTO Student2
VALUES('Brown',8,2,'CS');
SELECT *FROM Student2;
![output](student table)

INSERT INTO Course2
VALUES('Intro to Computer Science',1301,4,'CS');
SELECT * FROM Course2;
INSERT INTO Course2
VALUES('Data Structures',1321,4,'CS');
SELECT * FROM Course2;
![output](course table)

INSERT INTO Section3
VALUES(85,'MATH2410','fall',2007,'king');
SELECT * FROM Section3;
INSERT INTO Section3
VALUES(92,'CS1310','spring',2008,'stone');
SELECT * FROM Section3;
![output](section table)

INSERT INTO Grade_Report2
VALUES(17,112,'B');
SELECT * FROM Grade_Report2;
INSERT INTO Grade_Report2
VALUES(8,83,'C');
SELECT * FROM Grade_Report2;
![output](grade_report table)



