Additional Experiment -1
# Student Information Lookup Using Student ID 
## Create the STUDENT Table

```
CREATE TABLE student (
    student_id   NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    department   VARCHAR2(30),
    marks        NUMBER(5,2)
);

## Insert Sample Records

```
INSERT INTO student VALUES (101, 'Ravi',   'CSE', 85);
INSERT INTO student VALUES (102, 'Sita',   'ECE', 92);
INSERT INTO student VALUES (103, 'Kiran',  'EEE', 78);
INSERT INTO student VALUES (104, 'Anjali', 'CSE', 88);
INSERT INTO student VALUES (105, 'Rahul',  'IT',  74);

COMMIT;


## Verify the records

SELECT * FROM student;

## Write the PL/SQL Block

SET SERVEROUTPUT ON;

DECLARE
    v_student_id   student.student_id%TYPE;
    v_student_name student.student_name%TYPE;
    v_department   student.department%TYPE;
    v_marks        student.marks%TYPE;

BEGIN
    -- Accept Student ID from the user
    v_student_id := &student_id;

    -- Retrieve student details
    SELECT student_name, department, marks
    INTO v_student_name, v_department, v_marks
    FROM student
    WHERE student_id = v_student_id;

    -- Display student details
    DBMS_OUTPUT.PUT_LINE('Student ID   : ' || v_student_id);
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || v_student_name);
    DBMS_OUTPUT.PUT_LINE('Department   : ' || v_department);
    DBMS_OUTPUT.PUT_LINE('Marks        : ' || v_marks);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'No student found with Student ID: ' || v_student_id
        );

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: ' || SQLERRM
        );
END;
/

## Execute for an Invalid Student ID
Additional Experiment - 2
# Developing a Stored Function to Calculate Annual Salary 

## Create the EMPLOYEE Table
```
CREATE TABLE employee (
    employee_id   NUMBER(5) PRIMARY KEY,
    employee_name VARCHAR2(50),
    department    VARCHAR2(30),
    monthly_salary NUMBER(10,2)
);

## Insert Sample Employee Records

INSERT INTO employee VALUES (101, 'Ravi',   'CSE', 25000);
INSERT INTO employee VALUES (102, 'Sita',   'ECE', 30000);
INSERT INTO employee VALUES (103, 'Kiran',  'EEE', 35000);
INSERT INTO employee VALUES (104, 'Anjali', 'CSE', 40000);
INSERT INTO employee VALUES (105, 'Rahul',  'IT',  45000);

COMMIT;



## Verify the records:

SELECT * FROM employee;


## Create the Stored Function

CREATE OR REPLACE FUNCTION calculate_annual_salary (
    p_monthly_salary IN NUMBER
)
RETURN NUMBER
IS
    v_annual_salary NUMBER;
BEGIN
    v_annual_salary := p_monthly_salary * 12;

    RETURN v_annual_salary;
END;



## Check the Function is valid or not

SELECT object_name, status
FROM user_objects
WHERE object_name = 'CALCULATE_ANNUAL_SALARY';




## Invoke the Function Using a SELECT Statement



SELECT employee_id,
       employee_name,
       department,
       monthly_salary,
       calculate_annual_salary(monthly_salary) AS annual_salary
FROM employee;


## Invoking the function uisng PL/SQL code

SET SERVEROUTPUT ON;

DECLARE
    v_monthly_salary employee.monthly_salary%TYPE;
    v_annual_salary  NUMBER;
BEGIN
    SELECT monthly_salary
    INTO v_monthly_salary
    FROM employee
    WHERE employee_id = 101;

    v_annual_salary := calculate_annual_salary(v_monthly_salary);

    DBMS_OUTPUT.PUT_LINE('Employee ID     : 101');
    DBMS_OUTPUT.PUT_LINE('Monthly Salary  : ' || v_monthly_salary);
    DBMS_OUTPUT.PUT_LINE('Annual Salary   : ' || v_annual_salary);
END;
Additional Experiment - 3
# Develop Parameterized Cursor for Employees

## Create the EMPLOYEE Table


CREATE TABLE employee (
    employee_id   NUMBER(5) PRIMARY KEY,
    employee_name VARCHAR2(50),
    department    VARCHAR2(30),
    designation   VARCHAR2(30),
    salary        NUMBER(10,2)
);

## Insert Sample records

INSERT INTO employee VALUES
(101, 'Ravi', 'CSE', 'Software Engineer', 35000);

INSERT INTO employee VALUES
(102, 'Sita', 'ECE', 'System Engineer', 40000);

INSERT INTO employee VALUES
(103, 'Kiran', 'CSE', 'Senior Developer', 50000);

INSERT INTO employee VALUES
(104, 'Anjali', 'EEE', 'Electrical Engineer', 38000);

INSERT INTO employee VALUES
(105, 'Rahul', 'CSE', 'Software Engineer', 42000);

INSERT INTO employee VALUES
(106, 'Priya', 'ECE', 'Hardware Engineer', 45000);

INSERT INTO employee VALUES
(107, 'Arun', 'EEE', 'Design Engineer', 40000);

INSERT INTO employee VALUES
(108, 'Sneha', 'CSE', 'Project Engineer', 48000);

COMMIT;



## Verify the records
SELECT * FROM employee;

## ENABLE SERVEROUPUT

SET SERVEROUTPUT ON;

## PL/SQL code


DECLARE

    -- Parameterized cursor
    CURSOR c_employee (p_department VARCHAR2) IS
        SELECT employee_id,
               employee_name,
               department,
               designation,
               salary
        FROM employee
        WHERE department = p_department;

    -- Variables to store employee details
    v_employee_id   employee.employee_id%TYPE;
    v_employee_name employee.employee_name%TYPE;
    v_department    employee.department%TYPE;
    v_designation   employee.designation%TYPE;
    v_salary        employee.salary%TYPE;

BEGIN

    -- Open cursor by passing department name
    OPEN c_employee('CSE');

    -- Fetch employee records
    LOOP

        FETCH c_employee
        INTO v_employee_id,
        DBMS_OUTPUT.PUT_LINE('Salary        : ' || v_salary);
        DBMS_OUTPUT.PUT_LINE('-----------------------------');

    END LOOP;

    -- Close cursor
    CLOSE c_employee;

END;
/            