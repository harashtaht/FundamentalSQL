-- Exercise 1
/* Find the Average Salary of male and female 
employees in each department
*/

USE udemy_employee;
SHOW TABLES;

select * from salaries;

select * from employees;

select * from dept_emp;

select 
	e.emp_no,
    e.gender,
    de.dept_no,
    AVG(s.salary)
FROM
	employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    JOIN dept_emp de ON e.emp_no = de.emp_no
GROUP BY de.dept_no;
	
	