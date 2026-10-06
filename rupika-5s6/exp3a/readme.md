SELECT * FROM EMPLOYEE;

Q1
CREATE VIEW EMP_VIEW AS
SELECT *
FROM EMPLOYEE;
![output](<Screenshot (79).png>)

Q2
CREATE VIEW EMP_BASIC AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY
FROM EMPLOYEE;
![output](<Screenshot (80).png>)

Q3
SELECT *
FROM EMP_VIEW;
![output](<Screenshot (86).png>) 

Q4
CREATE VIEW IT_EMPLOYEES AS
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT = 'IT';
![output](<Screenshot (87).png>)

Q5
CREATE VIEW HIGH_SALARY AS
SELECT *
FROM EMPLOYEE
WHERE SALARY > 60000;
![output](<Screenshot (88).png>)

Q6
CREATE VIEW HYDERABAD_EMP AS
SELECT *
FROM EMPLOYEE
WHERE CITY = 'Hyderabad';
![output](<Screenshot (89).png>)

Q7
CREATE VIEW FEMALE_EMP AS
SELECT *
FROM EMPLOYEE
WHERE GENDER = 'Female';
![output](<Screenshot (90).png>)

Q8
CREATE VIEW RECENT_EMPLOYEES AS
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE >= TO_DATE('01-JAN-2020','DD-MON-YYYY');
![output](<Screenshot (91).png>)

Q9
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM HIGH_SALARY;
![output](<Screenshot (92).png>)

Q10
CREATE OR REPLACE VIEW EMP_BASIC AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME,
       DEPARTMENT, SALARY, CITY
FROM EMPLOYEE;
![output](<Screenshot (93).png>)

Q11
CREATE VIEW EMP_SALARY_VIEW AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEE
WITH READ ONLY;

Q12
CREATE VIEW SALES_EMP AS
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT = 'Sales'
WITH CHECK OPTION;
![output](<Screenshot (95).png>)

Q13
UPDATE EMP_BASIC
SET SALARY = 75000
WHERE EMPLOYEE_ID = 101;

COMMIT;

Q14
DELETE FROM EMP_VIEW
WHERE EMPLOYEE_ID = 107;

COMMIT;

Q15
INSERT INTO EMP_BASIC
VALUES (111, 'Ravi', 'Kumar', 'IT', 50000, 'Hyderabad');

COMMIT;
![output](<Screenshot (100).png>)

Q16
DESC EMP_BASIC;

Q17
SELECT *
FROM IT_EMPLOYEES;
![output](<Screenshot (101).png>)

Q18
SELECT *
FROM HIGH_SALARY
WHERE SALARY > 70000;

Q19
SELECT *
FROM FEMALE_EMP;
![output](<Screenshot (103).png>)

Q20
SELECT FIRST_NAME, SALARY
FROM HYDERABAD_EMP;
![output](<Screenshot (104).png>)

Q21
DROP VIEW EMP_VIEW;
![output](<Screenshot (105).png>)

Q22
DROP VIEW HIGH_SALARY;

Q23
DROP VIEW EMP_BASIC;

Q24
CREATE VIEW HR_EMPLOYEES AS
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT = 'HR';

Q25
CREATE VIEW MARKETING_EMP AS
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT, SALARY
FROM EMPLOYEE
WHERE DEPARTMENT = 'Marketing';

Q26
CREATE VIEW TOP_EARNERS AS
SELECT *
FROM EMPLOYEE
WHERE SALARY > 70000;

Q27
CREATE VIEW EMP_CITY AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, CITY
FROM EMPLOYEE;




# 3b Experiment Question, Answers and Outputs



-- Q1. Create a view named EMP_VIEW that displays all columns from the EMPLOYEES table.
CREATE VIEW EMP_VIEW AS
SELECT *
FROM EMPLOYEES; 
![output](<Screenshot (106).png>)

- Q2. Create a view named EMP_BASIC that displays the Employee ID, First Name, Last Name, Department, and Salary.
CREATE VIEW EMP_BASIC AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY
FROM EMPLOYEES; 
![output](<Screenshot (107).png>)

-- Q3. Display all records from the EMP_VIEW.
SELECT *
FROM EMP_VIEW; 

![output](<Screenshot (108).png>)

-- Q4. Create a view named IT_EMPLOYEES that displays the details of employees working in the IT department.
CREATE VIEW IT_EMPLOYEES AS
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT = 'IT'; 

-- Q5. Create a view named HIGH_SALARY that displays employees whose salary is greater than ₹60,000.
CREATE VIEW HIGH_SALARY AS
SELECT *
FROM EMPLOYEES
WHERE SALARY > 60000; 

