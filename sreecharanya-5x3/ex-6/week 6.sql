SET SERVEROUTPUT ON;

DECLARE
    v_student_name STUDENT.STUDENT_NAME%TYPE;
    v_marks        STUDENT.MARKS%TYPE;
    v_grade        VARCHAR2(10);
    v_nullif       NUMBER;
    v_coalesce     VARCHAR2(50);
BEGIN
    -- Get student details
    SELECT STUDENT_NAME, MARKS
    INTO v_student_name, v_marks
    FROM STUDENT
    WHERE STUDENT_ID = 101;

    DBMS_OUTPUT.PUT_LINE('Student Name : ' || v_student_name);
    DBMS_OUTPUT.PUT_LINE('Marks        : ' || v_marks);

    -- 1. NESTED IF
    IF v_marks >= 40 THEN
        DBMS_OUTPUT.PUT_LINE('Result       : PASS');

        IF v_marks >= 75 THEN
            DBMS_OUTPUT.PUT_LINE('Class        : Distinction');
        ELSIF v_marks >= 60 THEN
            DBMS_OUTPUT.PUT_LINE('Class        : First Class');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Class        : Second Class');
        END IF;

    ELSE
        DBMS_OUTPUT.PUT_LINE('Result       : FAIL');
    END IF;


    -- 2. CASE STATEMENT
    CASE
        WHEN v_marks >= 90 THEN
            DBMS_OUTPUT.PUT_LINE('CASE Grade   : A+');
        WHEN v_marks >= 75 THEN
            DBMS_OUTPUT.PUT_LINE('CASE Grade   : A');
        WHEN v_marks >= 60 THEN
            DBMS_OUTPUT.PUT_LINE('CASE Grade   : B');
        WHEN v_marks >= 40 THEN
            DBMS_OUTPUT.PUT_LINE('CASE Grade   : C');
        ELSE
            DBMS_OUTPUT.PUT_LINE('CASE Grade   : F');
    END CASE;


    -- 3. CASE EXPRESSION
    v_grade :=
        CASE
            WHEN v_marks >= 90 THEN 'A+'
            WHEN v_marks >= 75 THEN 'A'
            WHEN v_marks >= 60 THEN 'B'
            WHEN v_marks >= 40 THEN 'C'
            ELSE 'F'
        END;

    DBMS_OUTPUT.PUT_LINE('CASE Expression Grade : ' || v_grade);


    -- 4. NULLIF FUNCTION
    v_nullif := NULLIF(80, 80);

    IF v_nullif IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('NULLIF Result : NULL');
    ELSE
        DBMS_OUTPUT.PUT_LINE('NULLIF Result : ' || v_nullif);
    END IF;


    -- 5. COALESCE FUNCTION
    v_coalesce := COALESCE(NULL, NULL, 'Oracle', 'Database');

    DBMS_OUTPUT.PUT_LINE('COALESCE Result : ' || v_coalesce);


EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Student record not found.');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Error: More than one student record found.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

SET SERVEROUTPUT ON;

DECLARE
    -- Variables
    v_student_id   STUDENT.STUDENT_ID%TYPE := 101;
    v_student_name STUDENT.STUDENT_NAME%TYPE;
    v_course       STUDENT.COURSE%TYPE;
    v_marks        STUDENT.MARKS%TYPE;
    
    v_age NUMBER := 20;
    
    -- User-defined exception
    invalid_marks EXCEPTION;
    
    i NUMBER := 1;

BEGIN

    -- 1. WHILE LOOP
    DBMS_OUTPUT.PUT_LINE('--- WHILE LOOP ---');

    WHILE i <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE('Number: ' || i);
        i := i + 1;
    END LOOP;


    -- 2. NUMERIC FOR LOOP
    DBMS_OUTPUT.PUT_LINE('--- NUMERIC FOR LOOP ---');

    FOR j IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Number: ' || j);
    END LOOP;


    -- 3. NESTED FOR LOOP
    DBMS_OUTPUT.PUT_LINE('--- NESTED LOOP ---');

    FOR x IN 1..3 LOOP
        FOR y IN 1..3 LOOP
            DBMS_OUTPUT.PUT_LINE(
                x || ' x ' || y || ' = ' || (x * y)
            );
        END LOOP;
    END LOOP;


    -- 4. SELECT INTO
    DBMS_OUTPUT.PUT_LINE('--- STUDENT DETAILS ---');

    SELECT STUDENT_NAME, COURSE, MARKS
    INTO v_student_name, v_course, v_marks
    FROM STUDENT
    WHERE STUDENT_ID = v_student_id;

    DBMS_OUTPUT.PUT_LINE('Student ID   : ' || v_student_id);
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || v_student_name);
    DBMS_OUTPUT.PUT_LINE('Course       : ' || v_course);
    DBMS_OUTPUT.PUT_LINE('Marks        : ' || v_marks);


    -- 5. USER-DEFINED EXCEPTION
    IF v_marks > 100 THEN
        RAISE invalid_marks;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Marks are valid.');
    END IF;


    -- 6. RAISE_APPLICATION_ERROR
    IF v_age < 18 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Age should be 18 or above.'
        );
    ELSE
        DBMS_OUTPUT.PUT_LINE('Age is valid: ' || v_age);
    END IF;


EXCEPTION

    -- Built-in exception
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: Student record not found.'
        );

    -- Built-in exception
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: More than one student record found.'
        );

    -- User-defined exception
    WHEN invalid_marks THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: Marks cannot be greater than 100.'
        );

    -- Other errors
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: ' || SQLERRM
        );

END;
/