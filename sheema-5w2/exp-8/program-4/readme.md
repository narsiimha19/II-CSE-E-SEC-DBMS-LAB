SET SERVEROUTPUT ON;

-- Create BOOK table
CREATE TABLE BOOK
(
    BOOK_ID NUMBER(4) PRIMARY KEY,
    BOOK_TITLE VARCHAR2(50),
    AUTHOR VARCHAR2(30),
    AVAILABLE_COPIES NUMBER(4)
);

-- Insert sample book records
INSERT INTO BOOK VALUES (101, 'Database Management System', 'Korth', 10);
INSERT INTO BOOK VALUES (102, 'Operating System', 'Galvin', 8);
INSERT INTO BOOK VALUES (103, 'Computer Networks', 'Tanenbaum', 12);
INSERT INTO BOOK VALUES (104, 'Python Programming', 'Guido', 15);
INSERT INTO BOOK VALUES (105, 'Artificial Intelligence', 'Russell', 7);

COMMIT;

-- FOR UPDATE Cursor
DECLARE
    CURSOR C_BOOK IS
        SELECT BOOK_ID,
               BOOK_TITLE,
               AUTHOR,
               AVAILABLE_COPIES
        FROM BOOK
        FOR UPDATE;

BEGIN
    FOR REC IN C_BOOK LOOP

        -- Increase available copies by 5
        UPDATE BOOK
        SET AVAILABLE_COPIES = AVAILABLE_COPIES + 5
        WHERE CURRENT OF C_BOOK;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Available copies increased by 5 for all books.');
    DBMS_OUTPUT.PUT_LINE('Records updated successfully.');

END;
/
![output 1](op21.png)
-- Display updated BOOK table
SELECT BOOK_ID,
       BOOK_TITLE,
       AUTHOR,
       AVAILABLE_COPIES
FROM BOOK;
![output 2](op22.png)
