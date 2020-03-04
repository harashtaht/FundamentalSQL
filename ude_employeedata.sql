# L66 : SELECT.. FROM..

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

# Exercise

select * from departments;

SELECT dept_name FROM departments;

SELECT * from employees WHERE first_name= 'Denis';
