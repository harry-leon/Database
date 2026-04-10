Create databse "UniversityDB"
Create schema university
Create table university.Students(
	student_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	birth_date date,
	email varchar(100) not null unique
);

Create table university.Courses(
	course_id serial primary key,
	course_name varchar(100) not null,
	credits int
);

Create table university.Enrollments (
	enrollment_id serial primary key,
	student_id not null REFERENCES university.Students(student_id),
	course_id  not null REFERENCES university.Courses(course_id),
	enroll_date date
);
-- Xem danh sách database
select datname from pg_database;

-- xem danh sachs schema
select schema_name from information_schema.schemata;

-- Xem cấu trúc bảng Students, Courses, Enrollments
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'students'
AND table_schema = 'university';

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'courses'
AND table_schema = 'university';

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'enrollments'
AND table_schema = 'university';