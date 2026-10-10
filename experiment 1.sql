CREATE TABLE student (
    name VARCHAR2(30),
    student_number NUMBER,
    class NUMBER,
    major VARCHAR2(20)
);
INSERT INTO student
VALUES ('Johnson', 12, 1, 'CSE');

INSERT INTO student
VALUES ('Williams', 25, 2, 'CSE');

INSERT INTO student
VALUES ('Davis', 31, 3, 'ECE');

INSERT INTO student
VALUES ('Miller', 42, 2, 'EEE');

INSERT INTO student
VALUES ('Wilson', 56, 1, 'CSE');

INSERT INTO student
VALUES ('Taylor', 63, 3, 'MECH');

INSERT INTO student
VALUES ('Anderson', 74, 2, 'CSE');

INSERT INTO student
VALUES ('Thomas', 81, 1, 'ECE');

INSERT INTO student
VALUES ('Jackson', 95, 3, 'CSE');

INSERT INTO student
VALUES ('Martin', 108, 2, 'EEE');
DESC student;
DROP TABLE student;
