-- Bảng khách hàng
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

-- Bảng đơn hàng
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    total_amount NUMERIC(10,2)
);

-- Bảng chi tiết đơn hàng
CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_name VARCHAR(100),
    quantity INT,
    price NUMERIC(10,2)
);

SELECT 
    c.customer_name AS ten_khach,
    o.order_date AS ngay_dat_hang,
    o.total_amount AS tong_tien
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

SELECT 
    SUM(total_amount) AS tong_doanh_thu,
    AVG(total_amount) AS trung_binh_don_hang,
    MAX(total_amount) AS don_hang_lon_nhat,
    MIN(total_amount) AS don_hang_nho_nhat,
    COUNT(order_id) AS so_luong_don_hang
FROM orders;

SELECT 
    c.city AS thanh_pho,
    SUM(o.total_amount) AS tong_doanh_thu
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING SUM(o.total_amount) > 10000;


SELECT 
    c.customer_name AS ten_khach_hang,
    o.order_date AS ngay_dat_hang,
    oi.product_name AS ten_san_pham,
    oi.quantity AS so_luong,
    oi.price AS gia
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id;


SELECT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.total_amount) = (
    SELECT MAX(tong_doanh_thu)
    FROM (
        SELECT SUM(total_amount) AS tong_doanh_thu
        FROM orders
        GROUP BY customer_id
    ) AS doanh_thu_khach
);