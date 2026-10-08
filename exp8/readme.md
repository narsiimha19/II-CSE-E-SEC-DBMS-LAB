```
-- EXPERIMENT-8
-- PROGRAM 1: CURSOR WITH PARAMETERS
-- BANKING SYSTEM
SELECT * FROM ACCOUNT;
SET SERVEROUTPUT ON;

-- Create ACCOUNT table

CREATE TABLE ACCOUNT
(
    ACCOUNT_NO NUMBER(6) PRIMARY KEY,
    CUSTOMER_NAME VARCHAR2(30),
    ACCOUNT_TYPE VARCHAR2(20),
    BALANCE NUMBER(10,2)
);

-- Insert sample records

INSERT INTO ACCOUNT VALUES (100001, 'Rahul', 'SAVINGS', 25000);
INSERT INTO ACCOUNT VALUES (100002, 'Sneha', 'CURRENT', 45000);
INSERT INTO ACCOUNT VALUES (100003, 'Arjun', 'SAVINGS', 30000);
INSERT INTO ACCOUNT VALUES (100004, 'Priya', 'CURRENT', 55000);
INSERT INTO ACCOUNT VALUES (100005, 'Kiran', 'SAVINGS', 20000);

COMMIT;

-- Parameterized Cursor

DECLARE

    CURSOR C_ACCOUNT(P_ACCOUNT_TYPE VARCHAR2) IS
        SELECT ACCOUNT_NO,
               CUSTOMER_NAME,
               ACCOUNT_TYPE,
               BALANCE
        FROM ACCOUNT
        WHERE ACCOUNT_TYPE = P_ACCOUNT_TYPE;

BEGIN

    DBMS_OUTPUT.PUT_LINE('Accounts with SAVINGS Type');
    DBMS_OUTPUT.PUT_LINE('----------------------------');

    FOR REC IN C_ACCOUNT('SAVINGS') LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Account No: ' || REC.ACCOUNT_NO ||
            '  Customer Name: ' || REC.CUSTOMER_NAME ||
            '  Account Type: ' || REC.ACCOUNT_TYPE ||
            '  Balance: ' || REC.BALANCE
        );

    END LOOP;

END;
/
```
![output](outputs8/op1.png)
```
-- EXPERIMENT-8
-- PROGRAM 2: CURSOR WITH PARAMETERS
-- HOSPITAL MANAGEMENT

-- Create PATIENT table

        SELECT PATIENT_ID,
               DOCTOR_NAME
        WHERE DEPARTMENT = P_DEPARTMENT;

BEGIN


    FOR REC IN C_PATIENT('Cardiology') LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Patient ID: ' || REC.PATIENT_ID ||
            '  Patient Name: ' || REC.PATIENT_NAME ||
            '  Doctor: ' || REC.DOCTOR_NAME
        );

    END LOOP;

END;
/
```
![output](outputs8/op2.png)
```
SET SERVEROUTPUT ON;
DROP TABLE EMPLOYEE;
SELECT * FROM EMPLOYEE;

-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE
(
    EMPLOYEE_ID NUMBER(4) PRIMARY KEY,
    EMPLOYEE_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    SALARY NUMBER(10,2)
);

-- Insert sample records
INSERT INTO EMPLOYEE VALUES (101, 'Rahul', 'HR', 35000);
INSERT INTO EMPLOYEE VALUES (102, 'Sneha', 'Sales', 42000);
INSERT INTO EMPLOYEE VALUES (103, 'Arjun', 'HR', 38000);
INSERT INTO EMPLOYEE VALUES (104, 'Priya', 'Finance', 45000);
INSERT INTO EMPLOYEE VALUES (105, 'Kiran', 'Sales', 39000);

COMMIT;

-- FOR UPDATE cursor
DECLARE
    CURSOR C_EMPLOYEE IS
        SELECT EMPLOYEE_ID,
               EMPLOYEE_NAME,
               DEPARTMENT,
               SALARY
        FROM EMPLOYEE
        FOR UPDATE;

BEGIN
    FOR REC IN C_EMPLOYEE LOOP

        -- Increase salary by 10%
        UPDATE EMPLOYEE
        SET SALARY = SALARY * 1.10
        WHERE CURRENT OF C_EMPLOYEE;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Salary increased by 10% for all employees.');
    DBMS_OUTPUT.PUT_LINE('Records updated successfully.');

END;
/
```
![output](outputs8/op3.png)
```
-- Display updated table
SELECT EMPLOYEE_ID,
            '  Department: ' || REC.DEPARTMENT ||
    DBMS_OUTPUT.PUT_LINE('Patients in Cardiology Department');
       EMPLOYEE_NAME,
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');
       DEPARTMENT,
        FROM PATIENT
       SALARY
FROM EMPLOYEE;
```
![output 2](outputs8/op4.png)
```   
            PATIENT_NAME,
SET SERVEROUTPUT ON;
               DEPARTMENT,

    CURSOR C_PATIENT(P_DEPARTMENT VARCHAR2) IS
DECLARE

-- Parameterized Cursor
-- Create BOOK table
CREATE TABLE BOOK
CREATE TABLE PATIENT
(
    BOOK_ID NUMBER(4) PRIMARY KEY,

COMMIT;
    BOOK_TITLE VARCHAR2(50),

    AUTHOR VARCHAR2(30),
    PATIENT_NAME VARCHAR2(30),
INSERT INTO PATIENT VALUES (105, 'Kiran', 'Cardiology', 'Dr. Kumar');
    AVAILABLE_COPIES NUMBER(4)
INSERT INTO PATIENT VALUES (104, 'Priya', 'Orthopedics', 'Dr. Singh');

INSERT INTO PATIENT VALUES (103, 'Arjun', 'Cardiology', 'Dr. Reddy');
INSERT INTO PATIENT VALUES (102, 'Sneha', 'Neurology', 'Dr. Sharma');
INSERT INTO PATIENT VALUES (101, 'Rahul', 'Cardiology', 'Dr. Kumar');
-- Insert sample records
    DEPARTMENT VARCHAR2(30),
);
);

    DOCTOR_NAME VARCHAR2(30)
    PATIENT_ID NUMBER(4) PRIMARY KEY,
(



-- Insert sample book records
INSERT INTO BOOK VALUES (101, 'Database Management System', 'Korth', 10);
INSERT INTO BOOK VALUES (102, 'Operating System', 'Galvin', 8);

INSERT INTO BOOK VALUES (103, 'Computer Networks', 'Tanenbaum', 12);
INSERT INTO BOOK VALUES (104, 'Python Programming', 'Guido', 15);

INSERT INTO BOOK VALUES (105, 'Artificial Intelligence', 'Russell', 7);


COMMIT;


-- FOR UPDATE Cursor
DECLARE
    CURSOR C_BOOK IS
        SELECT BOOK_ID,

               BOOK_TITLE,
               AUTHOR,
               AVAILABLE_COPIES
        FROM BOOK

        FOR UPDATE;


BEGIN
    FOR REC IN C_BOOK LOOP

        -- Increase available copies by 5
        UPDATE BOOK
        SET AVAILABLE_COPIES = AVAILABLE_COPIES + 5
        WHERE CURRENT OF C_BOOK;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Available copies increased by 5 for all books.');
    DBMS_OUTPUT.PUT_LINE('Records updated successfully.');

END;
/
```
![output](outputs8/op5.png)
```
-- Display updated BOOK table
SELECT BOOK_ID,
       BOOK_TITLE,
       AUTHOR,
       AVAILABLE_COPIES
FROM BOOK;
```
![output](outputs8/op6.png)
```
SET SERVEROUTPUT ON;

-- Create PRODUCT table
CREATE TABLE PRODUCT
(
    PRODUCT_ID NUMBER(4) PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(30),
    PRICE NUMBER(10,2),
    QUANTITY NUMBER(5)
);

-- Insert sample product records
INSERT INTO PRODUCT VALUES (101, 'Laptop', 50000, 10);
INSERT INTO PRODUCT VALUES (102, 'Mobile Phone', 20000, 25);
INSERT INTO PRODUCT VALUES (103, 'Headphones', 2000, 40);
INSERT INTO PRODUCT VALUES (104, 'Keyboard', 1500, 30);
INSERT INTO PRODUCT VALUES (105, 'Mouse', 800, 50);

COMMIT;

-- FOR UPDATE Cursor
DECLARE
    CURSOR C_PRODUCT IS
        SELECT PRODUCT_ID,
               PRODUCT_NAME,
               PRICE,
               QUANTITY
        FROM PRODUCT
        FOR UPDATE;

BEGIN
    FOR REC IN C_PRODUCT LOOP

        -- Increase product price by 5%
        UPDATE PRODUCT
        SET PRICE = PRICE * 1.05
        WHERE CURRENT OF C_PRODUCT;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Product price increased by 5% for all products.');
    DBMS_OUTPUT.PUT_LINE('Records updated successfully.');

END;
/
```
![output](outputs8/op7.png)
```
-- Display updated PRODUCT table
SELECT PRODUCT_ID,
       PRODUCT_NAME,
       PRICE,
       QUANTITY
FROM PRODUCT;
```
![output](outputs8/op8.png)
```
SET SERVEROUTPUT ON;

-- Create STUDENT table
CREATE TABLE STUDENT
(
    STUDENT_ID NUMBER(4) PRIMARY KEY,
    STUDENT_NAME VARCHAR2(30),
    COURSE VARCHAR2(30),
    MARKS NUMBER(3)
);

-- Insert sample student records
INSERT INTO STUDENT VALUES (101, 'Rahul', 'B.Tech CSE', 85);
INSERT INTO STUDENT VALUES (102, 'Sneha', 'B.Tech ECE', 78);
INSERT INTO STUDENT VALUES (103, 'Arjun', 'B.Tech CSE', 92);
INSERT INTO STUDENT VALUES (104, 'Priya', 'B.Tech IT', 88);
INSERT INTO STUDENT VALUES (105, 'Kiran', 'B.Tech CSE', 74);

COMMIT;

-- REF CURSOR
DECLARE
    TYPE STUDENT_CURSOR IS REF CURSOR;
    C_STUDENT STUDENT_CURSOR;

    V_STUDENT_ID   STUDENT.STUDENT_ID%TYPE;
    V_STUDENT_NAME STUDENT.STUDENT_NAME%TYPE;
    V_COURSE       STUDENT.COURSE%TYPE;
    V_MARKS        STUDENT.MARKS%TYPE;

BEGIN
    -- Open REF CURSOR
    OPEN C_STUDENT FOR
        SELECT STUDENT_ID,
               STUDENT_NAME,
               COURSE,
               MARKS
        FROM STUDENT;

    -- Fetch and display records
    LOOP
        FETCH C_STUDENT
        INTO V_STUDENT_ID,
             V_STUDENT_NAME,
             V_COURSE,
             V_MARKS;

        EXIT WHEN C_STUDENT%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Student ID: ' || V_STUDENT_ID ||
            '  Name: ' || V_STUDENT_NAME ||
            '  Course: ' || V_COURSE ||
            '  Marks: ' || V_MARKS
        );
    END LOOP;

    -- Close REF CURSOR
    CLOSE C_STUDENT;

    DBMS_OUTPUT.PUT_LINE('All student records displayed successfully.');

END;
/
```
![output](outputs8/op9.png)
```
SET SERVEROUTPUT ON;

-- Create DOCTOR table
CREATE TABLE DOCTOR
(
    DOCTOR_ID NUMBER(4) PRIMARY KEY,
    DOCTOR_NAME VARCHAR2(30),
    SPECIALIZATION VARCHAR2(30),
    EXPERIENCE NUMBER(2)
);

-- Insert sample doctor records
INSERT INTO DOCTOR VALUES (101, 'Dr. Kumar', 'Cardiology', 12);
INSERT INTO DOCTOR VALUES (102, 'Dr. Sharma', 'Neurology', 10);
INSERT INTO DOCTOR VALUES (103, 'Dr. Reddy', 'Orthopedics', 15);
INSERT INTO DOCTOR VALUES (104, 'Dr. Singh', 'Dermatology', 8);
INSERT INTO DOCTOR VALUES (105, 'Dr. Priya', 'Pediatrics', 7);

COMMIT;

-- REF CURSOR
DECLARE
    TYPE DOCTOR_CURSOR IS REF CURSOR;
    C_DOCTOR DOCTOR_CURSOR;

    V_DOCTOR_ID       DOCTOR.DOCTOR_ID%TYPE;
    V_DOCTOR_NAME     DOCTOR.DOCTOR_NAME%TYPE;
    V_SPECIALIZATION  DOCTOR.SPECIALIZATION%TYPE;
    V_EXPERIENCE      DOCTOR.EXPERIENCE%TYPE;

BEGIN
    -- Open REF CURSOR
    OPEN C_DOCTOR FOR
        SELECT DOCTOR_ID,
               DOCTOR_NAME,
               SPECIALIZATION,
               EXPERIENCE
        FROM DOCTOR;

    -- Fetch and display records
    LOOP
        FETCH C_DOCTOR
        INTO V_DOCTOR_ID,
             V_DOCTOR_NAME,
             V_SPECIALIZATION,
             V_EXPERIENCE;

        EXIT WHEN C_DOCTOR%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Doctor ID: ' || V_DOCTOR_ID ||
            '  Name: ' || V_DOCTOR_NAME ||
            '  Specialization: ' || V_SPECIALIZATION ||
            '  Experience: ' || V_EXPERIENCE || ' years'
        );
    END LOOP;

    -- Close REF CURSOR
    CLOSE C_DOCTOR;

    DBMS_OUTPUT.PUT_LINE('All doctor records displayed successfully.');

END;
/
```
![output](outputs8/op10.png)
```
SET SERVEROUTPUT ON;

-- Create ORDERS table
CREATE TABLE ORDERS
(
    ORDER_ID NUMBER(4) PRIMARY KEY,
    CUSTOMER_NAME VARCHAR2(30),
    PRODUCT_NAME VARCHAR2(30),
    QUANTITY NUMBER(4),
    TOTAL_AMOUNT NUMBER(10,2)
);

-- Insert sample order records
INSERT INTO ORDERS VALUES (101, 'Rahul', 'Laptop', 1, 55000);
INSERT INTO ORDERS VALUES (102, 'Sneha', 'Mobile Phone', 2, 40000);
INSERT INTO ORDERS VALUES (103, 'Arjun', 'Headphones', 3, 6000);
INSERT INTO ORDERS VALUES (104, 'Priya', 'Keyboard', 1, 1500);
INSERT INTO ORDERS VALUES (105, 'Kiran', 'Smart Watch', 2, 10000);

COMMIT;

-- REF CURSOR
DECLARE
    TYPE ORDER_CURSOR IS REF CURSOR;
    C_ORDER ORDER_CURSOR;

    V_ORDER_ID      ORDERS.ORDER_ID%TYPE;
    V_CUSTOMER_NAME ORDERS.CUSTOMER_NAME%TYPE;
    V_PRODUCT_NAME  ORDERS.PRODUCT_NAME%TYPE;
    V_QUANTITY      ORDERS.QUANTITY%TYPE;
    V_TOTAL_AMOUNT  ORDERS.TOTAL_AMOUNT%TYPE;

BEGIN
    -- Open REF CURSOR
    OPEN C_ORDER FOR
        SELECT ORDER_ID,
               CUSTOMER_NAME,
               PRODUCT_NAME,
               QUANTITY,
               TOTAL_AMOUNT
        FROM ORDERS;

    -- Fetch and display records
    LOOP
        FETCH C_ORDER
        INTO V_ORDER_ID,
             V_CUSTOMER_NAME,
             V_PRODUCT_NAME,
             V_QUANTITY,
             V_TOTAL_AMOUNT;

        EXIT WHEN C_ORDER%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Order ID: ' || V_ORDER_ID ||
            '  Customer: ' || V_CUSTOMER_NAME ||
            '  Product: ' || V_PRODUCT_NAME ||
            '  Quantity: ' || V_QUANTITY ||
            '  Total Amount: ' || V_TOTAL_AMOUNT
        );
    END LOOP;

    -- Close REF CURSOR
    CLOSE C_ORDER;

    DBMS_OUTPUT.PUT_LINE('All order records displayed successfully.');

END;
/
```
![output](outputs8/op11.png)
```
SET SERVEROUTPUT ON;

-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE
(
    EMPLOYEE_ID NUMBER(4) PRIMARY KEY,
    EMPLOYEE_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    SALARY NUMBER(10,2),
    EXPERIENCE NUMBER(2)
);

-- Insert sample records
INSERT INTO EMPLOYEE VALUES (101, 'Rahul', 'HR', 35000, 5);
INSERT INTO EMPLOYEE VALUES (102, 'Sneha', 'Sales', 42000, 4);
INSERT INTO EMPLOYEE VALUES (103, 'Arjun', 'HR', 38000, 6);
INSERT INTO EMPLOYEE VALUES (104, 'Priya', 'Finance', 45000, 7);
INSERT INTO EMPLOYEE VALUES (105, 'Kiran', 'Sales', 39000, 3);

COMMIT;

-- Parameterized FOR UPDATE Cursor
DECLARE
    CURSOR C_EMPLOYEE(P_DEPT VARCHAR2) IS
        SELECT EMPLOYEE_ID,
               EMPLOYEE_NAME,
               DEPARTMENT,
               SALARY,
               EXPERIENCE
        FROM EMPLOYEE
        WHERE DEPARTMENT = P_DEPT
        FOR UPDATE;

    V_NEW_SALARY NUMBER(10,2);

BEGIN
    DBMS_OUTPUT.PUT_LINE('Employees in HR Department');
    DBMS_OUTPUT.PUT_LINE('--------------------------');

    -- Open cursor for HR department
    FOR REC IN C_EMPLOYEE('HR') LOOP

        -- Increase salary by Rs. 3000
        V_NEW_SALARY := REC.SALARY + 3000;

        UPDATE EMPLOYEE
        SET SALARY = V_NEW_SALARY
        WHERE CURRENT OF C_EMPLOYEE;

        -- Display updated details
        DBMS_OUTPUT.PUT_LINE(
            'Employee ID: ' || REC.EMPLOYEE_ID ||
            '  Name: ' || REC.EMPLOYEE_NAME ||
            '  Updated Salary: ' || V_NEW_SALARY ||
            '  Experience: ' || REC.EXPERIENCE || ' years'
        );

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('--------------------------');
    DBMS_OUTPUT.PUT_LINE('Salary updated successfully.');

END;
/
```
![output](outputs8/op12.png)
```
-- Display updated EMPLOYEE table
SELECT EMPLOYEE_ID,
       EMPLOYEE_NAME,
       DEPARTMENT,
       SALARY,
       EXPERIENCE
FROM EMPLOYEE;
```
![output](outputs8/op13.png)
```
SET SERVEROUTPUT ON;

-- Create STUDENT table
CREATE TABLE STUDENT
(
    STUDENT_ID NUMBER(4) PRIMARY KEY,
    STUDENT_NAME VARCHAR2(30),
    BRANCH VARCHAR2(20),
    SEMESTER NUMBER(2),
    CGPA NUMBER(3,2),
    SCHOLARSHIP_STATUS VARCHAR2(20)
);

-- Insert sample student records
INSERT INTO STUDENT VALUES (101, 'Rahul', 'CSE', 4, 9.20, 'Not Eligible');
INSERT INTO STUDENT VALUES (102, 'Sneha', 'CSE', 4, 8.60, 'Not Eligible');
INSERT INTO STUDENT VALUES (103, 'Arjun', 'CSE', 4, 9.50, 'Not Eligible');
INSERT INTO STUDENT VALUES (104, 'Priya', 'ECE', 4, 9.10, 'Not Eligible');
INSERT INTO STUDENT VALUES (105, 'Kiran', 'CSE', 4, 7.80, 'Not Eligible');

COMMIT;

DECLARE

    -- Parameterized cursor for specified branch
    CURSOR C_STUDENT(P_BRANCH VARCHAR2) IS
        SELECT STUDENT_ID,
               STUDENT_NAME,
               BRANCH,
               SEMESTER,
               CGPA
        FROM STUDENT
        WHERE BRANCH = P_BRANCH;

    -- FOR UPDATE cursor
    CURSOR C_UPDATE(P_BRANCH VARCHAR2) IS
        SELECT STUDENT_ID,
               CGPA,
               SCHOLARSHIP_STATUS
        FROM STUDENT
        WHERE BRANCH = P_BRANCH
        FOR UPDATE;

    -- REF CURSOR declaration
    TYPE REF_STUDENT_CURSOR IS REF CURSOR;
    C_REF REF_STUDENT_CURSOR;

    V_STUDENT_ID       STUDENT.STUDENT_ID%TYPE;
    V_STUDENT_NAME     STUDENT.STUDENT_NAME%TYPE;
    V_BRANCH           STUDENT.BRANCH%TYPE;
    V_SEMESTER         STUDENT.SEMESTER%TYPE;
    DBMS_OUTPUT.PUT_LINE('Students in CSE Branch');
               BRANCH,
               SEMESTER,
               CGPA
    -- Fetch and display using REF CURSOR
    LOOP
        FETCH C_REF
        INTO V_STUDENT_ID,
             V_STUDENT_NAME,
             V_BRANCH,
             V_SEMESTER,
             V_CGPA;

        EXIT WHEN C_REF%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Student ID: ' || V_STUDENT_ID ||
            '  Name: ' || V_STUDENT_NAME ||
            '  Branch: ' || V_BRANCH ||
            '  Semester: ' || V_SEMESTER ||
            '  CGPA: ' || V_CGPA
        );
    END LOOP;

    -- Close REF CURSOR
    CLOSE C_REF;

    DBMS_OUTPUT.PUT_LINE('----------------------');

    -- FOR UPDATE cursor using parameterized branch
    FOR REC IN C_UPDATE('CSE') LOOP

        -- Check CGPA
        IF REC.CGPA >= 9.0 THEN

            -- Update scholarship status
            UPDATE STUDENT
            SET SCHOLARSHIP_STATUS = 'Eligible'
            WHERE CURRENT OF C_UPDATE;

            DBMS_OUTPUT.PUT_LINE(
                'Scholarship Eligible: Student ID ' ||
                REC.STUDENT_ID
            );

        END IF;

    END LOOP;

    COMMIT;
        FROM STUDENT
        WHERE BRANCH = 'CSE';


    DBMS_OUTPUT.PUT_LINE('----------------------');
    OPEN C_REF FOR
        SELECT STUDENT_ID,
               STUDENT_NAME,
    DBMS_OUTPUT.PUT_LINE('----------------------');

    -- Open REF CURSOR for CSE students
    V_CGPA             STUDENT.CGPA%TYPE;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Scholarship status updated successfully.');


END;
/
```
![output](outputs8/op14.png)
```
-- Display final updated table
SELECT STUDENT_ID,
       STUDENT_NAME,
       BRANCH,
       SEMESTER,
       CGPA,
       SCHOLARSHIP_STATUS
FROM STUDENT;
```
![output](outputs8/op15.png)

