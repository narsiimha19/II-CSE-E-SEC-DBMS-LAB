
experiment 8

program 1

-- Create ACCOUNT table
CREATE TABLE ACCOUNT (
    ACCOUNT_NO   NUMBER(10),
    CUSTOMER_NAME VARCHAR2(50),
    ACCOUNT_TYPE  VARCHAR2(20),
    BALANCE       NUMBER(12,2)
);
![output](<Screenshot (220).png>)
-- Insert sample records
INSERT INTO ACCOUNT VALUES (1001, 'Ravi Kumar', 'SAVINGS', 25000.00);
INSERT INTO ACCOUNT VALUES (1002, 'Priya Sharma', 'CURRENT', 50000.00);
![output](<Screenshot (221).png>)


INSERT INTO ACCOUNT VALUES (1003, 'Arun Reddy', 'SAVINGS', 32000.00);
INSERT INTO ACCOUNT VALUES (1004, 'Sneha Rao', 'CURRENT', 45000.00);
INSERT INTO ACCOUNT VALUES (1005, 'Kiran Kumar', 'SAVINGS', 18000.00);

COMMIT;
![output](<Screenshot (222).png>)

-- Enable server output
SET SERVEROUTPUT ON;

-- PL/SQL program using parameterized cursor
DECLARE
    -- Parameterized cursor
    CURSOR C_ACCOUNT (P_ACCOUNT_TYPE VARCHAR2) IS
        SELECT ACCOUNT_NO,
               CUSTOMER_NAME,
               ACCOUNT_TYPE,
               BALANCE
        FROM ACCOUNT
        WHERE ACCOUNT_TYPE = P_ACCOUNT_TYPE;

    V_ACCOUNT_NO     ACCOUNT.ACCOUNT_NO%TYPE;
    V_CUSTOMER_NAME  ACCOUNT.CUSTOMER_NAME%TYPE;
    V_ACCOUNT_TYPE   ACCOUNT.ACCOUNT_TYPE%TYPE;
    V_BALANCE        ACCOUNT.BALANCE%TYPE;

BEGIN
    -- Open cursor with account type
    OPEN C_ACCOUNT('SAVINGS');

    LOOP
        -- Fetch one record
        FETCH C_ACCOUNT
        INTO V_ACCOUNT_NO,
             V_CUSTOMER_NAME,
             V_ACCOUNT_TYPE,
             V_BALANCE;

        -- Exit when no more records
        EXIT WHEN C_ACCOUNT%NOTFOUND;

        -- Display account details
        DBMS_OUTPUT.PUT_LINE(
            'Account Number : ' || V_ACCOUNT_NO
        );
DBMS_OUTPUT.PUT_LINE(
            'Customer Name  : ' || V_CUSTOMER_NAME
        );
        DBMS_OUTPUT.PUT_LINE(
            'Account Type   : ' || V_ACCOUNT_TYPE
        );
        DBMS_OUTPUT.PUT_LINE(
            'Balance        : ' || V_BALANCE
        );
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;

    -- Close cursor
    CLOSE C_ACCOUNT;

END;
/
![output](<Screenshot (223).png>)


program 2

-- Create PATIENT table
CREATE TABLE PATIENT (
    PATIENT_ID    NUMBER(10),
    PATIENT_NAME  VARCHAR2(50),
    DEPARTMENT    VARCHAR2(30),
    DOCTOR_NAME   VARCHAR2(50)
);

-- Insert sample records
INSERT INTO PATIENT VALUES (101, 'Rahul Kumar', 'Cardiology', 'Dr. Sharma');
INSERT INTO PATIENT VALUES (102, 'Priya Reddy', 'Neurology', 'Dr. Rao');
INSERT INTO PATIENT VALUES (103, 'Arun Kumar', 'Cardiology', 'Dr. Mehta');
INSERT INTO PATIENT VALUES (104, 'Sneha Singh', 'Orthopedics', 'Dr. Reddy');
INSERT INTO PATIENT VALUES (105, 'Kiran Rao', 'Cardiology', 'Dr. Sharma');
![output](<Screenshot (225).png>)

