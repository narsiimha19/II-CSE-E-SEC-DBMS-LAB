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