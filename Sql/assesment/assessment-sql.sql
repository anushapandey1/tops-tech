-- Create Database 
CREATE DATABASE try; 
USE try; 
 
CREATE TABLE employees ( 
Employee_id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR (100), 
position VARCHAR (100), salary DECIMAL (10, 2), hire_date DATE 
); 
 
CREATE TABLE employee_audit ( 
audit_id INT AUTO_INCREMENT PRIMARY KEY, 
employee_id INT, 
name VARCHAR 
(100), 
position VARCHAR (100), salary DECIMAL (10, 2), hire_date DATE, 
action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
); 
 
INSERT INTO employees (name, position, salary, hire_date) VALUES ('John Doe', 
'Software Engineer', 80000.00, '2022-01-15'), 
('Jane Smith', 'Project Manager', 90000.00, '2021-05-22'), 
('Alice Johnson', 'UX Designer', 75000.00, '2023-03-01'); 
 
 
 
-- create a Trigger that will insert a record into the employee_audit table every time 
-- a new employee is added to the employee’s table: 

DELIMITER  $$
create trigger after_employee_insert
after insert on  employees 
for each row 
begin
   insert into employee_audit ( employee_id , name , position , salary, hire_date)
   values ( NEW.employee_id , NEW.name, NEW.position,NEW.salary,NEW.hire_date);
end $$
DELIMITER ; 



-- We have an employee’s table, and we want to create a stored procedure to add a 
-- new employee and automatically log this action in an 
-- employee_audit table.

DELIMITER  $$ 
create procedure AddNewEmp ( in emp_name VARCHAR (100), in emp_position VARCHAR (100), 
in emp_salary decimal (10,2), in emp_hire_date DATE )
begin
  insert into employees ( name , position,salary,hire_date)
  values ( emp_name,emp_position, emp_salary, emp_hire_date);
  
end  $$
delimiter  ;
call AddNewEmp (' Harry Potter ' , ' Civil engineer ' , 82000.00 , '2025-07-01' );
