#AIM: To understand SQL injection attacks and implement appropriate countermeasures to identify and prevent SQL injection vulnerabilities in applications.
```
CREATE USER lab_user IDENTIFIED BY Lab123;
GRANT CREATE SESSION TO lab_user;
GRANT CREATE SESSION TO lab_user;
GRANT SELECT, INSERT ON STUDENT TO lab_user;
REVOKE INSERT ON STUDENT FROM lab_user;
CREATE ROLE student_role;
GRANT SELECT ON STUDENT TO student_role;
GRANT student_role TO lab_user;
SELECT * 
FROM USER_TAB_PRIVS;
```
![OUTPUT](op1-vir1.png)
![OUTPUT](op2-vir1.png)
![OUTPUT](op3-vir1.png)
![OUTPUT](op4-vir1.png)
![OUTPUT](op5-vir1.png)
![OUTPUT](op6-vir1.png)
![OUTPUT](op7-vir1.png)
![OUTPUT](op8-vir1.png)
![OUTPUT](op9-vir1.png)
