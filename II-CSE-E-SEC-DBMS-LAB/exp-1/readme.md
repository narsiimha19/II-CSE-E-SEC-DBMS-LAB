#WEEK-1 DBMSLAB
#students table creation
CREATE TABLE student (
    name VARCHAR2(50),
    student_number NUMBER,
    class VARCHAR2(20),
    major VARCHAR2(20)
);
![output](create-student)
#course table creation
CREATE TABLE course (
    course_name VARCHAR2(50),
    course_number VARCHAR2(10),
    credit_hours NUMBER,
    department VARCHAR2(30)
);
![output](create-course)
#section table creation
CREATE TABLE section (
    section_identifier NUMBER,
    course_number VARCHAR2(10),
    semester VARCHAR2(20),
    year NUMBER,
    instructor VARCHAR2(50)
);
![output](create-section)
#grade_report table creation
CREATE TABLE grade_report (
    student_number NUMBER,
    section_identifier NUMBER,
    grade VARCHAR2(1)
);
![output](create-gradereport)

#ddescribing of tables
DESC student;
![output](desc-student)
DESC course;
![output](desc-course)
DESC section;
![output](desc-section)
DESC grade_report;
![output](desc-gradereport)
#insertion into student
INSERT INTO student VALUES ('Smith', 17, 1, 'CS');
INSERT INTO student VALUES ('Brown', 18, 2, 'CS');
![output](insert-student)
#insertion into course
INSERT INTO course VALUES ('Intro to Computer Science', 'CS1310', 4, 'CS');
INSERT INTO course VALUES ('Data Structures', 'CS3320', 4, 'CS');
INSERT INTO course VALUES ('Discrete Mathematics', 'MATH2410', 3, 'MATH');
INSERT INTO course VALUES ('Database Systems', 'CS3380', 3, 'CS');
![output](insert-course)
#insertion into section
INSERT INTO SECTION VALUES(85,'MATH2410','Fall',07,'King');
INSERT INTO SECTION VALUES(92,'CS1310','Fall',07,'Anderson');
INSERT INTO SECTION VALUES(102,'CS3320','Spring',08,'Knuth');
INSERT INTO SECTION VALUES(112,'MATH2410','Fall',08,'Chang');
INSERT INTO SECTION VALUES(119,'CS1310','Fall',08,'Anderson');
INSERT INTO SECTION VALUES(135,'CS3320','Fall',08,'Stone');
![output](insert-section)
#insertion into grade_report
INSERT INTO GRADE_REPORT VALUES(17,112,'B');
INSERT INTO GRADE_REPORT VALUES(17,119,'C');
INSERT INTO GRADE_REPORT VALUES(8,85,'A');
INSERT INTO GRADE_REPORT VALUES(8,92,'A');
INSERT INTO GRADE_REPORT VALUES(8,102,'B');
INSERT INTO GRADE_REPORT VALUES(8,135,'A');
![output](insert-gradereport)
#table of student
SELECT * FROM student;
![output](select-student)
#table of course
SELECT * FROM course;
![output](select-course)
#table of section
SELECT * FROM section;
![output](select-section)
#table of grade_report
SELECT * FROM grade_report;
![output](select-gradereport)
DROP TABLE section;
![output](drop-section)
DROP TABLE course;
![output](drop-course)
DROP TABLE student;
![output](drop-student)
DROP TABLE grade_report;
![output](drop-gradereport)
