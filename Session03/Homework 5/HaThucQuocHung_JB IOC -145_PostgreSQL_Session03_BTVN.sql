create database course_management;

create table courses(
    course_id serial primary key,
    course_name varchar(255) not null unique,
    description text,
    tuition numeric(12,2) not null
);

create table instructors(
    instructor_id serial primary key,
    full_name varchar(255) not null,
    specialty varchar(255) not null,
    phone varchar(20) not null unique
);

create table students(
    student_id serial primary key,
    full_name varchar(255) not null,
    email varchar(255) not null unique,
    registration_date date not null default current_date
);

create table classes(
    class_id serial primary key,
    class_time varchar(255) not null,
    instructor_id int not null references instructors(instructor_id),
    course_id int not null references courses(course_id)
);