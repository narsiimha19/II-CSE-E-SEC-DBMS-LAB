## 1.Implement the tables using above contraints
```
CREATE TABLE Student(
Name VARCHAR2(30),
Student_number NUMBER PRIMARY KEY,
Class NUMBER,
Major VARCHAR2(50) );

CREATE TABLE Course (
Course_Name VARCHAR2(20),
Course_Number NUMBER PRIMARY KEY,
Credit_Hours NUMBER,
Department VARCHAR2(30) );

CREATE TABLE Section(
Section_Identifier NUMBER PRIMARY KEY,
Course_Number NUMBER,
Semester VARCHAR2(20),
Year NUMBER,
Instructor VARCHAR2(40),
FOREIGN KEY(Course_Number) REFERENCES Course(course_Number) );

CREATE TABLE Grade_Report(
Student_Number NUMBER,
Section_Identifier NUMBER,
Grade CHAR(2),
PRIMARY KEY(Student_Number,Section_Identifier),
FOREIGN KEY(Student_Number) REFERENCES Student(Student_Number),
FOREIGN KEY(Section_Identifier) REFERENCES Section(Section_Identifier) );

CREATE TABLE Prerequisite(
Course_Number NUMBER,
Prerequisite_Number NUMBER,
PRIMARY KEY(Course_Number),
FOREIGN KEY(Course_Number) REFERENCES Course(Course_Number) );
```

![output](1 of 17.png)

## 2.Display the decription of each table
```
DESC Student;
DESC course;
DESC Section;
DESC Grade_Report;
DESC Prerequisite;
```

![output](2 of 17.png)

## 3.Insert the values specified by the above database
```
INSERT INTO Student VALUES('Smith',17,1,'CS'),('Brown',8,2,'CS'),('Jaylor',25,3,'Math');
INSERT INTO Course VALUES('INTRO-TO-CS',1301,3,'CS'),('DATA-STRUCTURE',1310,3,'CS'),('Database',3320,3,'CS');
INSERT INTO Section VALUES(85,1301,'FALL',2007,'King'),(92,1301,'FALL',2008,'Anderson'),(102,3320,'Spring',2008,'Knuth');
INSERT INTO Grade_Report VALUES(17,85,'A'),(8,92,'B'),(25,102,'A');
INSERT INTO prerequisite VALUES(1301,1301),(3320,1310);
COMMIT;
```

![output](3 of 17.png)

## 4.Display the instances of each table in the database
```
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Section;
SELECT * FROM Grade_Report;
SELECT * FROM Prerequisite;
```

![output](4 of 17.png)

## 5.All branch attribute in student table and Describe the table
```
ALTER TABLE Student
ADD Branch VARCHAR2(20);
DESC Student;
```

![output](5 of 17.png)

## 6.Copy Major attribure values into branch attribute and display it
```
UPDATE Student
SET Branch = Major;
SELECT * FROM Student;
```

![output](6 of 17.png)

## 7.Remove the Major attribute in Student
```
ALTER TABLE Student
DROP COLUMN Major;
```

![output](7 of 17.png)

## 8.Change the name of Course_number to cid in course and describe it
```
ALTER TABLE Course
RENAME COLUMN Course_Number TO CID;
DESC Course;
```

![output](8 of 17.png)

## 9.change the value of credit-hrs of database to 4 in course
```
UPDATE Course
SET Credit_Hrs = 4;
SELECT * FROM Course;
```

![output](9 of 17.png)

## 10.Put NOT NULL CONSTRAINT to column branch in student
```
ALTER TABLE Student
MODIFY BRANCH VARCHAR2(20) NOT NULL;
```

![output](10 of 17.png)

## 11.Replace the student table name to pupil
```
RENAME Student to pupil;
```

![output](11 of 17.png)

## 12.Remove the student table
```
DROP TABLE student;
```

![output](12 of 17.png)

## 13.Remove the rows of 'Fall' Semester in section
```
DELETE FROM Section
WHERE Semester = 'Fall';
COMMIT;
```

![output](13 of 17.png)

## 14.Remove the row of 'Data_structure' in Course
```
DELETE FROM Course
WHERE Course_Name = 'Data_Structure';
COMMIT;
```

![output](14 of 17.png)

## 15.Remove all rows in all tables using TRUNCATE table
```
TRUNCATE TABLE Grade_Report;
TRUNCATE TABLE Section;
TRUNCATE TABLE Course;
TRUNCATE TABLE Pupil;
```

![output](15 of 17.png)

## 16.Remove pupil, course and section table so that it exist in recycle bin
```
DROP TABLE Pupil;
DROP TABLE Course;
DROP TABLE Section;
```

![output](16 of 17.png)

## 17.Remove Grade_Report & Prerequisites table permanently
```
DROP TABLE Grade_Report PURGE;
DROP TABLE Prerequisite PURGE;
```

![output](17 of 17.png)
