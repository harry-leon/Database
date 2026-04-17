select product_name as  "Tên SP",
	price as "Đơn giá",
	(stock_quantity*1.1) as "Giá VAT"
from products 

-- Đếm tổng số khách hàng hiện có theo từng thành phố (Sắp xếp giảm dần theo số lượng).
select city, count(customer_id)
from customers
group by city

-- Tính giá cao nhất, thấp nhất và trung bình của các sản phẩm có trong kho.
select Max(price) as "Giá Cao Nhất",
	Min(price) as "Giá Thấp Nhất",
	Avg(price) as "Giá Trung Bình"
From products

-- Thống kê số lượng đơn hàng theo từng trạng thái (Status).
select status, count(order_id)
from orders
group by status