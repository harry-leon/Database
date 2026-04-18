-- DML
INSERT INTO customers (full_name, email, phone, city, join_date) VALUES
('Nguyen Van A', 'vana@gmail.com', '0901234567', 'Ho Chi Minh', '2026-01-10'),
('Tran Thi B', 'thib@gmail.com', '0902234567', 'Ha Noi', '2026-01-15'),
('Le Van C', 'vanc@gmail.com', '0903234567', 'Da Nang', '2026-02-01'),
('Pham Minh D', 'minhd@gmail.com', '0904234567', 'Can Tho', '2026-02-10'),
('Hoang Thi E', 'thie@gmail.com', '0905234567', 'Hue', '2026-02-15'),
('Vu Van F', 'vanf@gmail.com', '0906234567', 'Hai Phong', '2026-03-01'),
('Dang Thi G', 'thig@gmail.com', '0907234567', 'Nha Trang', '2026-03-05'),
('Bui Van H', 'vanh@gmail.com', '0908234567', 'Da Lat', '2026-03-10'),
('Ngo Thi I', 'thii@gmail.com', '0909234567', 'Vung Tau', '2026-03-15'),
('Ly Van K', 'vank@gmail.com', '0910234567', 'Bien Hoa', '2026-04-01');
INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('iPhone 15', 'Electronics', 25000000, 10),
('Samsung S23', 'Electronics', 20000000, 15),
('Macbook M3', 'Electronics', 35000000, 5),
('Sony Headphone', 'Electronics', 5000000, 20),
('Dell XPS 13', 'Electronics', 30000000, 0),
('T-Shirt Nike', 'Fashion', 500000, 50),
('Jean Levi''s', 'Fashion', 1200000, 30),
('Adidas Sneaker', 'Fashion', 2500000, 12),
('Uniqlo Jacket', 'Fashion', 1000000, 25),
('Zara Dress', 'Fashion', 1500000, 18),
('Table Lamp', 'Home Decor', 350000, 40),
('Wall Clock', 'Home Decor', 200000, 0),
('Ceramic Vase', 'Home Decor', 450000, 15),
('Sofa Bed', 'Home Decor', 8000000, 3),
('Floor Rug', 'Home Decor', 1200000, 10);
INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(1, '2026-04-01', 25000000, 'PENDING'),
(2, '2026-04-02', 1200000, 'CONFIRMED'),
(3, '2026-04-03', 5000000, 'SHIPPING'),
(1, '2026-04-04', 500000, 'DELIVERED'),
(4, '2026-04-05', 35000000, 'PENDING'),
(5, '2026-04-06', 2500000, 'CANCELLED'),
(2, '2026-04-07', 8000000, 'PENDING'),
(6, '2026-04-08', 350000, 'CONFIRMED');

UPDATE products SET price = price * 1.1 WHERE category = 'Electronics';
UPDATE customers SET phone = '0888999000' WHERE email = 'vana@gmail.com';
UPDATE orders SET status = 'CONFIRMED' WHERE status = 'PENDING';

DELETE FROM products WHERE stock_quantity = 0;
DELETE FROM customers  WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);
