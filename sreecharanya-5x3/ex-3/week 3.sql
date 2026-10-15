CREATE TABLE EMPLOYEE (
    EMPLOYEE_ID NUMBER(5) PRIMARY KEY,
    FIRST_NAME VARCHAR2(20),
    LAST_NAME VARCHAR2(20),
    GENDER CHAR(1),
    JOB_ID VARCHAR2(15),
    DEPARTMENT VARCHAR2(30),
    SALARY NUMBER(8,2),
    COMMISSION NUMBER(5,2),
    HIRE_DATE DATE,
    CITY VARCHAR2(20)
);

INSERT INTO EMPLOYEE VALUES
(101, 'John', 'Smith', 'M', 'IT_PROG', 'IT',
 65000, 5, TO_DATE('15-JAN-2020','DD-MON-YYYY'), 'Hyderabad');

INSERT INTO EMPLOYEE VALUES
(102, 'Anita', 'Sharma', 'F', 'HR_REP', 'HR',
 52000, 3, TO_DATE('10-JUN-2019','DD-MON-YYYY'), 'Bengaluru');

INSERT INTO EMPLOYEE VALUES
(103, 'Rahul', 'Kumar', 'M', 'SA_REP', 'Sales',
 48000, 8, TO_DATE('25-AUG-2021','DD-MON-YYYY'), 'Chennai');

INSERT INTO EMPLOYEE VALUES
(104, 'Priya', 'Reddy', 'F', 'MK_MAN', 'Marketing',
 72000, 10, TO_DATE('05-MAR-2018','DD-MON-YYYY'), 'Hyderabad');

INSERT INTO EMPLOYEE VALUES
(105, 'David', 'Wilson', 'M', 'FI_ACCOUNT', 'Finance',
 58000, NULL, TO_DATE('18-DEC-2017','DD-MON-YYYY'), 'Mumbai');

INSERT INTO EMPLOYEE VALUES
(106, 'Sneha', 'Patel', 'F', 'IT_PROG', 'IT',
 69000, 6, TO_DATE('12-NOV-2022','DD-MON-YYYY'), 'Pune');

INSERT INTO EMPLOYEE VALUES
(107, 'Amit', 'Verma', 'M', 'SA_REP', 'Sales',
 45000, 4, TO_DATE('20-JUL-2023','DD-MON-YYYY'), 'Delhi');

INSERT INTO EMPLOYEE VALUES
(108, 'Kiran', 'Rao', 'M', 'HR_REP', 'HR',
 50000, NULL, TO_DATE('09-FEB-2021','DD-MON-YYYY'), 'Hyderabad');
 
 COMMIT;
 
 SELECT * FROM EMPLOYEE;

SELECT employee_id, first_name,
       TO_CHAR(hire_date, 'DD-MON-YYYY') AS hire_date
FROM employee;

SELECT employee_id, first_name,
       TO_CHAR(salary, 'L99,999,999.00') AS salary
FROM employee;

SELECT employee_id, first_name,
       TO_NUMBER(salary) + 5000 AS new_salary
FROM employee;

SELECT *
FROM employee
WHERE hire_date > TO_DATE('01-JAN-2020', 'DD-MON-YYYY');

SELECT employee_id,
       first_name || ' ' || last_name AS full_name
FROM employee; 
 
 SELECT employee_id,
       CONCAT(first_name, CONCAT(' ', last_name)) AS full_name
FROM employee;

SELECT first_name,
       LPAD(first_name, 15, '*') AS padded_name
FROM employee;

SELECT first_name,
       RPAD(first_name, 15, '*') AS padded_name
FROM employee;

SELECT first_name,
       LTRIM(first_name) AS trimmed_name
FROM employee;

SELECT last_name,
       RTRIM(last_name) AS trimmed_name
FROM employee;

SELECT employee_id,
       LOWER(first_name) AS first_name
FROM employee;

SELECT employee_id,
       UPPER(first_name) AS first_name
FROM employee;

SELECT employee_id,
       INITCAP(first_name) AS first_name
FROM employee;

SELECT employee_id, first_name,
       LENGTH(first_name) AS name_length
FROM employee;

