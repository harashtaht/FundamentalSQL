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



### L111: Using Aliases

### L114: HAVING


### L117: WHERE vs HAVING


### L21: LIMIT

