7b3

SET SERVEROUTPUT ON;

-- 1. Create STUDENT table
CREATE TABLE STUDENT7b3 (
    STUDENT_ID   NUMBER PRIMARY KEY,
    STUDENT_NAME VARCHAR2(50),
    MARKS        NUMBER
);

-- 2. Insert sample student records
INSERT INTO STUDENT7b3 VALUES (101, 'Rahul', 85);
INSERT INTO STUDENT7b3 VALUES (102, 'Priya', 72);
INSERT INTO STUDENT7b3 VALUES (103, 'Arun', 56);
INSERT INTO STUDENT7b3 VALUES (104, 'Sneha', 42);
INSERT INTO STUDENT7b3 VALUES (105, 'Kiran', 28);

COMMIT;


-- 3. Create the stored function
CREATE OR REPLACE FUNCTION GET_GRADE (
    P_MARKS IN NUMBER
)
RETURN VARCHAR2
IS
    V_GRADE VARCHAR2(20);
BEGIN
    -- Determine grade using IF-ELSIF-ELSE
    IF P_MARKS >= 75 THEN
        V_GRADE := 'Distinction';

    ELSIF P_MARKS >= 60 THEN
        V_GRADE := 'First Class';

    ELSIF P_MARKS >= 50 THEN
        V_GRADE := 'Second Class';

    ELSIF P_MARKS >= 35 THEN
        V_GRADE := 'Pass';

    ELSE
        V_GRADE := 'Fail';
    END IF;

    -- Return the calculated grade
    RETURN V_GRADE;
END;
/
 

-- 4. Invoke the function using SELECT statement
SELECT
    STUDENT_NAME,
    MARKS,
    GET_GRADE(MARKS) AS GRADE
FROM STUDENT7b3;
