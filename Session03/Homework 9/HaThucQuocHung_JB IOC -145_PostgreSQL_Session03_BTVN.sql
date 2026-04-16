create database SchoolDB;

Create table Students(
    student_id serial primary key,
    name varchar(255) not null,
    dob date not null 
);

Create table courses(
    course_id serial primary key,
    course_name varchar(255) not null unique,
    credits integer not null CHECK (credits > 0)
);

create table enrollments(
    enrollment_id serial primary key,
    student_id integer not null references Students(student_id),
    course_id integer not null references courses(course_id),
    grade varchar(1) check (grade in ('A', 'B', 'C', 'D', 'F'))
);