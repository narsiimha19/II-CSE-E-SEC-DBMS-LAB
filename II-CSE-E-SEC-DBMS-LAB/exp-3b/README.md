# EXPERIMENT-3B

# Q1
```
CREATE VIEW EMP_VIEW AS
SELECT *
FROM EMPLOYEE;
```
<img width="1600" height="957" alt="display emp-view" src="https://github.com/user-attachments/assets/8a9b7356-5d71-4ef9-b1f1-70168a9f44e9" />

# Q2
```
CREATE VIEW EMP_BASIC AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY
FROM EMPLOYEE;
```
<img width="1362" height="958" alt="emp-basic" src="https://github.com/user-attachments/assets/5810873e-1bdc-43a7-acf8-dc89c2fb3e70" />


# Q3
```
SELECT * FROM EMP_VIEW;
```
<img width="1310" height="962" alt="emp-view" src="https://github.com/user-attachments/assets/b14e658c-3da9-4a1a-a789-1e5dd89dd3c4" />


# Q4
```
CREATE VIEW IT_EMPLOYEES AS
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT = 'IT';
```
<img width="1336" height="973" alt="q4" src="https://github.com/user-attachments/assets/e1e2b5c9-5e56-4e73-9414-063cedb1b1f6" />


# Q5
```
CREATE VIEW HIGH_SALARY AS
SELECT * FROM EMPLOYEE
WHERE SALARY > 60000;
```
<img width="1375" height="961" alt="q5" src="https://github.com/user-attachments/assets/ab1b4738-67b2-4e75-8617-ff42bdcdd4b8" />


# Q6
```
CREATE VIEW HYDERABAD_EMP AS
SELECT *
FROM EMPLOYEE
WHERE CITY = 'Hyderabad';
```
<img width="1392" height="983" alt="q6" src="https://github.com/user-attachments/assets/2d111050-65e3-461b-8154-7305a6f36146" />

# Q7
```
CREATE VIEW FEMALE_EMP AS
SELECT *
FROM EMPLOYEE
WHERE GENDER = 'Female';
```
<img width="1397" height="976" alt="q7" src="https://github.com/user-attachments/assets/a76194a1-3fc9-4daf-9e07-1aeabd721273" />


# Q8
```
CREATE VIEW RECENT_EMPLOYEES AS
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE >= TO_DATE('01-JAN-2020','DD-MON-YYYY');
```
<img width="1480" height="975" alt="q8" src="https://github.com/user-attachments/assets/3471975b-b3ce-4b76-a43e-d3cf311ac452" />

# Q9
```
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM HIGH_SALARY;
```
<img width="1366" height="973" alt="q9" src="https://github.com/user-attachments/assets/66cd81cf-08f0-495d-abbc-6d85dbe08f60" />


# Q10
```
CREATE OR REPLACE VIEW EMP_BASIC AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME,
       DEPARTMENT, SALARY, CITY
FROM EMPLOYEE;
```
<img width="1462" height="983" alt="q10" src="https://github.com/user-attachments/assets/4c3644c8-f82b-4cc3-a434-95ae7b497b40" />


# Q11
```
CREATE VIEW EMP_SALARY_VIEW AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEE
WITH READ ONLY;
```
<img width="1452" height="968" alt="q11" src="https://github.com/user-attachments/assets/2240c74b-7aaf-49b4-bad8-e522ef2bda1d" />


# Q12
```
CREATE VIEW SALES_EMP AS
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT = 'Sales'
WITH CHECK OPTION;
```
<img width="1417" height="970" alt="q12" src="https://github.com/user-attachments/assets/9ff7bf65-af98-4076-aac8-12dcc3f20c34" />


# Q13
```
UPDATE EMP_BASIC
SET SALARY = 75000
WHERE EMPLOYEE_ID = 101;

COMMIT;
```
<img width="1357" height="965" alt="q13" src="https://github.com/user-attachments/assets/5d61a54b-1d7b-41e2-af6c-ad9b7c5a3ee6" />

# Q14
```
DELETE FROM EMP_VIEW
WHERE EMPLOYEE_ID = 107;

COMMIT;
```
<img width="1377" height="978" alt="q14" src="https://github.com/user-attachments/assets/b72ad0e1-cafa-4dd4-9a09-e225f3fd11b5" />


# Q15
```
INSERT INTO EMP_BASIC
VALUES (111, 'Ravi', 'Kumar', 'IT', 50000, 'Hyderabad');

COMMIT;
```
<img width="1416" height="981" alt="q15" src="https://github.com/user-attachments/assets/c3308090-24fb-4998-b14c-4c3cd62e7cbf" />


# Q16
```
DESC EMP_BASIC;
```
<img width="1386" height="982" alt="q16" src="https://github.com/user-attachments/assets/b11d9570-c12f-4eab-b247-5975914672fb" />


# Q17
```
SELECT * FROM IT_EMPLOYEES;
```
<img width="1600" height="856" alt="q17" src="https://github.com/user-attachments/assets/d0e591ec-f383-4afd-9418-6c4f51a66c71" />


# Q18
```
SELECT * FROM HIGH_SALARY
WHERE SALARY > 70000;
```
<img width="1536" height="978" alt="q18" src="https://github.com/user-attachments/assets/75ad717f-f4a1-4a0c-957a-7f44fce43e7c" />

# Q19
```
SELECT * FROM FEMALE_EMP;
```
<img width="1600" height="920" alt="q19" src="https://github.com/user-attachments/assets/dee1e283-e354-4745-96d6-8ba3e53f4bad" />


# Q20
```
SELECT FIRST_NAME, SALARY
FROM HYDERABAD_EMP;
```
<img width="1526" height="982" alt="q20" src="https://github.com/user-attachments/assets/6e6d82b7-3d0d-4661-9473-ebfb98b50ba7" />


# Q21
DROP VIEW EMP_VIEW;
<img width="1372" height="986" alt="q21" src="https://github.com/user-attachments/assets/49e33ba8-10cf-40b8-b9ad-bf1b4f7050a1" />


# Q22
DROP VIEW HIGH_SALARY;
<img width="1426" height="975" alt="q22" src="https://github.com/user-attachments/assets/97508777-2d2f-4dac-9d12-c8ea66e18553" />


# Q23
DROP VIEW EMP_BASIC;
<img width="1395" height="976" alt="q23" src="https://github.com/user-attachments/assets/7a0a20db-4fa9-4922-ba15-c07cecc8228b" />

# Q24
```
CREATE VIEW HR_EMPLOYEES AS
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT = 'HR';
```
<img width="1522" height="972" alt="q24" src="https://github.com/user-attachments/assets/de3f55a2-2312-4290-8210-ae98ab71fc16" />


# Q25
```
CREATE VIEW MARKETING_EMP AS
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT, SALARY
FROM EMPLOYEE
WHERE DEPARTMENT = 'Marketing';
```
<img width="1531" height="987" alt="q25" src="https://github.com/user-attachments/assets/53dc00b7-5642-4455-9053-c1b6c0be4a36" />

# Q26
```
CREATE VIEW TOP_EARNERS AS
SELECT * FROM EMPLOYEE
WHERE SALARY > 70000;
```
<img width="1521" height="962" alt="q26" src="https://github.com/user-attachments/assets/75e33972-74cf-4063-b4f1-9f2fa9aba12a" />


# Q27
```
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, CITY
FROM EMPLOYEE;
```
<img width="1366" height="977" alt="q27" src="https://github.com/user-attachments/assets/e798ce12-9e3c-4178-84b6-81df6014ce83" />
