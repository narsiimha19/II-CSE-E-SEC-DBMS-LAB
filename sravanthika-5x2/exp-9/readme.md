## program-1

##
```
SET SERVEROUTPUT ON;
```
##
```
CREATE TABLE EMPLOYEE_B1 (
    EMP_ID NUMBER PRIMARY KEY,
    EMP_NAME VARCHAR2(30),
    SALARY NUMBER
);
```
![output](exp9 output 1)

##
```
CREATE OR REPLACE TRIGGER TRG_BEFORE_INSERT
BEFORE INSERT ON EMPLOYEE_B1
FOR EACH ROW
BEGIN
    IF :NEW.SALARY <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001,
            'Salary must be greater than zero');
    END IF;
END;
/
```
![output](exp9 output 2)

## Valid record
```
INSERT INTO EMPLOYEE_B1 VALUES (101, 'Ravi', 45000);
```
![output](exp9 output 3)

## Invalid record
```
BEGIN
    INSERT INTO EMPLOYEE_B1 VALUES (102, 'Sita', -5000);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
```
![output](exp9 output 4)

COMMIT;
##
```
SELECT * FROM EMPLOYEE_B1;
```
![output](exp9 output 5)


## program-2

##
```
SET SERVEROUTPUT ON;
```
##
```
CREATE TABLE EMPLOYEE_A2 (
    EMP_ID NUMBER PRIMARY KEY,
    EMP_NAME VARCHAR2(30),
    SALARY NUMBER
);
```
![output](exp9 output 6)
##
```
CREATE TABLE EMP_AUDIT (
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(30),
    ACTION_NAME VARCHAR2(20),
    ACTION_DATE DATE
);
```
![output](exp9 output 7)
##
```
CREATE OR REPLACE TRIGGER TRG_AFTER_INSERT
AFTER INSERT ON EMPLOYEE_A2
FOR EACH ROW
BEGIN
    INSERT INTO EMP_AUDIT
    VALUES (
        :NEW.EMP_ID,
        :NEW.EMP_NAME,
        'INSERT',
        SYSDATE
    );
/
```
![output](exp9 output 8)
##
```
INSERT INTO EMPLOYEE_A2
VALUES (101, 'Ravi', 45000);

COMMIT;
```
![output](exp9 output 9)
##
```
SELECT * FROM EMP_AUDIT;
```
![output](exp9 output 10)

## program-3

```
SET SERVEROUTPUT ON;
```
##
```
CREATE TABLE EMPLOYEE_R3 (
    EMP_ID NUMBER PRIMARY KEY,
    EMP_NAME VARCHAR2(30),
    SALARY NUMBER
);
```
![output](exp9 output 11)
##
```
INSERT INTO EMPLOYEE_R3 VALUES (101, 'Ravi', 45000);
INSERT INTO EMPLOYEE_R3 VALUES (102, 'Sita', 50000);

COMMIT;
```
![output](exp9 output 12)

##
```
CREATE OR REPLACE TRIGGER TRG_ROW_SALARY_CHECK
BEFORE UPDATE OF SALARY ON EMPLOYEE_R3
FOR EACH ROW
BEGIN
    IF :NEW.SALARY < 0 THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Salary cannot be negative'
        );
    END IF;

    DBMS_OUTPUT.PUT_LINE(
        'Old Salary: ' || :OLD.SALARY ||
        ', New Salary: ' || :NEW.SALARY
    );
END;
/
```
![output](exp9 output 13)

## Valid update
```
UPDATE EMPLOYEE_R3
SET SALARY = 55000
WHERE EMP_ID = 101;
```
![output](exp9 output 14)

## Invalid update
```
BEGIN
    UPDATE EMPLOYEE_R3
    SET SALARY = -1000
    WHERE EMP_ID = 102;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
```
COMMIT;
![output](exp9 output 15)
##
```
SELECT * FROM EMPLOYEE_R3;
```
![output](exp9 output 16)


## program-4

##
```
SET SERVEROUTPUT ON;
```
##
```
CREATE TABLE EMPLOYEE_S4 (
    EMP_ID NUMBER PRIMARY KEY,
    EMP_NAME VARCHAR2(30),
    SALARY NUMBER
);
```
![output](exp9 output 17)

##
```
CREATE TABLE DELETE_LOG (
    MESSAGE VARCHAR2(100),
    LOG_DATE DATE
);
```
![output](exp9 output 18)

##
```
INSERT INTO EMPLOYEE_S4 VALUES (101, 'Ravi', 45000);
INSERT INTO EMPLOYEE_S4 VALUES (102, 'Sita', 50000);
INSERT INTO EMPLOYEE_S4 VALUES (103, 'Kiran', 55000);

COMMIT;
```
![output](exp9 output 19)

##
```
CREATE OR REPLACE TRIGGER TRG_AFTER_DELETE
AFTER DELETE ON EMPLOYEE_S4
BEGIN
    INSERT INTO DELETE_LOG
    VALUES ('Delete operation completed', SYSDATE);

    DBMS_OUTPUT.PUT_LINE(
        'Delete operation completed.'
    );
END;
/
```

##
```
DELETE FROM EMPLOYEE_S4
WHERE EMP_ID IN (101, 102);

COMMIT;
```
![output](exp9 output 20)

##
```
SELECT * FROM DELETE_LOG;
```
![output](exp9 output 21)

##
```
SELECT * FROM EMPLOYEE_S4;
```
![output](exp9 output 22)

## program-5

##
```
SET SERVEROUTPUT ON;
```
##
```
CREATE TABLE EMPLOYEE_I5 (
    EMP_ID NUMBER PRIMARY KEY,
    EMP_NAME VARCHAR2(30),
    SALARY NUMBER
);
```
![output](exp9 output 23)

##
```
INSERT INTO EMPLOYEE_I5 VALUES (101, 'Ravi', 45000);
INSERT INTO EMPLOYEE_I5 VALUES (102, 'Sita', 50000);

COMMIT;
```
![output](exp9 output 24)

##
```
CREATE OR REPLACE VIEW EMPLOYEE_VIEW AS
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE_I5;
```
![output](exp9 output 25)

##
```
CREATE OR REPLACE TRIGGER TRG_INSTEAD_UPDATE
INSTEAD OF UPDATE ON EMPLOYEE_VIEW
FOR EACH ROW
BEGIN
    UPDATE EMPLOYEE_I5
    SET SALARY = :NEW.SALARY
    WHERE EMP_ID = :OLD.EMP_ID;
END;
/
```
![output](exp9 output 26)

##
```
UPDATE EMPLOYEE_VIEW
SET SALARY = 60000
WHERE EMP_ID = 101;

COMMIT;
```

##
```
SELECT * FROM EMPLOYEE_I5;
```
![output](exp9 output 27)

```
##
```
```
