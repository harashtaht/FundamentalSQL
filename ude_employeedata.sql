## L66 : SELECT.. FROM..

show databases;

use employees;

show tables;

SELECT 
    *
FROM
    employees;

SELECT 
    first_name, last_name
FROM
    employees;

-- Exercise

select * from departments;

SELECT dept_name FROM departments;


## L70: WHERE
SELECT * from employees WHERE first_name= 'Denis'; #232

#- Exercise
SELECT * FROM employees WHERE first_name= "Elvis"; #246

## L71: 'AND'

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';
    
-- Ex 71

SELECT *
FROM employees
WHERE first_name= 'Kellie' AND gender= 'F'; 

## L75: 'OR'

SELECT *
FROM employees
WHERE gender = 'M' AND (first_name = 'Denis' OR first_name= 'Elvis');
    
-- Ex 75
SELECT *
FROM employees
WHERE first_name = 'Kellie' OR first_name = 'Aruna';


## L78: Operator Precedence
SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis'
        AND (gender = 'M' OR gender = 'F');

SELECT * 
FROM EMPLOYEES
WHERE gender = 'F' AND
(first_name= 'Kellie' OR first_name= ' Aruna');


## L81: IN - NOT IN

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');
    


SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');


-- Ex 82

SELECT 
    *
FROM
    employees
WHERE
    first_name  IN ('Denis' , 'Elvis');


SELECT 
    *
FROM
    employees
WHERE
    first_name  NOT IN ('John' , 'Mark', 'Jacob');
    
## Lesson 86: LIKE - NOT LIKE

SELECT * FROM employees WHERE first_name LIKE ('Mar%');

SELECT * FROM employees WHERE first_name LIKE ('%ar%'); #name with 'ar' in between other strings

SELECT * FROM employees WHERE first_name LIKE ('ar%'); #ends with 'ar'

SELECT * FROM employees WHERE first_name LIKE ('Mar_'); #4 digits

SELECT * FROM employees WHERE first_name NOT LIKE ('Mar%');

-- SQL is not Case Sensitive

-- Exercise 

SELECT *
FROM employees
WHERE first_name LIKE ('Mark%');

SELECT *
FROM employees
WHERE hire_date LIKE ('2000%');

SELECT *
FROM employees
WHERE emp_no LIKE ('1____');


## L89: Wildcard Characters

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%');
    


SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%');
    
## L92: BETWEEN AND 

SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-01';

SELECT *
FROM employees
WHERE hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';

-- Exercise

SELECT * FROM salaries;

SELECT *
FROM salaries
WHERE salary BETWEEN '66000' AND '70000';

SELECT *
FROM salaries
WHERE salary BETWEEN 66000 AND 70000;

SELECT *
FROM employees
WHERE emp_no NOT BETWEEN '10004' AND '10012';


select * from departments;

SELECT *
FROM departments
WHERE dept_no BETWEEN 'd003' AND 'd006';

### L97: IS NOT NULL - IS NULL

SELECT *
FROM employees
WHERE first_name IS NOT NULL;

SELECT *
FROM employees
WHERE first_name IS NOT NULL;

-- Exercise

SELECT *
FROM departments
WHERE dept_no IS NOT NULL;


### L98: Other Comparison Operators

/* 
Not Equal -> '!=' , '<>'


*/

SELECT *
FROM employees
WHERE first_name <> 'Mark';

SELECT *
FROM employees
WHERE first_name != 'Mark';

SELECT *
FROM employees
WHERE hire_date > '2000-01-01';

SELECT *
FROM employees
WHERE hire_date >= '2000-01-01';

SELECT *
FROM employees
WHERE hire_date <= '1985-02-01';

-- Exercise 

SELECT *
FROM employees
WHERE gender = 'F' 
AND hire_date > '2000-01-01';

select *
from salaries
where salary> 150000;

### L101: SELECT DISTINCT

SELECT gender FROM employees;

