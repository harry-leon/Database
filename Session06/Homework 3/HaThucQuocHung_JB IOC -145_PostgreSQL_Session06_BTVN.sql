create table Customer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    points INT
);

-- Them 7 khach hang (co 1 nguoi khong co email)
insert into Customer (name, email, phone, points)
values
    ('Nguyen Minh An', 'an.nguyen@example.com', '0901000001', 120),
    ('Tran Hoai Nam', 'nam.tran@example.com', '0901000002', 450),
    ('Le Thu An', NULL, '0901000003', 300),
    ('Pham Quang Huy', 'huy.pham@example.com', '0901000004', 500),
    ('Vo Thanh An', 'an.vo@example.com', '0901000005', 250),
    ('Do Mai Linh', 'linh.do@example.com', '0901000006', 380),
    ('Bui Gia Bao', 'bao.bui@example.com', '0901000007', 410);

-- Truy van danh sach ten khach hang duy nhat (DISTINCT)
select distinct name
from Customer;

-- Tim khach hang chua co email (IS NULL)
select *
from Customer
where email is null;

-- Hien thi 3 khach hang co diem thuong cao nhat, bo qua khach hang cao diem nhat
select *
from Customer
order by points desc
limit 3 offset 1;

-- Sap xep danh sach khach hang theo ten giam dan
select *
from Customer
order by name desc;
