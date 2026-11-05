##
```
SET SERVEROUTPUT ON;
```
##CREATE STUDENT TABLE
```
CREATE TABLE student11 (
    student_id NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    course VARCHAR2(30),
    marks NUMBER(5,2)
);
```
## INSERT INTO STUDENT TABLE
```
INSERT INTO student11 VALUES (101, 'Ravi', 'CSE', 85);
INSERT INTO student11 VALUES (102, 'Sita', 'CSE', 92);
INSERT INTO student11 VALUES (103, 'Kiran', 'ECE', 78);
INSERT INTO student11 VALUES (104, 'Anjali', 'EEE', 88);
INSERT INTO student11 VALUES (105, 'Rahul', 'CSE', 74);
```
![OUTPUT](7a ouput)
##
```
COMMIT;
```
![OUTPUT](7a ouput1)
##
```
CREATE OR REPLACE PROCEDURE GET_STUDENT_DETAILS (
    p_student_id   IN  student.student_id%TYPE,
    p_student_name OUT student.student_name%TYPE,
    p_marks        OUT student.marks%TYPE
)
IS
BEGIN
    -- Retrieve student details
    SELECT student_name, marks
    INTO p_student_name, p_marks
    FROM student
    WHERE student_id = p_student_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_student_name := NULL;
        p_marks := NULL;

        DBMS_OUTPUT.PUT_LINE(
            'No student found with ID: ' || p_student_id
        );

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: ' || SQLERRM
        );
END;
```
![OUTPUT](7a ouput2)
##
```
DECLARE
    -- Variables to receive OUT parameter values
    v_student_name student.student_name%TYPE;
    v_marks        student.marks%TYPE;

BEGIN
    -- Call the procedure
    GET_STUDENT_DETAILS(
        101,
        v_student_name,
        v_marks
    );

    -- Display returned values
    IF v_student_name IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE(
            'Student Name : ' || v_student_name
        );

        DBMS_OUTPUT.PUT_LINE(
            'Marks        : ' || v_marks
        );
    END IF;

END;
```
##
```

SET SERVEROUTPUT ON;
VARIABLE v_name VARCHAR2(50);
VARIABLE v_marks NUMBER;
EXEC GET_STUDENT_DETAILS(101, :v_name, :v_marks);
PRINT v_name;
PRINT v_marks;
```
![OUTPUT](7a ouput3)
