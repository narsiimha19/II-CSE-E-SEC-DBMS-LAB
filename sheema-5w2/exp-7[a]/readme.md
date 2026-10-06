-- EXPERIMENT-7(a)
-- PL/SQL Procedures and Functions
-- Procedure with IN and OUT Parameters

-- 1. Enable Server Output
SET SERVEROUTPUT ON;

-- 2. Create STUDENT Table
CREATE TABLE STUDENT12
(
    STUDENT_ID NUMBER(4) PRIMARY KEY,
    STUDENT_NAME VARCHAR2(30),
    COURSE VARCHAR2(20),
    MARKS NUMBER(3)
);

-- 3. Insert Sample Records
INSERT INTO STUDENT12 VALUES (101, 'Rahul', 'B.Tech', 82);
INSERT INTO STUDENT12 VALUES (102, 'Sneha', 'B.Tech', 74);
INSERT INTO STUDENT12 VALUES (103, 'Arjun', 'BCA', 58);
INSERT INTO STUDENT12 VALUES (104, 'Priya', 'B.Sc', 91);
INSERT INTO STUDENT12 VALUES (105, 'Kiran', 'BCA', 45);

-- 4. Save the Records
COMMIT;

-- 4. Create Stored Procedure

CREATE OR REPLACE PROCEDURE GET_STUDENT_DETAILS
(
    P_STUDENT_ID IN NUMBER,
    P_NAME       OUT VARCHAR2,
    P_MARKS      OUT NUMBER
)
IS
BEGIN
    SELECT STUDENT_NAME, MARKS
    INTO P_NAME, P_MARKS
    FROM STUDENT12
    WHERE STUDENT_ID = P_STUDENT_ID;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        P_NAME := 'Student Not Found';
        P_MARKS := NULL;
END;
/

-- 5. Call the Procedure

DECLARE
    V_NAME  VARCHAR2(30);
    V_MARKS NUMBER(3);
BEGIN
    GET_STUDENT_DETAILS(101, V_NAME, V_MARKS);

    DBMS_OUTPUT.PUT_LINE('Student ID   : 101');
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || V_NAME);
    DBMS_OUTPUT.PUT_LINE('Marks        : ' || V_MARKS);
END;
/
![output 1](op11.png)

DECLARE
    V_NAME  VARCHAR2(30);
    V_MARKS NUMBER(3);
BEGIN
    GET_STUDENT_DETAILS(110, V_NAME, V_MARKS);

    DBMS_OUTPUT.PUT_LINE('Student Name : ' || V_NAME);
    
    IF V_MARKS IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Marks        : Not Available');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Marks        : ' || V_MARKS);
    END IF;
END;
/
![output 2](op12.png)
