SET SERVEROUTPUT ON;

-- Step 1: Create EMPLOYEE table
CREATE TABLE EMPLOYEE
(
    EMPLOYEE_ID NUMBER(4) PRIMARY KEY,
    EMPLOYEE_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    SALARY NUMBER(10,2)
);

-- Step 2: Create BEFORE INSERT trigger
CREATE OR REPLACE TRIGGER TRG_BEFORE_INSERT
BEFORE INSERT
ON EMPLOYEE
FOR EACH ROW
BEGIN
    -- Validate employee salary
    IF :NEW.SALARY <= 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Salary must be greater than 0.'
        );
    END IF;

    -- Validate employee name
    IF :NEW.EMPLOYEE_NAME IS NULL THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Employee name cannot be NULL.'
        );
    END IF;
END;
/

-- Step 3: Insert valid record
BEGIN
    INSERT INTO EMPLOYEE
    VALUES (101, 'Rahul', 'HR', 35000);

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Valid employee record inserted successfully.'
    );
END;
/

-- Step 4: Insert invalid record
BEGIN
    INSERT INTO EMPLOYEE
    VALUES (102, 'Sneha', 'Sales', -5000);

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Invalid record rejected: ' || SQLERRM
        );
END;
/

-- Step 5: Display table contents
SELECT EMPLOYEE_ID,
       EMPLOYEE_NAME,
       DEPARTMENT,
       SALARY
FROM EMPLOYEE;
