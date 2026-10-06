SET SERVEROUTPUT ON;

-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE
(
    EMPLOYEE_ID NUMBER(4) PRIMARY KEY,
    EMPLOYEE_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    SALARY NUMBER(10,2)
);

-- Insert sample records
INSERT INTO EMPLOYEE VALUES (101, 'Rahul', 'HR', 35000);
INSERT INTO EMPLOYEE VALUES (102, 'Sneha', 'Sales', 42000);
INSERT INTO EMPLOYEE VALUES (103, 'Arjun', 'Finance', 45000);

COMMIT;

-- Create BEFORE UPDATE Row-Level Trigger
CREATE OR REPLACE TRIGGER TRG_BEFORE_UPDATE
BEFORE UPDATE
ON EMPLOYEE
FOR EACH ROW
BEGIN
    -- Check if new salary is negative
    IF :NEW.SALARY < 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Salary cannot be negative.'
        );
    END IF;

    -- Check if salary is decreased
    IF :NEW.SALARY < :OLD.SALARY THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Salary cannot be decreased.'
        );
    END IF;
END;
/

-- Valid update
BEGIN
    UPDATE EMPLOYEE
    SET SALARY = 40000
    WHERE EMPLOYEE_ID = 101;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Valid update completed successfully.'
    );
END;
/

-- Invalid update
BEGIN
    UPDATE EMPLOYEE
    SET SALARY = 30000
    WHERE EMPLOYEE_ID = 102;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Invalid update rejected: ' || SQLERRM
        );
END;
/

-- Display final table
SELECT EMPLOYEE_ID,
       EMPLOYEE_NAME,
       DEPARTMENT,
       SALARY
FROM EMPLOYEE;