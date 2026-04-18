create table orders (
    id serial primary key,
    customer_id int,
    order_date date,
    total_amount numeric(10,2)
);

-- du lieu mau (nhieu nam, co nam doanh thu > 50 trieu)
insert into orders (customer_id, order_date, total_amount)
values
    (1, '2023-01-10', 12000000),
    (2, '2023-03-22', 8000000),
    (3, '2023-06-05', 15000000),
    (4, '2023-10-19', 9000000),
    (5, '2023-12-28', 11000000),
    (1, '2024-02-14', 6000000),
    (2, '2024-04-09', 7000000),
    (3, '2024-07-21', 9500000),
    (4, '2024-10-03', 4000000),
    (5, '2024-11-30', 5000000),
    (1, '2025-01-08', 20000000),
    (2, '2025-05-16', 18000000),
    (3, '2025-08-27', 14000000),
    (4, '2025-09-12', 16000000),
    (5, '2025-12-24', 13000000);

-- tong doanh thu, so don hang, gia tri trung binh moi don
select
    sum(total_amount) as total_revenue,
    count(*) as total_orders,
    avg(total_amount) as average_order_value
from orders;

-- nhom theo nam dat hang, hien thi doanh thu tung nam
select
    extract(year from order_date) as order_year,
    sum(total_amount) as total_revenue
from orders
group by extract(year from order_date)
order by order_year;

-- chi hien thi cac nam co doanh thu tren 50 trieu
select
    extract(year from order_date) as order_year,
    sum(total_amount) as total_revenue
from orders
group by extract(year from order_date)
having sum(total_amount) > 50000000
order by order_year;

-- hien thi 5 don hang co gia tri cao nhat
select *
from orders
order by total_amount desc
limit 5;