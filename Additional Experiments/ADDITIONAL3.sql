-- ADDITIONAL EXPERIMENT - 3
-- Develop Parameterized Cursor for Employees

-- Create EMPLOYEE table

CREATE TABLE employee (
    employee_id   NUMBER(5) PRIMARY KEY,
    employee_name VARCHAR2(50),
    department    VARCHAR2(30),
    designation   VARCHAR2(30),
    salary        NUMBER(10,2)
);


-- Insert sample records

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


-- Verify records

SELECT * FROM employee;


-- Enable server output

SET SERVEROUTPUT ON;


-- Parameterized Cursor

DECLARE

    CURSOR c_employee (p_department VARCHAR2) IS
        SELECT employee_id,
               employee_name,
               department,
               designation,
               salary
        FROM employee
        WHERE department = p_department;

    v_employee_id   employee.employee_id%TYPE;
    v_employee_name employee.employee_name%TYPE;
    v_department    employee.department%TYPE;
    v_designation   employee.designation%TYPE;
    v_salary        employee.salary%TYPE;

BEGIN

    -- Pass CSE as the cursor parameter

    OPEN c_employee('CSE');

    LOOP

        FETCH c_employee
        INTO v_employee_id,
             v_employee_name,
             v_department,
             v_designation,
             v_salary;

        EXIT WHEN c_employee%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Employee ID   : ' || v_employee_id);
        DBMS_OUTPUT.PUT_LINE('Employee Name : ' || v_employee_name);
        DBMS_OUTPUT.PUT_LINE('Department    : ' || v_department);
        DBMS_OUTPUT.PUT_LINE('Designation   : ' || v_designation);
        DBMS_OUTPUT.PUT_LINE('Salary        : ' || v_salary);
        DBMS_OUTPUT.PUT_LINE('-----------------------------');

    END LOOP;

    CLOSE c_employee;

END;
/