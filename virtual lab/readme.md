---virtual lab-1
# JSON Data Storage and Functional Indexing in Oracle 11g

## Aim

To store JSON data in an Oracle 11g database using a CLOB column, extract JSON values using REGEXP_SUBSTR, and use a functional index for faster searching.

## 1. Create Table
```
```sql
CREATE TABLE student_json_data (
    student_id NUMBER PRIMARY KEY,
    student_info CLOB
);
INSERT INTO student_json_data (student_id, student_info)
VALUES (1, '{"name":"Alice", "course":"CSE", "total_marks":480}');

INSERT INTO student_json_data (student_id, student_info)
VALUES (2, '{"name":"Bob", "course":"CSE", "total_marks":450}');

INSERT INTO student_json_data (student_id, student_info)
VALUES (3, '{"name":"Charlie", "course":"ECE", "total_marks":470}');

COMMIT;
SELECT student_id, student_info
FROM student_json_data;
```
![output](<virtual lab(outputs)/1-op1.png>)
```
SELECT student_id,
       REGEXP_SUBSTR(DBMS_LOB.SUBSTR(student_info, 4000, 1),
                     '"name":"([^"]+)"', 1, 1, NULL, 1) AS name,
       REGEXP_SUBSTR(DBMS_LOB.SUBSTR(student_info, 4000, 1),
                     '"course":"([^"]+)"', 1, 1, NULL, 1) AS course,
       REGEXP_SUBSTR(DBMS_LOB.SUBSTR(student_info, 4000, 1),
                     '"total_marks":([0-9]+)', 1, 1, NULL, 1) AS total_marks
FROM student_json_data
WHERE REGEXP_SUBSTR(DBMS_LOB.SUBSTR(student_info, 4000, 1),
                    '"course":"([^"]+)"', 1, 1, NULL, 1) = 'CSE';
```
![output](<virtual lab(outputs)/1-op2.png>)
```
CREATE INDEX idx_student_course
ON student_json_data (
    REGEXP_SUBSTR(
        DBMS_LOB.SUBSTR(student_info, 4000, 1),
        '"course":"([^"]+)"',
        1, 1, NULL, 1
    )
);
SELECT student_id,
       REGEXP_SUBSTR(DBMS_LOB.SUBSTR(student_info, 4000, 1),
                     '"name":"([^"]+)"', 1, 1, NULL, 1) AS name,
       REGEXP_SUBSTR(DBMS_LOB.SUBSTR(student_info, 4000, 1),
                     '"course":"([^"]+)"', 1, 1, NULL, 1) AS course
FROM student_json_data
WHERE REGEXP_SUBSTR(DBMS_LOB.SUBSTR(student_info, 4000, 1),
                    '"course":"([^"]+)"', 1, 1, NULL, 1) = 'CSE';
```
![output](<virtual lab(outputs)/1-op3.png>)
```
SELECT index_name,
       table_name,
       status
FROM user_indexes
WHERE index_name = 'IDX_STUDENT_COURSE';
```
![output](<virtual lab(outputs)/1-op4.png>)

---virtual lab-2
# Virtual Columns in Oracle 11g

Virtual columns are columns that are automatically calculated based on an expression involving other columns in the same table. They are computed automatically and do not require separate values to be inserted.

---

## 1. Create Table with Virtual Columns

```sql
CREATE TABLE students_scores (
    student_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    marks1 NUMBER,
    marks2 NUMBER,
    marks3 NUMBER,
    total_marks NUMBER GENERATED ALWAYS AS (marks1 + marks2 + marks3) VIRTUAL,
    average_marks NUMBER GENERATED ALWAYS AS ((marks1 + marks2 + marks3) / 3) VIRTUAL
);
INSERT INTO students_scores (student_id, name, marks1, marks2, marks3)
VALUES (1, 'Alice', 85, 90, 95);

INSERT INTO students_scores (student_id, name, marks1, marks2, marks3)
VALUES (2, 'Bob', 80, 85, 88);

INSERT INTO students_scores (student_id, name, marks1, marks2, marks3)
VALUES (3, 'Charlie', 78, 82, 80);

COMMIT;
DESC students_scores;
```
![output](<virtual lab(outputs)/2-op1.png>)
```
SELECT student_id,
       name,
       marks1,
       marks2,
       marks3,
       total_marks,
       average_marks
FROM students_scores;
```
![output](<virtual lab(outputs)/2-op2.png>)
```
SELECT student_id,
       name,
       total_marks,
       average_marks
FROM students_scores
WHERE total_marks >= 250;
```
![output](<virtual lab(outputs)/2-op3.png>)
```
CREATE INDEX idx_total_marks
ON students_scores(total_marks);
SELECT index_name,
       table_name,
       status
FROM user_indexes
WHERE index_name = 'IDX_TOTAL_MARKS';
```
![output](<virtual lab(outputs)/2-op4.png>)

