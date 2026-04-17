
-- 1. Categories
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(150) NOT NULL,
    description TEXT
);

-- 2. Products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(12,2) CHECK (price >= 0),
    stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0),
    CONSTRAINT fk_category
        FOREIGN KEY (category_id) 
        REFERENCES categories(category_id)
);

-- 3. Customers
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE,
    city VARCHAR(100),
    join_date DATE DEFAULT CURRENT_DATE
);

-- 4. Orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE,
    total_amount DECIMAL(12,2) CHECK (total_amount >= 0),
    status VARCHAR(50),
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id) 
        REFERENCES customers(customer_id)
);

-- 5. Order Items
CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT CHECK (quantity > 0),
    unit_price DECIMAL(12,2) CHECK (unit_price >= 0),
    CONSTRAINT fk_order
        FOREIGN KEY (order_id) 
        REFERENCES orders(order_id),
    CONSTRAINT fk_product
        FOREIGN KEY (product_id) 
        REFERENCES products(product_id)
);

-- Sample Data Insertion
-- 1. Dữ liệu cho bảng categories
INSERT INTO categories (category_name, description) VALUES
('Điện tử', 'Các sản phẩm điện tử và công nghệ'),
('Gia dụng', 'Đồ dùng gia đình và nhà bếp'),
('Thời trang', 'Quần áo, giày dép và phụ kiện'),
('Sách', 'Sách học tập, kỹ năng và giải trí');

-- 2. Dữ liệu cho bảng products
INSERT INTO products (product_name, category_id, price, stock_quantity) VALUES
('Điện thoại Samsung Galaxy', 1, 8500000, 20),
('Laptop Dell Inspiron', 1, 16500000, 10),
('Tai nghe Bluetooth', 1, 1200000, 50),
('Nồi cơm điện Sharp', 2, 1800000, 15),
('Máy xay sinh tố Philips', 2, 950000, 25),
('Áo thun nam cổ tròn', 3, 250000, 100),
('Quần jean nữ', 3, 420000, 60),
('Giày thể thao', 3, 780000, 40),
('Sách học SQL cơ bản', 4, 150000, 30),
('Sách kỹ năng giao tiếp', 4, 120000, 35);

-- 3. Dữ liệu cho bảng customers
INSERT INTO customers (customer_name, email, city, join_date) VALUES
('Nguyễn Văn An', 'an.nguyen@example.com', 'Hà Nội', '2024-01-15'),
('Trần Thị Bình', 'binh.tran@example.com', 'Đà Nẵng', '2024-03-10'),
('Lê Hoàng Minh', 'minh.le@example.com', 'Hồ Chí Minh', '2024-05-22'),
('Phạm Thu Trang', 'trang.pham@example.com', 'Cần Thơ', '2024-07-01'),
('Võ Quốc Bảo', 'bao.vo@example.com', 'Hải Phòng', '2024-09-18');

-- 4. Dữ liệu cho bảng orders
INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(1, '2025-01-05', 9700000, 'Đã giao'),
(2, '2025-01-10', 1800000, 'Đã giao'),
(3, '2025-01-15', 16950000, 'Đang xử lý'),
(1, '2025-02-02', 400000, 'Đã giao'),
(4, '2025-02-12', 780000, 'Đã hủy'),
(5, '2025-02-20', 270000, 'Đã giao'),
(3, '2025-03-01', 1200000, 'Đã giao'),
(2, '2025-03-08', 950000, 'Đang giao');

-- 5. Dữ liệu cho bảng order_items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 8500000),
(1, 3, 1, 1200000),

(2, 4, 1, 1800000),

(3, 2, 1, 16500000),
(3, 9, 1, 150000),
(3, 10, 1, 120000),
(3, 6, 1, 180000),

(4, 6, 1, 250000),
(4, 10, 1, 120000),
(4, 9, 1, 150000),

(5, 8, 1, 780000),

(6, 9, 1, 150000),
(6, 10, 1, 120000),

(7, 3, 1, 1200000),

(8, 5, 1, 950000);