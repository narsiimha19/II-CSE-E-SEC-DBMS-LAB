additional experiment 

EXPERIMENT 1:


DROP TABLE STUDENTS;

CREATE TABLE students (
   student_id NUMBER PRIMARY KEY,
   name VARCHAR2(100),
   email VARCHAR2(100),
   dob DATE,
   course VARCHAR2(100)
);
CREATE SEQUENCE student_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE OR REPLACE TRIGGER trg_student_id
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
    SELECT student_seq.NEXTVAL INTO :NEW.student_id FROM dual;
END;
/

INSERT INTO students (name, email, dob, course)
VALUES ('John Doe', 'john.doe@example.com', TO_DATE('2003-06-15', 'YYYY-MM-DD'), 'Computer Science');

INSERT INTO students (name, email, dob, course)
VALUES ('Jane Smith', 'jane.smith@example.com', TO_DATE('2002-12-20', 'YYYY-MM-DD'), 'Electronics');

SELECT * FROM students;

EXPERIMENT 2:

CREATE MATERIALIZED VIEW mv_student_course_count
BUILD IMMEDIATE
REFRESH COMPLETE
START WITH SYSDATE
NEXT SYSDATE + 1
AS
SELECT course, COUNT(*) AS total_students
FROM students
GROUP BY course;
SELECT * FROM mv_studentS_course_count;
EXEC DBMS_MVIEW.REFRESH('mv_studentS_course_count');
CREATE MATERIALIZED VIEW LOG ON students
WITH ROWID, SEQUENCE (course)
INCLUDING NEW VALUES;
CREATE MATERIALIZED VIEW mv_studentS_course_count
BUILD IMMEDIATE
REFRESH FAST
ON COMMIT
AS
SELECT course, COUNT(*) AS total_students
FROM students
GROUP BY course;

EXPERIMENT 3:
CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    total_marks NUMBER,
    course VARCHAR2(100)
);

INSERT INTO students VALUES (1, 'Alice', 480, 'CSE');
INSERT INTO students VALUES (2, 'Bob', 450, 'CSE');
INSERT INTO students VALUES (3, 'Charlie', 450, 'CSE');
INSERT INTO students VALUES (4, 'David', 500, 'ECE');
INSERT INTO students VALUES (5, 'Eva', 480, 'ECE');
INSERT INTO students VALUES (6, 'Frank', 470, 'ECE');
COMMIT;
SELECT student_id, name, course, total_marks,
       RANK() OVER (PARTITION BY course ORDER BY total_marks DESC) AS rank,
       DENSE_RANK() OVER (PARTITION BY course ORDER BY total_marks DESC) AS dense_rank,
       ROW_NUMBER() OVER (PARTITION BY course ORDER BY total_marks DESC) AS row_num,
       NTILE(3) OVER (PARTITION BY course ORDER BY total_marks DESC) AS ntile_group,
       LAG(total_marks) OVER (PARTITION BY course ORDER BY total_marks DESC) AS previous_marks,
       LEAD(total_marks) OVER (PARTITION BY course ORDER BY total_marks DESC) AS next_marks
FROM students;
