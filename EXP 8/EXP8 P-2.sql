SET SERVEROUTPUT ON;

-- Create PATIENT table

CREATE TABLE PATIENT
(
    PATIENT_ID NUMBER(4) PRIMARY KEY,
    PATIENT_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(30),
    DOCTOR_NAME VARCHAR2(30)
);

-- Insert sample records

INSERT INTO PATIENT VALUES (101, 'Rahul', 'Cardiology', 'Dr. Kumar');
INSERT INTO PATIENT VALUES (102, 'Sneha', 'Neurology', 'Dr. Sharma');
INSERT INTO PATIENT VALUES (103, 'Arjun', 'Cardiology', 'Dr. Reddy');
INSERT INTO PATIENT VALUES (104, 'Priya', 'Orthopedics', 'Dr. Singh');
INSERT INTO PATIENT VALUES (105, 'Kiran', 'Cardiology', 'Dr. Kumar');

COMMIT;

-- Parameterized Cursor

DECLARE

    CURSOR C_PATIENT(P_DEPARTMENT VARCHAR2) IS
        SELECT PATIENT_ID,
               PATIENT_NAME,
               DEPARTMENT,
               DOCTOR_NAME
        FROM PATIENT
        WHERE DEPARTMENT = P_DEPARTMENT;

BEGIN

    DBMS_OUTPUT.PUT_LINE('Patients in Cardiology Department');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');

    FOR REC IN C_PATIENT('Cardiology') LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Patient ID: ' || REC.PATIENT_ID ||
            '  Patient Name: ' || REC.PATIENT_NAME ||
            '  Department: ' || REC.DEPARTMENT ||
            '  Doctor: ' || REC.DOCTOR_NAME
        );

    END LOOP;

END;
/