SELECT DISTINCT gender FROM employees; ##similar to unique

-- Exercise 102

SELECT DISTINCT hire_date FROM employees;


### L104: Aggregate Functions

SELECT COUNT(*) 
FROM employees;

SELECT COUNT(emp_no)
FROM employees;

SELECT COUNT(*) 
FROM employees
WHERE first_name LIKE ('Mar%');

SELECT COUNT(DISTINCT first_name)
FROM employees;

-- Exercise 105

select count(*) from salaries;

select count(*)
FROM salaries
WHERE salary >= '100000';

select count(*)
from dept_manager;

select * from dept_manager;


## L107: ORDER BY

SELECT *
FROM employees
ORDER BY first_name;

SELECT *
FROM employees
ORDER BY first_name DESC;

SELECT *
FROM employees
ORDER BY emp_no DESC;

SELECT *
FROM employees
ORDER BY first_name, last_name ASC;

-- Exercise

SELECT *
FROM employees
ORDER BY hire_date DESC;

### L110: GROUP BY

SELECT 
    first_name
FROM
    employees
GROUP BY first_name;

SELECT DISTINCT first_name
FROM employees;

SELECT first_name, COUNT(
    first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;


### L111: Using Aliases (AS)

SELECT 
first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

-- Exercise

select * from salaries LIMIT 10000;

SELECT salary, count(emp_no) AS emps_with_same_salary
FROM salaries
WHERE salary > 80000
GROUP BY salary
ORDER BY emps_with_same_salary DESC;

SELECT salary, count(emp_no) AS emps_with_same_salary
FROM salaries
WHERE salary > 80000
GROUP BY salary
ORDER BY salary;


SELECT DISTINCT salary
FROM salaries;

### L114: HAVING

SELECT *
FROM employees
WHERE hire_date >= '2000-01-01';

SELECT *
FROM employees
HAVING hire_date >= '2000-01-01';

SELECT first_name, COUNT(first_name) AS names_count
FROM employees
GROUP BY first_name
HAVING names_count>250
-- ORDER BY first_name;
ORDER BY names_count DESC;

-- Exercise

select * from employees;

-- Answer
SELECT 
    emp_no, AVG(salary) as avg_salary
FROM
    salaries
GROUP BY
	emp_no
HAVING
	avg_salary >120000
ORDER BY
	emp_no;

-- Query1

-- SELECT *, AVG(salary)
-- FROM salaries
-- -- WHERE salary>12000
-- GROUP BY emp_no
-- HAVING salary>12000
-- ORDER by emp_no;

-- Query 2
-- SELECT
--     *, AVG(salary)
-- FROM
--     salaries
-- GROUP BY emp_no
-- HAVING AVG(salary) > 120000;


### L117: WHERE vs HAVING

SELECT first_name, COUNT(first_name) AS names_count
FROM employees
WHERE hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;

-- Exercise

SELECT emp_no, COUNT(emp_no) as times_signed
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING times_signed>1
ORDER BY emp_no; #196rows

SELECT emp_no
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date)>1
ORDER BY emp_no; #196rows

### L21: LIMIT

SELECT * 
FROM salaries
ORDER BY salary DESC
LIMIT 10;

SELECT * FROM dept_emp LIMIT 100;


### Section 10
### L124: INSERT Statement

INSERT INTO employees
(
	emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
    ) 
    VALUES(
    999901,
    '1986-04-21',
    'John',
    'Smith',
    'M',
    '2011-01-01'
    );

SELECT *
FROM employees
ORDER BY emp_no DESC
LIMIT 10; 

INSERT INTO employees
VALUES
(
	999902,
    '1977-09-14',
    'Johnathan',
    'Creek',
    'M',
    '1999-01-01'
);

SELECT *
FROM titles
ORDER BY emp_no DESC
LIMIT 10;

SELECT DISTINCT *
FROM titles
;

INSERT INTO titles
(
	emp_no,
    title,
    from_date
    )
