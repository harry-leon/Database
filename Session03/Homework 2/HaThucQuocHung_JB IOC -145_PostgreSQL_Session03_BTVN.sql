Create database student_management;
Create schema student;
Create table student.students(
    id serial primary key,
    name varchar(255) not null,
    date_of_birth date,
    gender varchar(10),
    address varchar(255),
    email varchar(255) unique,
    phone varchar(20) unique,
    status varchar(20) default 'active' check (status in ('active', 'inactive'))
);

Create table student.instructors(
    id serial primary key,
    name varchar(255) not null,
    title varchar(100),
    department varchar(100),
    email varchar(255) unique,
    phone varchar(20) unique
);

create table student.courses(
    id serial primary key,
    name varchar(255) not null,
    code varchar(20) unique,
    description text,
    instructor_id int foreign key references student.instructors(id)
);

create table student.enrollments(
    id serial primary key,
    student_id int foreign key references student.students(id),
    course_id int foreign key references student.courses(id),
    enrollment_date date default current_date,
    status varchar(20) default 'enrolled' check (status in ('enrolled', 'completed', 'dropped'))
);
