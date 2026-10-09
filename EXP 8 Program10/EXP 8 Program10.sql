SET SERVEROUTPUT ON;

-- Create STUDENT table
CREATE TABLE STUDENT11
(
    STUDENT_ID NUMBER(4) PRIMARY KEY,
    STUDENT_NAME VARCHAR2(30),
    BRANCH VARCHAR2(20),
    SEMESTER NUMBER(2),
    CGPA NUMBER(3,2),
    SCHOLARSHIP_STATUS VARCHAR2(20)
);

-- Insert sample student records
INSERT INTO STUDENT11 VALUES (101, 'Rahul', 'CSE', 4, 9.20, 'Not Eligible');
INSERT INTO STUDENT11 VALUES (102, 'Sneha', 'CSE', 4, 8.60, 'Not Eligible');
INSERT INTO STUDENT11 VALUES (103, 'Arjun', 'CSE', 4, 9.50, 'Not Eligible');
INSERT INTO STUDENT11 VALUES (104, 'Priya', 'ECE', 4, 9.10, 'Not Eligible');
INSERT INTO STUDENT11 VALUES (105, 'Kiran', 'CSE', 4, 7.80, 'Not Eligible');

COMMIT;

DECLARE

    -- Parameterized cursor for specified branch
    CURSOR C_STUDENT(P_BRANCH VARCHAR2) IS
        SELECT STUDENT_ID,
               STUDENT_NAME,
               BRANCH,
               SEMESTER,
               CGPA
        FROM STUDENT11
        WHERE BRANCH = P_BRANCH;

    -- FOR UPDATE cursor
    CURSOR C_UPDATE(P_BRANCH VARCHAR2) IS
        SELECT STUDENT_ID,
               CGPA,
               SCHOLARSHIP_STATUS
        FROM STUDENT11
        WHERE BRANCH = P_BRANCH
        FOR UPDATE;

    -- REF CURSOR declaration
    TYPE REF_STUDENT_CURSOR IS REF CURSOR;
    C_REF REF_STUDENT_CURSOR;

    V_STUDENT_ID       STUDENT.STUDENT_ID%TYPE;
    V_STUDENT_NAME     STUDENT.STUDENT_NAME%TYPE;
    V_BRANCH           STUDENT.BRANCH%TYPE;
    V_SEMESTER         STUDENT.SEMESTER%TYPE;
    V_CGPA             STUDENT.CGPA%TYPE;

BEGIN

    DBMS_OUTPUT.PUT_LINE('Students in CSE Branch');
    DBMS_OUTPUT.PUT_LINE('----------------------');

    -- Open REF CURSOR for CSE students
    OPEN C_REF FOR
        SELECT STUDENT_ID,
               STUDENT_NAME,
               BRANCH,
               SEMESTER,
               CGPA
        FROM STUDENT11
        WHERE BRANCH = 'CSE';

    -- Fetch and display using REF CURSOR
    LOOP
        FETCH C_REF
        INTO V_STUDENT_ID,
             V_STUDENT_NAME,
             V_BRANCH,
             V_SEMESTER,
             V_CGPA;

        EXIT WHEN C_REF%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Student ID: ' || V_STUDENT_ID ||
            '  Name: ' || V_STUDENT_NAME ||
            '  Branch: ' || V_BRANCH ||
            '  Semester: ' || V_SEMESTER ||
            '  CGPA: ' || V_CGPA
        );
    END LOOP;

    -- Close REF CURSOR
    CLOSE C_REF;

    DBMS_OUTPUT.PUT_LINE('----------------------');

    -- FOR UPDATE cursor using parameterized branch
    FOR REC IN C_UPDATE('CSE') LOOP

        -- Check CGPA
        IF REC.CGPA >= 9.0 THEN

            -- Update scholarship status
            UPDATE STUDENT11
            SET SCHOLARSHIP_STATUS = 'Eligible'
            WHERE CURRENT OF C_UPDATE;

            DBMS_OUTPUT.PUT_LINE(
                'Scholarship Eligible: Student ID ' ||
                REC.STUDENT_ID
            );

        END IF;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('----------------------');
    DBMS_OUTPUT.PUT_LINE('Scholarship status updated successfully.');

END;
/

-- Display final updated table
SELECT STUDENT_ID,
       STUDENT_NAME,
       BRANCH,
       SEMESTER,
       CGPA,
       SCHOLARSHIP_STATUS
FROM STUDENT11;