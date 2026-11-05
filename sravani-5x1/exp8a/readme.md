## CREATE ACCOUNT TABLE
```
CREATE TABLE account (
    account_number NUMBER(10) PRIMARY KEY,
    customer_name  VARCHAR2(50),
    account_type   VARCHAR2(20),
    balance        NUMBER(12,2)
);
```
![OUTPUT](8a output)

## INSERT INTO ACCOUNT TABLE
```
INSERT INTO account VALUES (1001, 'Ravi',   'SAVINGS', 25000);
INSERT INTO account VALUES (1002, 'Sita',   'CURRENT', 50000);
INSERT INTO account VALUES (1003, 'Kiran',  'SAVINGS', 35000);
INSERT INTO account VALUES (1004, 'Anjali', 'CURRENT', 45000);
INSERT INTO account VALUES (1005, 'Rahul',  'SAVINGS', 18000);
INSERT INTO account VALUES (1006, 'Priya',  'SAVINGS', 60000);
INSERT INTO account VALUES (1007, 'Arun',   'CURRENT', 75000);
INSERT INTO account VALUES (1008, 'Sneha',  'SAVINGS', 42000);
```
![OUTPUT](8a output1)

##
```
COMMIT;
```
![OUTPUT](8a output2)

##
```
SET SERVEROUTPUT ON;

DECLARE

    -- Parameterized cursor
    CURSOR C_ACCOUNT (p_account_type VARCHAR2) IS
        SELECT account_number,
               customer_name,
               account_type,
               balance
        FROM account
        WHERE account_type = p_account_type;

    -- Variables to store fetched values
    v_account_number account.account_number%TYPE;
    v_customer_name  account.customer_name%TYPE;
    v_account_type   account.account_type%TYPE;
    v_balance        account.balance%TYPE;

BEGIN

    -- Open cursor by passing account type
    OPEN C_ACCOUNT('SAVINGS');

    -- Fetch records one by one
    LOOP

        FETCH C_ACCOUNT
        INTO v_account_number,
             v_customer_name,
             v_account_type,
             v_balance;

        -- Exit when all records are processed
        EXIT WHEN C_ACCOUNT%NOTFOUND;

        -- Display account details
        DBMS_OUTPUT.PUT_LINE(
            'Account Number : ' || v_account_number
        );

        DBMS_OUTPUT.PUT_LINE(
            'Customer Name  : ' || v_customer_name
        );

        DBMS_OUTPUT.PUT_LINE(
            'Account Type   : ' || v_account_type
        );

        DBMS_OUTPUT.PUT_LINE(
            'Balance        : ' || v_balance
        );

        DBMS_OUTPUT.PUT_LINE(
            '-----------------------------'
        );

    END LOOP;

    -- Close the cursor
    CLOSE C_ACCOUNT;

END;
/
```
![OUTPUT](8a output3)

## CREATE PATIENT TABLE
```
CREATE TABLE patient (
    patient_id   NUMBER(5) PRIMARY KEY,
    patient_name VARCHAR2(50),
    department   VARCHAR2(30),
    doctor_name  VARCHAR2(50)
);
```
![OUTPUT](8a output4)

## INSERT INTO PATIENT TABLE
```
INSERT INTO patient VALUES (101, 'Ravi',   'Cardiology', 'Dr. Kumar');
INSERT INTO patient VALUES (102, 'Sita',   'Neurology',  'Dr. Ramesh');
INSERT INTO patient VALUES (103, 'Kiran',  'Cardiology', 'Dr. Kumar');
INSERT INTO patient VALUES (104, 'Anjali', 'Orthopedic', 'Dr. Priya');
INSERT INTO patient VALUES (105, 'Rahul',  'Cardiology', 'Dr. Sharma');
INSERT INTO patient VALUES (106, 'Divya',  'Neurology',  'Dr. Ramesh');
INSERT INTO patient VALUES (107, 'Arun',   'Cardiology', 'Dr. Kumar');
INSERT INTO patient VALUES (108, 'Sneha',  'Orthopedic', 'Dr. Priya');
```
![OUTPUT](8a output5)

##
```
COMMIT;
```
![OUTPUT](8a output6)

##
```
SET SERVEROUTPUT ON;

DECLARE

    -- Parameterized cursor
    CURSOR C_PATIENT (p_department VARCHAR2) IS
        SELECT patient_id,
               patient_name,
               department,
               doctor_name
        FROM patient
        WHERE department = p_department;

    -- Variables to store fetched values
    v_patient_id   patient.patient_id%TYPE;
    v_patient_name patient.patient_name%TYPE;
    v_department   patient.department%TYPE;
    v_doctor_name  patient.doctor_name%TYPE;

BEGIN

    -- Open cursor by passing the department name
    OPEN C_PATIENT('Cardiology');

    -- Fetch records one at a time
    LOOP

        FETCH C_PATIENT
        INTO v_patient_id,
             v_patient_name,
             v_department,
             v_doctor_name;

        -- Exit when all records have been processed
        EXIT WHEN C_PATIENT%NOTFOUND;

        -- Display patient details
        DBMS_OUTPUT.PUT_LINE(
            'Patient ID   : ' || v_patient_id
        );

        DBMS_OUTPUT.PUT_LINE(
            'Patient Name : ' || v_patient_name
        );

        DBMS_OUTPUT.PUT_LINE(
            'Department   : ' || v_department
        );

        DBMS_OUTPUT.PUT_LINE(
            'Doctor Name  : ' || v_doctor_name
        );

        DBMS_OUTPUT.PUT_LINE(
            '-----------------------------'
        );

    END LOOP;

    -- Close the cursor
    CLOSE C_PATIENT;

END;
/
```
![OUTPUT](8a output7)

