## Exercise 1 ##

/* Find the Average Salary of male and female 
employees in each department
*/

USE udemy_employee;
SHOW TABLES;

select * from salaries;

select * from employees;

select * from dept_emp;

select 
    de.dept_no,
    e.gender,
    AVG(s.salary)
FROM
	employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    JOIN dept_emp de ON e.emp_no = de.emp_no
    GROUP BY de.dept_no, e.gender
    ORDER BY dept_no ASC;
	
## Exercise 2
/* Find the lowest department number
encountered in the dept_emp table. Then, find the highest department number. */

SELECT 
    MIN(dept_no), MAX(dept_no)
FROM
    dept_emp;
    
## Exercise 3

SELECT 
    e.emp_no, de.dept_no
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
HAVING e.emp_no <= 10040
ORDER BY e.emp_no ASC;