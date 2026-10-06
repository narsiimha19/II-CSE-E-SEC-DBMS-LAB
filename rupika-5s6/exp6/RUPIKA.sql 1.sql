6 experiment
 6a
 
 SET SERVEROUTPUT ON;

DECLARE
    v_name  VARCHAR2(30) := 'Ravi';
    v_marks NUMBER := 82;
    v_grade CHAR(1);
    v_result VARCHAR2(30);
    v_null NUMBER;
    v_value VARCHAR2(30);

BEGIN
    IF v_marks >= 40 THEN
        IF v_marks >= 75 THEN
            v_result := 'Distinction';
        ELSIF v_marks >= 60 THEN
            v_result := 'First Class';
        ELSE
            v_result := 'Pass';
        END IF;
    ELSE
        v_result := 'Fail';
    END IF;

    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks);
    DBMS_OUTPUT.PUT_LINE('Nested IF Result: ' || v_result);

    CASE
        WHEN v_marks >= 75 THEN
            DBMS_OUTPUT.PUT_LINE('CASE Statement: Grade A');
        WHEN v_marks >= 60 THEN
            DBMS_OUTPUT.PUT_LINE('CASE Statement: Grade B');
        WHEN v_marks >= 40 THEN
            DBMS_OUTPUT.PUT_LINE('CASE Statement: Grade C');
        ELSE
            DBMS_OUTPUT.PUT_LINE('CASE Statement: Fail');
    END CASE;

    v_grade := CASE
        WHEN v_marks >= 75 THEN 'A'
        WHEN v_marks >= 60 THEN 'B'
        WHEN v_marks >= 40 THEN 'C'
        ELSE 'F'
    END;

    DBMS_OUTPUT.PUT_LINE('CASE Expression Grade: ' || v_grade);

    v_null := NULLIF(80, 80);

    IF v_null IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('NULLIF Result: NULL');
    ELSE
        DBMS_OUTPUT.PUT_LINE('NULLIF Result: ' || v_null);
    END IF;

    v_value := COALESCE(NULL, NULL, 'Oracle', '100');

    DBMS_OUTPUT.PUT_LINE('COALESCE Result: ' || v_value);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

6b


SET SERVEROUTPUT ON;

DECLARE
    i NUMBER := 1;
    j NUMBER;

    v_student_id   NUMBER := 1;
    v_student_name VARCHAR2(50);
    v_marks        NUMBER;
    v_age          NUMBER := 20;

    e_invalid_marks EXCEPTION;

BEGIN

    DBMS_OUTPUT.PUT_LINE('WHILE LOOP:');

    WHILE i <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
        i := i + 1;
    END LOOP;


    
    DBMS_OUTPUT.PUT_LINE('NUMERIC FOR LOOP:');

    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;


    DBMS_OUTPUT.PUT_LINE('MULTIPLICATION TABLES:');

    FOR i IN 1..3 LOOP
        FOR j IN 1..3 LOOP
            DBMS_OUTPUT.PUT_LINE(
                i || ' x ' || j || ' = ' || (i * j)
            );
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('----------------');
    END LOOP;


    SELECT student_name, marks
    INTO v_student_name, v_marks
    FROM studentr
    WHERE student_id = v_student_id;

    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_student_name);
    DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks);



    IF v_marks > 100 THEN
        RAISE e_invalid_marks;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Marks are valid.');


    
    IF v_age < 18 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Age must be 18 or above.'
        );
    END IF;

    DBMS_OUTPUT.PUT_LINE('Age is valid.');

EXCEPTION

    
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: Student record not found.'
        );
    WHEN e_invalid_marks THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: Marks cannot be greater than 100.'
        );

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: ' || SQLERRM
        );

END;
/