#.1. Create the STUDENT Table
```
CREATE TABLE student (
    student_id   NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    course       VARCHAR2(30),
    marks        NUMBER(5,2)
);
```

![Output](1.1.png)

```
```
#2. Create the BEFORE INSERT Trigger
```
CREATE OR REPLACE TRIGGER trg_student_before_insert
BEFORE INSERT ON student
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
![Output](1.2.png)
```
```

#.3. Insert a Valid Record
```
INSERT INTO student
VALUES (101, 'Ravi', 'CSE', 85);

```
![Output](1.3.png)
```
```
#.4. Insert an Invalid Record
```
INSERT INTO student
VALUES (102, 'Sita', 'ECE', 120);

```
![Output](1.4.png)
```
```

#.5. Test Another Invalid Record
```
INSERT INTO student
VALUES (-103, 'Kiran', 'EEE', 75);
```
![Output](1.5.png)
```
```


#.6. Display the Final Table
```
SELECT * FROM student;
```
![Output](1.6.png)
```
```
Program 2: AFTER Trigger
#.1. Create the Main Table
```
CREATE TABLE student (
    student_id   NUMBER(5) PRIMARY KEY,

    student_name VARCHAR2(50),
    course       VARCHAR2(30),
    marks        NUMBER(5,2)
);
```
![Output](2.1.png)
```
```

#.2. Create the Audit Table
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
![Output](2.2.png)
```
```

#.3. Create a Sequence for the Audit ID
```
CREATE SEQUENCE student_audit_seq
START WITH 1
INCREMENT BY 1;
```
![Output](2.3.png)
```
```
#.4. Create the AFTER INSERT Trigger
```
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
![Output](2.4.png)
```
```


#.5. Insert a New Record into the Main Table
```
INSERT INTO student
VALUES (101, 'Ravi', 'CSE', 85);
```

![Output](2.5.png)

#.26. Verify the Main Table
```
SELECT * FROM student;
```
![Output](2.6.png)
```
```
Program 3: Row-Level Trigger
#.1. Create the EMPLOYEE Table
```
CREATE TABLE employee (
    employee_id   NUMBER(5) PRIMARY KEY,
    employee_name VARCHAR2(50),
    department    VARCHAR2(30),
    salary        NUMBER(10,2)
);
```
![output](3.1.png)
```
```
#2. Insert Sample Employee Records
```
INSERT INTO employee VALUES (101, 'Ravi', 'CSE', 30000);
INSERT INTO employee VALUES (102, 'Sita', 'ECE', 35000);
INSERT INTO employee VALUES (103, 'Kiran', 'EEE', 40000);
INSERT INTO employee VALUES (104, 'Anjali', 'CSE', 45000);
```
![output](3.2.png)
```
```
#.3. Create the BEFORE UPDATE Trigger
```
CREATE OR REPLACE TRIGGER trg_employee_before_update
BEFORE UPDATE ON employee
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
![output](3.3.png)
```
```
#.4. Update a Valid Record
```
UPDATE employee
SET salary = 33000

WHERE employee_id = 101;
```
![output](3.4.png)
```
```
#.5. Update an Invalid Record
```
UPDATE employee
SET salary = 28000
WHERE employee_id = 101;
```
![output](3.5.png)
```
```
#.6. Display the Table Contents
```
SELECT * FROM employee;
```
![Output](3.6.png)
```
```

Program 4: Statement-Level Trigger
#.1. Create the Main Table
```
CREATE TABLE employee (
    employee_id   NUMBER(5) PRIMARY KEY,
    employee_name VARCHAR2(50),
    department    VARCHAR2(30),
    salary        NUMBER(10,2)
);
```

![output](4.1.png)
```
```

#.2. Insert Sample Records
```
INSERT INTO employee VALUES (101, 'Ravi', 'CSE', 30000);
INSERT INTO employee VALUES (102, 'Sita', 'ECE', 35000);
INSERT INTO employee VALUES (103, 'Kiran', 'EEE', 40000);
INSERT INTO employee VALUES (104, 'Anjali', 'CSE', 45000);
INSERT INTO employee VALUES (105, 'Rahul', 'ECE', 38000);

```
![Output](4.2.png)

#.3. Create the Log Table
```
CREATE TABLE employee_delete_log (
    log_id        NUMBER(5),
    message       VARCHAR2(200),
    delete_date   DATE
);
```
![Output](4.3.png)
```
```

#.4. Create a Sequence for the Log ID
```
CREATE SEQUENCE employee_delete_log_seq
START WITH 1
INCREMENT BY 1;
```
![Output](4.4.png)
```
```

#.5. Create the AFTER DELETE Statement-Level Trigger
```
CREATE OR REPLACE TRIGGER trg_employee_after_delete
AFTER DELETE ON employee
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
![Output](4.5.png)
```
```

#.6. Verify the Trigger
```
SELECT trigger_name, status
FROM user_triggers
WHERE trigger_name = 'TRG_EMPLOYEE_AFTER_DELETE';
```INSERT INTO course VALUES (1, 'Computer Science');
INSERT INTO course VALUES (2, 'Electronics');
INSERT INTO course VALUES (3, 'Electrical');

```
![output](4.6.png)
```
```

Program 5: INSTEAD OF Trigger
#.1. Create the Base Tables
```
Create COURSE Table

CREATE TABLE course (
    course_id   NUMBER(5) PRIMARY KEY,
    course_name VARCHAR2(50)
);
```
![Output](5.1.png)
```
```

#.2. Insert Sample Records
```
Insert Course Records
INSERT INTO course VALUES (1, 'Computer Science');
INSERT INTO course VALUES (2, 'Electronics');
INSERT INTO course VALUES (3, 'Electronics');
```
![output](5.2.png)
```
```
