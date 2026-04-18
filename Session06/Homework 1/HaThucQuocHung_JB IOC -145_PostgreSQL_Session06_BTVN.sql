CREATE TABLE Product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2),
    stock INT
);

INSERT INTO Product (name, category, price, stock) VALUES
('Laptop Dell XPS 13', 'Electronics', 25000000.00, 10),
('iPhone 15', 'Electronics', 30000000.00, 15),
('Áo thun nam', 'Fashion', 200000.00, 50),
('Giày thể thao', 'Fashion', 1200000.00, 30),
('Bàn phím cơ', 'Accessories', 1500000.00, 20);

-- 1. Hiển thị toàn bộ sản phẩm
SELECT * FROM Product;

-- 2. Hiển thị 3 sản phẩm có giá cao nhất
SELECT * 
FROM Product
ORDER BY price DESC
LIMIT 3;

-- 3. Sản phẩm thuộc danh mục “Điện tử” và giá < 10,000,000
SELECT *
FROM Product
WHERE category = 'Điện tử' AND price < 10000000;

-- 4. Sắp xếp theo số lượng tồn kho tăng dần
SELECT *
FROM Product
ORDER BY stock ASC;