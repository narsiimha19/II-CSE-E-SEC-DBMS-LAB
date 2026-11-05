## CREATE STUDENT TABLE
```
CREATE TABLE STUDENT56 (
    STUDENT_ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(50),
    DEPARTMENT VARCHAR2(30),
    MARKS NUMBER
);
```
![OUTPUT](ADD output)
## INSERT INTO STUDENT TABLE
```
INSERT INTO STUDENT56 VALUES (101, 'Rahul', 'CSE', 85);
INSERT INTO STUDENT56 VALUES (102, 'Priya', 'ECE', 90);
INSERT INTO STUDENT56 VALUES (103, 'Sravani', 'CSE', 88);
```
![OUTPUT](ADD output1)

##
```
COMMIT;
```
![OUTPUT](ADD output2)

##
```
-- Enable output
SET SERVEROUTPUT ON;

-- PL/SQL Program
DECLARE
    v_student_id STUDENT.STUDENT_ID%TYPE := &student_id;
    v_name       STUDENT.NAME%TYPE;
    v_department STUDENT.DEPARTMENT%TYPE;
    v_marks      STUDENT.MARKS%TYPE;
BEGIN
    SELECT NAME, DEPARTMENT, MARKS
    INTO v_name, v_department, v_marks
    FROM STUDENT
    WHERE STUDENT_ID = v_student_id;

    DBMS_OUTPUT.PUT_LINE('Student ID : ' || v_student_id);
    DBMS_OUTPUT.PUT_LINE('Name       : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Department : ' || v_department);
    DBMS_OUTPUT.PUT_LINE('Marks      : ' || v_marks);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student ID ' || v_student_id || ' does not exist.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
```
