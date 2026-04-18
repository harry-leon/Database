-- HaThucQuocHung_JB IOC -145_PostgreSQL_Session06_BTVN.sql
-- Homework 10 for Session 06

drop table if exists oldcustomers;
drop table if exists newcustomers;

create table oldcustomers (
    id serial primary key,
    name varchar(100),
    city varchar(50)
);

create table newcustomers (
    id serial primary key,
    name varchar(100),
    city varchar(50)
);

-- du lieu mau (co khach trung giua 2 bang)
insert into oldcustomers (name, city)
values
    ('nguyen minh an', 'ha noi'),
    ('tran hoai nam', 'ha noi'),
    ('le thu an', 'da nang'),
    ('pham quang huy', 'tp hcm'),
    ('bui gia bao', 'tp hcm'),
    ('do mai linh', 'ha noi');

insert into newcustomers (name, city)
values
    ('nguyen minh an', 'ha noi'),
    ('vo thanh an', 'da nang'),
    ('pham quang huy', 'tp hcm'),
    ('nguyen thi hoa', 'can tho'),
    ('le quang huy', 'tp hcm'),
    ('tran thi lan', 'ha noi');

-- 1) danh sach tat ca khach hang (cu + moi) khong trung lap (union)
select name, city
from oldcustomers
union
select name, city
from newcustomers;

-- 2) khach hang vua thuoc oldcustomers vua thuoc newcustomers (intersect)
select name, city
from oldcustomers
intersect
select name, city
from newcustomers;

-- 3) so luong khach hang o tung thanh pho (group by city)
select
    city,
    count(*) as customer_count
from (
    select name, city from oldcustomers
    union all
    select name, city from newcustomers
) t
group by city
order by customer_count desc, city;

-- 4) thanh pho co nhieu khach hang nhat (subquery va max)
select c.city, c.customer_count
from (
    select
        city,
        count(*) as customer_count
    from (
        select name, city from oldcustomers
        union all
        select name, city from newcustomers
    ) t
    group by city
) c
where c.customer_count = (
    select max(customer_count)
    from (
        select
            city,
            count(*) as customer_count
        from (
            select name, city from oldcustomers
            union all
            select name, city from newcustomers
        ) t2
        group by city
    ) m
);
