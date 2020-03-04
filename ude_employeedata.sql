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
