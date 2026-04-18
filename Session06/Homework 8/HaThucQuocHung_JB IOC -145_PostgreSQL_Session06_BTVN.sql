-- HaThucQuocHung_JB IOC -145_PostgreSQL_Session06_BTVN.sql
-- Homework 8 for Session 06

drop table if exists orders;
drop table if exists customer;

create table customer (
    id serial primary key,
    name varchar(100)
);

create table orders (
    id serial primary key,
    customer_id int,
    order_date date,
    total_amount numeric(10,2)
);

-- du lieu mau (co khach hang chua tung mua hang)
insert into customer (name)
values
    ('nguyen minh an'),
    ('tran hoai nam'),
    ('le thu an'),
    ('pham quang huy'),
    ('vo thanh an'),
    ('do mai linh'),
    ('bui gia bao'),
    ('nguyen thi hoa');

insert into orders (customer_id, order_date, total_amount)
values
    (1, '2024-01-10', 1200000),
    (1, '2024-03-05', 800000),
    (2, '2024-02-18', 2500000),
    (2, '2024-10-02', 1500000),
    (3, '2024-07-21', 600000),
    (4, '2024-10-15', 4200000),
    (5, '2024-11-09', 900000),
    (6, '2024-12-01', 3000000),
    (7, '2024-09-12', 700000);

-- hien thi ten khach hang va tong tien da mua, sap xep giam dan theo tong tien
select c.name, sum(o.total_amount) as total_spent
from customer c
left join orders o on o.customer_id = c.id
group by c.id, c.name
order by total_spent desc;

-- tim khach hang co tong chi tieu cao nhat (subquery voi max)
select t.name, t.total_spent
from (
    select c.id, c.name, coalesce(sum(o.total_amount), 0) as total_spent
    from customer c
    left join orders o on o.customer_id = c.id
    group by c.id, c.name
) t
where t.total_spent = (select max(total_spent) from (
    select
        c.id,
        coalesce(sum(o.total_amount), 0) as total_spent
    from customer c
    left join orders o on o.customer_id = c.id
    group by c.id
) m);

-- liet ke khach hang chua tung mua hang
select c.id, c.name
from customer c
left join orders o on o.customer_id = c.id
where o.id is null;

-- khach hang co tong chi tieu > trung binh cua toan bo khach hang (subquery trong having)
select c.name, sum(o.total_amount) as total_spent
from customer c
inner join orders o on o.customer_id = c.id
group by c.id, c.name
having sum(o.total_amount) > ( 
    select avg(total_spent) from (
        select c.id, coalesce(sum(o.total_amount), 0) as total_spent
        from customer c
        left join orders o on o.customer_id = c.id
        group by c.id
    ) a
)
order by total_spent desc;
