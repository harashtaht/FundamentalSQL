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

-- DROP TABLE SALES;


-- Other Useful Data Types

-- DATE : YYYYMMDD e.g. '2018-07-25'
-- DATETIME : YYYYMMDD HH:MM:SS[.fraction] '2018-07-25 09:00:00'
-- TIMESTAMP: used for a well defined, exact point of time. 
-- '2018-07-25 09:00:00' UTC (Universal Time C)

-- Written in Quotes
-- -> string, date, and time data types
-- -> i.e. CHAR, VARCHAR, DATE, DATETIME, TIMESTAMP

-- Not written in quotes
-- -> numeric data types
-- -> i.e. INTEGER, DECIMAL, NUMERIC, FLOAT, DOUBLE

-- BLOB datatype
-- Binary Large OBject
-- Refers to a file of binary data - 0 and 1
-- .doc, .wav, .jpg, .xml, .xlsx

-- PRIMARY KEY

-- CREATE TABLE sales
show databases;
use Sales;
show tables;

CREATE TABLE sales
(
	purchase_number INT AUTO_INCREMENT,
    date_of_purchase DATE,
    customer_id INT,
    item_code VARCHAR(10),
PRIMARY KEY (purchase_number)
);

show tables;

-- S6.L47

-- DROP TABLE CUSTOMERS;

CREATE TABLE customers
(
	customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY (customer_id)
);

-- DROP TABLE items;-- 

CREATE TABLE items
(
	item_code VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10,2),
    company_id VARCHAR(255),
PRIMARY KEY (item_code)
);


CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number INT(12),
PRIMARY KEY (company_id)
);    

show tables;

-- L49 FOREIGN KEY Constraints

-- FOREIGN KEY: is mentioned in the 'child' table
-- REFERENCES referencing the 'parent' table and the column referenced
-- ON DELETE CASCADE: if a specific value from parent table is removed, in child table removed also
-- 
-- CREATE TABLE sales
-- (
-- 	purchase_number INT AUTO_INCREMENT,
--     date_of_purchase DATE,
--     customer_id INT,
--     item_code VARCHAR(10),
-- PRIMARY KEY (purchase_number),
-- FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
-- );

-- ALTER TABLE sales
-- ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;
-- 
-- ALTER TABLE sales
-- DROP FOREIGN KEY `sales_ibfk_1`;
-- 

DROP TABLE sales;
DROP TABLE customers;
DROP TABLE items;
dROP TABLE companies;


-- L54

CREATE TABLE customers
(
	customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)
);

ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;

INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley', 0)
;

select * from customers;

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

INSERT INTO customers (first_name, last_name, gender)
VALUES ('Peter', 'Figaro', 'M')
;

SELECT * from customers;

ALTER TABLE customers
ALTER COLUMN number_of_complaints DROP DEFAULT;

show tables;

ALTER TABLE customers
ADD company_name VARCHAR(255) UNIQUE KEY,
ADD headquarters_phone_number VARCHAR(255) DEFAULT "X";

SELECT * FROM customers;-- 

INSERT INTO customers (first_name, last_name, gender, company_name)
VALUES ('Babo', 'Walaluyu', 'F', 'PT. Meninggal');

CREATE TABLE companies
(
	company_id INT AUTO_INCREMENT,
    headquarters_phone_number VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
PRIMARY KEY (company_id)
);


-- MODIFY is if the column is not changed, but to be updated / modified


ALTER TABLE companies
MODIFY company_name VARCHAR(255) NULL;

ALTER TABLE companies
MODIFY company_name VARCHAR(255) NOT NULL;

INSERT INTO companies (headquarters_phone_number, company_name)
VALUES ('+27 92910-2020', 'The company AA');

ALTER TABLE companies
MODIFY headquarters_phone_number VARCHAR(255) NULL;

ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;

-- Null value is a missing value.

-- Assigned by user: 0, None
-- Assigned by computer: NULL


-- Section 7: SQL Best Practices

/*
Testing satu
Dua tiga
Limalimalima
*/

# shortcut for beautifying query-> cmd+B

CREATE TABLE IF NOT EXISTS test (
    numbers INT(10),
    words VARCHAR(10)
);

SHOW TABLES;

DROP TABLE companies;
DROP TABLE customers;

