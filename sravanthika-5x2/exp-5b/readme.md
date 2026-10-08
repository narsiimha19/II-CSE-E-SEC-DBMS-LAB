##
```
TRUNCATE table student;
```
## DESCRIBE STUDENT TABLE
```
DESC student;
```
![output](exp-5b output1)



##DISPLAY STUDENT TABLE
```
SELECT * FROM student;
```
![output](exp-5b output2)



## PL/SQL CODE
```
SET SERVEROUTPUT ON;

BEGIN

    INSERT INTO student
    VALUES (116, 'Harish', 'CSE', 82);


    INSERT INTO student
    VALUES (117, 'Lakshmi', 'ECE', 90);

    SAVEPOINT SP1;

    INSERT INTO student
    VALUES (118, 'Naveen', 'IT', 75);


    DBMS_OUTPUT.PUT_LINE('All three student records have been inserted.');


    ROLLBACK TO SP1;

    DBMS_OUTPUT.PUT_LINE('Rollback to savepoint SP1 has been completed.');

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Transaction has been committed successfully.');

EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM );
END;
```
![output](exp-5b output3)


## 
```
SELECT * FROM student;
```
![output](exp-5b output4)
