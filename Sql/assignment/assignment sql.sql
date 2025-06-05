create database Marketco;
 use Marketco;
 
create table company (
company_id int auto_increment PRIMARY KEY,
company_name varchar (45),
street varchar (45),
city varchar (45),
state varchar(2),
zip boolean
);
 select  * from company;
-- 1) Statement to create the Contact table  
 
 create table contact (
 contact_id int auto_increment PRIMARY KEY ,
 company_id int , 
 first_name varchar (45),
 last_name varchar (45),
 street varchar (45),
 city varchar (45),
 state varchar (45),
 zip varchar (10),
 ismain boolean,
 email varchar (45),
 phone varchar (12)
 );

select * from contact; 
 
-- 2) Statement to create the Employee table  

create table employee (
employee_id int ,
first_name varchar (45),
last_name varchar (45),
salary decimal (10,2),
hire_date date ,
job_title varchar (25),
email varchar (45),
phone varchar (12)
   );
   
   select * from employee; 

-- 3) Statement to create the ContactEmployee table  
-- HINT: Use DATE as the datatype for ContactDate. It allows you to store the 
-- date in this format: YYYY-MM-DD (i.e., ‘2014-03-12’ for March 12, 2014).  

create table contact_employee(
contact_employee_id int ,
contact_id int,
employee_id int ,
contact_date date,
description varchar (100)

);

insert  into contact_employee ( contact_employee_id , contact_id , employee_id , contact_date ,description )
values  
( '1', '103', '5551', '2014-03-12','ABG' ) ,
( '2', '104', '1115', ' 2025-01-02', 'CXZ');

select * from contact_employee;
-- 4) In the Employee table, the statement that changes Lesley Bland’s phone number 
-- to 215-555-8800  

select * from employee;
insert into employee ( employee_id, first_name,last_name,phone)
values 
( '101', 'Lesly', 'Bland', '215-543-8880'),
('102', 'John' , 'Smith' , '312-555-7777');

update employee
set phone = '215-555-8800'
where first_name = 'Lesly' and last_name = 'Bland';

-- 5) In the Company table, the statement that changes the name of “Urban 
-- Outfitters, Inc.” to “Urban Outfitters” . 

select * from company;

insert into company ( company_id , company_name)
values 
( 1 , 'zara' ),
(2, 'urban outfitters inc.'),
( 3, 'jio'); 

update  company 
set company_name = 'urban outfitters'
where company_name = 'urban outfitters inc ';



-- 6) What is the significance of “%” and “_” operators in the LIKE statement?  

#  % is a wildcard that matching any sequence of characters ( including none ) 
# _ is a wildcard that matching exactly one character 
# like statement ,
select * from employee where First_name like 'J%' ;
# matches names starting with 'J' 
select * from employee where first_name like 'A';
# matches names with 'A' as the second letter and any third character 



-- 7) Explain normalization in the context of databases. 


 
-- 8) What does a join in MySQL mean?  

# in my sql ,a join is used to combine rows from two or more tables based on a related  column between them
# it allows to retrieve data that is spread across multiple tables in a relational database 


-- 9) 19.What do you understand about DDL, DCL, and DML in MySQL? 

# DDL, DML and DCL in MySQL 
# DDL ( Data Definition Language ) - defines database structure  ->  CREATE , ALTER , DROP 
# DML ( Data Manipulation Language ) - manages table data  ->   INSERT, UPDATE , DELETE , SELECT 
# DCL ( Data Control Language ) - control access to data   -> GRANT , REVOKE 


-- 10) What is the role of the MySQL JOIN clause in a query, and what are some 
-- common types of joins?

# MYSQL JOIN CLAUSE 
# ROLE : Combines rows from multiple tables based on a common column
# COMMON TYPES OF JOINs 
#1 INNER JOIN : Returns matching rows from both tables 
#2 LEFT JOIN : Returns all rows from the left table + matching the left rows 
#3 RIGHT JOIN : Returns all rows from the right table + matching left rows 
#4 CROSS JOIN : Returns the Cartesian product of both tables

