/* GROUP BY & HAVING */
 create database mnc_db;
 use mnc_db;
 
 create table departments(
	dept_id int,
    dept_name varchar(50) primary key
 );


create table employees(
	emp_id int auto_increment primary key,
    firstname varchar(100) not null,
    dept varchar(50),
    salary double,
    foreign key (dept) references departments(dept_name) on delete cascade
);

INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales'),
(4, 'Marketing');

INSERT INTO employees (firstname, dept, salary) VALUES
('Ravi', 'HR', 35000),
('Priya', 'HR', 36000),
('Kiran', 'IT', 45000),
('Sneha', 'IT', 47000),
('Raj', 'IT', 49000),
('Meena', 'Sales', 40000),
('Arjun', 'Sales', 41000),
('Divya', 'Sales', 43000),
('Varun', 'Sales', 42000),
('Kavya', 'Sales', 44000),
('Sanjay', 'Sales', 41500),
('Anu', 'Marketing', 38000),
('Rishi', 'Marketing', 39500),
('Nikhil', 'Sales', 42500),
('Pooja', 'Sales', 43000),
('Ramesh', 'Sales', 44000),
('Sonal', 'Sales', 41500),
('Tarun', 'Sales', 42000);

select count(emp_id) as Employee_count, dept from employees
group by dept having employee_count > 10;

select*from employees;


/* Additional for Union and function execution */
 create table Past_emp(
	emp_id int auto_increment primary key,
	emp_name varchar(100),
    dept varchar(50),
    salary double
 );
insert into past_emp(emp_name, dept, salary) values
('Ravi', 'HR', 34000),         
('Priya', 'HR', 35500),
('Asha', 'Sales', 39000),
('Vijay', 'IT', 46000),
('Kiran', 'IT', 45000);       
      
select emp_id, firstname emp_name,dept from employees 
union
select emp_id, emp_name, dept from past_emp;
 
select emp_id,  concat(firstname," ",lastname) emp_name,dept from employees 
union all
select emp_id,emp_name, dept from past_emp;



 /* Alterind and updating table */
alter table employees
add column (
lastname varchar(100) not null,
gender enum ('Male', 'Female'),
joindate date
);
        
UPDATE employees SET LastName='Kumar', Gender='Male', JoinDate='2021-04-15' WHERE FirstName='Ravi';
UPDATE employees SET LastName='Sharma', Gender='Female', JoinDate='2022-01-10' WHERE FirstName='Priya';
UPDATE employees SET LastName='Patel', Gender='Male', JoinDate='2020-11-20' WHERE FirstName='Kiran';
UPDATE employees SET LastName='Reddy', Gender='Female', JoinDate='2019-06-25' WHERE FirstName='Sneha';
UPDATE employees SET LastName='Verma', Gender='Male', JoinDate='2023-02-01' WHERE FirstName='Raj';
UPDATE employees SET LastName='Nair', Gender='Female', JoinDate='2022-08-18' WHERE FirstName='Meena';
UPDATE employees SET LastName='Singh', Gender='Male', JoinDate='2021-09-10' WHERE FirstName='Arjun';
UPDATE employees SET LastName='Iyer', Gender='Female', JoinDate='2023-05-12' WHERE FirstName='Divya';
UPDATE employees SET LastName='Menon', Gender='Male', JoinDate='2020-03-01' WHERE FirstName='Varun';
UPDATE employees SET LastName='Das', Gender='Female', JoinDate='2021-12-30' WHERE FirstName='Kavya';
UPDATE employees SET LastName='Gupta', Gender='Male', JoinDate='2018-09-20' WHERE FirstName='Sanjay';
UPDATE employees SET LastName='Pillai', Gender='Female', JoinDate='2023-04-05' WHERE FirstName='Anu';
UPDATE employees SET LastName='Mehta', Gender='Male', JoinDate='2021-02-15' WHERE FirstName='Rishi';
UPDATE employees SET LastName='Bhatia', Gender='Male', JoinDate='2019-10-10' WHERE FirstName='Nikhil';
UPDATE employees SET LastName='Joshi', Gender='Female', JoinDate='2022-06-22' WHERE FirstName='Pooja';
UPDATE employees SET LastName='Rao', Gender='Male', JoinDate='2020-07-17' WHERE FirstName='Ramesh';
UPDATE employees SET LastName='Chatterjee', Gender='Female', JoinDate='2023-01-28' WHERE FirstName='Sonal';
UPDATE employees SET LastName='Khanna', Gender='Male', JoinDate='2019-05-15' WHERE FirstName='Tarun';

select * from employees;

select concat(firstname," ",lastname) Full_Name from employees;

-- year of joining
select firstname Name, year(joindate) Join_Date from employees;

-- days worked/ working
select firstname Name, datediff(curdate(),joindate) Days_Worked from employees;

-- years worked/working
select firstname Name,round(datediff(curdate(),joindate)/365) Years_worked from employees;

-- day & month of joining 
select firstname Name,month(joindate) Month, dayname(joindate) Day from employees;


-- UDF

delimiter //
create function FullName(firstname varchar(100), lastname varchar(100))
returns varchar(100)
reads sql data
deterministic
begin
	return concat(firstname,' ',lastname);
end //

delimiter ;

-- TESTING UDF 
select emp_id ID_NO, Fullname(firstname,lastname) Full_Name from employees;



-- Stored Procedure - HR wants a quick way to fetch employee details by ID.
delimiter //
create procedure GetEmpInfo()
BEGIN
	select * from employees;
END //
delimiter ;

call GetEmpInfo();

-- Simple View - Management wants a view for employee name and department.
create view Emp_info as
select emp_id, concat(firstname, " ", lastname) Emp_Name, dept Department 
from employees
order by emp_id;

-- to call view 
select * from Emp_info;

--  Complex View -  Create a view joining Employees, Departments, and Salaries.
create view Emp_details as
select d.dept_id, d.dept_name, e.firstname, e.salary 
from employees e
inner join departments d on d.dept_name = e.dept;

-- to call view 
select*from Emp_details;







