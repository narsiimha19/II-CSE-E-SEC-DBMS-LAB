# EXPERIMENT-3B

# Q1
```
CREATE VIEW EMP_VIEW AS
SELECT *
FROM EMPLOYEE;
```
![output a](output-week3b/q1.png)
# Q2
```
CREATE VIEW EMP_BASIC AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY
FROM EMPLOYEE;
```
![output a](output-week3b/q2.png)

# Q3
```
SELECT * FROM EMP_VIEW;
```
![output a](output-week3b/q3.png)

# Q4
```
CREATE VIEW IT_EMPLOYEES AS
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT = 'IT';
```
![output a](output-week3b/q4.png)

# Q5
```
CREATE VIEW HIGH_SALARY AS
SELECT * FROM EMPLOYEE
WHERE SALARY > 60000;
```
![output a](output-week3b/q5.png)

# Q6
```
CREATE VIEW HYDERABAD_EMP AS
SELECT *
FROM EMPLOYEE
WHERE CITY = 'Hyderabad';
```
![output a](output-week3b/q6.png)

# Q7
```
CREATE VIEW FEMALE_EMP AS
SELECT *
FROM EMPLOYEE
WHERE GENDER = 'Female';
```
![output a](output-week3b/q7.png)

# Q8
```
CREATE VIEW RECENT_EMPLOYEES AS
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE >= TO_DATE('01-JAN-2020','DD-MON-YYYY');
```
![output a](output-week3b/q8.png)

# Q9
```
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM HIGH_SALARY;
```
![output a](output-week3b/q9.png)

# Q10
```
CREATE OR REPLACE VIEW EMP_BASIC AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME,
       DEPARTMENT, SALARY, CITY
FROM EMPLOYEE;
```
![output a](output-week3b/q10.png)

# Q11
```
CREATE VIEW EMP_SALARY_VIEW AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEE
WITH READ ONLY;
```
![output a](output-week3b/q11.png)

# Q12
```
CREATE VIEW SALES_EMP AS
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT = 'Sales'
WITH CHECK OPTION;
```
![output a](output-week3b/q12.png)

# Q13
```
UPDATE EMP_BASIC
SET SALARY = 75000
WHERE EMPLOYEE_ID = 101;

COMMIT;
```
![output a](output-week3b/q13.png)

# Q14
```
DELETE FROM EMP_VIEW
WHERE EMPLOYEE_ID = 107;

COMMIT;
```
![output a](output-week3b/q14.png)

# Q15
```
INSERT INTO EMP_BASIC
VALUES (111, 'Ravi', 'Kumar', 'IT', 50000, 'Hyderabad');

COMMIT;
```
![output a](output-week3b/q15.png)

# Q16
```
DESC EMP_BASIC;
```
![output a](output-week3b/q16.png)

# Q17
```
SELECT * FROM IT_EMPLOYEES;
```
![output a](output-week3b/q17.png)

# Q18
```
SELECT * FROM HIGH_SALARY
WHERE SALARY > 70000;
```
![output a](output-week3b/q18.png)

# Q19
```
SELECT * FROM FEMALE_EMP;
```
![output a](output-week3b/q19.png)

# Q20
```
SELECT FIRST_NAME, SALARY
FROM HYDERABAD_EMP;
```
![output a](output-week3b/q20.png)

# Q21
DROP VIEW EMP_VIEW;
![output a](output-week3b/q21.png)

# Q22
DROP VIEW HIGH_SALARY;
![output a](output-week3b/q22.png)

# Q23
DROP VIEW EMP_BASIC;
![output a](output-week3b/q23.png)

# Q24
```
CREATE VIEW HR_EMPLOYEES AS
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT = 'HR';
```
![output a](output-week3b/q24.png)

# Q25
```
CREATE VIEW MARKETING_EMP AS
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT, SALARY
FROM EMPLOYEE
WHERE DEPARTMENT = 'Marketing';
```
![output a](output-week3b/q25.png)

# Q26
```
CREATE VIEW TOP_EARNERS AS
SELECT * FROM EMPLOYEE
WHERE SALARY > 70000;
```
![output a](output-week3b/q26.png)

# Q27
```
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, CITY
FROM EMPLOYEE;
```
![output a](output-week3b/q27.png)
