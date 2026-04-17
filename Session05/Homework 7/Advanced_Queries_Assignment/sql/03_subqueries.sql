-- Tìm thông tin sản phẩm có giá cao hơn giá trung bình của tất cả sản phẩm trong hệ thống.
select product_name, price
from products 
where price > (
	select avg(price)
	from products 
)

-- Tìm các khách hàng chưa từng phát sinh bất kỳ đơn hàng nào (Sử dụng NOT EXISTS).\
select c.customer_id, c.customer_name
from customers c
where not exists (
	select 
	from orders o
	where o.customer_id = c.customer_id
);

-- Liệt kê các sản phẩm có giá cao hơn giá trung bình của chính danh mục mà sản phẩm đó thuộc về (Correlated Subquery).
SELECT *
FROM products p1
WHERE p1.price > (
    SELECT AVG(p2.price)
    FROM products p2
    WHERE p2.category_id = p1.category_id
);


-- Tìm khách hàng đã thực hiện đơn hàng có giá trị lớn nhất trong toàn bộ hệ thống.
SELECT 
    c.customer_name,
    o.order_id,
    o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.total_amount = (
    SELECT MAX(total_amount)
    FROM orders
);

