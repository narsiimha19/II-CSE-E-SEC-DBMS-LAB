---6(A)
```
SELECT * FROM STUDENT1;
DESC STUDENT1;
INSERT INTO STUDENT1 VALUES (101, 'Ayesha', 'CSE', 85);
INSERT INTO STUDENT1 VALUES (102, 'Rahul', 'CSE', 55);
INSERT INTO STUDENT1 VALUES (103, 'Saniya', 'ECE', 72);
INSERT INTO STUDENT1 VALUES (104, 'Anjum', 'EEE', 48);
INSERT INTO STUDENT1 VALUES (105, 'Priya', 'CSE', 91);

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    v_id       STUDENT1.STUDENT_ID%TYPE := 101;
    v_name     STUDENT1.STUDENT_NAME%TYPE;
    v_marks    STUDENT1.MARKS%TYPE;
    v_grade    VARCHAR2(20);
    v_result   VARCHAR2(20);
    v_value    NUMBER;

BEGIN
    -- Retrieve student details
    SELECT STUDENT_NAME, MARKS
    INTO v_name, v_marks
    FROM STUDENT1
    WHERE STUDENT_ID = v_id;

    DBMS_OUTPUT.PUT_LINE('Student ID   : ' || v_id);
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Marks        : ' || v_marks);

    -- Nested IF
    IF v_marks >= 40 THEN
        IF v_marks >= 60 THEN
            v_result := 'PASS - FIRST CLASS';
        ELSE
            v_result := 'PASS';
        END IF;
    ELSE
        v_result := 'FAIL';
    END IF;

    DBMS_OUTPUT.PUT_LINE('Nested IF Result : ' || v_result);

    -- CASE Statement
    CASE
        WHEN v_marks >= 90 THEN
            DBMS_OUTPUT.PUT_LINE('CASE Statement : Outstanding');
        WHEN v_marks >= 75 THEN
            DBMS_OUTPUT.PUT_LINE('CASE Statement : Distinction');
        WHEN v_marks >= 60 THEN
            DBMS_OUTPUT.PUT_LINE('CASE Statement : First Class');
        WHEN v_marks >= 40 THEN
            DBMS_OUTPUT.PUT_LINE('CASE Statement : Pass');
        ELSE
            DBMS_OUTPUT.PUT_LINE('CASE Statement : Fail');
    END CASE;

    -- CASE Expression
    v_grade :=
        CASE
            WHEN v_marks >= 90 THEN 'A+'
            WHEN v_marks >= 75 THEN 'A'
            WHEN v_marks >= 60 THEN 'B'
            WHEN v_marks >= 40 THEN 'C'
            ELSE 'F'
        END;

    DBMS_OUTPUT.PUT_LINE('CASE Expression Grade : ' || v_grade);

    -- NULLIF
    v_value := NULLIF(v_marks, 85);

    IF v_value IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('NULLIF Result : NULL');
    ELSE
        DBMS_OUTPUT.PUT_LINE('NULLIF Result : ' || v_value);
    END IF;

    -- COALESCE
    DBMS_OUTPUT.PUT_LINE(
        'COALESCE Result : ' ||
        COALESCE(NULL, v_name, 'No Name')
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student record not found.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
```
![output](week6(outputs)/6A.png)

---6(B)
```
SELECT * FROM STUDENT1;

SET SERVEROUTPUT ON;

DECLARE
    -- Variables for loops
    counter NUMBER := 1;
    i NUMBER;
    j NUMBER;

    -- Student variables
    v_id STUDENT1.STUDENT_ID%TYPE := 101;
    v_name STUDENT1.STUDENT_NAME%TYPE;
    v_marks STUDENT1.MARKS%TYPE;

    -- Age variable
    v_age NUMBER := 20;

    -- User-defined exception
    invalid_marks EXCEPTION;

BEGIN

    -- =========================================
    -- 1. WHILE LOOP
    -- =========================================

    DBMS_OUTPUT.PUT_LINE('--------------------------------');
    DBMS_OUTPUT.PUT_LINE('Numbers using WHILE LOOP');
    DBMS_OUTPUT.PUT_LINE('--------------------------------');

    WHILE counter <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE(counter);
        counter := counter + 1;
    END LOOP;


    -- =========================================
    -- 2. NUMERIC FOR LOOP
    -- =========================================

    DBMS_OUTPUT.PUT_LINE('--------------------------------');
    DBMS_OUTPUT.PUT_LINE('Numbers using FOR LOOP');
    DBMS_OUTPUT.PUT_LINE('--------------------------------');

    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;


    -- =========================================
    -- 3. NESTED LOOPS
    -- =========================================

    DBMS_OUTPUT.PUT_LINE('--------------------------------');
    DBMS_OUTPUT.PUT_LINE('Multiplication Table 1 to 3');
    DBMS_OUTPUT.PUT_LINE('--------------------------------');

    FOR i IN 1..3 LOOP

        FOR j IN 1..3 LOOP

            DBMS_OUTPUT.PUT_LINE(
                i || ' x ' || j || ' = ' || (i * j)
            );

        END LOOP;

    END LOOP;


    -- =========================================
    -- 4. SELECT INTO
    -- =========================================

    DBMS_OUTPUT.PUT_LINE('--------------------------------');
    DBMS_OUTPUT.PUT_LINE('Student Details');
    DBMS_OUTPUT.PUT_LINE('--------------------------------');

    SELECT STUDENT_NAME, MARKS
    INTO v_name, v_marks
    FROM STUDENT1
    WHERE STUDENT_ID = v_id;

    DBMS_OUTPUT.PUT_LINE('Student ID   : ' || v_id);
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Marks        : ' || v_marks);


    -- =========================================
    -- 5. USER-DEFINED EXCEPTION
    -- =========================================

    IF v_marks > 100 THEN

        RAISE invalid_marks;

    END IF;

    DBMS_OUTPUT.PUT_LINE(
        'Marks validation successful.'
    );


    -- =========================================
    -- 6. RAISE_APPLICATION_ERROR
    -- =========================================

    IF v_age < 18 THEN

        RAISE_APPLICATION_ERROR(
            -20001,
            'Age should be 18 or above.'
        );

    END IF;

    DBMS_OUTPUT.PUT_LINE(
        'Age validation successful.'
    );


-- =========================================
-- EXCEPTION HANDLING
-- =========================================

EXCEPTION

    -- Built-in Exception
    WHEN NO_DATA_FOUND THEN

        DBMS_OUTPUT.PUT_LINE(
            'NO_DATA_FOUND: Student record not found.'
        );


    -- User-defined Exception
    WHEN invalid_marks THEN

        DBMS_OUTPUT.PUT_LINE(
            'User-defined Exception: Marks cannot be greater than 100.'
        );


    -- Other Exceptions
    WHEN OTHERS THEN

        DBMS_OUTPUT.PUT_LINE(
            'Error: ' || SQLERRM
        );

END;
/
```
![output](week6(outputs)/6B-1.png)
![output](week6(outputs)/6B-2.png)
