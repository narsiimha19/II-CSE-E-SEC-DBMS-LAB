SET SERVEROUTPUT ON;

DECLARE
    v_student_id   STUDENT.STUDENT_ID%TYPE;
    v_student_name STUDENT.STUDENT_NAME%TYPE;
    v_course       STUDENT.COURSE%TYPE;
    v_marks        STUDENT.MARKS%TYPE;
BEGIN
    -- Accept Student ID from the user
    v_student_id := &student_id;

    -- Retrieve student details
    SELECT STUDENT_NAME, COURSE, MARKS
    INTO v_student_name, v_course, v_marks
    FROM STUDENT
    WHERE STUDENT_ID = v_student_id;

    -- Display student details
    DBMS_OUTPUT.PUT_LINE('Student Information');
    DBMS_OUTPUT.PUT_LINE('-------------------');
    DBMS_OUTPUT.PUT_LINE('Student ID   : ' || v_student_id);
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || v_student_name);
    DBMS_OUTPUT.PUT_LINE('Course       : ' || v_course);
    DBMS_OUTPUT.PUT_LINE('Marks        : ' || v_marks);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'No student found with Student ID: ' || v_student_id
        );

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
