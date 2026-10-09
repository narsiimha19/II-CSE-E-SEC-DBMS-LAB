SET SERVEROUTPUT ON;

-- Create DOCTOR table
CREATE TABLE DOCTOR
(
    DOCTOR_ID NUMBER(4) PRIMARY KEY,
    DOCTOR_NAME VARCHAR2(30),
    SPECIALIZATION VARCHAR2(30),
    EXPERIENCE NUMBER(2)
);

-- Insert sample doctor records
INSERT INTO DOCTOR VALUES (101, 'Dr. Kumar', 'Cardiology', 12);
INSERT INTO DOCTOR VALUES (102, 'Dr. Sharma', 'Neurology', 10);
INSERT INTO DOCTOR VALUES (103, 'Dr. Reddy', 'Orthopedics', 15);
INSERT INTO DOCTOR VALUES (104, 'Dr. Singh', 'Dermatology', 8);
INSERT INTO DOCTOR VALUES (105, 'Dr. Priya', 'Pediatrics', 7);

COMMIT;

-- REF CURSOR
DECLARE
    TYPE DOCTOR_CURSOR IS REF CURSOR;
    C_DOCTOR DOCTOR_CURSOR;

    V_DOCTOR_ID       DOCTOR.DOCTOR_ID%TYPE;
    V_DOCTOR_NAME     DOCTOR.DOCTOR_NAME%TYPE;
    V_SPECIALIZATION  DOCTOR.SPECIALIZATION%TYPE;
    V_EXPERIENCE      DOCTOR.EXPERIENCE%TYPE;

BEGIN
    -- Open REF CURSOR
    OPEN C_DOCTOR FOR
        SELECT DOCTOR_ID,
               DOCTOR_NAME,
               SPECIALIZATION,
               EXPERIENCE
        FROM DOCTOR;

    -- Fetch and display records
    LOOP
        FETCH C_DOCTOR
        INTO V_DOCTOR_ID,
             V_DOCTOR_NAME,
             V_SPECIALIZATION,
             V_EXPERIENCE;

        EXIT WHEN C_DOCTOR%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Doctor ID: ' || V_DOCTOR_ID ||
            '  Name: ' || V_DOCTOR_NAME ||
            '  Specialization: ' || V_SPECIALIZATION ||
            '  Experience: ' || V_EXPERIENCE || ' years'
        );
    END LOOP;

    -- Close REF CURSOR
    CLOSE C_DOCTOR;

    DBMS_OUTPUT.PUT_LINE('All doctor records displayed successfully.');

END;
/