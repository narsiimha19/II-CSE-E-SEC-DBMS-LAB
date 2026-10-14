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
<img width="1600" height="900" alt="create employee" src="https://github.com/user-attachments/assets/dc2cf1b4-fe08-4682-b5ad-af9d13d6c969" />


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
<img width="1600" height="900" alt="insert employee" src="https://github.com/user-attachments/assets/0b038095-67f2-421e-aaee-82dbd7f16588" />

# Describing the table 

```      	 
SELECT * FROM EMPLOYEE;
```
![output 1](outputs-3(a)/desc-emp.png)

# q1
```
SELECT EMPLOYEE_ID, FIRST_NAME,
       TO_CHAR(HIRE_DATE, 'DD-MON-YYYY') AS HIRE_DATE
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q1" src="https://github.com/user-attachments/assets/3fae9ffd-3463-4df8-b352-9e55844dbac8" />

# q2
```
SELECT EMPLOYEE_ID, FIRST_NAME,
       TO_CHAR(SALARY, 'L99,999,999') AS SALARY
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q2" src="https://github.com/user-attachments/assets/51b16982-15cc-429e-a537-40a2ed1e614e" />

# q3
```
SELECT EMPLOYEE_ID, FIRST_NAME,
       TO_NUMBER(SALARY) + 5000 AS NEW_SALARY
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q3 - Copy" src="https://github.com/user-attachments/assets/388eddcb-27d2-4cd9-a6e9-47b821bff639" />

# q4
```
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE > TO_DATE('01-JAN-2020', 'DD-MON-YYYY');
```

<img width="1600" height="900" alt="q4" src="https://github.com/user-attachments/assets/2614f153-8788-4b86-a39b-9d8a930b8ef3" />


# q5
```
SELECT EMPLOYEE_ID,
       FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q5" src="https://github.com/user-attachments/assets/bba7312f-5dfe-4c20-ad5d-075c52919852" />


# q6
```
SELECT EMPLOYEE_ID,
       CONCAT(FIRST_NAME, CONCAT(' ', LAST_NAME)) AS FULL_NAME
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q6" src="https://github.com/user-attachments/assets/f037ea1b-07fc-4237-9a25-876ad56ab905" />



# q7
```
SELECT FIRST_NAME,
       LPAD(FIRST_NAME, 10, '*') AS PADDED_NAME
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q7" src="https://github.com/user-attachments/assets/bfd0b535-b746-47c8-8bf9-5e36c973fc93" />


# q8
```
SELECT FIRST_NAME,
       RPAD(FIRST_NAME, 10, '*') AS PADDED_NAME
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q8" src="https://github.com/user-attachments/assets/f15d123e-9aa6-4ae9-a391-4bfaa665adb3" />


# q9
```
SELECT FIRST_NAME,
       LTRIM(FIRST_NAME) AS TRIMMED_NAME
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q9" src="https://github.com/user-attachments/assets/0d00f763-016b-4353-b307-f6a601c31770" />





# q10
```
SELECT FIRST_NAME,
       RTRIM(FIRST_NAME) AS TRIMMED_NAME
FROM EMPLOYEE;
```

<img width="1600" height="900" alt="q10" src="https://github.com/user-attachments/assets/42fcce68-75a5-48b2-80e1-4d7285d2a218" />


# q11
```
SELECT FIRST_NAME,
       LOWER(FIRST_NAME) AS LOWERCASE_NAME
FROM EMPLOYEE;
```

<img width="1600" height="900" alt="q11" src="https://github.com/user-attachments/assets/5e634023-9beb-4c11-80f9-cdedb7b217d0" />

# q12
```
SELECT FIRST_NAME,
       UPPER(FIRST_NAME) AS UPPERCASE_NAME
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q12" src="https://github.com/user-attachments/assets/0398adce-8eaa-49a9-a56a-9e7ac86a0b40" />

# q13
```
SELECT FIRST_NAME,
       INITCAP(FIRST_NAME) AS PROPER_NAME