COMMIT;
![output](<Screenshot (226).png>)

-- Enable server output
SET SERVEROUTPUT ON;

-- PL/SQL program using parameterized cursor
DECLARE
    -- Parameterized cursor
    CURSOR C_PATIENT (P_DEPARTMENT VARCHAR2) IS
        SELECT PATIENT_ID,
               PATIENT_NAME,
               DEPARTMENT,
               DOCTOR_NAME
        FROM PATIENT
        WHERE DEPARTMENT = P_DEPARTMENT;

    V_PATIENT_ID    PATIENT.PATIENT_ID%TYPE;
    V_PATIENT_NAME  PATIENT.PATIENT_NAME%TYPE;
    V_DEPARTMENT    PATIENT.DEPARTMENT%TYPE;
    V_DOCTOR_NAME   PATIENT.DOCTOR_NAME%TYPE;

BEGIN
    -- Open cursor with department name
    OPEN C_PATIENT('Cardiology');

    LOOP
        -- Fetch one record
        FETCH C_PATIENT
        INTO V_PATIENT_ID,
             V_PATIENT_NAME,
             V_DEPARTMENT,
             V_DOCTOR_NAME;

        -- Exit when there are no more records
        EXIT WHEN C_PATIENT%NOTFOUND;

        -- Display patient details
        DBMS_OUTPUT.PUT_LINE(
            'Patient ID   : ' || V_PATIENT_ID
        );
        DBMS_OUTPUT.PUT_LINE(
            'Patient Name : ' || V_PATIENT_NAME
        );
        DBMS_OUTPUT.PUT_LINE(
            'Department   : ' || V_DEPARTMENT
        );
        DBMS_OUTPUT.PUT_LINE(
            'Doctor Name  : ' || V_DOCTOR_NAME
        );
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;

    -- Close cursor
    CLOSE C_PATIENT;

END;
/
![output](<Screenshot (226).png>)
program 3  :

-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE8 (
    EMPLOYEE_ID    NUMBER(10),
    EMPLOYEE_NAME  VARCHAR2(50),
    DEPARTMENT     VARCHAR2(30),
    SALARY         NUMBER(10,2)
);
![output](<Screenshot (227).png>)

-- Insert sample employee records
INSERT INTO EMPLOYEE8 VALUES (101, 'Ravi Kumar', 'IT', 30000);
INSERT INTO EMPLOYEE8 VALUES (102, 'Priya Sharma', 'HR', 35000);
INSERT INTO EMPLOYEE8 VALUES (103, 'Arun Reddy', 'Finance', 40000);
INSERT INTO EMPLOYEE8 VALUES (104, 'Sneha Rao', 'IT', 45000);
INSERT INTO EMPLOYEE8 VALUES (105, 'Kiran Kumar', 'Sales', 32000);

COMMIT;
![output](<Screenshot (228).png>)

-- Enable server output
SET SERVEROUTPUT ON;

-- PL/SQL program using FOR UPDATE cursor
DECLARE
    -- Cursor with FOR UPDATE clause
    CURSOR C_EMPLOYEE8 IS
        SELECT EMPLOYEE_ID,
               EMPLOYEE_NAME,
               DEPARTMENT,
               SALARY
        FROM EMPLOYEE8
        FOR UPDATE;

BEGIN
    -- Process each employee
    FOR EMP IN C_EMPLOYEE8
    LOOP
        -- Increase salary by 10%
        UPDATE EMPLOYEE8
        SET SALARY = EMP.SALARY * 1.10
        WHERE CURRENT OF C_EMPLOYEE8;
    END LOOP;

    -- Commit the changes
    COMMIT;

    -- Display success message
    DBMS_OUTPUT.PUT_LINE(
        'Salary of all employees increased by 10% successfully.'
    );