## EMPLOYEE EMPLOYEE TABLE
```
CREATE TABLE employee2 (
    employee_id   NUMBER(5) PRIMARY KEY,
    employee_name VARCHAR2(50),
    department    VARCHAR2(30),
    salary        NUMBER(10,2)
);
```
![OUTPUT](8a output8)

## INSERT INTO EMPLOYEE TABLE
```
INSERT INTO employee2 VALUES (101, 'Ravi',   'CSE', 25000);
INSERT INTO employee2 VALUES (102, 'Sita',   'ECE', 30000);
INSERT INTO employee2 VALUES (103, 'Kiran',  'EEE', 28000);
INSERT INTO employee2 VALUES (104, 'Anjali', 'IT',  35000);
INSERT INTO employee2 VALUES (105, 'Rahul',  'CSE', 40000);
```
![OUTPUT](8a output9)

##
```
COMMIT;
```
![OUTPUT](8a output10)

##
```
SET SERVEROUTPUT ON;

DECLARE

    -- Declare cursor with FOR UPDATE
    CURSOR C_EMPLOYEE IS
        SELECT employee_id,
               employee_name,
               department,
               salary
        FROM employee
        FOR UPDATE;

BEGIN

    -- Open and process the cursor
    FOR emp_rec IN C_EMPLOYEE
    LOOP

        -- Increase salary by 10%
        UPDATE employee
        SET salary = emp_rec.salary * 1.10
        WHERE CURRENT OF C_EMPLOYEE;

        -- Display updated employee details
        DBMS_OUTPUT.PUT_LINE(
            'Employee ID   : ' || emp_rec.employee_id
        );

        DBMS_OUTPUT.PUT_LINE(
            'Employee Name : ' || emp_rec.employee_name
        );

        DBMS_OUTPUT.PUT_LINE(
            'Old Salary    : ' || emp_rec.salary
        );

        DBMS_OUTPUT.PUT_LINE(
            'New Salary    : ' || (emp_rec.salary * 1.10)
        );

        DBMS_OUTPUT.PUT_LINE(
            '-----------------------------'
        );

    END LOOP;

    -- Commit the transaction
    COMMIT;

    -- Display success message
    DBMS_OUTPUT.PUT_LINE(
        'Salary updated successfully for all employees.'
    );

END;
/
```
![OUTPUT](8a output11)

##
```
SELECT
    employee_id,
    employee_name,
    department,
    salary
FROM employee2;
```
![OUTPUT](8a output12)

## CREATE BOOK TABLE
```
CREATE TABLE book (
    book_id          NUMBER(5) PRIMARY KEY,
    book_title       VARCHAR2(100),
    author           VARCHAR2(50),
    available_copies NUMBER(5)
);
```
![OUTPUT](8a output13)

## INSERT INTO BOOK TABLE
```
INSERT INTO book VALUES (101, 'Database Management Systems', 'Raghu Ramakrishnan', 10);
INSERT INTO book VALUES (102, 'Operating System Concepts', 'Abraham Silberschatz', 8);
INSERT INTO book VALUES (103, 'Computer Networks', 'Andrew S. Tanenbaum', 12);
INSERT INTO book VALUES (104, 'Programming in C', 'Dennis Ritchie', 6);
INSERT INTO book VALUES (105, 'Artificial Intelligence', 'Stuart Russell', 15);
```
![OUTPUT](8a output14)

##
```
COMMIT;
```
![OUTPUT](8a output15)

##
```
SET SERVEROUTPUT ON;

DECLARE

    -- Variables to store fetched values
    v_book_id          book.book_id%TYPE;
    v_book_title       book.book_title%TYPE;
    v_author            book.author%TYPE;
    v_available_copies book.available_copies%TYPE;

    -- FOR UPDATE cursor
    CURSOR C_BOOK IS
        SELECT book_id,
               book_title,
               author,
               available_copies
        FROM book
        FOR UPDATE;

BEGIN

    -- Open the cursor
    OPEN C_BOOK;

    LOOP

        -- Fetch one record at a time
        FETCH C_BOOK
        INTO v_book_id,
             v_book_title,
             v_author,
             v_available_copies;

        -- Exit when all records are processed
        EXIT WHEN C_BOOK%NOTFOUND;

        -- Increase available copies by 5
        v_available_copies := v_available_copies + 5;

        -- Update the current record
        UPDATE book
        SET available_copies = v_available_copies
        WHERE CURRENT OF C_BOOK;

    END LOOP;

    -- Commit the changes
    COMMIT;

    -- Display success message
    DBMS_OUTPUT.PUT_LINE(
        'All book records have been updated successfully.'
    );

    -- Close the cursor
    CLOSE C_BOOK;

END;
/
```

##
```
SELECT *FROM book;
```
![OUTPUT](8a output16)
