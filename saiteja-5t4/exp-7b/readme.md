##PROGRAM NO1```


SET SERVEROUTPUT ON;
CREATE TABLE student4 (
    student4_id NUMBER(5) PRIMARY KEY,
    student4_name VARCHAR2(50),
    course VARCHAR2(30),
    marks NUMBER(5,2)
);
```
!OUTPUT[exp7b program1 output1]
```
INSERT INTO student4 VALUES (101, 'Ravi', 'CSE', 85);
INSERT INTO student4 VALUES (102, 'Sita', 'CSE', 92);
INSERT INTO student4 VALUES (103, 'Kiran', 'ECE', 78);
INSERT INTO student4 VALUES (104, 'Anjali', 'EEE', 88);
INSERT INTO student4 VALUES (105, 'Rahul', 'CSE', 74);

COMMIT;
```
!OUTPUT[exp7b program1 output2]

```
CREATE OR REPLACE PROCEDURE GET_STUDENT4_DETAILS (
    p_student4_id   IN  student4.student4_id%TYPE,
    p_student4_name OUT student4.student4_name%TYPE,
    p_marks        OUT student4.marks%TYPE
)
IS
BEGIN
    SELECT student4_name, marks
    INTO p_student4_name, p_marks
    FROM student4
    WHERE student4_id = p_student4_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_student4_name := NULL;
        p_marks := NULL;
        DBMS_OUTPUT.PUT_LINE('No student4 found with ID: ' || p_student4_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
SET SERVEROUTPUT ON;

DECLARE
    v_student4_name student4.student4_name%TYPE;
    v_marks        student4.marks%TYPE;
BEGIN
    GET_STUDENT4_DETAILS(101, v_student4_name, v_marks);

    IF v_student4_name IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Student4 Name : ' || v_student4_name);
        DBMS_OUTPUT.PUT_LINE('Marks        : ' || v_marks);
    END IF;
END;
/
```
!OUTPUT[exp7b program1 output3]
!OUTPUT[exp7b program1 output4]


##PROGRAM NO2```
CREATE TABLE employee3 (
    employee3_id NUMBER(5) PRIMARY KEY,
    employee3_name VARCHAR2(50),
    monthly_salary NUMBER(10,2)
);
```
!OUTPUT[exp7b program2 output1]

```
INSERT INTO employee3 VALUES (101, 'Ravi', 25000);
INSERT INTO employee3 VALUES (102, 'Sita', 30000);
INSERT INTO employee3 VALUES (103, 'Kiran', 35000);
INSERT INTO employee3 VALUES (104, 'Anjali', 40000);
INSERT INTO employee3 VALUES (105, 'Rahul', 45000);

COMMIT;
```
!OUTPUT[exp7b program2 output2]

```
CREATE OR REPLACE FUNCTION CALCULATE_ANNUAL_SALARY (
    p_monthly_salary IN NUMBER
)
RETURN NUMBER
IS
    v_annual_salary NUMBER;
BEGIN
    -- Calculate annual salary
    v_annual_salary := p_monthly_salary * 12;

    -- Return annual salary
    RETURN v_annual_salary;
END;
/
SELECT * FROM EMPLOYEE3; 

SELECT employee3_id,
       employee3_name,
        monthly_salary,
        CALCULATE_ANNUAL_SALARY(monthly_salary) AS annual_salary
FROM employee3;
```
!OUTPUT[exp7b program2 output3]

##PROGRAM NO3```
CREATE TABLE student6 (
    student6_id NUMBER(5) PRIMARY KEY,
    student6_name VARCHAR2(50),
    marks NUMBER(5,2)
);
```
!OUTPUT[exp7b program3 output1]

```
INSERT INTO student6 VALUES (101, 'Ravi',   85);
INSERT INTO student6 VALUES (102, 'Sita',   72);
INSERT INTO student6 VALUES (103, 'Kiran',  55);
INSERT INTO student6 VALUES (104, 'Anjali', 45);
INSERT INTO student6 VALUES (105, 'Rahul',  30);
INSERT INTO student6 VALUES (106, 'Priya',  91);
INSERT INTO student6 VALUES (107, 'Arun',   68);
INSERT INTO student6 VALUES (108, 'Sneha',  58);

COMMIT;
```
!OUTPUT[exp7b program3 output2]


```
SELECT * FROM student6;
```
!OUTPUT[exp7b program3 output3]
```
CREATE OR REPLACE FUNCTION GET_GRADE (
    p_marks IN NUMBER
)
RETURN VARCHAR2
IS
    v_grade VARCHAR2(20);
BEGIN

    -- Determine grade based on marks
    IF p_marks >= 75 THEN
        v_grade := 'Distinction';

    ELSIF p_marks >= 60 THEN
        v_grade := 'First Class';

    ELSIF p_marks >= 50 THEN
        v_grade := 'Second Class';

    ELSIF p_marks >= 35 THEN
        v_grade := 'Pass';

    ELSE
        v_grade := 'Fail';
    END IF;

    -- Return the calculated grade
    RETURN v_grade;

END;
/
SELECT
    student_name,
    marks,
    GET_GRADE(marks) AS grade
FROM student;
```
!OUTPUT[exp7b program3 output4]
!OUTPUT[exp7b program3 output5]

   
