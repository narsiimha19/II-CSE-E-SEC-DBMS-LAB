
Experiment-10

##
```
SET SERVEROUTPUT ON;
```
## 1. Create EMPLOYEE table
```
CREATE TABLE EMPLOYEE (
    EMP_ID NUMBER PRIMARY KEY,
    EMP_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    SALARY NUMBER
);
```
![output](exp10 output 1)

## 2. Insert records
```
INSERT INTO EMPLOYEE VALUES
(101, 'Ravi', 'CSE', 45000);

INSERT INTO EMPLOYEE VALUES
(102, 'Sita', 'ECE', 50000);

INSERT INTO EMPLOYEE VALUES
(103, 'Kiran', 'CSE', 55000);

INSERT INTO EMPLOYEE VALUES
(104, 'Anu', 'IT', 60000);

INSERT INTO EMPLOYEE VALUES
(105, 'Rahul', 'ECE', 48000);

COMMIT;
```
![output](exp10 output 2)
##
```
SELECT * FROM EMPLOYEE;
```
![output](exp10 output 3)

## 3. Non-indexed search
```
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME = 'Ravi';
```
![output](exp10 output 4)

## 4. Display execution plan
```
EXPLAIN PLAN FOR
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME = 'Ravi';
```
![output](exp10 output 5)

##
```
SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);
```
![output](exp10 output 6)


## 5. Create index
```
CREATE INDEX EMP_NAME_INDEX
ON EMPLOYEE(EMP_NAME);
```
![output](exp10 output 7)

## 6. Indexed search
```
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME = 'Ravi';
```
![output](exp10 output 8)

## 7. Display execution plan after index
```
EXPLAIN PLAN FOR
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME = 'Ravi';
```
![output](exp10 output 9)
```
SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);
```
![output](exp10 output 10)


## 8. View index information
```
SELECT INDEX_NAME,
       TABLE_NAME,
       COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMPLOYEE';
```
![output](exp10 output 11)

## 9. Drop index
```
DROP INDEX EMP_NAME_INDEX;
```
![output](exp10 output 12)
