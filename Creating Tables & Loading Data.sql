-- Library Management System Project

CREATE DATABASE Library_manage;
use Library_manage;


-- CREATING & Loading data to these Tables.


DROP TABLE IF EXISTS books;
CREATE TABLE books(
	isbn varchar(50) Primary Key,	
    book_title varchar(100),	
    category varchar(40),	
    rental_price decimal(10,5),	
    status varchar(10),	
    author varchar(150),	
    publisher varchar(60));
    




DROP TABLE IF EXISTS branch;
CREATE TABLE branch(
	branch_id varchar(10) PRIMARY KEY,
	manager_id varchar(10),
	branch_address varchar(20),
	contact_no bigint);
    




DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
	emp_id VARCHAR(10) PRIMARY KEY,	
    emp_name VARCHAR(20),	
    position VARCHAR(20), 
    salary	BIGINT,
    branch_id VARCHAR(10),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id));
    




DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`(
	member_id VARCHAR(10) PRIMARY KEY,
	member_name VARCHAR(30),
	member_address VARCHAR(30),
	reg_date DATE);
    




DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status(
	issued_id VARCHAR(20) Primary KEY, 
    issued_member_id VARCHAR(20), 
    issued_book_name VARCHAR(150),
    issued_date	VARCHAR(20),
    issued_book_isbn VARCHAR(20),
    issued_emp_id VARCHAR(20),
    FOREIGN KEY (issued_member_id) REFERENCES `member`(member_id),
    FOREIGN KEY (issued_emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn));
    




DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status(
	return_id VARCHAR(10) PRIMARY KEY,	
    issued_id VARCHAR(40),	
    return_book_name VARCHAR(100),
	return_date	DATE, 
    return_book_isbn VARCHAR(50),
    FOREIGN KEY (return_book_isbn) REFERENCES books(isbn));


show tables from library_manage;  -- Check tables we are created


LOAD DATA LOCAL INFILE "D:/Projects/MySQL/6- Library Management system/Data set/books.csv"
INTO TABLE books
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY "\r\n"
IGNORE 1 ROWS ;



LOAD DATA LOCAL INFILE "D:/Projects/MySQL/6- Library Management system/Data set/branch.csv"
INTO TABLE branch
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY "\r\n"
IGNORE 1 ROWS ;







LOAD DATA LOCAL INFILE "D:/Projects/MySQL/6- Library Management system/Data set/employees.csv"
INTO TABLE employees
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY "\r\n"
IGNORE 1 ROWS ;



LOAD DATA LOCAL INFILE "D:/Projects/MySQL/6- Library Management system/Data set/issued_status.csv"
INTO TABLE issued_status
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY "\r\n"
IGNORE 1 ROWS ;




LOAD DATA LOCAL INFILE "D:/Projects/MySQL/6- Library Management system/Data set/return_status.csv"
INTO TABLE return_status
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY "\r\n"
IGNORE 1 ROWS ;




LOAD DATA LOCAL INFILE "D:/Projects/MySQL/6- Library Management system/Data set/members.csv"
INTO TABLE `member`
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY "\r\n"
IGNORE 1 ROWS ;



