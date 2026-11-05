# WEEK-3 DBMSLAB

# Employee table creation

```
CREATE TABLE EMPLOYEE
(
    EMPLOYEE_ID NUMBER(4) PRIMARY KEY,
    FIRST_NAME VARCHAR2(20),
    LAST_NAME VARCHAR2(20),
    GENDER CHAR(1),
    JOB_ID VARCHAR2(15),
    DEPARTMENT VARCHAR2(20),
    SALARY NUMBER(8),
    COMMISSION NUMBER(5),
    HIRE_DATE DATE,
    CITY VARCHAR2(20)
);
```
![output 1](week3(outputs)/create_emp.png)

# Inserting values

```
INSERT INTO EMPLOYEE
VALUES (101, 'John', 'Smith', 'M', 'IT_PROG', 'IT', 65000, 5,
        TO_DATE('15-JAN-2020','DD-MON-YYYY'), 'Hyderabad');

INSERT INTO EMPLOYEE
VALUES (102, 'Anita', 'Sharma', 'F', 'HR_REP', 'HR', 52000, 3,
        TO_DATE('10-JUN-2019','DD-MON-YYYY'), 'Bengaluru');

INSERT INTO EMPLOYEE
VALUES (103, 'Rahul', 'Kumar', 'M', 'SA_REP', 'Sales', 48000, 8,
        TO_DATE('25-AUG-2021','DD-MON-YYYY'), 'Chennai');

INSERT INTO EMPLOYEE
VALUES (104, 'Priya', 'Reddy', 'F', 'MK_MAN', 'Marketing', 72000, 10,
        TO_DATE('05-MAR-2018','DD-MON-YYYY'), 'Hyderabad');

INSERT INTO EMPLOYEE
VALUES (105, 'David', 'Wilson', 'M', 'FI_ACCOUNT', 'Finance', 58000, NULL,
        TO_DATE('18-DEC-2017','DD-MON-YYYY'), 'Mumbai');

INSERT INTO EMPLOYEE
VALUES (106, 'Sneha', 'Patel', 'F', 'IT_PROG', 'IT', 69000, 6,
        TO_DATE('12-NOV-2022','DD-MON-YYYY'), 'Pune');

INSERT INTO EMPLOYEE
VALUES (107, 'Amit', 'Verma', 'M', 'SA_REP', 'Sales', 45000, 4,
        TO_DATE('20-JUL-2023','DD-MON-YYYY'), 'Delhi');

INSERT INTO EMPLOYEE
VALUES (108, 'Kiran', 'Rao', 'M', 'HR_REP', 'HR', 50000, NULL,
        TO_DATE('09-FEB-2021','DD-MON-YYYY'), 'Hyderabad');

INSERT INTO EMPLOYEE
VALUES (109, 'Lakshmi', 'Nair', 'F', 'IT_PROG', 'IT', 76000, 7,
        TO_DATE('14-SEP-2016','DD-MON-YYYY'), 'Kochi');

INSERT INTO EMPLOYEE
VALUES (110, 'Arjun', 'Singh', 'M', 'MK_MAN', 'Marketing', 68000, 5,
        TO_DATE('30-APR-2019','DD-MON-YYYY'), 'Jaipur');

```
![output 2](week3(outputs)/insert_emp.png)


# Describing the table 

```      	 
SELECT * FROM EMPLOYEE;
```
![output 1](week3(outputs)/dis_emp.png)


# q1
```
SELECT EMPLOYEE_ID, FIRST_NAME,
       TO_CHAR(HIRE_DATE, 'DD-MON-YYYY') AS HIRE_DATE
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q1-a.png)


# q2
```
SELECT EMPLOYEE_ID, FIRST_NAME,
       TO_CHAR(SALARY, 'L99,999,999') AS SALARY
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q2-a.png)


