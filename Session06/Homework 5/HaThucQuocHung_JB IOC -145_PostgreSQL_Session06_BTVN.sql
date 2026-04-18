-- HaThucQuocHung_JB IOC -145_PostgreSQL_Session06_BTVN.sql
-- Homework 5 for Session 06

drop table if exists Course;

create table Course (
    id serial primary key,
    title varchar(100),
    instructor varchar(50),
    price numeric(10,2),
    duration int
);

-- them it nhat 6 khoa hoc
insert into Course (title, instructor, price, duration)
values
    ('sql co ban', 'Hung', 600000, 20),
    ('postgresql nang cao', 'Lan', 1800000, 40),
    ('data analysis with sql', 'Nam', 1500000, 35),
    ('demo sql crash course', 'Mai', 400000, 10),
    ('python fundamentals', 'Tuan', 900000, 28),
    ('sql performance tuning', 'Kiet', 2000000, 32);

-- cap nhat gia tang 15% cho khoa hoc co thoi luong tren 30 gio
update Course set price = price * 1.15 where duration > 30;

-- xoa khoa hoc co ten chua tu khoa "Demo"
delete from Course where title ilike '%demo%';

-- hien thi khoa hoc co ten chua tu "SQL" (khong phan biet hoa thuong)
select * from Course where title ilike '%sql%';

-- lay 3 khoa hoc co gia nam giua 500,000 va 2,000,000, sap xep theo gia giam dan
select * from Course 
where price between 500000 and 2000000
order by price 
desc limit 3;

