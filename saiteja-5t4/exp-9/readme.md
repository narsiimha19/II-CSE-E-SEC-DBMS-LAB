
##PROGRAM NO1```
CREATE TABLE student9 (
    student9_id   NUMBER(5) PRIMARY KEY,
    stude
Cnt9_name VARCHAR2(50),
    course       VARCHAR2(30),
    marks        NUMBER(5,2)
);
```
![exp-9 program1 output1](./exp-9%20program1%20output1.png)
```
CREATE OR REPLACE TRIGGER trg_student8_before_insert
BEFORE INSERT ON student8
FOR EACH ROW
BEGIN

    -- Validate Student8 ID
    IF :NEW.student8_id <= 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Student8 ID must be greater than 0.'
        );
    END IF;

    -- Validate Student8 Name
    IF :NEW.student8_name IS NULL THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Student8 Name cannot be NULL.'
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

INSERT INTO student8
VALUES (101, 'Ravi', 'CSE', 85);

COMMIT;
INSERT INTO student8
VALUES (102, 'Sita', 'ECE', 120);
INSERT INTO student8
VALUES (-103, 'Kiran', 'EEE', 75);

SELECT * FROM student8;
```
![exp-9 program1 output2](./exp-9%20program1%20output2.png)
