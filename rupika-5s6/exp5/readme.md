

5 experiment
5a


CREATE TABLE STUDENTr (
    Student_id NUMBER(5),
    Student_name VARCHAR2(30),
    Course VARCHAR2(20),
    Marks NUMBER(3)
);

![output](<Screenshot (193).png>)

INSERT INTO STUDENTr VALUES (101, 'Ravi', 'BCA', 85);
INSERT INTO STUDENTr VALUES (102, 'Priya', 'BCA', 90);
INSERT INTO STUDENTr VALUES (103, 'Kiran', 'BCA', 78);
![output](<Screenshot (194).png>)

INSERT INTO STUDENTr VALUES (104, 'Anu', 'BCA', 88);
INSERT INTO STUDENTr VALUES (105, 'Rahul', 'BCA', 76);
INSERT INTO STUDENTr VALUES (106, 'Sneha', 'BCA', 92);
INSERT INTO STUDENTr VALUES (107, 'Arjun', 'BCA', 81);

![output](<Screenshot (195).png>)
INSERT INTO STUDENTr VALUES (108, 'Divya', 'BCA', 87);
INSERT INTO STUDENTr VALUES (109, 'Vijay', 'BCA', 74);
INSERT INTO STUDENTr VALUES (110, 'Pooja', 'BCA', 89);
INSERT INTO STUDENTr VALUES (111, 'Suresh', 'BCA', 80);
INSERT INTO STUDENTr VALUES (112, 'Kavya', 'BCA', 95);
INSERT INTO STUDENTr VALUES (113, 'Manoj', 'BCA', 72);
INSERT INTO STUDENTr VALUES (114, 'Swathi', 'BCA', 84);
INSERT INTO STUDENTr VALUES (115, 'Ramesh', 'BCA', 91);

COMMIT;
![output](<Screenshot (196).png>)
SELECT * FROM STUDENTr;

![output](<Screenshot (197)>png>)


5b

SET SERVEROUTPUT ON;

BEGIN
    INSERT INTO STUDENTr
    VALUES (116, 'Akhil', 'BCA', 86);
    INSERT INTO STUDENTr
    VALUES (117, 'Neha', 'BCA', 91);
    SAVEPOINT SP1;
    INSERT INTO STUDENTr
    VALUES (118, 'Varun', 'BCA', 79);

    DBMS_OUTPUT.PUT_LINE('Three records have been inserted.');
    ROLLBACK TO SP1;

    DBMS_OUTPUT.PUT_LINE('Rollback to SAVEPOINT SP1 completed.');
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Transaction committed successfully.');

EXCEPTION

    WHEN OTHERS THEN

        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END;
/
![output](<Screenshot (198).png>)
