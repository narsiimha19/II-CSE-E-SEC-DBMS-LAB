##
```
SET SERVEROUTPUT ON
SET LINESIZE 150
SET PAGESIZE 100

-- Remove objects from an earlier run, if present.
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE EMPLOYEE PURGE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN RAISE; END IF;
END;
/
```
![OUTPUT](10 output)
##
```
-- Create the table.
CREATE TABLE EMPLOYEE (
    EMP_ID      NUMBER PRIMARY KEY,
    EMP_NAME    VARCHAR2(30),
    DEPARTMENT  VARCHAR2(20),
    SALARY      NUMBER
);
```
![OUTPUT](10 output1)

##
```
-- Add enough rows to make the access paths easy to inspect.
INSERT INTO EMPLOYEE
SELECT LEVEL,
       'Employee' || TO_CHAR(LEVEL, 'FM00000'),
       CASE MOD(LEVEL, 3)
           WHEN 0 THEN 'CSE'
           WHEN 1 THEN 'ECE'
           ELSE 'IT'
       END,
       30000 + MOD(LEVEL * 137, 70000)
FROM DUAL
CONNECT BY LEVEL <= 10000;
```
##
```
COMMIT;
```
![OUTPUT](10 output2)

##
```
-- Collect table statistics for the optimizer.
BEGIN
    DBMS_STATS.GATHER_TABLE_STATS(USER, 'EMPLOYEE');
END;
/
```
![OUTPUT](10 output3)

##
```
-- 1. Search without an index on EMP_NAME.
-- The FULL hint makes the full table scan clear in the execution plan.
EXPLAIN PLAN FOR
SELECT /*+ FULL(e) */ *
FROM EMPLOYEE e
WHERE EMP_NAME = 'Employee05000';
```
![OUTPUT](10 output4)

##
```
SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);

-- 2. Create an index on the search column.
CREATE INDEX EMP_NAME_INDEX ON EMPLOYEE(EMP_NAME);

BEGIN
    DBMS_STATS.GATHER_TABLE_STATS(USER, 'EMPLOYEE');
END;
/
``
##
``
-- 3. Run the same search using the index.
-- The INDEX hint makes the index access path clear in the execution plan.
EXPLAIN PLAN FOR
SELECT /*+ INDEX(e EMP_NAME_INDEX) */ *
FROM EMPLOYEE e
WHERE EMP_NAME = 'Employee05000';
```
##
```
SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);

-- Execute the searches and show the matching row.
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME = 'Employee05000';
```
##
```
-- View index information.
SELECT INDEX_NAME, TABLE_NAME, COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMPLOYEE';
```
![OUTPUT](10 output5)

##
```
-- Optional: remove the index after observing the plans.
-- DROP INDEX EMP_NAME_INDEX;
```