FROM EMPLOYEE;
```

<img width="1600" height="900" alt="q13" src="https://github.com/user-attachments/assets/aae4a679-be29-4104-962d-eb13b2f5700c" />



# q14
```
SELECT FIRST_NAME,
       LENGTH(FIRST_NAME) AS NAME_LENGTH
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q14 - Copy" src="https://github.com/user-attachments/assets/62d79c07-3840-4bec-b126-216dc3a58e3b" />




# q15
```
SELECT FIRST_NAME,
       SUBSTR(FIRST_NAME, 1, 3) AS FIRST_THREE
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q15" src="https://github.com/user-attachments/assets/f18d5ed7-5905-4750-9548-50a7e1055a52" />


# q16
```
SELECT FIRST_NAME,
       INSTR(LOWER(FIRST_NAME), 'a') AS POSITION_OF_A
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q16" src="https://github.com/user-attachments/assets/43ac5f4e-3ae5-442e-8299-083540db766d" />


# q17
```
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME,
       HIRE_DATE, SYSDATE AS CURRENT_DATE
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q17" src="https://github.com/user-attachments/assets/a71fbd0e-7046-4205-9d2d-7452b5ad6908" />

# q18
```
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE,
       NEXT_DAY(HIRE_DATE, 'MONDAY') AS NEXT_MONDAY
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q18" src="https://github.com/user-attachments/assets/a1930a6a-0b4f-4304-9211-fcd160f62257" />



# q19
```
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE,
       ADD_MONTHS(HIRE_DATE, 6) AS AFTER_SIX_MONTHS
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q19" src="https://github.com/user-attachments/assets/5c52babd-d85c-4600-9095-c1501079e941" />



# q20
```
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE,
       LAST_DAY(HIRE_DATE) AS LAST_DAY_OF_MONTH
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q20" src="https://github.com/user-attachments/assets/e613d6b4-b202-43ce-888f-25efb00c4c93" />




# q21
```
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE,
       ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE), 2) AS MONTHS_WORKED
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q21" src="https://github.com/user-attachments/assets/dd1caabe-63c1-4ca9-94fa-6a675e8bdfa4" />



# q22
```
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,
       LEAST(SALARY, 60000) AS SMALLER_VALUE
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q22" src="https://github.com/user-attachments/assets/72d1ca99-8214-4a12-819c-81d37f233dd8" />



# q23
```
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,
       GREATEST(SALARY, 60000) AS GREATER_VALUE
FROM EMPLOYEE;
```

<img width="1600" height="900" alt="q23" src="https://github.com/user-attachments/assets/c3dfb820-0ef8-499a-8b5b-15c9190a5136" />



# q24
```
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE,
       TRUNC(HIRE_DATE, 'MONTH') AS FIRST_DAY_OF_MONTH
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q24" src="https://github.com/user-attachments/assets/c473a180-72ef-4f0f-9cf9-2dc079f08298" />


# q25
```
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE,
       ROUND(HIRE_DATE, 'MONTH') AS ROUNDED_DATE
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q25" src="https://github.com/user-attachments/assets/9c8e729c-1408-476d-9071-7876a1b5d1d4" />





# q26
```
SELECT EMPLOYEE_ID, FIRST_NAME,
       TO_CHAR(HIRE_DATE, 'DAY, DD-MON-YYYY') AS FORMATTED_DATE
FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q26" src="https://github.com/user-attachments/assets/11bcc892-47cf-4611-8bb9-db115e9da2b7" />


# q27
```
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE < TO_DATE('01-JAN-2019', 'DD-MON-YYYY');
SELECT * FROM EMPLOYEE;
```
<img width="1600" height="900" alt="q27" src="https://github.com/user-attachments/assets/d25b6e1a-0b8b-46bd-a36d-14ba6a307b98" />

