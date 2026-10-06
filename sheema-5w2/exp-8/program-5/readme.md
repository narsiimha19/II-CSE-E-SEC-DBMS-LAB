SET SERVEROUTPUT ON;

-- Create PRODUCT table
CREATE TABLE PRODUCT
(
    PRODUCT_ID NUMBER(4) PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(30),
    PRICE NUMBER(10,2),
    QUANTITY NUMBER(5)
);

-- Insert sample product records
INSERT INTO PRODUCT VALUES (101, 'Laptop', 50000, 10);
INSERT INTO PRODUCT VALUES (102, 'Mobile Phone', 20000, 25);
INSERT INTO PRODUCT VALUES (103, 'Headphones', 2000, 40);
INSERT INTO PRODUCT VALUES (104, 'Keyboard', 1500, 30);
INSERT INTO PRODUCT VALUES (105, 'Mouse', 800, 50);

COMMIT;

-- FOR UPDATE Cursor
DECLARE
    CURSOR C_PRODUCT IS
        SELECT PRODUCT_ID,
               PRODUCT_NAME,
               PRICE,
               QUANTITY
        FROM PRODUCT
        FOR UPDATE;

BEGIN
    FOR REC IN C_PRODUCT LOOP

        -- Increase product price by 5%
        UPDATE PRODUCT
        SET PRICE = PRICE * 1.05
        WHERE CURRENT OF C_PRODUCT;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Product price increased by 5% for all products.');
    DBMS_OUTPUT.PUT_LINE('Records updated successfully.');

END;
/
![output 1](op23.png)
-- Display updated PRODUCT table
SELECT PRODUCT_ID,
       PRODUCT_NAME,
       PRICE,
       QUANTITY
FROM PRODUCT;
![output 2](op24.png)
