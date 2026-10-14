#Experiment - 5a
```
CREATE TABLE student (
    student_id NUMBER(5) PRIMARY KEY,
    student_name VARCHAR2(50),
    course VARCHAR2(30),
    marks NUMBER(5,2)
);
```

## INSERT INTO STUDENT TABLE
```
INSERT INTO student VALUES (101, 'Ravi', 'CSE', 85);
INSERT INTO student VALUES (102, 'Sita', 'CSE', 92);
INSERT INTO student VALUES (103, 'Kiran', 'ECE', 78);
INSERT INTO student VALUES (104, 'Anjali', 'EEE', 88);
INSERT INTO student VALUES (105, 'Rahul', 'CSE', 74);
INSERT INTO student VALUES (106, 'Priya', 'ECE', 95);
INSERT INTO student VALUES (107, 'Arun', 'IT', 81);
INSERT INTO student VALUES (108, 'Sneha', 'CSE', 89);
INSERT INTO student VALUES (109, 'Vijay', 'EEE', 68);
INSERT INTO student VALUES (110, 'Divya', 'IT', 91);
INSERT INTO student VALUES (111, 'Manoj', 'ECE', 76);
INSERT INTO student VALUES (112, 'Kavya', 'CSE', 84);
INSERT INTO student VALUES (113, 'Ramesh', 'IT', 72);
INSERT INTO student VALUES (114, 'Swathi', 'EEE', 87);
INSERT INTO student VALUES (115, 'Ajay', 'ECE', 93);
COMMIT;
```
<img width="1437" height="971" alt="create student table" src="https://github.com/user-attachments/assets/1ef6e17e-3ee0-41be-a57a-b1c6da2a9e4d" />

<img width="1497" height="986" alt="insert student" src="https://github.com/user-attachments/assets/08163d98-4b4e-4591-bc8d-e938081b2a5c" />



# DISPLAY STUDENT TABLE
SELECT * FROM student;
![OUTPUT](output-exp-5/display.png)


## PL/SQL CODE
```
SET SERVEROUTPUT ON;
DECLARE
    -- Boolean variable to check whether any student is found
    v_found BOOLEAN := FALSE;

    -- User-defined exception
    e_no_first_class EXCEPTION;

    -- Cursor to retrieve First Class students
    CURSOR c_first_class IS
        SELECT student_id, student_name, marks
        FROM student
        WHERE marks >= 60;

BEGIN
    -- Open cursor and process each student
    FOR student_rec IN c_first_class
    LOOP
        -- A matching record is found
        v_found := TRUE;

        -- Display student details
        DBMS_OUTPUT.PUT_LINE( 'Student ID   : ' || student_rec.student_id );
        DBMS_OUTPUT.PUT_LINE( 'Student Name : ' || student_rec.student_name);
        DBMS_OUTPUT.PUT_LINE('Marks        : ' || student_rec.marks);
        DBMS_OUTPUT.PUT_LINE('---------------------------');
    END LOOP;

    -- Check whether any record was found
    END IF;

EXCEPTION
    WHEN e_no_first_class THEN
        DBMS_OUTPUT.PUT_LINE('No First Class Students Found.');
    -- Handle other unexpected exceptions
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
    INSERT INTO student
    VALUES (116, 'Harish', 'CSE', 82);
```
<img width="1592" height="985" alt="sql code" src="https://github.com/user-attachments/assets/f9cc3e31-f48f-4b9c-afb5-3737b198ebe8" />



# EXPERIMENT - 5B

SET SERVEROUTPUT ON;

```
CREATE TABLE STUDENT1 (
    STUDENT_ID NUMBER(5) PRIMARY KEY,
    STUDENT_NAME VARCHAR2(30),
    COURSE VARCHAR2(20),
    MARKS NUMBER(3)
);
```

SET SERVEROUTPUT ON;
```
BEGIN
```
```
    INSERT INTO STUDENT1
    VALUES (201, 'Ravi', 'CSE', 85);

    INSERT INTO STUDENT1
    VALUES (202, 'Anjali', 'ECE', 78);

    SAVEPOINT SP1;

    INSERT INTO STUDENT1
    VALUES (203, 'Kiran', 'IT', 65);

    DBMS_OUTPUT.PUT_LINE('Three student records inserted.');

    ROLLBACK TO SP1;

    DBMS_OUTPUT.PUT_LINE('Rollback to SAVEPOINT SP1 completed.');
    DBMS_OUTPUT.PUT_LINE('Third student record has been rolled back.');

    COMMIT;
```
    DBMS_OUTPUT.PUT_LINE('Transaction committed successfully.');

EXCEPTION
   ```
 WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END;
/
```
<img width="1502" height="992" alt="sql2 code" src="https://github.com/user-attachments/assets/df6101ef-c726-495c-81df-a2df44443515" />

```
SELECT * FROM STUDENT1
WHERE STUDENT_ID BETWEEN 201 AND 203;
```
![output 2](output-exp-5/5b-2.png)
