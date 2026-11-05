
# Exercise2

THE STUDENTS TABLE
CREATE CATALOG IF NOT EXISTS exercise2;
CREATE SCHEMA IF NOT EXISTS exercise2.KPM;
CREATE OR REPLACE TABLE exercise2.KPM.students(student_id INT,name STRING,age INT,department STRING);
INSERT INTO TABLE exercise2.KPM.students VALUES
(1,'Alice',20,'IT'),
(2,'Bob',22,'HR'),
(3,'Charlie',21,'IT'),
(4,'Diana',23,'FINANCE'),
(5,'Eve',22,'HR');


SELECT distinct department 
FROM exercise2.KPM.students;

SELECT department,
     AVG(age) as avg_age
FROM exercise2.KPM.students
GROUP BY department;

SELECT department,
      COUNT(*) AS student_count
FROM exercise2.KPM.students
GROUP BY department
HAVING COUNT(*)>1;

SELECT student_id,
      name,
      age,
      department
FROM exercise2.KPM.students
WHERE age BETWEEN 21 AND 23;

SELECT student_id,
      name,
      age,
      department
FROM exercise2.KPM.students
WHERE department IN ('IT','HR')
AND age>21;

THE CREATE CATALOG IF NOT EXISTS exercise2;
CREATE SCHEMA IF NOT EXISTS exercise2.KPM;
CREATE TABLE IF NOT EXISTS exercise2.KPM.courses(course_id INT,course_name STRING,department STRING, credits INT);
INSERT INTO TABLE exercise2.KPM.courses VALUES
(101,'SQL Basics','IT',3),
(102,'Python','IT',4),
(103,'Data Science','IT',4),
(104,'Excel','FINANCE',2),
(105,'Statistics','HR',3);


SELECT department,
       SUM(credits) AS total_credits
FROM exercise2.KPM.courses
GROUP BY department
HAVING SUM(credits) > 5;

SELECT course_id,
       course_name,
       department,
       credits
FROM exercise2.KPM.courses
WHERE credits<>4;

SELECT course_id,
      course_name,
      department,
      credits
FROM exercise2.KPM.courses
ORDER BY credits DESC
LIMIT 3;COURSES TABLE

CREATE CATALOG IF NOT EXISTS exercise2;
CREATE SCHEMA IF NOT EXISTS exercise2.KPM;
CREATE TABLE IF NOT EXISTS exercise2.KPM.enrollments(enrollment_id INT,student_id INT,course_id INT,grade INT);
INSERT INTO TABLE exercise2.KPM.enrollments VALUES
(1,1,101,85),
(2,2,102,78),
(3,3,103,90),
(4,4,104,88),
(5,5,105,82);

SELECT MAX(grade) AS max_grade,
       MIN(grade) AS min_grade,
       AVG(grade) AS avg_grade
FROM exercise2.KPM.enrollments;

SELECT course_id,
       COUNT(*) AS enrollment_count
FROM exercise2.KPM.enrollments
GROUP BY course_id;

CREATE CATALOG IF NOT EXISTS exercise2;
CREATE SCHEMA IF NOT EXISTS exercise2.KPM;
CREATE TABLE IF NOT EXISTS exercise2.KPM.salaries(employee_id INT,name STRING,department STRING,salary INT);
INSERT INTO TABLE exercise2.KPM.salaries VALUES
(1,'Tom','IT',60000),
(2,'Jerry','HR',55000),
(3,'Spike','FINANCE',70000),
(4,'Tyke','IT',62000),
(5,'Butch','HR',5400);

SELECT department,
       SUM(salary) AS total_salary,
       SUM(bonus) AS total_bonus
FROM exercise2.KPM.salaries
GROUP BY department;
-- DROP TABLE exercise2.KPM.salaries;
CREATE TABLE IF NOT EXISTS exercise2.KPM.salaries(employee_id INT,name STRING,department STRING, salary INT,bonus INT);
INSERT INTO TABLE exercise2.KPM.salaries VALUES
(1,'Tom','IT',60000,5000),
(2,'Jerry','HR',55000,4000),
(3,'Spike','FINANCE',70000,6000),
(4,'Tyke','IT',62000,5500),
(5,'Butch','HR',5400,3500);

SELECT department,
       SUM(salary) AS total_salary,
       SUM(bonus) AS total_bonus
FROM exercise2.KPM.salaries
GROUP BY department;

SELECT department,
       AVG(salary) AS avg_salary
FROM exercise2.KPM.salaries
GROUP BY department
HAVING AVG(salary) > 55000;

SELECT employee_id,
       name,
       salary,
       bonus,
       (salary + bonus) AS total_compensation
FROM exercise2.KPM.salaries
WHERE (salary + bonus) > 60000;

CREATE CATALOG IF NOT EXISTS exercise2;
CREATE SCHEMA IF NOT EXISTS exercise2.KPM;
CREATE TABLE IF NOT EXISTS exercise2.KPM.projects(project_id INT,project_name STRING,department STRING, budget INT);
INSERT INTO TABLE exercise2.KPM.projects VALUES
(1,'AI App','IT',120000),
(2,'Payroll System','Finance',80000),
(3,'Dashboard','IT',150000),
(4,'Website','Marketing',60000),
(5,'HR Portal','HR',50000);

SELECT department,
SUM(budget) AS total_budget,
AVG(budget) AS avg_budget
FROM exercise2.KPM.projects
GROUP BY department
HAVING AVG(budget) > 70000;

SELECT project_id,
project_name,
department,
budget
FROM exercise2.KPM.projects
WHERE budget BETWEEN 50000 AND 120000
  AND department <> 'Marketing';
