SET SERVEROUTPUT ON;

-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE4
(
    EMPLOYEE_ID NUMBER(4) PRIMARY KEY,
    EMPLOYEE_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    SALARY NUMBER(10,2),
    EXPERIENCE NUMBER(2)
);

-- Insert sample records
INSERT INTO EMPLOYEE4 VALUES (101, 'Rahul', 'HR', 35000, 5);
INSERT INTO EMPLOYEE4 VALUES (102, 'Sneha', 'Sales', 42000, 4);
INSERT INTO EMPLOYEE4 VALUES (103, 'Arjun', 'HR', 38000, 6);
INSERT INTO EMPLOYEE4 VALUES (104, 'Priya', 'Finance', 45000, 7);
INSERT INTO EMPLOYEE4 VALUES (105, 'Kiran', 'Sales', 39000, 3);

COMMIT;


-- Parameterized FOR UPDATE Cursor
DECLARE

    CURSOR C_EMPLOYEE(P_DEPT VARCHAR2) IS
        SELECT EMPLOYEE_ID,
               EMPLOYEE_NAME,
               DEPARTMENT,
               SALARY,
               EXPERIENCE
        FROM EMPLOYEE4
        WHERE DEPARTMENT = P_DEPT
        FOR UPDATE;

    V_NEW_SALARY NUMBER(10,2);

BEGIN

    DBMS_OUTPUT.PUT_LINE('Employees in HR Department');
    DBMS_OUTPUT.PUT_LINE('--------------------------');

    -- Open cursor for HR department
    FOR REC IN C_EMPLOYEE('HR') LOOP

        -- Increase salary by Rs. 3000
        V_NEW_SALARY := REC.SALARY + 3000;

        -- Update salary
        UPDATE EMPLOYEE4
        SET SALARY = V_NEW_SALARY
        WHERE CURRENT OF C_EMPLOYEE;

        -- Display updated details
        DBMS_OUTPUT.PUT_LINE(
            'Employee ID: ' || REC.EMPLOYEE_ID ||
            '  Name: ' || REC.EMPLOYEE_NAME ||
            '  Updated Salary: ' || V_NEW_SALARY ||
            '  Experience: ' || REC.EXPERIENCE || ' years'
        );

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('--------------------------');
    DBMS_OUTPUT.PUT_LINE('Salary updated successfully.');

END;
/
 

-- Display updated EMPLOYEE table
SELECT EMPLOYEE_ID,
       EMPLOYEE_NAME,
       DEPARTMENT,
       SALARY,
       EXPERIENCE
FROM EMPLOYEE4;