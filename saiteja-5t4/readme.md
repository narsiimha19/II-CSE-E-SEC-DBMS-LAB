##```
SET SERVEROUTPUT ON;
```
##CREATE STUDENT TABLE
```
CREATE TABLE student4 (
    student4_id NUMBER(5) PRIMARY KEY,
    student4_name VARCHAR2(50),
    course VARCHAR2(30),
    marks NUMBER(5,2)
);
```
!OUTPUT[exp7a output1]
##INSERT VALUES
```
INSERT INTO student4 VALUES (101, 'Ravi', 'CSE', 85);
INSERT INTO student4 VALUES (102, 'Sita', 'CSE', 92);
INSERT INTO student4 VALUES (103, 'Kiran', 'ECE', 78);
INSERT INTO student4 VALUES (104, 'Anjali', 'EEE', 88);
INSERT INTO student4 VALUES (105, 'Rahul', 'CSE', 74);

COMMIT;
```
!OUTPUT[exp7a output2]


```
SELECT * FROM STUDENT4;
```
!OUTPUT[exp7a output3]

```
CREATE OR REPLACE PROCEDURE GET_STUDENT4_DETAILS (
    p_student4_id   IN  student4.student4_id%TYPE,
    p_student4_name OUT student4.student4_name%TYPE,
    p_marks        OUT student4.marks%TYPE
)
IS
BEGIN
    SELECT student4_name, marks
    INTO p_student4_name, p_marks
    FROM student4
    WHERE student4_id = p_student4_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_student4_name := NULL;
        p_marks := NULL;
        DBMS_OUTPUT.PUT_LINE('No student4 found with ID: ' || p_student4_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
SET SERVEROUTPUT ON;

DECLARE
    v_student4_name student4.student4_name%TYPE;
    v_marks        student4.marks%TYPE;
BEGIN
    GET_STUDENT4_DETAILS(101, v_student4_name, v_marks);

    IF v_student4_name IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Student4 Name : ' || v_student4_name);
        DBMS_OUTPUT.PUT_LINE('Marks        : ' || v_marks);
    END IF;
END;
/
```
!OUTPUT[exp7a output4]
!OUTPUT[exp7a output5]

