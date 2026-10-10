# 1. CREATE TABLES

## Create STUDENT table

```sql
CREATE TABLE STUDENT (
    Name VARCHAR2(30),
    Student_number NUMBER,
    Class NUMBER,
    Major VARCHAR2(20)
);
```
![Output](1.a1%20output.jpeg)
### Create COURSE table

```sql
CREATE TABLE COURSE (
    Course_name VARCHAR2(50),
    Course_number VARCHAR2(10),
    Credit_hours NUMBER,
    Department VARCHAR2(20)
);
```
![Output](1.a2%20output.jpeg)
### Create SECTION table

```sql
CREATE TABLE SECTION (
    Section_identifier NUMBER,
    Course_number VARCHAR2(10),
    Semester VARCHAR2(10),
    Year VARCHAR2(2),
    Instructor VARCHAR2(30)
);
```
![Output](1.a3%20output.jpeg)
### Create GRADE_REPORT table

```sql
CREATE TABLE GRADE_REPORT (
    Student_number NUMBER,
    Section_identifier NUMBER,
    Grade VARCHAR2(2)
);
```
![Output](1.a4%20output.jpeg)
# 2. INSERT VALUES INTO TABLES

## Insert values into STUDENT table

```sql
INSERT INTO STUDENT VALUES ('Smith', 17, 1, 'CS');
INSERT INTO STUDENT VALUES ('Brown', 8, 2, 'CS');
```
![Output](1.a5%20output.jpeg)<img width="1600" height="851" alt="1 a5 output " src="https://github.com/user-attachments/assets/89f12866-5bec-4413-bdcf-4fcaac5847b6" />
 
## Insert values into COURSE table

```sql
INSERT INTO COURSE VALUES ('Intro to Computer Science', 'CS1310', 4, 'CS');
INSERT INTO COURSE VALUES ('Data Structures', 'CS3320', 4, 'CS');
INSERT INTO COURSE VALUES ('Discrete Mathematics', 'MATH2410', 3, 'MATH');
INSERT INTO COURSE VALUES ('Database', 'CS3380', 3, 'CS');
```
![Output](1.a6%20output.jpeg)
## Insert values into SECTION table

```sql
INSERT INTO SECTION VALUES (85, 'MATH2410', 'Fall', '07', 'King');
INSERT INTO SECTION VALUES (92, 'CS1310', 'Fall', '07', 'Anderson');
INSERT INTO SECTION VALUES (102, 'CS3320', 'Spring', '08', 'Knuth');
INSERT INTO SECTION VALUES (112, 'MATH2410', 'Fall', '08', 'Chang');
INSERT INTO SECTION VALUES (119, 'CS1310', 'Fall', '08', 'Anderson');
INSERT INTO SECTION VALUES (135, 'CS3380', 'Fall', '08', 'Stone');
```
![Output](1.a7%20output.jpeg)
## Insert values into GRADE_REPORT table

```sql
INSERT INTO GRADE_REPORT VALUES (17, 112, 'B');
INSERT INTO GRADE_REPORT VALUES (17, 119, 'C');
INSERT INTO GRADE_REPORT VALUES (8, 85, 'A');
INSERT INTO GRADE_REPORT VALUES (8, 92, 'A');
INSERT INTO GRADE_REPORT VALUES (8, 102, 'B');
INSERT INTO GRADE_REPORT VALUES (8, 135, 'A');
```
![Output](1.a8%20output.jpeg)

```

# 3. DESCRIBE ALL TABLES

## Describe STUDENT table

```sql
DESC STUDENT;
```
![Output](1.a9%20output.jpeg)
## Describe COURSE table

```sql
DESC COURSE;
```
![Output](1.a10%20output.jpeg)

## Describe SECTION table

```sql
DESC SECTION;
```
![Output](1.a11%20output.jpeg)<img width="1600" height="850" alt="1 a17 output" src="https://github.com/user-attachments/assets/5f0b0d0b-13c2-4de6-9527-a5b0e78454e1" />


## Describe GRADE_REPORT table

```sql
DESC GRADE_REPORT;
```
![Output](1.a12%20output.jpeg)

# 4. LIST THE CREATED TABLES

## List all created tables

```sql
SELECT TABLE_NAME
FROM USER_TABLES;
```

# 5. DISPLAY VALUES OF EACH TABLE

## Display STUDENT table

```sql
SELECT * FROM STUDENT;
```

## Display COURSE table

```sql
SELECT * FROM COURSE;
```

## Display SECTION table

```sql
SELECT * FROM SECTION;
```
![Output](1.a13%20output.jpeg)
## Display GRADE_REPORT table

```sql
SELECT * FROM GRADE_REPORT;
```
![Output](1.a14%20output.jpeg)
# 6. DELETE ALL TABLES

## Delete GRADE_REPORT table

```sql
DROP TABLE GRADE_REPORT;
```
![Output](1.a15%20output.jpeg)
## Delete SECTION table

```sql
DROP TABLE SECTION;
```
![Output](1.a16%20output.jpeg)
## Delete COURSE table

```sql
DROP TABLE COURSE;
```
![Output](1.a17%20output.jpeg)
## Delete STUDENT table

```sql
DROP TABLE STUDENT;
```
![Output](1.a18%20output.jpeg)
