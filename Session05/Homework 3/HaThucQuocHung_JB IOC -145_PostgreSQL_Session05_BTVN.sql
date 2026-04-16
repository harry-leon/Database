CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(150) NOT NULL,
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_price DECIMAL(12, 2),
	CONSTRAINT fk_customers FOREIGN key (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT CHECK (quantity > 0),
    price DECIMAL(12, 2) CHECK (price >= 0),
	CONSTRAINT fk_orders FOREIGN key (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Nguyễn Văn A', 'Hà Nội'),
(2, 'Trần Thị B', 'Đà Nẵng'),
(3, 'Lê Văn C', 'Hồ Chí Minh'),
(4, 'Phạm Thị D', 'Hà Nội');
INSERT INTO orders (order_id, customer_id, order_date, total_price) VALUES
(101, 1, '2024-12-20', 3000),
(102, 2, '2025-01-05', 1500),
(103, 1, '2025-02-10', 2500),
(104, 3, '2025-02-15', 4000),
(105, 4, '2025-03-01', 800);
INSERT INTO order_items (item_id, order_id, product_id, quantity, price) VALUES
(1, 101, 1, 2, 1500),
(2, 102, 2, 1, 1500),
(3, 103, 3, 5, 500),
(4, 104, 2, 4, 1000);

-- Viết truy vấn hiển thị tổng doanh thu và tổng số đơn hàng của mỗi khách hàng:
-- Chỉ hiển thị khách hàng có tổng doanh thu > 2000
-- Dùng ALIAS: total_revenue và order_count
SELECT 
	c.customer_name,
	SUM(o.total_price) as total_revenue, 
	count(o.order_id) as order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING SUM(o.total_price) > 2000;

-- Viết truy vấn con (Subquery) để tìm doanh thu trung bình của tất cả khách hàng
-- Sau đó hiển thị những khách hàng có doanh thu lớn hơn mức trung bình đó
Select
    c.customer_name,
    SUM(o.total_price) AS total_revenue
from customers c 
join orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having sum(o.total_price) > (
	select avg(t.total_revenue)
	From(
		SELECT 
		    customer_id,
		    SUM(total_price) AS total_revenue
		FROM orders
		GROUP BY customer_id
	) t
);

-- Dùng HAVING + GROUP BY để lọc ra thành phố 
-- có tổng doanh thu cao nhất
SELECT c.city, SUM(o.total_price) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING SUM(o.total_price) = (
	SELECT max(total_revenue)
	FROM (
        SELECT 
            c.city,
            SUM(o.total_price) AS total_revenue
        FROM customers c
        JOIN orders o ON c.customer_id = o.customer_id
        GROUP BY c.city
	) t
);

-- (Mở rộng) Hãy dùng INNER JOIN giữa customers, orders, order_items để hiển thị chi tiết:
-- Tên khách hàng, tên thành phố, tổng sản phẩm đã mua, tổng chi tiêu
SELECT 
    c.customer_name,
    c.city,
    SUM(oi.quantity) AS total_products,
    SUM(oi.quantity * oi.price) AS total_spent
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name, c.city;