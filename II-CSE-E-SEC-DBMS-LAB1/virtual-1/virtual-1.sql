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
       REGEXP_SUBSTR(student_info, '"name":"([^"]+)"', 1, 1, NULL, 1) AS name,
       REGEXP_SUBSTR(student_info, '"course":"([^"]+)"', 1, 1, NULL, 1) AS course,
       REGEXP_SUBSTR(student_info, '"total_marks":([0-9]+)', 1, 1, NULL, 1) AS total_marks
FROM student_json_data
WHERE REGEXP_SUBSTR(
          student_info,
          '"course":"([^"]+)"',
          1, 1, NULL, 1
      ) = 'CSE';


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


-- 7. VERIFY THAT THE INDEX EXISTS

SELECT index_name,
       table_name,
       status
FROM user_indexes
WHERE index_name = 'IDX_STUDENT_COURSE';


-- 8. DISPLAY TABLE STRUCTURE

DESC student_json_data;
