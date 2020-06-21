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

SELECT COUNT(*) FROM titles 
WHERE title = 'Engineer';

SELECT COUNT(*) FROM titles
WHERE title LIKE ('%engineer%');


SELECT COUNT(*) FROM titles 
WHERE title = 'Senior Engineer';

SELECT COUNT(*) FROM titles
WHERE title LIKE ('%senior engineer%');

SELECT COUNT(*) FROM employees WHERE first_name LIKE ('%ichi%');


## Exercise 6

USE udemy_employee;

SELECT e.emp_no, e.first_name, e.last_name, e.gender, de.dept_no FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no = 10010;

SELECT * from departments;
SELECT * FROM dept_emp;

DROP PROCEDURE IF EXISTS last_department;
-- 
DELIMITER $$
CREATE PROCEDURE last_dept (in p_emp_no integer)
BEGIN
SELECT 
	e.emp_no, d.dept_no, d.dept_name
FROM
	employees e
	JOIN 
    dept_emp de ON e.emp_no = de.emp_no
    JOIN
	departments d ON de.dept_no = d.dept_no
WHERE
	e.emp_no = p_emp_no
    AND de.from_date = (SELECT MAX(from_date)
    FROM dept_emp
    WHERE 
    emp_no = p_emp_no
    );
END$$

DELIMITER ;

CALL last_dept(10010);


## Exercise 7