END;
/

![output](<Screenshot (229).png>)

program 4 :

-- Create BOOK table
CREATE TABLE BOOK (
    BOOK_ID          NUMBER(10),
    BOOK_TITLE       VARCHAR2(100),
    AUTHOR           VARCHAR2(50),
    AVAILABLE_COPIES NUMBER(5)
);

![output](<Screenshot (230).png>)

-- Insert sample book records
INSERT INTO BOOK VALUES (101, 'Database Management System', 'Raghu Ramakrishnan', 10);
INSERT INTO BOOK VALUES (102, 'Operating System Concepts', 'Abraham Silberschatz', 8);
INSERT INTO BOOK VALUES (103, 'Computer Networks', 'Andrew S. Tanenbaum', 12);
INSERT INTO BOOK VALUES (104, 'Java Programming', 'Herbert Schildt', 15);
INSERT INTO BOOK VALUES (105, 'Python Programming', 'Mark Lutz', 7);
![output](<Screenshot (229).png>)

COMMIT;



-- Enable server output
SET SERVEROUTPUT ON;

-- PL/SQL program using FOR UPDATE cursor
DECLARE
    -- Cursor with FOR UPDATE clause
    CURSOR C_BOOK IS
        SELECT BOOK_ID,
               BOOK_TITLE,
               AUTHOR,
               AVAILABLE_COPIES
        FROM BOOK
        FOR UPDATE;

BEGIN
    -- Process each book
    FOR B IN C_BOOK
    LOOP
        -- Increase available copies by 5
        UPDATE BOOK
        SET AVAILABLE_COPIES = B.AVAILABLE_COPIES + 5
        WHERE CURRENT OF C_BOOK;
    END LOOP;

    -- Commit the changes
    COMMIT;

    -- Display success message
    DBMS_OUTPUT.PUT_LINE(
        'Available copies of all books increased by 5 successfully.'
    );

END;
/
![output](<Screenshot (232).png>)

program 5:

-- Create PRODUCT table
CREATE TABLE PRODUCT (
    PRODUCT_ID    NUMBER(10),
    PRODUCT_NAME  VARCHAR2(50),
    PRICE         NUMBER(10,2),
    QUANTITY      NUMBER(5)
);

![output](<Screenshot (233).png>)

-- Insert sample product records
INSERT INTO PRODUCT VALUES (101, 'Rice', 50.00, 100);
INSERT INTO PRODUCT VALUES (102, 'Sugar', 45.00, 80);
INSERT INTO PRODUCT VALUES (103, 'Oil', 120.00, 60);
INSERT INTO PRODUCT VALUES (104, 'Milk', 30.00, 50);
INSERT INTO PRODUCT VALUES (105, 'Biscuits', 25.00, 120);

COMMIT;
![output](<Screenshot (234).png>)

-- Enable server output
SET SERVEROUTPUT ON;

-- PL/SQL program using FOR UPDATE cursor
DECLARE
    -- Cursor with FOR UPDATE clause
    CURSOR C_PRODUCT IS
        SELECT PRODUCT_ID,
               PRODUCT_NAME,
               PRICE,
               QUANTITY
        FROM PRODUCT
        FOR UPDATE;

BEGIN
    -- Process each product
    FOR P IN C_PRODUCT
    LOOP
        -- Increase price by 5%
        UPDATE PRODUCT
        SET PRICE = P.PRICE * 1.05
        WHERE CURRENT OF C_PRODUCT;
    END LOOP;

    -- Commit the changes
    COMMIT;
![output](<Screenshot (235).png>)

    -- Display success message
    DBMS_OUTPUT.PUT_LINE(
        'Price of all products increased by 5% successfully.'
    );

END;
/
![output](<Screenshot (236).png>)


program 6:

