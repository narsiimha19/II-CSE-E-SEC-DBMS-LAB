# EXPERIMENT-4

# Q1: Create DEPT table
```
CREATE TABLE DEPT
(
    DNO NUMBER,
    DNAME VARCHAR2(30)
);
```
<img width="1361" height="968" alt="q1" src="https://github.com/user-attachments/assets/5a3315d3-ee9d-4fe2-9291-12eee516ead7" />

# Q2: Apply Primary Key on DNO and NOT NULL on DNAME
```
ALTER TABLE DEPT
ADD CONSTRAINT DEPT_PK PRIMARY KEY (DNO);

ALTER TABLE DEPT
MODIFY DNAME NOT NULL;
```
![output b](outputs/2.png)

# Q3: Create STUDENT table
```
CREATE TABLE STUDENT
(
    SID NUMBER,
    SNAME VARCHAR2(30),
    DID NUMBER
);
```

<img width="1538" height="976" alt="q3" src="https://github.com/user-attachments/assets/83461932-1e5c-47c8-b389-4af9a903c4dc" />

# Q4: Apply Primary Key, NOT NULL and Foreign Key constraints
```
ALTER TABLE STUDENT
ADD CONSTRAINT STUDENT_PK PRIMARY KEY (SID);

ALTER TABLE STUDENT
MODIFY SNAME NOT NULL;

ALTER TABLE STUDENT
ADD CONSTRAINT STUDENT_FK
FOREIGN KEY (DID) REFERENCES DEPT(DNO);
```
![output d](outputs/4.png)

# Q5: Insert department details
```
INSERT INTO DEPT VALUES (10, 'CSE');
INSERT INTO DEPT VALUES (20, 'ME');
INSERT INTO DEPT VALUES (30, 'CE');
INSERT INTO DEPT VALUES (40, 'EEE');
INSERT INTO DEPT VALUES (50, 'ECE');
INSERT INTO DEPT VALUES (60, 'CSM');
INSERT INTO DEPT VALUES (70, 'CSD');

COMMIT;
```
<img width="1596" height="971" alt="q5" src="https://github.com/user-attachments/assets/d643cec3-057f-47bd-aa9d-3d7e4743a1bb" />

# Q6: Insert student details
```
INSERT INTO STUDENT VALUES (101, 'Rahul', 10);
INSERT INTO STUDENT VALUES (102, 'Sneha', 20);
INSERT INTO STUDENT VALUES (103, 'Arjun', 30);
INSERT INTO STUDENT VALUES (104, 'Kiran', 40);
INSERT INTO STUDENT VALUES (105, 'Priya', 50);
INSERT INTO STUDENT VALUES (106, 'Nikhil', 10);
INSERT INTO STUDENT VALUES (107, 'Anjali', 60);
INSERT INTO STUDENT VALUES (108, 'Ravi', 30);
INSERT INTO STUDENT VALUES (109, 'Ayesha', 70);
INSERT INTO STUDENT VALUES (110, 'Vijay', NULL);

COMMIT;
```
<img width="1442" height="977" alt="q6" src="https://github.com/user-attachments/assets/f94410f1-7ef4-4a26-b4ad-a16c9bf7cf29" />

# Q7: NATURAL JOIN Student and Dept
```
SELECT *
FROM STUDENT
NATURAL JOIN
(
    SELECT DNO AS DID, DNAME
    FROM DEPT
);

```
<img width="1531" height="975" alt="q7" src="https://github.com/user-attachments/assets/886bc5b8-3d6d-46de-90f0-f42d09968c3a" />


# Q8: EQUI JOIN Student and Dept
```
SELECT S.SID, S.SNAME, D.DNO, D.DNAME
FROM STUDENT S
INNER JOIN DEPT D
ON S.DID = D.DNO;
```
<img width="1522" height="967" alt="q8" src="https://github.com/user-attachments/assets/f9acfda4-3dc8-4cec-a5e1-6e1a935a133f" />

# Q9: CONDITIONAL JOIN Student and Dept
```
SELECT S.SID, S.SNAME, D.DNO, D.DNAME
FROM STUDENT S
JOIN DEPT D
ON S.DID > D.DNO;
```
<img width="1471" height="977" alt="q9" src="https://github.com/user-attachments/assets/cf756742-c4bb-4aa0-baa8-efb516323606" />