# q3
```
SELECT EMPLOYEE_ID, FIRST_NAME,
       TO_NUMBER(SALARY) + 5000 AS NEW_SALARY
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q3-a.png)


# q4
```
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE > TO_DATE('01-JAN-2020', 'DD-MON-YYYY');
```

![output 1](week3(outputs)/q4-a.png)


# q5
```
SELECT EMPLOYEE_ID,
       FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q5-a.png)


# q6
```
SELECT EMPLOYEE_ID,
       CONCAT(FIRST_NAME, CONCAT(' ', LAST_NAME)) AS FULL_NAME
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q6-a.png)


# q7
```
SELECT FIRST_NAME,
       LPAD(FIRST_NAME, 10, '*') AS PADDED_NAME
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q7-a.png)


# q8
```
SELECT FIRST_NAME,
       RPAD(FIRST_NAME, 10, '*') AS PADDED_NAME
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q8-a.png)


# q9
```
SELECT FIRST_NAME,
       LTRIM(FIRST_NAME) AS TRIMMED_NAME
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q9-a.png)


# q10
```
SELECT FIRST_NAME,
       RTRIM(FIRST_NAME) AS TRIMMED_NAME
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q10-a.png)

# q11
```
SELECT FIRST_NAME,
```
![output 1](week3(outputs)/q11-a.png)

# q12
```
SELECT FIRST_NAME,
       UPPER(FIRST_NAME) AS UPPERCASE_NAME
```
![output 1](week3(outputs)/q12-a.png)

# q13
```
SELECT FIRST_NAME,
       INITCAP(FIRST_NAME) AS PROPER_NAME
```
![output 1](week3(outputs)/q13-a.png)

# q14
```
SELECT FIRST_NAME,
       LENGTH(FIRST_NAME) AS NAME_LENGTH
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q14.png)

# q15
```
SELECT FIRST_NAME,
       SUBSTR(FIRST_NAME, 1, 3) AS FIRST_THREE
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q15-a.png)

# q16
```
SELECT FIRST_NAME,
       INSTR(LOWER(FIRST_NAME), 'a') AS POSITION_OF_A
```
![output 1](week3(outputs)/q16-a.png)

# q17
```
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME,
       HIRE_DATE, SYSDATE AS CURRENT_DATE
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q17-a.png)

# q18
```
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE,
       NEXT_DAY(HIRE_DATE, 'MONDAY') AS NEXT_MONDAY
```
![output 1](week3(outputs)/q18-a.png)

# q19
```
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE,
       ADD_MONTHS(HIRE_DATE, 6) AS AFTER_SIX_MONTHS
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q19-a.png)

# q20
```
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE,
       LAST_DAY(HIRE_DATE) AS LAST_DAY_OF_MONTH
FROM EMPLOYEE;

```
![output 1](week3(outputs)/q20-a.png)

# q21
```
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE,
       ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE), 2) AS MONTHS_WORKED
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q21-a.png)


# q22
```
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,
       LEAST(SALARY, 60000) AS SMALLER_VALUE
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q22-a.png)

# q23
```
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,
       GREATEST(SALARY, 60000) AS GREATER_VALUE
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q23-a.png)

# q24
```
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE,
       TRUNC(HIRE_DATE, 'MONTH') AS FIRST_DAY_OF_MONTH
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q21-a-a.png)

# q25
```
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE,
       ROUND(HIRE_DATE, 'MONTH') AS ROUNDED_DATE
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q25-a.png)

# q26
```
SELECT EMPLOYEE_ID, FIRST_NAME,
       TO_CHAR(HIRE_DATE, 'DAY, DD-MON-YYYY') AS FORMATTED_DATE
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q26-a.png)

# q27
```
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE < TO_DATE('01-JAN-2019', 'DD-MON-YYYY');
SELECT * FROM EMPLOYEE;
```
![output 1](week3(outputs)/q27-a.png)


# EXPERIMENT-3B

# Q1
```
CREATE VIEW EMP_VIEW AS
SELECT *
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q1-b.png)

