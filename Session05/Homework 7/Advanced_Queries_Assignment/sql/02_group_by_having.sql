
-- (Inner Join): Hiển thị 10 đơn hàng gần nhất gồm: Mã đơn, Tên khách hàng, Email và Tổng giá trị đơn hàng.
select 
	o.order_id as "Mã đơn", 
	c.customer_name "Tên khách hàng", 
	c.email as "Email", 
	sum(o.total_amount) as "Tổng giá trị đơn hàng"
from orders o
join customers c on o.customer_id = c.customer_id 
group by o.order_id, c.customer_name, c.email
order by order_date desc 
Limit 10
-- (Left Join): Liệt kê tất cả danh mục (Categories) và số lượng sản phẩm thuộc danh mục đó (Kể cả danh mục chưa có sản phẩm).
select c.category_name, count(c.category_name)
from Categories c
left join products p on c.category_id = p.category_id
group by c.category_name

--(Group By & Having): Tìm các khách hàng đã đặt từ 3 đơn hàng trở lên và có tổng chi tiêu (total_amount) > 5.000.000 VNĐ.
select c.customer_name, count(o.order_id), sum(o.total_amount)
from customers c
join orders o On c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having 
	COUNT(o.order_id) >= 3 
    AND SUM(o.total_amount) > 5000000;


-- Thống kê tổng doanh thu theo từng tên danh mục sản phẩm (Nối 4 bảng: Categories, Products, Order_Items, Orders).
select category_name, sum(oi.quantity * oi.unit_price) as "Doanh thu"
from categories c
JOIN products p  ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
GROUP BY c.category_id, c.category_name