# Q10: LEFT OUTER NATURAL JOIN Student and Dept
```
SELECT S.SID, S.SNAME, S.DID, D.DNAME
FROM STUDENT S
LEFT OUTER JOIN
(
    SELECT DNO AS DID, DNAME
    FROM DEPT
) D
ON S.DID = D.DID;
```
<img width="1521" height="978" alt="q10" src="https://github.com/user-attachments/assets/01212e43-791a-43bc-9afe-6db9b343c927" />

# Q11: RIGHT OUTER NATURAL JOIN Student and Dept
```
SELECT S.SID, S.SNAME, S.DID, D.DNAME
FROM STUDENT S
RIGHT OUTER JOIN
(
    SELECT DNO AS DID, DNAME
    FROM DEPT
) D
ON S.DID = D.DID;
```
<img width="1566" height="976" alt="q11" src="https://github.com/user-attachments/assets/a40c72f6-908c-436e-9186-8e5542bb84d4" />

# Q12: FULL OUTER NATURAL JOIN Student and Dept
```
SELECT S.SID, S.SNAME, S.DID, D.DNAME
FROM STUDENT S
FULL OUTER JOIN
(
    SELECT DNO AS DID, DNAME
    FROM DEPT
) D
ON S.DID = D.DID;

```
<img width="1465" height="990" alt="q12" src="https://github.com/user-attachments/assets/1351a3d9-76db-43f4-b33f-d34583b40e49" />

# Q13: LEFT OUTER EQUI JOIN Student and Dept
```
SELECT S.SID, S.SNAME, D.DNO, D.DNAME
FROM STUDENT S
LEFT OUTER JOIN DEPT D
ON S.DID = D.DNO;
```
<img width="1392" height="978" alt="q13" src="https://github.com/user-attachments/assets/335c1ba4-a791-4b6b-a6f3-8197a92c8335" />

# Q14: RIGHT OUTER EQUI JOIN Student and Dept
```
SELECT S.SID, S.SNAME, D.DNO, D.DNAME
FROM STUDENT S
RIGHT OUTER JOIN DEPT D
ON S.DID = D.DNO;
```
<img width="1566" height="976" alt="q14" src="https://github.com/user-attachments/assets/b841741f-c657-4db6-862d-c2ed0c1e2ae5" />

# Q15: FULL OUTER EQUI JOIN Student and Dept
```
SELECT S.SID, S.SNAME, D.DNO, D.DNAME
FROM STUDENT S
FULL OUTER JOIN DEPT D
ON S.DID = D.DNO;
```
<img width="1465" height="990" alt="q15" src="https://github.com/user-attachments/assets/aefcc1d2-58ea-4ae1-b09c-922c57a6191f" />

# Q16: LEFT OUTER CONDITIONAL JOIN Student and Dept
```
SELECT S.SID, S.SNAME, D.DNO, D.DNAME
FROM STUDENT S
LEFT OUTER JOIN DEPT D
ON S.DID > D.DNO;
```
<img width="1301" height="980" alt="q16" src="https://github.com/user-attachments/assets/fac0324e-027f-4d92-ba59-95826978ece1" />


# Q17: RIGHT OUTER CONDITIONAL JOIN Student and Dept
```
SELECT S.SID, S.SNAME, D.DNO, D.DNAME
FROM STUDENT S
RIGHT OUTER JOIN DEPT D
ON S.DID > D.DNO;
```
<img width="1431" height="982" alt="q17" src="https://github.com/user-attachments/assets/36d5e2d6-88ee-4627-952f-acad5d585490" />

# Q18: FULL OUTER CONDITIONAL JOIN Student and Dept
```
SELECT S.SID, S.SNAME, D.DNO, D.DNAME
FROM STUDENT S
FULL OUTER JOIN DEPT D
ON S.DID > D.DNO;
```
<img width="1465" height="990" alt="q18" src="https://github.com/user-attachments/assets/c6428f47-c0fc-427f-8707-bdfb9d1d2812" />


# Q19: CROSS JOIN Student and Dept
```
SELECT S.SID, S.SNAME, D.DNO, D.DNAME
FROM STUDENT S
CROSS JOIN DEPT D;
```
<img width="1420" height="978" alt="q19" src="https://github.com/user-attachments/assets/660ad7de-31bd-4b84-af14-14ac410faeee" />