VALUES
(	999903,
    'Senior Engineer',
    '1997-10-01');
    
INSERT INTO employees

VALUES

(

    999903,

    '1977-09-14',

    'Johnathan',

    'Creek',

    'M',

    '1999-01-01'

);

SELECT * FROM dept_emp
ORDER BY emp_no DESC
LIMIT 10;

INSERT INTO dept_emp
VALUES(
	999903,
    'd005',
    '1997-10-01',
    '9999-01-01'
    );
    
SELECT *
FROM departments
LIMIT 10;

CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

SELECT *
FROM departments_dup;

INSERT INTO departments_dup
(
	dept_no,
    dept_name
    )
SELECT *
FROM departments;

SELECT *
FROM departments;

INSERT INTO departments
VALUES(
	'd010',
    'Business Analysis'
    );
    

########
########
######## Section 11 : SQL UPDATE Statement

# L133 : TCL's Commit and ROLLBACK

# L134: The Update Statement part 1
SELECT * from employees where emp_no = 999901;

UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;

# L136: UPDATE part 2

SELECT * FROM departments_dup ORDER BY dept_no;

COMMIT;

UPDATE departments_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control';
    
ROLLBACK;


### Section 12 : The DELETE Statement

SELECT *
FROM employees
ORDER BY emp_no DESC;

SELECT *
FROM employees
WHERE emp_no = 999903;

SELECT *
FROM employees
WHERE emp_no = 999902;
## datas in both tables are deleted due to the DELETE CASCADE


DELETE FROM employees
WHERE emp_no = 999903;

ROLLBACK; #only worked if COMMIT was done

SELECT *
FROM departments_dup
ORDER BY dept_no;

DELETE FROM departments_dup;

SELECT *
FROM departments;

DELETE
FROM departments
WHERE dept_no= 'd010';


### L143: DROP vs TRUNCATE cs DELETE

/*
DROP: 		won't be able to roll back to its initial state, or to the last COMMIT statement. 
			only use when you sure you aren't going to use it anymore.

TRUNCATE:	auto-increment values will be reset.
			DELETE without WHERE.
			quicker to run than DELETE.
            
DELETE	:	removes records row by row.
			auto-increment values will not be reseted.
            
*/

###
### Section 13: Aggregate Functions
### Lesson 144: COUNT()

SELECT *
FROM salaries
ORDER BY salary DESC
LIMIT 10;

SELECT COUNT(salary)
FROM salaries;

SELECT COUNT(DISTINCT from_date)
FROM salaries; #6392

/* Aggregate functions typically ignore null values.
But only if you have indicated a specific column name within the parantheses.
The alternative is to use the wildcard.
COUNT(*)
*/

SELECT COUNT(DISTINCT dept_no)
FROM dept_emp
LIMIT 10;

### Lesson 147 - SUM()

SELECT
SUM(salary)
FROM salaries
WHERE from_date > '1997-01-01';

SELECT
*
FROM salaries
LIMIT 10;

### Lesson 150 - MAX() MIN()

SELECT MAX(salary)
FROM salaries;

SELECT MIN(salary)
FROM salaries;


### Lesson 151 - AVG()

SELECT AVG(salary)
FROM salaries
WHERE from_date > '1997-01-01';

SELECT *
FROM salaries
LIMIT 10;


### Lesson 156 - ROUND()

SELECT ROUND(AVG(salary),2)
FROM salaries
WHERE from_date > '1997-01-01';


### LESSON 159 - COALESCE()

SELECT * 
FROM departments_dup;
-- commit;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

INSERT INTO departments_dup(dept_no)
VALUES ('d010'), ('d011');

ALTER TABLE employees.departments_dup
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;

COMMIT;

### Lesson 160: IFNULL() and COALESCE()

SELECT * 
FROM departments_dup
ORDER BY dept_no;

SELECT 
	dept_no,
	IFNULL(dept_name,
			'Department name not provided') as dept_name
