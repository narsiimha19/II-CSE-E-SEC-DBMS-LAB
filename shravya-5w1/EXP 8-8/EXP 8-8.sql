SET SERVEROUTPUT ON;

-- Create ORDERS table
CREATE TABLE ORDERS
(
    ORDER_ID NUMBER(4) PRIMARY KEY,
    CUSTOMER_NAME VARCHAR2(30),
    PRODUCT_NAME VARCHAR2(30),
    QUANTITY NUMBER(4),
    TOTAL_AMOUNT NUMBER(10,2)
);

-- Insert sample order records
INSERT INTO ORDERS VALUES (101, 'Rahul', 'Laptop', 1, 55000);
INSERT INTO ORDERS VALUES (102, 'Sneha', 'Mobile Phone', 2, 40000);
INSERT INTO ORDERS VALUES (103, 'Arjun', 'Headphones', 3, 6000);
INSERT INTO ORDERS VALUES (104, 'Priya', 'Keyboard', 1, 1500);
INSERT INTO ORDERS VALUES (105, 'Kiran', 'Smart Watch', 2, 10000);

COMMIT;

-- REF CURSOR
DECLARE
    TYPE ORDER_CURSOR IS REF CURSOR;
    C_ORDER ORDER_CURSOR;

    V_ORDER_ID      ORDERS.ORDER_ID%TYPE;
    V_CUSTOMER_NAME ORDERS.CUSTOMER_NAME%TYPE;
    V_PRODUCT_NAME  ORDERS.PRODUCT_NAME%TYPE;
    V_QUANTITY      ORDERS.QUANTITY%TYPE;
    V_TOTAL_AMOUNT  ORDERS.TOTAL_AMOUNT%TYPE;

BEGIN
    -- Open REF CURSOR
    OPEN C_ORDER FOR
        SELECT ORDER_ID,
               CUSTOMER_NAME,
               PRODUCT_NAME,
               QUANTITY,
               TOTAL_AMOUNT
        FROM ORDERS;

    -- Fetch and display records
    LOOP
        FETCH C_ORDER
        INTO V_ORDER_ID,
             V_CUSTOMER_NAME,
             V_PRODUCT_NAME,
             V_QUANTITY,
             V_TOTAL_AMOUNT;

        EXIT WHEN C_ORDER%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Order ID: ' || V_ORDER_ID ||
            '  Customer: ' || V_CUSTOMER_NAME ||
            '  Product: ' || V_PRODUCT_NAME ||
            '  Quantity: ' || V_QUANTITY ||
            '  Total Amount: ' || V_TOTAL_AMOUNT
        );
    END LOOP;

    -- Close REF CURSOR
    CLOSE C_ORDER;

    DBMS_OUTPUT.PUT_LINE('All order records displayed successfully.');

END;
/