-- Create STUDENT table
CREATE TABLE STUDENT8 (
    STUDENT_ID    NUMBER(10),
    STUDENT_NAME  VARCHAR2(50),
    COURSE        VARCHAR2(50),
    MARKS         NUMBER(5,2)
);
![output](<Screenshot (237).png>)

-- Insert sample student records
INSERT INTO STUDENT8 VALUES (101, 'Ravi Kumar', 'BCA', 85);
INSERT INTO STUDENT8 VALUES (102, 'Priya Sharma', 'B.Sc Computer Science', 92);
INSERT INTO STUDENT8 VALUES (103, 'Arun Reddy', 'BCA', 78);
INSERT INTO STUDENT8 VALUES (104, 'Sneha Rao', 'B.Tech', 88);
INSERT INTO STUDENT8 VALUES (105, 'Kiran Kumar', 'B.Sc Computer Science', 81);

COMMIT;

-- Enable server output
SET SERVEROUTPUT ON;

-- PL/SQL program using REF CURSOR
DECLARE
    -- Declare REF CURSOR type
    TYPE STUDENT8_REF_CURSOR IS REF CURSOR;

    -- Declare cursor variable
    C_STUDENT8 STUDENT8_REF_CURSOR;

    -- Variables to store fetched data
    V_STUDENT_ID    STUDENT8.STUDENT_ID%TYPE;
    V_STUDENT_NAME  STUDENT8.STUDENT_NAME%TYPE;
    V_COURSE        STUDENT8.COURSE%TYPE;
    V_MARKS         STUDENT8.MARKS%TYPE;

BEGIN
    -- Open REF CURSOR for SELECT query
    OPEN C_STUDENT8 FOR
        SELECT STUDENT_ID,
               STUDENT_NAME,
               COURSE,
               MARKS
        FROM STUDENT8;

    LOOP
        -- Fetch one student record
        FETCH C_STUDENT8
        INTO V_STUDENT_ID,
             V_STUDENT_NAME,
             V_COURSE,
             V_MARKS;

        -- Exit when no more records
        EXIT WHEN C_STUDENT8%NOTFOUND;

        -- Display student details
        DBMS_OUTPUT.PUT_LINE(
            'Student ID   : ' || V_STUDENT_ID
        );
        DBMS_OUTPUT.PUT_LINE(
            'Student Name : ' || V_STUDENT_NAME
        );
        DBMS_OUTPUT.PUT_LINE(
            'Course       : ' || V_COURSE
        );
        DBMS_OUTPUT.PUT_LINE(
            'Marks        : ' || V_MARKS
        );
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;

    -- Close REF CURSOR
    CLOSE C_STUDENT8;

END;
/

program 7:


-- Create DOCTOR table
CREATE TABLE DOCTOR (

DOCTOR_ID       NUMBER(10),
    DOCTOR_NAME     VARCHAR2(50),
    SPECIALIZATION  VARCHAR2(50),
    EXPERIENCE      NUMBER(3)
);

-- Insert sample doctor records
INSERT INTO DOCTOR VALUES (101, 'Dr. Sharma', 'Cardiology', 15);
INSERT INTO DOCTOR VALUES (102, 'Dr. Rao', 'Neurology', 10);
INSERT INTO DOCTOR VALUES (103, 'Dr. Reddy', 'Orthopedics', 12);
INSERT INTO DOCTOR VALUES (104, 'Dr. Mehta', 'Dermatology', 8);
INSERT INTO DOCTOR VALUES (105, 'Dr. Singh', 'Pediatrics', 6);

COMMIT;

-- Enable server output
SET SERVEROUTPUT ON;

-- PL/SQL program using REF CURSOR
DECLARE
    -- Declare REF CURSOR type
    TYPE DOCTOR_REF_CURSOR IS REF CURSOR;

    -- Declare cursor variable
    C_DOCTOR DOCTOR_REF_CURSOR;

    -- Variables to store fetched data
    V_DOCTOR_ID       DOCTOR.DOCTOR_ID%TYPE;
    V_DOCTOR_NAME     DOCTOR.DOCTOR_NAME%TYPE;
    V_SPECIALIZATION  DOCTOR.SPECIALIZATION%TYPE;
    V_EXPERIENCE      DOCTOR.EXPERIENCE%TYPE;