FROM departments_dup
ORDER BY dept_no;


SELECT 
	dept_no,
    dept_name,
	COALESCE(dept_manager,dept_name,'N/A') as dept_manager
FROM departments_dup
ORDER BY dept_no;

SELECT 
	dept_no,
    dept_name,
	COALESCE('Please fill Department Manager') as tobefilled
FROM departments_dup
ORDER BY dept_no;

SELECT
	dept_no, dept_name,
    COALESCE(dept_no, dept_name) as dept_info
FROM departments_dup
ORDER BY dept_no DESC;

SELECT
    IFNULL(dept_no, 'N/A') as dept_no,
    IFNULL(dept_name, 'Department name not provided') as dept_name,
	COALESCE(dept_no, dept_name) AS dept_info
FROM departments_dup
ORDER BY dept_no DESC;

####
#### Section 14: JOINS

show databases;
use udemy_employee;
show tables;
select * from dept_emp;

#### L166: Introduction to JOINS

-- 
select * from departments_dup
ORDER BY dept_no;

select * from departments
ORDER BY dept_no;

ALTER TABLE departments_dup
DROP dept_manager;

ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;
-- 
ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40)
NULL;

INSERT INTO departments_dup (dept_name)
VALUES ("Public Relations");

DELETE FROM departments_dup 
WHERE dept_no = 'd002';

select * from departments_dup order by dept_no;

show tables;
select * from dept_manager;

CREATE TABLE dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);

SELECT 
    *
FROM
    dept_manager_dup;


INSERT INTO dept_manager_dup
SELECT * FROM dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');
                               
DELETE FROM dept_manager_dup
WHERE dept_no = 'd001';

-- SELECT * FROM departments_dup;
-- INSERT INTO departments_dup (dept_name)
-- values ('Public Relations');

DELETE FROM departments_dup WHERE dept_no = 'd002';

select * from departments_dup;

### L170: Inner Join - Part 1

SELECT *
FROM dept_manager_dup
ORDER by dept_no;

SELECT *
FROM departments_dup
ORDER by dept_no;

### L171: Part 2

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

## extract a list info about managers' employee number, first_name, last_name, dept_no, hire_date

select * from dept_manager_dup;
select * from employees;

SELECT m.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
FROM dept_manager_dup m
INNER JOIN employees e
ON m.emp_no = e.emp_no
ORDER BY e.emp_no;

SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

### L175: Duplicate Records

INSERT INTO dept_manager_dup
VALUES ('110228', 'd003', '1992-03-21', '9999-01-01');

insert into departments_dup
values ('d009', 'Customer Service');

SELECT *
FROM dept_manager_dup
ORDER by dept_no ASC;

SELECT *
FROM departments_dup
ORDER by dept_no ASC;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        JOIN
    departments_dup d ON m.dept_no = d.dept_no
-- GROUP BY m.emp_no
ORDER BY dept_no;

### L176: Left Join

# remove the duplicates from the two tables
DELETE FROM dept_manager_dup
WHERE emp_no = '110228';

DELETE FROM dept_manager_dup
WHERE dept_no = 'd009';

# add back the initial records
INSERT INTO dept_manager_dup
VALUES ('110228', 'd003', '1992-03-21', '9999-01-01');

INSERT INTO departments_dup
VALUES ('d009', 'Customer Service');

DELETE FROM departments_dup 
WHERE dept_name = 'd009';

## Left Join

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY dept_no;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY dept_no;

use udemy_employee;

select * from departments_dup ORDER BY dept_no;

# L177: LEFT JOIN part II

SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT OUTER JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;


SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
    WHERE dept_name IS NULL
ORDER BY m.dept_no;

SELECT * FROM employees;

SELECT * FROM dept_manager_dup;

SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM
    employees e
       LEFT JOIN
    dept_manager m ON e.emp_no = m.emp_no
