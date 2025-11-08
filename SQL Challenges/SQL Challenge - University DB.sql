create database university_db;
use university_db;

create table departments(
	department_id int auto_increment primary key,
    department_name varchar(50) unique
);

create table courses(
	course_id int unique not null primary key,
    course_name varchar(100) unique not null
);

create table students(
	student_id int auto_increment primary key,
    student_name varchar(100),
    student_email varchar(100) unique,
    student_dept_id int,
    course_id int,
    cgpa double,
    foreign key (student_dept_id) references departments(department_id) on delete cascade,
    foreign key (course_id) references courses (course_id) on delete cascade
);


insert into departments (department_name)
values ('BME'), ('AGRI'), ('MECH'), ('EEE'), ('ECE');

insert into courses 
values (1, 'EG') , (2, 'EM'), (3, 'BEEE'), (4, 'EVS'), (5, 'DBME');

select * from departments;
select * from courses;
select * from students;

insert into students (student_name, student_email, student_dept_id, course_id, cgpa)
values 
('Joe', 'joe11@gmail.com', 3 , 5, 8.5),
('Jane', 'jane21@gmail.com', 1, 4, 9.4),
('Alice', null, 2, 4, 9.8),
('Daise', 'daisehellen@gmail.com', 2, 3, 8.9);

-- DISTINCT & WHERE
select distinct department_name from departments;

-- IS NULL & NOT NULL
select * from students where student_email is null;
select * from students where student_email is not null;

-- IN, BETWEEN, NOT BETWEEN
select * from students where course_id in (1,4,5);
select * from students where cgpa between 8.5 and 9;
select * from students where cgpa not between 8.5 and 9;


-- INNER JOIN
select c.course_name , s.student_name from students s
join courses c on c.course_id = s.course_id;


-- LEFT JOIN
select s.student_name, c.course_name from students s
left join courses c on c.course_id = s.course_id;


-- RIGHT JOIN 
select s.student_name, c.course_name from students s
right join courses c on c.course_id = s.course_id;

