## Exercise 1 ##

/* Find the Average Salary of male and female 
employees in each department
*/
SHOW databases;

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
    MIN(dept_no) AS low_dept_no, MAX(dept_no) AS hi_dept_no
FROM
    dept_emp;
    
## Exercise 3

SELECT 
    emp_no,
    (SELECT 
            MIN(dept_no)
        FROM
            dept_emp de
        WHERE
            e.emp_no = de.emp_no) AS dept_no,
	CASE 
		WHEN emp_no <= 10020 THEN '110022' ELSE '110039'
    END AS manager
FROM
    employees e
WHERE
    e.emp_no <= 10040;


## Exercise 4

SELECT * FROM employees
WHERE YEAR(hire_date) =2000;

-- SELECT COUNT(emp_no), MONTH(hire_date) FROM employees
-- GROUP BY MONTH(hire_date)
-- ORDER BY MONTH(hire_date) ASC
-- ;


## Exercise 5