WHERE
    e.last_name = 'Markovitch';

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    dm.from_date
FROM
    employees e
        LEFT JOIN
    departments dm ON e.emp_no = dm.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC , e.emp_no;

select * from dept_manager;

select * from employees;
select * from dept_manager;
select * from departments;

## L180: RIGHT JOIN

## L181: The new and Old Join Syntax (Inner Join)

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

select * from departments_dup;
select * from dept_manager_dup;

-- WHERE

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m,
    departments_dup d
WHERE
    m.dept_no = d.dept_no
ORDER BY m.dept_no;


-- Exercise
select * from dept_manager;
select * from employees;

SELECT 
    m.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
FROM
    dept_manager m,
    employees e
WHERE
    m.emp_no = e.emp_no
ORDER BY emp_no;

-- JOIN
SELECT 
    m.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
FROM
    dept_manager m
    JOIN
    employees e
ON
    m.emp_no = e.emp_no
ORDER BY emp_no;


use udemy_employee;

SELECT * FROM departments_dup ORDER BY dept_no;

SELECT * FROM dept_manager_dup ORDER BY dept_no;

SELECT * FROM dept_manager;

DROP table dept_manager_dup;

CREATE TABLE dept_manager_dup
SELECT *
FROM dept_manager;

SELECT * FROM dept_manager_dup;


# L184: JOIN and WHERE

SELECT * from employees;

SELECT * FROM salaries;

SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no
WHERE s.salary > 145000;

-- SELECT @@global.sql_mode;

SELECT 
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'Margareta'
        AND e.last_name = 'Markovitch'
ORDER BY e.emp_no;


## L188: CROSS JOIN

SELECT * FROM dept_manager;
SELECT * FROM departments;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm,
    departments d
ORDER BY dm.emp_no , d.dept_no;


SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;


SELECT 
    e.*, d.*
FROM
    departments d
    CROSS JOIN
    dept_manager dm
    JOIN 
    employees e ON dm.emp_no = e.emp_no
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE
    d.dept_no = 'd009';
    
SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no <= 10010
ORDER BY e.emp_no , d.dept_name;

### L193: Using Aggregate Functions with Joins

SELECT 
    e.gender, AVG(s.salary) AS average_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY gender;

### L194: JOIN more than two tables

SELECT 
    -- e.emp_no,
    e.first_name,
    e.last_name,
    e.hire_date,
    dm.from_date,
    d.dept_name
FROM
    employees e
        CROSS JOIN
    dept_manager dm
        JOIN
    departments d ON dm.dept_no = d.dept_no;
-- ORDER BY e.emp_no;


SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
;

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    employees e ON m.emp_no = e.emp_no
;

## Exercise
-- 
-- SELECT 
-- 	e.emp_no, e.first_name, e.last_name, e.hire_date, t.title, t.from_date, d.dept_name
--     FROM
--     employees e
--     JOIN
--     titles t ON e.emp_no = t.emp_no
--     JOIN
--     dept_manager dm ON t.emp_no = dm.emp_no
--     JOIN
--     departments d ON dm.dept_no = d.dept_name
-- ORDER BY e.emp_no;



SELECT 
	e.first_name, e.last_name, e.hire_date, t.title, dm.from_date, d.dept_name
    FROM
    employees e
    JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
    JOIN
    departments d ON dm.dept_no = d.dept_no
    JOIN
    titles t ON e.emp_no = t.emp_no
WHERE t.title = 'Manager'
ORDER BY e.emp_no;

## L197 : Tips and Tricks for Joins

-- dept_name, average_salaary

-- only 1 row
SELECT 
    d.dept_name, AVG(salary) as average_salary
FROM
    departments d
        JOIN
    dept_manager dm ON d.dept_no = dm.dept_no
        JOIN
    salaries s ON dm.emp_no = s.emp_no
    
GROUP BY d.dept_name
HAVING average_salary >60000
ORDER BY average_salary DESC;
-- ORDER BY d.dept_no;
    
