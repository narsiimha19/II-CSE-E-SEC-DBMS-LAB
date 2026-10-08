## CREATING TABLES OF THE DATABASE WITHOUT CONSTRATAINTS
```
CREATE TABLE Student(
Name VARCHAR2(30),
Student_number NUMBER,
Class NUMBER,
Major VARCHAR2(50) );

CREATE TABLE Course (
Course_Name VARCHAR2(20),
Course_Number NUMBER,
Credit_Hours NUMBER,
Department VARCHAR2(30) );

CREATE TABLE Section(
Section_Identifier NUMBER,
Course_Number NUMBER,
Semester VARCHAR2(20),
Year NUMBER,
Instructor VARCHAR2(40));

CREATE TABLE Grade_Report(
Student_Number NUMBER,
Section_Identifier NUMBER,
Grade CHAR(2));
```

![output](1a.png)

## INSERT ALL VALUES INSIDE THE TABLE
```
INSERT INTO Student VALUES('Smith',17,1,'CS'),('Brown',8,2,'CS'),('Jaylor',25,3,'Math');
INSERT INTO Course VALUES('INTRO-TO-CS',1301,3,'CS'),('DATA-STRUCTURE',1310,3,'CS'),('Database',3320,3,'CS');
INSERT INTO Section VALUES(85,1301,'FALL',2007,'King'),(92,1301,'FALL',2008,'Anderson'),(102,3320,'Spring',2008,'Knuth'),(112,2410,'Fall',2008,'Chang'),(119,1310,'Fall',2008,'Stone'),(135,3380,'Fall',2008,'Stone');
INSERT INTO Grade_Report VALUES(17,112,'B'),(17,119,'C'),(8,85,'A'),(8,92,'A'),(8,102,'B'),(8,135,'A');
```

![output](1b.png)

## DESCRIBE ALL TABLES
```
DESC Student;
DESC course;
DESC Section;
DESC Grade_Report;
```

![output](1c.png)

## LIST THE CREATED TABLES
```
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Section;
SELECT * FROM Grade_Report;
```

![output](1d.png)

## DISPLAY THE VALUES OF EACH TABLE
```
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Section;
SELECT * FROM Grade_Report;
```

![output](1e.png)

## DELETE ALL TABLES
```
DROP TABLE student;
DROP TABLE Course;
DROP TABLE Section;
DROP TABLE grade_report;
```
![output](1f.png)