SELECT employee_id, first_name,
       SUBSTR(first_name, 1, 3) AS first_three_chars
FROM employee;

SELECT employee_id, first_name,
       INSTR(LOWER(first_name), 'a') AS position_of_a
FROM employee;

SELECT employee_id, first_name, last_name, hire_date,
       SYSDATE AS current_date
FROM employee;

SELECT employee_id, first_name, hire_date,
       NEXT_DAY(hire_date, 'MONDAY') AS next_monday
FROM employee;

SELECT employee_id, first_name, hire_date,
       ADD_MONTHS(hire_date, 6) AS date_after_six_months
FROM employee;

SELECT employee_id, first_name, hire_date,
       LAST_DAY(hire_date) AS last_day_of_month
FROM employee;

SELECT employee_id, first_name, hire_date,
       MONTHS_BETWEEN(SYSDATE, hire_date) AS months_worked
FROM employee;

SELECT employee_id, first_name, salary,
       LEAST(salary, 60000) AS smaller_value
FROM employee;

SELECT employee_id, first_name, salary,
       GREATEST(salary, 60000) AS greater_value
FROM employee;

SELECT employee_id, first_name, hire_date,
       TRUNC(hire_date, 'MONTH') AS first_day_of_month
FROM employee;

SELECT employee_id, first_name, hire_date,
       ROUND(hire_date, 'MONTH') AS rounded_month
FROM employee;

SELECT employee_id, first_name,
       TO_CHAR(hire_date, 'DAY, DD-MON-YYYY') AS formatted_hire_date
FROM employee;

SELECT *
FROM employee
WHERE hire_date < TO_DATE('01-JAN-2019', 'DD-MON-YYYY');

CREATE VIEW EMP_VIEW AS
SELECT *
FROM EMPLOYEE;

CREATE VIEW EMP_BASIC AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY
FROM EMPLOYEE;

SELECT *
FROM EMP_VIEW;

CREATE VIEW IT_EMPLOYEES AS
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT = 'IT';

CREATE VIEW HIGH_SALARY AS
SELECT *
FROM EMPLOYEE
WHERE SALARY > 60000;

CREATE VIEW HYDERABAD_EMP AS
SELECT *
FROM EMPLOYEE
WHERE CITY = 'Hyderabad';

CREATE VIEW FEMALE_EMP AS
SELECT *
FROM EMPLOYEE
WHERE GENDER = 'Female';

CREATE VIEW RECENT_EMPLOYEES AS
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE >= TO_DATE('01-JAN-2020', 'DD-MON-YYYY');

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM HIGH_SALARY;

CREATE OR REPLACE VIEW EMP_BASIC AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY, CITY
FROM EMPLOYEE;

CREATE VIEW EMP_SALARY_VIEW AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEE
WITH READ ONLY;

CREATE VIEW SALES_EMP AS
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT = 'Sales'
WITH CHECK OPTION;

UPDATE EMP_BASIC
SET SALARY = 75000
WHERE EMPLOYEE_ID = 101;

DELETE FROM EMP_VIEW
WHERE EMPLOYEE_ID = 107;

INSERT INTO EMP_BASIC
(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY, CITY)
VALUES
(111, 'Ravi', 'Kumar', 'IT', 55000, 'Hyderabad');

DESC EMP_BASIC;

SELECT *
FROM IT_EMPLOYEES;

SELECT *
FROM HIGH_SALARY
WHERE SALARY > 70000;

SELECT *
FROM FEMALE_EMP;

SELECT FIRST_NAME, SALARY
FROM HYDERABAD_EMP;

DROP VIEW EMP_VIEW;

DROP VIEW HIGH_SALARY;

DROP VIEW EMP_BASIC;

CREATE VIEW HR_EMPLOYEES AS
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT = 'HR';

CREATE VIEW MARKETING_EMP AS
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT, SALARY
FROM EMPLOYEE
WHERE DEPARTMENT = 'Marketing';

CREATE VIEW TOP_EARNERS AS
SELECT *
FROM EMPLOYEE
WHERE SALARY > 70000;

CREATE VIEW EMP_CITY AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, CITY
FROM EMPLOYEE;