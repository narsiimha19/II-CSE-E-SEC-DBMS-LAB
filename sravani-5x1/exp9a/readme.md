## CREATE STUDENT TABLE
```
CREATE TABLE student55 (
    student_id   NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    course       VARCHAR2(30),
    marks        NUMBER(5,2)
);
```
![OUTPUT](9a output)
## 
```
CREATE OR REPLACE TRIGGER trg_student_before_insert
BEFORE INSERT ON student55
FOR EACH ROW
BEGIN

    -- Validate Student ID
    IF :NEW.student_id <= 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Student ID must be greater than 0.'
        );
    END IF;

    -- Validate Student Name
    IF :NEW.student_name IS NULL THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Student Name cannot be NULL.'
        );
    END IF;

    -- Validate Marks
    IF :NEW.marks < 0 OR :NEW.marks > 100 THEN
        RAISE_APPLICATION_ERROR(
            -20003,
            'Marks must be between 0 and 100.'
        );
    END IF;

END;
/
```
![OUTPUT](9a output1)

## INSERT INTO STUDENT TABLE
```
INSERT INTO student55
VALUES (101, 'Ravi', 'CSE', 85);
```
![OUTPUT](9a output2)

##
```
COMMIT;
```
![OUTPUT](9a output3)

##
```
INSERT INTO student55
VALUES (102, 'Sita', 'ECE', 120);
INSERT INTO student55
VALUES (-103, 'Kiran', 'EEE', 75);
```
![OUTPUT](9a output4)

##
```
SELECT * FROM student55;
```
![OUTPUT](9a output5)

## 
```
CREATE TABLE student66 (
    student_id   NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    course       VARCHAR2(30),
    marks        NUMBER(5,2)
);
```
![OUTPUT](9a output6)

##
```
CREATE TABLE student_audit (
    audit_id      NUMBER(5),
    student_id    NUMBER(5),
    student_name  VARCHAR2(50),
    course        VARCHAR2(30),
    marks         NUMBER(5,2),
    action        VARCHAR2(20),
    action_date   DATE
);
```
![OUTPUT](9a output7)

##
```
CREATE SEQUENCE student_audit_seq
START WITH 1
INCREMENT BY 1;
CREATE OR REPLACE TRIGGER trg_student_after_insert
AFTER INSERT ON student
FOR EACH ROW
BEGIN

    INSERT INTO student_audit (
        audit_id,
        student_id,
        student_name,
        course,
        marks,
        action,
        action_date
    )
    VALUES (
        student_audit_seq.NEXTVAL,
        :NEW.student_id,
        :NEW.student_name,
        :NEW.course,
        :NEW.marks,
        'INSERT',
        SYSDATE
    );

END;
/
```
![OUTPUT](9a output8)

##
```
INSERT INTO student66
VALUES (101, 'Ravi', 'CSE', 85);
```
![OUTPUT](9a output9)

##
```
COMMIT;
```
![OUTPUT](9a output10)

##
```
SELECT * FROM student66;
SELECT * FROM student_audit;
CREATE TABLE employee3 (
    employee_id   NUMBER(5) PRIMARY KEY,
    employee_name VARCHAR2(50),
    department    VARCHAR2(30),
    salary        NUMBER(10,2)
);
```
![OUTPUT](9a output11)

##
```
INSERT INTO employee3 VALUES (101, 'Ravi', 'CSE', 30000);
INSERT INTO employee3 VALUES (102, 'Sita', 'ECE', 35000);
INSERT INTO employee3 VALUES (103, 'Kiran', 'EEE', 40000);
INSERT INTO employee3 VALUES (104, 'Anjali', 'CSE', 45000);
```
![OUTPUT](9a output12)

##
```
COMMIT;
```
![OUTPUT](9a output13)

##
```
CREATE OR REPLACE TRIGGER trg_employee_before_update
BEFORE UPDATE ON employee3
FOR EACH ROW
BEGIN

    -- Compare old and new salary
    IF :NEW.salary < :OLD.salary THEN

        RAISE_APPLICATION_ERROR(
            -20001,
            'Salary cannot be decreased.'
        );

    END IF;

END;
/
```
![OUTPUT](9a output14)

##
```
UPDATE employee3
SET salary = 33000

WHERE employee_id = 101;
```
![OUTPUT](9a output15)

##
```
COMMIT;
```
![OUTPUT](9a output16)

##
```
SELECT * FROM employee3
```
![OUTPUT](9a output17)

##
```
WHERE employee_id = 101;

UPDATE employee3
SET salary = 28000
WHERE employee_id = 101;
```
![OUTPUT](9a output18)

