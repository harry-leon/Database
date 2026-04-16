-- Thêm cột genre (varchar) vào bảng Books
Alter table library.books add column genre varchar(255);
-- Đổi tên cột available thành is_available
Alter table library books rename column available to is_available;
-- Xóa cột email khỏi bảng Members
alter table library.members drop column email;
-- Xóa bảng OrderDetails khỏi schema sales
drop table sales.orderdetails;