BEGIN
    -- Open REF CURSOR for DOCTOR table
    OPEN C_DOCTOR FOR
        SELECT DOCTOR_ID,
               DOCTOR_NAME,
               SPECIALIZATION,
               EXPERIENCE
        FROM DOCTOR;

    LOOP
        -- Fetch one doctor record
        FETCH C_DOCTOR
        INTO V_DOCTOR_ID,
             V_DOCTOR_NAME,
             V_SPECIALIZATION,
             V_EXPERIENCE;

        -- Exit when no more records
        EXIT WHEN C_DOCTOR%NOTFOUND;

        -- Display doctor details
        DBMS_OUTPUT.PUT_LINE(
            'Doctor ID      : ' || V_DOCTOR_ID
        );
        DBMS_OUTPUT.PUT_LINE(
            'Doctor Name    : ' || V_DOCTOR_NAME
        );
        DBMS_OUTPUT.PUT_LINE(
            'Specialization : ' || V_SPECIALIZATION
        );
        DBMS_OUTPUT.PUT_LINE(
            'Experience     : ' || V_EXPERIENCE || ' years'
        );
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;

    -- Close REF CURSOR
    CLOSE C_DOCTOR;

END;
/


program 8:

-- Create ORDERS table
CREATE TABLE ORDERS (
    ORDER_ID      NUMBER(10),
    CUSTOMER_NAME VARCHAR2(50),
    PRODUCT_NAME  VARCHAR2(50),
    QUANTITY      NUMBER(5),
    TOTAL_AMOUNT  NUMBER(10,2)
);

-- Insert sample order records
INSERT INTO ORDERS VALUES (1001, 'Ravi Kumar', 'Laptop', 1, 55000.00);
INSERT INTO ORDERS VALUES (1002, 'Priya Sharma', 'Mobile Phone', 2, 40000.00);
INSERT INTO ORDERS VALUES (1003, 'Arun Reddy', 'Headphones', 1, 2500.00);
INSERT INTO ORDERS VALUES (1004, 'Sneha Rao', 'Keyboard', 2, 3000.00);
INSERT INTO ORDERS VALUES (1005, 'Kiran Kumar', 'Monitor', 1, 15000.00);

COMMIT;

-- Enable server output
SET SERVEROUTPUT ON;

-- PL/SQL program using REF CURSOR
DECLARE
    -- Declare REF CURSOR type
    TYPE ORDER_REF_CURSOR IS REF CURSOR;

    -- Declare cursor variable
    C_ORDER ORDER_REF_CURSOR;

    -- Variables to store fetched data
    V_ORDER_ID       ORDERS.ORDER_ID%TYPE;
    V_CUSTOMER_NAME  ORDERS.CUSTOMER_NAME%TYPE;
    V_PRODUCT_NAME   ORDERS.PRODUCT_NAME%TYPE;
    V_QUANTITY       ORDERS.QUANTITY%TYPE;
    V_TOTAL_AMOUNT   ORDERS.TOTAL_AMOUNT%TYPE;