# Exercise
-- SELECT
-- 	COUNT(*) as quantity, e.gender
-- FROM employees e
-- JOIN
-- titles t
-- ON e.emp_no = t.emp_no
-- GROUP BY e.gender;
-- WHERE t.title = 'Manager'
-- ORDER BY e.gender
-- ;

SELECT
e.gender, COUNT(dm.emp_no)
FROM
employees e
JOIN 
dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;

## L200: UNION vs UNION ALL

CREATE TABLE employees_dup (
	emp_no int(11),
    birth_date date,
    first_name varchar(14),
    last_name varchar(16),
    gender enum('M', 'F'),
    hire_date date
    );

INSERT INTO employees_dup
SELECT
	e.*
FROM 
	employees e
LIMIT 20;

USE udemy_employee;
SELECT * FROM employees_dup;

INSERT INTO employees_dup VALUES
('10001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');

SELECT * FROM dept_manager;

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = 10001 
UNION all SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    dm.dept_no,
    dm.from_date
FROM
    dept_manager dm;

## Exercise

SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT 
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) AS a
ORDER BY - a.emp_no DESC;

## What's the meaning of -a??


####
#### Section 15: Subqueries
####

# L203: SQL Subqueries with IN nested inside WHERE

SELECT * FROM dept_manager;
SELECT * FROM employees;


SELECT
e.first_name, e.last_name
FROM
employees e
WHERE
e.emp_no IN (SELECT dm.emp_no
FROM dept_manager dm)
ORDER BY e.emp_no;

# Ex 204

SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            
## L206: EXISTS-NOT EXISTS
-- returns a Boolean value

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE #the following condition is true
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no);
            
# Ex

select * from titles;

SELECT * FROM employees e
WHERE
	EXISTS(SELECT *
    FROM titles t
    WHERE 
    t.emp_no = e.emp_no
    AND
    t.title = 'Assistant Engineer');
    
SELECT 
    *
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
    WHERE t.title = 'Assistant Engineer';
    
## L209: SQL Subqueries nested in SELECT and FROM

SELECT * FROM dept_manager;

SELECT * FROM departments;

SELECT e.emp_no, e.first_name, de.dept_no FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
ORDER BY e.emp_no;

SELECT * FROM dept_emp;

# Exercise in slides

SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no >= 10021 AND e.emp_no <= 10040
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS B;

DROP TABLE IF EXISTS emp_manager;

CREATE TABLE emp_manager (
	emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
    );
    

INSERT INTO emp_manager
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A
	UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no >= 10021 AND e.emp_no <= 10040
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS B
	UNION
	SELECT 
	C.* 
    FROM (SELECT
			e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS C
    UNION
    SELECT
    D.* 
    FROM (SELECT
			e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS D;
    
SELECT * FROM emp_manager;
    
#### Section 16: Self Join)
#### L214: Self Join

SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE
    e2.emp_no IN (SELECT 
            manager_no
        FROM
            emp_manager);
            

SELECT DISTINCT
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
    
    
#### Section 17: SQL Views

#L215
SELECT * FROM dept_emp;

SET FOREIGN_KEY_CHECKS = 0;

USE udemy_employee;
show tables;

SELECT 
    emp_no, from_date, to_date, COUNT(emp_no) AS num
FROM
    dept_emp
GROUP BY emp_no
HAVING num > 1; #doesn't work if ONLY_FULL_GROUP_BY is not run yet

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;

SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;
    
SELECT * FROM udemy_employee.v_dept_emp_latest_date;

## Exercise

USE udemy_employee;

SELECT * from dept_manager;
SELECT * FROM salaries;

CREATE OR REPLACE VIEW v_salary_manager AS
SELECT ROUND(avg(salary),2)
FROM
dept_manager dm JOIN salaries s ON dm.emp_no = s.emp_no;

SELECT * FROM v_salary_manager;

#### Section 18: Stored Routine

SHOW DATABASES;
USE udemy_employee;
SHOW TABLES;