-- Q6. Create a view named HYDERABAD_EMP that displays employees whose city is Hyderabad.
CREATE VIEW HYDERABAD_EMP AS
SELECT *
FROM EMPLOYEES
WHERE CITY = 'Hyderabad'; 
![output](<Screenshot (110).png>)

-- Q7. Create a view named FEMALE_EMP that displays the details of all female employees.
CREATE VIEW FEMALE_EMP AS
SELECT *
FROM EMPLOYEES
WHERE GENDER = 'Female'; 

-- Q8. Create a view named RECENT_EMPLOYEES that displays employees hired on or after 01-JAN-2020.
CREATE VIEW RECENT_EMPLOYEES AS
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE >= '01-JAN-2020'; 
![output](<Screenshot (112).png>)

-- Q9. Display the Employee ID, First Name, and Salary from the HIGH_SALARY view.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM HIGH_SALARY; 


-- Q10. Replace the EMP_BASIC view by adding the CITY column using the CREATE OR REPLACE VIEW statement.
CREATE OR REPLACE VIEW EMP_BASIC AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY, CITY
FROM EMPLOYEES; 

-- Q11. Create a read-only view named EMP_SALARY_VIEW that displays the Employee ID, First Name, Last Name, and Salary.
CREATE VIEW EMP_SALARY_VIEW AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WITH READ ONLY; 

-- Q12. Create a view named SALES_EMP that displays employees belonging to the Sales department using the WITH CHECK OPTION clause.
CREATE VIEW SALES_EMP AS
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT = 'Sales'
WITH CHECK OPTION; 
![output](<Screenshot (116).png>)

-- Q13. Update the salary of employee 101 through the EMP_BASIC view.
UPDATE EMP_BASIC
SET SALARY = SALARY + 5000 -- Assuming an increase, or replace with a specific value like 65000
WHERE EMPLOYEE_ID = 101; 

-- Q14. Delete the details of employee 107 through the EMP_VIEW.
DELETE FROM EMP_VIEW
WHERE EMPLOYEE_ID = 107; 

-- Q15. Insert a new employee into the EMP_BASIC view.
INSERT INTO EMP_BASIC (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY, CITY)
VALUES (110, 'Rahul', 'Sharma', 'IT', 55000, 'Hyderabad'); 

-- Q16. Display the structure of the EMP_BASIC view.
DESCRIBE EMP_BASIC;
-- Note: 'DESC' or 'DESCRIBE' works in Oracle SQL*Plus. Alternatively, use 'PRAGMA table_info(EMP_BASIC);' in SQLite or 'SHOW COLUMNS FROM EMP_BASIC;' in MySQL. 

-- Q17. Display all records from the IT_EMPLOYEES view.
SELECT *
FROM IT_EMPLOYEES; 

-- Q18. Display employees from the HIGH_SALARY view whose salary is greater than ₹70,000.
SELECT *
FROM HIGH_SALARY
WHERE SALARY > 70000; 

-- Q19. Display all female employees from the FEMALE_EMP view.
SELECT *
FROM FEMALE_EMP; 

-- Q20. Display the names and salaries of employees from the HYDERABAD_EMP view.
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM HYDERABAD_EMP; 

-- Q21. Drop the EMP_VIEW.
DROP VIEW EMP_VIEW; 

-- Q22. Drop the HIGH_SALARY view.
DROP VIEW HIGH_SALARY; 
![output](<Screenshot (117).png>)


-- Q23. Drop the EMP_BASIC view.
DROP VIEW EMP_BASIC; 

-- Q24. Create a view named HR_EMPLOYEES that displays employees working in the HR department.
CREATE VIEW HR_EMPLOYEES AS
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT = 'HR'; 

-- Q25. Create a view named MARKETING_EMP that displays the Employee ID, First Name, Department, and Salary of employees working in the Marketing department.
CREATE VIEW MARKETING_EMP AS
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT = 'Marketing'; 

![output](<Screenshot (118).png>)

-- Q26. Create a view named TOP_EARNERS that displays employees earning more than ₹70,000.
CREATE VIEW TOP_EARNERS AS
SELECT *
FROM EMPLOYEES
WHERE SALARY > 70000; 

-- Q27. Create a view named EMP_CITY that displays the Employee ID, First Name, Last Name, and City of all employees.
CREATE VIEW EMP_CITY AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, CITY
FROM EMPLOYEES;
![output](<Screenshot (119).png>)