BEGIN
    -- Open REF CURSOR for ORDERS table
    OPEN C_ORDER FOR
        SELECT ORDER_ID,
               CUSTOMER_NAME,
               PRODUCT_NAME,
               QUANTITY,
               TOTAL_AMOUNT
        FROM ORDERS;

    LOOP
        -- Fetch one order record
        FETCH C_ORDER
        INTO V_ORDER_ID,
             V_CUSTOMER_NAME,
             V_PRODUCT_NAME,
             V_QUANTITY,
             V_TOTAL_AMOUNT;

        -- Exit when no more records
        EXIT WHEN C_ORDER%NOTFOUND;

        -- Display order details
        DBMS_OUTPUT.PUT_LINE(
            'Order ID      : ' || V_ORDER_ID
        );
        DBMS_OUTPUT.PUT_LINE(
            'Customer Name : ' || V_CUSTOMER_NAME
        );
        DBMS_OUTPUT.PUT_LINE(
            'Product Name  : ' || V_PRODUCT_NAME
        );
        DBMS_OUTPUT.PUT_LINE(
            'Quantity      : ' || V_QUANTITY
        );
        DBMS_OUTPUT.PUT_LINE(
            'Total Amount  : ' || V_TOTAL_AMOUNT
        );
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;

    -- Close REF CURSOR
    CLOSE C_ORDER;

END;
/


program 9:


-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE89 (
    EMPLOYEE_ID    NUMBER(10),
    EMPLOYEE_NAME  VARCHAR2(50),
    DEPARTMENT     VARCHAR2(30),
    SALARY         NUMBER(10,2),
    EXPERIENCE     NUMBER(3)
);

-- Insert sample employee records
INSERT INTO EMPLOYEE89 VALUES (101, 'Ravi Kumar', 'IT', 30000, 5);
INSERT INTO EMPLOYEE89 VALUES (102, 'Priya Sharma', 'HR', 35000, 7);
INSERT INTO EMPLOYEE89 VALUES (103, 'Arun Reddy', 'IT', 40000, 8);
INSERT INTO EMPLOYEE89 VALUES (104, 'Sneha Rao', 'Finance', 45000, 10);
INSERT INTO EMPLOYEE89 VALUES (105, 'Kiran Kumar', 'IT', 32000, 4);

COMMIT;

-- Enable server output
SET SERVEROUTPUT ON;

-- PL/SQL program using parameterized FOR UPDATE cursor
DECLARE
    -- Parameterized cursor with FOR UPDATE clause
    CURSOR C_EMPLOYEE89 (P_DEPARTMENT VARCHAR2) IS
        SELECT EMPLOYEE_ID,
               EMPLOYEE_NAME,
               DEPARTMENT,
               SALARY,
               EXPERIENCE
        FROM EMPLOYEE89
        WHERE DEPARTMENT = P_DEPARTMENT
        FOR UPDATE;

BEGIN
    -- Process employees belonging to IT department
    FOR EMP IN C_EMPLOYEE89('IT')
    LOOP
        -- Increase salary by ₹3,000
        UPDATE EMPLOYEE89
        SET SALARY = EMP.SALARY + 3000
        WHERE CURRENT OF C_EMPLOYEE89;

        -- Display updated employee details
        DBMS_OUTPUT.PUT_LINE(
            'Employee ID   : ' || EMP.EMPLOYEE_ID
        );
        DBMS_OUTPUT.PUT_LINE(
            'Employee Name : ' || EMP.EMPLOYEE_NAME
        );
        DBMS_OUTPUT.PUT_LINE(
            'Department    : ' || EMP.DEPARTMENT
        );
        DBMS_OUTPUT.PUT_LINE(
            'Old Salary    : ' || EMP.SALARY
        );
        DBMS_OUTPUT.PUT_LINE(
            'New Salary    : ' || (EMP.SALARY + 3000)
        );
        DBMS_OUTPUT.PUT_LINE(
            'Experience    : ' || EMP.EXPERIENCE || ' years'
        );
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;

    -- Commit the changes
    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Salary updated successfully for all employees in IT department.'
    );

END;
/


program 10:


-- Create STUDENT table
CREATE TABLE STUDENT81 (
    STUDENT_ID          NUMBER(10),
    STUDENT_NAME        VARCHAR2(50),
    BRANCH              VARCHAR2(30),
    SEMESTER            NUMBER(2),
    CGPA                NUMBER(3,2),
    SCHOLARSHIP_STATUS  VARCHAR2(20)
);