# Q2
```
CREATE VIEW EMP_BASIC AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q2-b.png)

# Q3
```
SELECT * FROM EMP_VIEW;
```
![output 1](week3(outputs)/q3-b.png)

# Q4
```
CREATE VIEW IT_EMPLOYEES AS
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT = 'IT';
```
![output 1](week3(outputs)/q4-b.png)

# Q5
```
CREATE VIEW HIGH_SALARY AS
SELECT * FROM EMPLOYEE
WHERE SALARY > 60000;
```
![output 1](week3(outputs)/q5-b.png)

# Q6
```
CREATE VIEW HYDERABAD_EMP AS
SELECT *
FROM EMPLOYEE
WHERE CITY = 'Hyderabad';
```
![output 1](week3(outputs)/q6-b.png)

# Q7
```
CREATE VIEW FEMALE_EMP AS
SELECT *
FROM EMPLOYEE
WHERE GENDER = 'Female';
```
![output 1](week3(outputs)/q7-b.png)

# Q8
```
CREATE VIEW RECENT_EMPLOYEES AS
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE >= TO_DATE('01-JAN-2020','DD-MON-YYYY');
```
![output 1](week3(outputs)/q8-b.png)

# Q9
```
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM HIGH_SALARY;
```
![output 1](week3(outputs)/q9-b.png)

# Q10
```
CREATE OR REPLACE VIEW EMP_BASIC AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME,
       DEPARTMENT, SALARY, CITY
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q10-b.png)

# Q11
```
CREATE VIEW EMP_SALARY_VIEW AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEE
WITH READ ONLY;
```
![output 1](week3(outputs)/q11-b.png)

# Q12
```
CREATE VIEW SALES_EMP AS
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT = 'Sales'
WITH CHECK OPTION;
```
![output 1](week3(outputs)/q12-b.png)

# Q13
```
UPDATE EMP_BASIC
SET SALARY = 75000
WHERE EMPLOYEE_ID = 101;

COMMIT;
```
![output 1](week3(outputs)/q13-b.png)

# Q14
```
DELETE FROM EMP_VIEW
WHERE EMPLOYEE_ID = 107;

COMMIT;
```
![output 1](week3(outputs)/q14-b.png)

# Q15
```
INSERT INTO EMP_BASIC
VALUES (111, 'Ravi', 'Kumar', 'IT', 50000, 'Hyderabad');

COMMIT;
```
![output 1](week3(outputs)/q15-b.png)

# Q16
```
DESC EMP_BASIC;
```
![output 1](week3(outputs)/q16-b.png)

# Q17
```
SELECT * FROM IT_EMPLOYEES;
```
![output 1](week3(outputs)/q17-b.png)

# Q18
```
SELECT * FROM HIGH_SALARY
WHERE SALARY > 70000;
```
![output 1](week3(outputs)/q18-b.png)

# Q19
```
SELECT * FROM FEMALE_EMP;
```
![output 1](week3(outputs)/q19-b.png)

# Q20
```
SELECT FIRST_NAME, SALARY
FROM HYDERABAD_EMP;
```
![output 1](week3(outputs)/q20-b.png)

# Q21
```
DROP VIEW EMP_VIEW;
```
![output 1](week3(outputs)/q21-b.png)

# Q22
```
DROP VIEW HIGH_SALARY;
```
![output 1](week3(outputs)/q22-b.png)

# Q23
```
DROP VIEW EMP_BASIC;
```
![output 1](week3(outputs)/q23-b.png)

# Q24
```
CREATE VIEW HR_EMPLOYEES AS
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT = 'HR';
```
![output 1](week3(outputs)/q24-b.png)

# Q25
```
CREATE VIEW MARKETING_EMP AS
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT, SALARY
FROM EMPLOYEE
WHERE DEPARTMENT = 'Marketing';
```
![output 1](week3(outputs)/q25-b.png)

# Q26
```
CREATE VIEW TOP_EARNERS AS
SELECT * FROM EMPLOYEE
WHERE SALARY > 70000;
```
![output 1](week3(outputs)/q26-b.png)

# Q27
```
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, CITY
FROM EMPLOYEE;
```
![output 1](week3(outputs)/q27-b.png)

