SET SERVEROUTPUT ON;

-- Create STUDENT table
CREATE TABLE STUDENT
(
    STUDENT_ID NUMBER(4) PRIMARY KEY,
    STUDENT_NAME VARCHAR2(30),
    COURSE VARCHAR2(30),
    MARKS NUMBER(3)
);

-- Insert sample student records
INSERT INTO STUDENT VALUES (101, 'Rahul', 'B.Tech CSE', 85);
INSERT INTO STUDENT VALUES (102, 'Sneha', 'B.Tech ECE', 78);
INSERT INTO STUDENT VALUES (103, 'Arjun', 'B.Tech CSE', 92);
INSERT INTO STUDENT VALUES (104, 'Priya', 'B.Tech IT', 88);
INSERT INTO STUDENT VALUES (105, 'Kiran', 'B.Tech CSE', 74);

COMMIT;

-- REF CURSOR
DECLARE
    TYPE STUDENT_CURSOR IS REF CURSOR;
    C_STUDENT STUDENT_CURSOR;

    V_STUDENT_ID   STUDENT.STUDENT_ID%TYPE;
    V_STUDENT_NAME STUDENT.STUDENT_NAME%TYPE;
    V_COURSE       STUDENT.COURSE%TYPE;
    V_MARKS        STUDENT.MARKS%TYPE;

BEGIN
    -- Open REF CURSOR
    OPEN C_STUDENT FOR
        SELECT STUDENT_ID,
               STUDENT_NAME,
               COURSE,
               MARKS
        FROM STUDENT;

    -- Fetch and display records
    LOOP
        FETCH C_STUDENT
        INTO V_STUDENT_ID,
             V_STUDENT_NAME,
             V_COURSE,
             V_MARKS;

        EXIT WHEN C_STUDENT%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Student ID: ' || V_STUDENT_ID ||
            '  Name: ' || V_STUDENT_NAME ||
            '  Course: ' || V_COURSE ||
            '  Marks: ' || V_MARKS
        );
    END LOOP;

    -- Close REF CURSOR
    CLOSE C_STUDENT;

    DBMS_OUTPUT.PUT_LINE('All student records displayed successfully.');

END;
/
![output 1](op24.png)
