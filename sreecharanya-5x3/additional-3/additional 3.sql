SET SERVEROUTPUT ON;

DECLARE
    CURSOR emp_cursor(p_department VARCHAR2) IS
        SELECT EMP_ID, EMP_NAME, DEPARTMENT, SALARY
        FROM EMPLOYEE
        WHERE UPPER(DEPARTMENT) = UPPER(p_department);

    v_count NUMBER := 0;

BEGIN
    FOR emp_rec IN emp_cursor('&department') LOOP

        v_count := v_count + 1;

        DBMS_OUTPUT.PUT_LINE('Employee ID   : ' || emp_rec.EMP_ID);
        DBMS_OUTPUT.PUT_LINE('Employee Name : ' || emp_rec.EMP_NAME);
        DBMS_OUTPUT.PUT_LINE('Department    : ' || emp_rec.DEPARTMENT);
        DBMS_OUTPUT.PUT_LINE('Salary        : ' || emp_rec.SALARY);
        DBMS_OUTPUT.PUT_LINE('-----------------------------');

    END LOOP;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE(
            'No employees found in the specified department.'
        );
    END IF;

END;
/