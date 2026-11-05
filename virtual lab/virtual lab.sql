---virtual lab-1
-- =========================================================
-- JSON DATA STORAGE AND FUNCTIONAL INDEXING IN ORACLE 11G
-- =========================================================

-- 1. CREATE TABLE

CREATE TABLE student_json_data (
    student_id NUMBER PRIMARY KEY,
    student_info CLOB
);


-- 2. INSERT SAMPLE JSON DATA

INSERT INTO student_json_data (student_id, student_info)
VALUES (1, '{"name":"Alice", "course":"CSE", "total_marks":480}');

INSERT INTO student_json_data (student_id, student_info)
VALUES (2, '{"name":"Bob", "course":"CSE", "total_marks":450}');

INSERT INTO student_json_data (student_id, student_info)
VALUES (3, '{"name":"Charlie", "course":"ECE", "total_marks":470}');

COMMIT;
 

-- 3. DISPLAY ALL JSON DATA

SELECT student_id, student_info
FROM student_json_data;


 -- 4. EXTRACT JSON VALUES USING REGEXP_SUBSTR

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


-- 5. CREATE FUNCTIONAL INDEX ON COURSE

CREATE INDEX idx_student_course
ON student_json_data (
    REGEXP_SUBSTR(
        student_info,
        '"course":"([^"]+)"',
        1, 1, NULL, 1
    )
); 


-- 6. QUERY USING THE FUNCTIONAL INDEX
 SELECT student_id,
       REGEXP_SUBSTR(student_info, '"name":"([^"]+)"', 1, 1, NULL, 1) AS name,
       REGEXP_SUBSTR(student_info, '"course":"([^"]+)"', 1, 1, NULL, 1) AS course
FROM student_json_data
WHERE REGEXP_SUBSTR(
          student_info,
          '"course":"([^"]+)"',
          1, 1, NULL, 1
      ) = 'CSE';
      -- 6. QUERY USING THE FUNCTIONAL INDEX

SELECT student_id,
       REGEXP_SUBSTR(DBMS_LOB.SUBSTR(student_info, 4000, 1),
                     '"name":"([^"]+)"', 1, 1, NULL, 1) AS name,
       REGEXP_SUBSTR(DBMS_LOB.SUBSTR(student_info, 4000, 1),
                     '"course":"([^"]+)"', 1, 1, NULL, 1) AS course
FROM student_json_data
WHERE REGEXP_SUBSTR(DBMS_LOB.SUBSTR(student_info, 4000, 1),
                    '"course":"([^"]+)"', 1, 1, NULL, 1) = 'CSE';
 

-- 7. VERIFY THAT THE INDEX EXISTS

SELECT index_name,
       table_name,
       status
FROM user_indexes
WHERE index_name = 'IDX_STUDENT_COURSE';


-- 8. DISPLAY TABLE STRUCTURE

DESC student_json_data;

---virtual lab-2

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

SELECT student_id,
       name,
       marks1,
       marks2,
       marks3,
       total_marks,
       average_marks
FROM students_scores;

CREATE INDEX idx_total_marks
ON students_scores(total_marks);


SELECT index_name,
       table_name,
       status
FROM user_indexes
WHERE index_name = 'IDX_TOTAL_MARKS';
 
 SELECT table_name
FROM user_tables
WHERE table_name LIKE '%STUDENT%';