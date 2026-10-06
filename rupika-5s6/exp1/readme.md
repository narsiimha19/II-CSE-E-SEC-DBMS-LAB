SELECT * FROM tab;
SELECT * FROM STUDENT;
DSEC STUDENT;

CREATE TABLE studenta(
name VARCHAR2(20),
student_number NUMBER,
class NUMBER,
major VARCHAR2(20) );
![output](<exp1op.png>)

   
      INSERT INTO studenta
      VALUES('smith',17,1,'cs');
            INSERT INTO studenta
            VALUES('brown',8,2,'cs');
            
     DSEC studenta;
![output](<Screenshot (60).png>)       
            

         SELECT * FROM studenta;
![output](<Screenshot (61).png>)   
            
 CREATE TABLE coursea (
course_name VARCHAR2(100),
course_no VARCHAR2(50),
credit_hours  NUMBER,
department  VARCHAR2(10) );

![output](<Screenshot (62).png>)
            
INSERT ALL
INTO coursea VALUES('INTRO TO CS','cs1310',4,'cs'),
('ds','cs3320',4,'cs'),('discrete mathematics','math2410',3,'math'),('database','cs3380',3,'cs');

![output](<Screenshot (63).png>)
            
SELECT * FROM COURSEA;
![output(<Screenshot (64).png>)

CREATE TABLE section (
section_identifier NUMBER,
course_number VARCHAR2(100),
semester VARCHAR(50),
year NUMBER,
instructor VARCHAR2(20));

![output](<Screenshot (64).png>)
            
            INSERT INTO SECTION 
            VALUES(85,'MATH2410','FALL',07,'KING');
                        INSERT INTO SECTION 
VALUES(92,'CS1310','FALL',07,'ANDERSON');
                        INSERT INTO SECTION 
VALUES(102,'CS3320','SPRING',08,'CHAG');

                        INSERT INTO SECTION 
VALUES(112,'MATH2410','FALL',08,'KNUTH');

![output](<Screenshots (64).png>)
SELECT * FROM SECTION;
![output](<Screenshot (65).png>)
![output](<Screenshot (66).png>)


CREATE TABLE GRADE_REPORT (
student_num NUMBER,
section_identifier NUMBER,
grade VARCHAR2(5));

![output](<Screenshot (70).png>)
![output](<Screenshot (71).png>)

INSERT INTO GRADE_REPORT VALUES (17,112,'B');
INSERT INTO GRADE_REPORT VALUES (17,119,'A');
INSERT INTO GRADE_REPORT VALUES (8,135,'C');
SELECT * FROM GRADE_REPORT;

       

