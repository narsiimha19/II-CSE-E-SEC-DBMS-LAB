SET SERVEROUTPUT ON;

-- Drop table if it already exists
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE EMPLOYEE19 CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

-- Create EMPLOYEE19 table
CREATE TABLE EMPLOYEE19
(
    EMP_ID NUMBER(4) PRIMARY KEY,
    EMP_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    SALARY NUMBER(10,2)
);

-- Insert records
INSERT INTO EMPLOYEE19 VALUES (101, 'Ravi', 'HR', 35000);
INSERT INTO EMPLOYEE19 VALUES (102, 'Rahul', 'IT', 45000);
INSERT INTO EMPLOYEE19 VALUES (103, 'Priya', 'CSE', 50000);
INSERT INTO EMPLOYEE19 VALUES (104, 'Anil', 'ECE', 40000);
INSERT INTO EMPLOYEE19 VALUES (105, 'Ravi', 'IT', 55000);

COMMIT;

--------------------------------------------------
-- STEP 1: Search before creating index
--------------------------------------------------

SELECT *
FROM EMPLOYEE19
WHERE EMP_NAME = 'Ravi';

--------------------------------------------------
-- STEP 2: Display execution plan before indexing
--------------------------------------------------

EXPLAIN PLAN FOR
SELECT *
FROM EMPLOYEE19
WHERE EMP_NAME = 'Ravi';

SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);

--------------------------------------------------
-- STEP 3: Create index
--------------------------------------------------

CREATE INDEX EMP_NAME_INDEX
ON EMPLOYEE19(EMP_NAME);

--------------------------------------------------
-- STEP 4: Search using index
--------------------------------------------------

SELECT *
FROM EMPLOYEE19
WHERE EMP_NAME = 'Ravi';

--------------------------------------------------
-- STEP 5: Display execution plan after indexing
--------------------------------------------------

EXPLAIN PLAN FOR
SELECT *
FROM EMPLOYEE19
WHERE EMP_NAME = 'Ravi';

SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);

--------------------------------------------------
-- STEP 6: Display indexes
--------------------------------------------------

SELECT INDEX_NAME, TABLE_NAME, STATUS
FROM USER_INDEXES
WHERE TABLE_NAME = 'EMPLOYEE19';

--------------------------------------------------
-- STEP 7: Drop the index
--------------------------------------------------

DROP INDEX EMP_NAME_INDEX;