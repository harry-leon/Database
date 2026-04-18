-- HaThucQuocHung_JB IOC -145_PostgreSQL_Session06_BTVN.sql
-- Homework 4 for Session 06

drop table if exists OrderInfo;

create table OrderInfo (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total NUMERIC(10,2),
    status VARCHAR(20)
);

-- Them 5 don hang mau voi tong tien khac nhau
insert into OrderInfo (customer_id, order_date, total, status)
values
    (1, '2024-10-02', 350000, 'Completed'),
    (2, '2024-10-15', 650000, 'Processing'),
    (3, '2024-09-28', 520000, 'Completed'),
    (4, '2024-10-31', 1200000, 'Pending'),
    (5, '2024-11-05', 480000, 'Cancelled');

-- Truy van don hang co tong tien lon hon 500,000
select *
from OrderInfo
where total > 500000;

-- Truy van don hang co ngay dat trong thang 10 nam 2024
select *
from OrderInfo
where order_date >= '2024-10-01' and order_date < '2024-11-01';

-- Liet ke don hang co trang thai khac "Completed"
select *
from OrderInfo
where status <> 'Completed';

-- Lay 2 don hang moi nhat
select *
from OrderInfo
order by order_date desc, id desc
limit 2;

