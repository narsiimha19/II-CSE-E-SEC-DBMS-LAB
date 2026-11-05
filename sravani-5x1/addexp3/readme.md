## CREATE EMPLOYEE TABLE
```
CREATE TABLE EMPLOYEE6 (
    ID NUMBER PRIMARY KEY,
    ENAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(30),
    SALARY NUMBER(10,2)
);
```
![OUTPUT](addexp3 output)
## INSERT INTO EMPLOYEE TABLE
```
INSERT INTO EMPLOYEE6 VALUES (101, 'Rahul', 'IT', 45000);
INSERT INTO EMPLOYEE6 VALUES (102, 'Priya', 'HR', 40000);
INSERT INTO EMPLOYEE6 VALUES (103, 'Arjun', 'IT', 50000);
INSERT INTO EMPLOYEE6 VALUES (104, 'Sneha', 'Finance', 48000);
INSERT INTO EMPLOYEE6 VALUES (105, 'Kiran', 'HR', 42000);
```
![OUTPUT](addexp3 output1)

##
```
COMMIT;
```
![OUTPUT](addexp3 output2)

##
```
-- Enable output
SET SERVEROUTPUT ON;

-- PL/SQL program using parameterized cursor
DECLARE
    CURSOR c_employee(p_dept VARCHAR2) IS
        SELECT ID, ENAME, DEPARTMENT, SALARY
        FROM EMPLOYEE6
        WHERE UPPER(DEPARTMENT) = UPPER(p_dept);

BEGIN
    DBMS_OUTPUT.PUT_LINE('Employees in IT Department');
    DBMS_OUTPUT.PUT_LINE('---------------------------');

    FOR rec IN c_employee('IT') LOOP
        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || rec.ID ||
            ', Name: ' || rec.ENAME ||
            ', Department: ' || rec.DEPARTMENT ||
            ', Salary: ' || rec.SALARY
        );
    END LOOP;
END;
/
```
![OUTPUT](addexp3 output3)