-- Insert sample student records
INSERT INTO STUDENT81 VALUES (101, 'Ravi Kumar', 'CSE', 5, 9.20, 'Not Eligible');
INSERT INTO STUDENT81 VALUES (102, 'Priya Sharma', 'CSE', 5, 8.70, 'Not Eligible');
INSERT INTO STUDENT81 VALUES (103, 'Arun Reddy', 'ECE', 4, 9.10, 'Not Eligible');
INSERT INTO STUDENT81 VALUES (104, 'Sneha Rao', 'CSE', 5, 9.50, 'Not Eligible');
INSERT INTO STUDENT81 VALUES (105, 'Kiran Kumar', 'CSE', 5, 8.40, 'Not Eligible');

COMMIT;

-- Enable server output
SET SERVEROUTPUT ON;

DECLARE
   
    CURSOR C_STUDENT81 (P_BRANCH VARCHAR2) IS
        SELECT STUDENT_ID,
               STUDENT_NAME,
               BRANCH,
               SEMESTER,
               CGPA,
               SCHOLARSHIP_STATUS
        FROM STUDENT81
        WHERE BRANCH = P_BRANCH
        FOR UPDATE;


    TYPE STUDENT81_REF_CURSOR IS REF CURSOR;

    C_REF STUDENT81_REF_CURSOR;

    -- Variables for REF CURSOR
    V_STUDENT_ID          STUDENT81.STUDENT_ID%TYPE;
    V_STUDENT_NAME        STUDENT81.STUDENT_NAME%TYPE;
    V_BRANCH              STUDENT81.BRANCH%TYPE;
    V_SEMESTER            STUDENT81.SEMESTER%TYPE;
    V_CGPA                STUDENT81.CGPA%TYPE;
    V_SCHOLARSHIP_STATUS  STUDENT81.SCHOLARSHIP_STATUS%TYPE;

BEGIN

    OPEN C_REF FOR
        SELECT STUDENT_ID,
               STUDENT_NAME,
               BRANCH,
               SEMESTER,
               CGPA,
               SCHOLARSHIP_STATUS
        FROM STUDENT81
        WHERE BRANCH = 'CSE';

    DBMS_OUTPUT.PUT_LINE('STUDENT DETAILS');
    DBMS_OUTPUT.PUT_LINE('==============================');

    LOOP
        -- Fetch student details using REF CURSOR
        FETCH C_REF
        INTO V_STUDENT_ID,
             V_STUDENT_NAME,
             V_BRANCH,
             V_SEMESTER,
             V_CGPA,
             V_SCHOLARSHIP_STATUS;

        EXIT WHEN C_REF%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Student ID         : ' || V_STUDENT_ID
        );
        DBMS_OUTPUT.PUT_LINE(
            'Student Name       : ' || V_STUDENT_NAME
        );
        DBMS_OUTPUT.PUT_LINE(
            'Branch             : ' || V_BRANCH
        );
        DBMS_OUTPUT.PUT_LINE(
            'Semester           : ' || V_SEMESTER
        );
        DBMS_OUTPUT.PUT_LINE(
            'CGPA               : ' || V_CGPA
        );
        DBMS_OUTPUT.PUT_LINE(
            'Scholarship Status : ' || V_SCHOLARSHIP_STATUS
        );
        DBMS_OUTPUT.PUT_LINE('------------------------------');
    END LOOP;


    CLOSE C_REF;


    FOR S IN C_STUDENT81('CSE')
    LOOP
        IF S.CGPA >= 9.0 THEN

            UPDATE STUDENT81
            SET SCHOLARSHIP_STATUS = 'Eligible'
            WHERE CURRENT OF C_STUDENT81;

            DBMS_OUTPUT.PUT_LINE(
                'Scholarship Eligible: ' ||
                S.STUDENT_NAME ||
                ' (CGPA: ' || S.CGPA || ')'
            );

        END IF;
    END LOOP;

    -- Commit the changes
    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Scholarship status updated successfully.'
    );

END;
/



