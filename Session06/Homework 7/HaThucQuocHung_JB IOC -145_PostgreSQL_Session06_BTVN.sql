create table department (
    id serial primary key,
    name varchar(50)
);

create table employee (
    id serial primary key,
    full_name varchar(100),
    department_id int,
    salary numeric(10,2)
);

-- du lieu mau (co phong ban khong co nhan vien)
insert into department (name)
values
    ('it'),
    ('hr'),
    ('finance'),
    ('marketing'),
    ('legal');

insert into employee (full_name, department_id, salary)
values
    ('nguyen van an', 1, 12000000),
    ('tran thi lan', 1, 15000000),
    ('le quang huy', 2, 8500000),
    ('pham minh anh', 3, 11000000),
    ('doan tuan kiet', 3, 9000000),
    ('vu ngoc mai', 4, 7000000);

-- liet ke danh sach nhan vien cung ten phong ban (inner join)
select
    e.full_name,
    d.name as department_name
from employee e
join department d on e.department_id = d.id;

-- tinh luong trung binh tung phong ban
select d.name as department_name, avg(e.salary) as avg_salary
from employee e
join department d on e.department_id = d.id
group by d.name;

-- phong ban co luong trung binh > 10 trieu
select d.name as department_name, avg(e.salary) as avg_salary
from employee e
join department d on e.department_id = d.id
group by d.name
having avg(e.salary) > 10000000;

-- phong ban khong co nhan vien nao
select
    d.id,
    d.name as department_name
from department d
left join employee e on e.department_id = d.id
where e.id is null;

