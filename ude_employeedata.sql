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
######## Section
######## 11


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

