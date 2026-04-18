-- HaThucQuocHung_JB IOC -145_PostgreSQL_Session06_BTVN.sql
-- Homework 9 for Session 06

drop table if exists orderdetail;
drop table if exists product;

create table product (
    id serial primary key,
    name varchar(100),
    category varchar(50),
    price numeric(10,2)
);

create table orderdetail (
    id serial primary key,
    order_id int,
    product_id int,
    quantity int
);

-- du lieu mau
insert into product (name, category, price)
values
    ('laptop dell xps 13', 'electronics', 25000000),
    ('iphone 15', 'electronics', 30000000),
    ('ban phim co', 'accessories', 1500000),
    ('chuot khong day', 'accessories', 800000),
    ('ao thun nam', 'fashion', 200000),
    ('giay the thao', 'fashion', 1200000),
    ('khoa hoc sql', 'education', 900000);

insert into orderdetail (order_id, product_id, quantity)
values
    (101, 1, 3),
    (101, 3, 5),
    (102, 2, 2),
    (102, 4, 10),
    (103, 6, 20),
    (104, 1, 1),
    (104, 2, 1),
    (105, 3, 8);

-- 1) tong doanh thu tung san pham: product_name, total_sales (sum(price * quantity))
select
    p.name as product_name,
    coalesce(sum(p.price * od.quantity), 0) as total_sales
from product p
left join orderdetail od on od.product_id = p.id
group by p.id, p.name
order by total_sales desc;

-- 2) doanh thu trung binh theo tung loai san pham (avg doanh thu theo san pham trong category)
select
    t.category,
    avg(t.total_sales) as avg_category_sales
from (
    select
        p.id,
        p.category,
        coalesce(sum(p.price * od.quantity), 0) as total_sales
    from product p
    left join orderdetail od on od.product_id = p.id
    group by p.id, p.category
) t
group by t.category
order by avg_category_sales desc;

-- 3) chi hien thi cac loai san pham co doanh thu trung binh > 20 trieu (having)
select
    t.category,
    avg(t.total_sales) as avg_category_sales
from (
    select
        p.id,
        p.category,
        coalesce(sum(p.price * od.quantity), 0) as total_sales
    from product p
    left join orderdetail od on od.product_id = p.id
    group by p.id, p.category
) t
group by t.category
having avg(t.total_sales) > 20000000
order by avg_category_sales desc;

-- 4) ten san pham co doanh thu cao hon doanh thu trung binh toan bo san pham (subquery)
select
    t.product_name,
    t.total_sales
from (
    select
        p.id,
        p.name as product_name,
        coalesce(sum(p.price * od.quantity), 0) as total_sales
    from product p
    left join orderdetail od on od.product_id = p.id
    group by p.id, p.name
) t
where t.total_sales > (
    select avg(x.total_sales)
    from (
        select
            p.id,
            coalesce(sum(p.price * od.quantity), 0) as total_sales
        from product p
        left join orderdetail od on od.product_id = p.id
        group by p.id
    ) x
)
order by t.total_sales desc;

-- 5) toan bo san pham va so luong ban duoc (ke ca san pham chua co don hang)
select
    p.name as product_name,
    coalesce(sum(od.quantity), 0) as total_quantity_sold
from product p
left join orderdetail od on od.product_id = p.id
group by p.id, p.name
order by total_quantity_sold desc, product_name;
