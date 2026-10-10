
##PROGRAM NO1```
CREATE TABLE employee3 (
    employee3_id NUMBER(5) PRIMARY KEY,
    employee3_name VARCHAR2(50),
    monthly_salary NUMBER(10,2)
);
```
!OUTPUT[exp7b program1 output1]
```
INSERT INTO employee3 VALUES (101, 'Ravi', 25000);
INSERT INTO employee3 VALUES (102, 'Sita', 30000);
INSERT INTO employee3 VALUES (103, 'Kiran', 35000);
INSERT INTO employee3 VALUES (104, 'Anjali', 40000);
INSERT INTO employee3 VALUES (105, 'Rahul', 45000);

COMMIT;
```
!OUTPUT[exp7b program1 output2]

```
SELECT * FROM Employee3;
```
!OUTPUT[exp7b program1 output3]

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
!OUTPUT[exp7b program1 output4]

##PROGRAM NO2```
CREATE TABLE student2 (
    student2_id NUMBER(5) PRIMARY KEY,
    student2_name VARCHAR2(50),
    course VARCHAR2(30),
    marks NUMBER(5,2)
);
```
!OUTPUT[exp7b program2 output1]

```
INSERT INTO student2 VALUES (101, 'Ravi',   'CSE', 85);
INSERT INTO student2 VALUES (102, 'Sita',   'CSE', 92);
INSERT INTO student2 VALUES (103, 'Kiran',  'ECE', 78);
INSERT INTO student2 VALUES (104, 'Anjali', 'EEE', 88);
INSERT INTO student2 VALUES (105, 'Rahul',  'CSE', 74);
INSERT INTO student2 VALUES (106, 'Priya',  'ECE', 95);
INSERT INTO student2 VALUES (107, 'Arun',   'IT',  81);
INSERT INTO student2 VALUES (108, 'Sneha',  'CSE', 89);
INSERT INTO student2 VALUES (109, 'Vijay',  'EEE', 68);
INSERT INTO student2 VALUES (110, 'Divya',  'IT',  91);
INSERT INTO student2 VALUES (111, 'Manoj',  'ECE', 76);
INSERT INTO student2 VALUES (112, 'Kavya',  'CSE', 84);
INSERT INTO student2 VALUES (113, 'Ramesh', 'IT',  72);
INSERT INTO student2 VALUES (114, 'Swathi', 'EEE', 87);
INSERT INTO student2 VALUES (115, 'Ajay',   'ECE', 93);

COMMIT;
```
!OUTPUT[exp7b program2 output2]

```
SELECT * FROM student2;
```


```
CREATE OR REPLACE FUNCTION COUNT_STUDENTS2 (
    p_course IN VARCHAR2
)
RETURN NUMBER
IS
    v_total_students2 NUMBER;
BEGIN
    -- Count students2 belonging to the given course
    SELECT COUNT(*)
    INTO v_total_students2
    FROM student2
    WHERE course = p_course;

    -- Return the count
    RETURN v_total_students2;
END;
SELECT
    'CSE' AS course,
    COUNT_STUDENTS2('CSE') AS total_students2
FROM dual;
SELECT
    'ECE' AS course,
    COUNT_STUDENTS2('ECE') AS total_students2
FROM dual;


SELECT
    course,
    COUNT_STUDENTS2(course) AS total_students2
FROM (
    SELECT DISTINCT course
    FROM student2
);

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