##
```
SELECT * FROM employee3;
```
![OUTPUT](9a output19)

##CREATE EMPLOYEE TABALE
```
CREATE TABLE employee4 (
    employee_id   NUMBER(5) PRIMARY KEY,
    employee_name VARCHAR2(50),
    department    VARCHAR2(30),
    salary        NUMBER(10,2)
);
```
![OUTPUT](9a output20)

## INSERT INTO EMPLOYEE TABLE
```
INSERT INTO employee4 VALUES (101, 'Ravi', 'CSE', 30000);
INSERT INTO employee4 VALUES (102, 'Sita', 'ECE', 35000);
INSERT INTO employee4 VALUES (103, 'Kiran', 'EEE', 40000);
INSERT INTO employee4 VALUES (104, 'Anjali', 'CSE', 45000);
INSERT INTO employee4 VALUES (105, 'Rahul', 'ECE', 38000);
```
![OUTPUT](9a output21)

##
```
COMMIT;
```
![OUTPUT](9a output22)

##
```
CREATE TABLE employee_delete_log (
    log_id        NUMBER(5),
    message       VARCHAR2(200),
    delete_date   DATE
);
```
![OUTPUT](9a output23)

##
```
CREATE SEQUENCE employee_delete_log_seq
START WITH 1
INCREMENT BY 1;
CREATE OR REPLACE TRIGGER trg_employee_after_delete
AFTER DELETE ON employee4
BEGIN

    INSERT INTO employee_delete_log (
        log_id,
        message,
        delete_date
    )
    VALUES (
        employee_delete_log_seq.NEXTVAL,
        'DELETE statement executed on EMPLOYEE table.',
        SYSDATE
    );

    DBMS_OUTPUT.PUT_LINE(
        'DELETE statement executed successfully.'
    );

END;
```
![OUTPUT](9a output24)

##
```
SELECT trigger_name, status
FROM user_triggers
WHERE trigger_name = 'TRG_EMPLOYEE_AFTER_DELETE';
```
![OUTPUT](9a output25)

##
```
SET SERVEROUTPUT ON;
```
![OUTPUT](9a output26)

##
```
DELETE FROM employee4
WHERE employee_id = 101;
```
![OUTPUT](9a output27)

##
```
COMMIT;
```
![OUTPUT](9a output28)

##
```
SELECT * FROM employee4;
DELETE FROM employee4
WHERE department = 'ECE';
```
![OUTPUT](9a output29)

##
```
COMMIT;
```
![OUTPUT](9a output30)

##
```
SELECT * FROM employee_delete_log;
```
![OUTPUT](9a output31)

## CREATE COURSE TABLE 
```
CREATE TABLE course (
    course_id   NUMBER(5) PRIMARY KEY,
    course_name VARCHAR2(50)
);
```
![OUTPUT](9a output32)

##CREATE STUDENT TABLE
```
CREATE TABLE student33 (
    student_id   NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    course_id    NUMBER(5),
    marks        NUMBER(5,2),
    CONSTRAINT fk_student_course
        FOREIGN KEY (course_id)
        REFERENCES course(course_id)
);
```
## INSERT INTO STUDENT TABLE
```
INSERT INTO course33 VALUES (1, 'Computer Science');
INSERT INTO course33 VALUES (2, 'Electronics');
INSERT INTO course33 VALUES (3, 'Electrical');
```
##
```
COMMIT;
```
![OUTPUT](9a output33)

## 
```
INSERT INTO student33 VALUES (101, 'Ravi', 1, 85);
INSERT INTO student33 VALUES (102, 'Sita', 2, 90); 
INSERT INTO student33 VALUES (103, 'Kiran', 3, 78); 
INSERT INTO student33 VALUES (104, 'Anjali', 1, 88);
```
##
```
COMMIT;
```
##
```
CREATE OR REPLACE VIEW student_course_view AS
SELECT
    s.student_id,
    s.student_name,
    s.course_id,
    c.course_name,
    s.marks
FROM student s
JOIN course c
    ON s.course_id = c.course_id;
```
##
```
SELECT * FROM student_course_view;

CREATE OR REPLACE TRIGGER trg_student_view_update
INSTEAD OF UPDATE ON student_course_view
FOR EACH ROW
BEGIN

    UPDATE student
    SET
        student_name = :NEW.student_name,
        marks = :NEW.marks
    WHERE student_id = :OLD.student_id;

END;
```
##
```
UPDATE student_course_view
SET marks = 95
WHERE student_id = 101;
```
##
```
COMMIT;
```
##
```
SELECT * FROM student33;
SELECT * FROM student_course_view;
```
![OUTPUT](9a output34)
