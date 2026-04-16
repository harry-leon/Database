CREATE TABLE products(
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(150) NOT NULL,
	category VARCHAR(150) NOT NULL
);

CREATE TABLE orders(
	order_id SERIAL PRIMARY KEY,
	product_id INT NOT NULL,
	quantity INT CHECK (quantity > 0),
	total_price DECIMAL(10, 2) CHECK (total_price > 0),
	CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products(product_name, category) VALUES
('Laptop Dell', 'Electronics'), 
('IPhone 15', 'Electronics'), 
('Bàn học gỗ','Furniture'), 
('Ghế xoay','Furniture');

INSERT INTO orders(order_id, product_id, quantity, total_price) VALUES
(101, 1, 2, 2200),
(102, 2, 3, 3300),
(103, 3, 5, 2500),
(104, 4, 4, 1600),
(105, 1, 1, 1100);

-- Viết truy vấn hiển thị tổng doanh thu (SUM(total_price)) và số lượng sản phẩm bán được 
-- (SUM(quantity)) cho từng nhóm danh mục (category)
SELECT 
	p.category , 
	SUM(o.total_price) AS total_sales, 
	SUM(o.quantity) AS total_quantity
FROM products p
JOIN orders o ON p.product_id = o.product_id 
GROUP BY p.category

-- Chỉ hiển thị những nhóm có tổng doanh thu lớn hơn 2000
SELECT 
	p.category , 
	SUM(o.total_price) AS total_sales, 
	SUM(o.quantity) AS total_quantity
FROM products p
JOIN orders o ON p.product_id = o.product_id 
GROUP BY p.category
HAVING SUM(o.total_price) > 2000


-- Sắp xếp kết quả theo tổng doanh thu giảm dần
SELECT 
	p.category , 
	SUM(o.total_price) AS total_sales, 
	SUM(o.quantity) AS total_quantity
FROM products p
JOIN orders o ON p.product_id = o.product_id 
GROUP BY p.category
HAVING SUM(o.total_price) > 2000
ORDER BY total_sales DESC;