SET SERVEROUTPUT ON;

DECLARE
    -- Variables
    V_STUDENT_ID       STUDENT11.STUDENT_ID%TYPE;
    V_STUDENT_NAME     STUDENT11.STUDENT_NAME%TYPE;
    V_BRANCH           STUDENT11.BRANCH%TYPE;
    V_SEMESTER         STUDENT11.SEMESTER%TYPE;
    V_CGPA              STUDENT11.CGPA%TYPE;
    V_SCHOLARSHIP      STUDENT11.SCHOLARSHIP_STATUS%TYPE;

    -- Explicit Cursor
    CURSOR C_STUDENT IS
        SELECT STUDENT_ID,
               STUDENT_NAME,
               BRANCH,
               SEMESTER,
               CGPA,
               SCHOLARSHIP_STATUS
        FROM STUDENT11;

BEGIN

    OPEN C_STUDENT;

    LOOP
        FETCH C_STUDENT
        INTO V_STUDENT_ID,
             V_STUDENT_NAME,
             V_BRANCH,
             V_SEMESTER,
             V_CGPA,
             V_SCHOLARSHIP;

        EXIT WHEN C_STUDENT%NOTFOUND;

        -- Display student details
        DBMS_OUTPUT.PUT_LINE('Student ID   : ' || V_STUDENT_ID);
        DBMS_OUTPUT.PUT_LINE('Student Name : ' || V_STUDENT_NAME);
        DBMS_OUTPUT.PUT_LINE('Branch       : ' || V_BRANCH);
        DBMS_OUTPUT.PUT_LINE('Semester     : ' || V_SEMESTER);
        DBMS_OUTPUT.PUT_LINE('CGPA         : ' || V_CGPA);

        -- Update scholarship status
        IF V_CGPA >= 8.5 THEN
            UPDATE STUDENT11
            SET SCHOLARSHIP_STATUS = 'ELIGIBLE'
            WHERE STUDENT_ID = V_STUDENT_ID;

        ELSE
            UPDATE STUDENT11
            SET SCHOLARSHIP_STATUS = 'NOT ELIGIBLE'
            WHERE STUDENT_ID = V_STUDENT_ID;
        END IF;

        DBMS_OUTPUT.PUT_LINE('-------------------------');

    END LOOP;

    CLOSE C_STUDENT;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Scholarship status updated successfully.');

EXCEPTION
    WHEN OTHERS THEN
        IF C_STUDENT%ISOPEN THEN
            CLOSE C_STUDENT;
        END IF;

        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
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