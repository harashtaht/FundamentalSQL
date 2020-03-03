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


