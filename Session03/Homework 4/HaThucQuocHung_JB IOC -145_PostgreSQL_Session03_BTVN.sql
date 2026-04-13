create database patient_management;

create table patients(
    patient_id serial primary key,
    full_name varchar(100) not null,
    gender varchar(20),
    phone varchar(20) not null unique,
    date_of_birth date not null,
    address varchar(255) not null,
    status varchar(20) not null default 'active' check (status in ('active','inactive'))
);

create table doctors(
    doctor_id serial primary key,
    full_name varchar(255) not null,
    title varchar(100) not null,
    specialty varchar(100),
    phone varchar(20) not null unique,
    email varchar(255) unique
);

create table departments(
    department_id serial primary key,
    department_name varchar(255) not null unique,
    phone varchar(20),
    location varchar(255)
);

create table medical_records(
    record_id serial primary key,
    visit_date date not null default current_date,
    diagnosis varchar(500),
    treatment varchar(500),
    notes text,
    patient_id int not null references patients(patient_id),
    doctor_id int not null references doctors(doctor_id),
    department_id int references departments(department_id)
);
