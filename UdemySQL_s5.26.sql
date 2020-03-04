#session 5 lesson 26++
#Datatypes: String

show databases;

use Sales;

CREATE SCHEMA IF NOT EXISTS Sales;

USE SALES;
-- Testing
# 				(bytes)							Example
#				max size	storage				len(symbol)	size(bytes)
# 'CHAR(5)' 	255			Fixed		'James	5			5
-- 										'Bob'	3			5
# 'VARCHAR(5)'	65535		Variable	'James'	5			5
-- 										'Bob'	3			3
# 'ENUM('M', 'F')					


# Datatypes : INT

# 1. integer: INTEGER
# 2. fixed int : DECIMAL, NUMERIC
# 2.B. numeric: e.g. Salaries; NUMERIC (precision, scales)
# 		e.g. NUMERIC (7,2): $ 75,000.50
# 3. floating-point: 

-- Lesson 38: Creating a Table

USE Sales;

-- show tables;

CREATE TABLE sales
(
	purchase_number INT NOT NULL PRIMARY KEY,
	date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL
    );


-- Create the “customers” table in the “sales” database. 
-- Let it contain the following 5 columns: 
-- customer_id, first_name, last_name, email_address, and number_of_complaints. 
-- Let the data types of customer_id and number_of_complaints be integer, 
-- while the data types of all other columns be VARCHAR of 255.

CREATE TABLE customers
(
	customer_id INT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email_address VARCHAR(255) NOT NULL,
    number_of_complaints INT
    );
    
-- What's inside the tables (the properties) is called "Field"

show tables;
select * from sales;
select * from customers;

SELECT * FROM sales.customers;

select * from sales.sales;

DROP TABLE SALES;


-- Other Useful Data Types

-- DATE : YYYYMMDD e.g. '2018-07-25'
-- DATETIME : YYYYMMDD HH:MM:SS[.fraction] '2018-07-25 09:00:00'
-- TIMESTAMP: used for a well defined, exact point of time. 
-- '2018-07-25 09:00:00' UTC (Universal Time C)
-- 