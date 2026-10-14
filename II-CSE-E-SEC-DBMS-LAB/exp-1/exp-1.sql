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

INSERT INTO  student("name", student_number,"class" ,major)
VALUES('smith',17,1,'cs');
INSERT INTO  student("name", student_number,"class" ,major)
VALUES('brown',8,2,'cs');

INSERT INTO course( course_name,course_number, credit_hours,department)
VALUES('INTRO TO COMPUTER SCIENCE',1301,4,'CS');
INSERT INTO course( course_name,course_number, credit_hours,department)
VALUES('DATA STRUCTURES',1321,4,'CS');
INSERT INTO course( course_name,course_number, credit_hours,department)
VALUES('DISCRETE MATHEMATICS',2302,3,'MATH');
INSERT INTO course( course_name,course_number, credit_hours,department)
VALUES('DATA BASE',3380,3,'CS');

INSERT INTO section1(section_identifier, course_number,semester, "year", instructor)
VALUES(85, 'MATH2410', 'FALL', 07, 'KING');
INSERT INTO section1(section_identifier, course_number, semester, "year", instructor)
VALUES(92, 'CS1310', 'FALL', 07, 'ANDERSON');
INSERT INTO section1(section_identifier, course_number, semester, "year", instructor)
VALUES(102, 'CS3320', 'SPRING', 08, 'KNUTH');
INSERT INTO section1(section_identifier, course_number, semester, "year", instructor)
VALUES(112, 'MATH2410', 'FALL', 08, 'CHANG');
INSERT INTO section1(section_identifier, course_number, semester, "year", instructor)
VALUES(119, 'CS1310', 'FALL', 08, 'ANDERSON');
INSERT INTO section1(section_identifier, course_number, semester, "year", instructor)
VALUES(135, 'CS3380', 'FALL', 08, 'STONE');

INSERT INTO grand_report(student_number,section_identifier,grade)
VALUES(17,112,'B');
INSERT INTO grand_report(student_number,section_identifier,grade)
VALUES(17,119,'C');
INSERT INTO grand_report(student_number,section_identifier,grade)
VALUES(8,85,'A');
INSERT INTO grand_report(student_number,section_identifier,grade)
VALUES(8,92,'A');
INSERT INTO grand_report(student_number,section_identifier,grade)
VALUES(8,102,'B');
INSERT INTO grand_report(student_number,section_identifier,grade)
VALUES(8,135,'A');

 DESC student;
 DESC course;
 DESC section1;
 DESC grand_report;
 
SELECT * FROM TAB;
 
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM section1;
SELECT * FROM  grand_report;
   
DROP TABLE  student;
DROP TABLE course;
DROP TABLE section1;
DROP TABLE grand_report;
