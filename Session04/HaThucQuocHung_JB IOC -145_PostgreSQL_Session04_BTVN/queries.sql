-- 1. Tìm khách hàng theo tên (không phân biệt hoa thường)
SELECT * FROM customers 
WHERE full_name ILIKE '%Nguyen%';

-- 2. Lọc sản phẩm theo khoảng giá
SELECT * FROM products 
WHERE price BETWEEN 1000000 AND 10000000;

-- 3. Tìm khách hàng chưa có số điện thoại
SELECT * FROM customers 
WHERE phone IS NULL;

-- 4. Top 5 sản phẩm có giá cao nhất
SELECT * FROM products 
ORDER BY price DESC 
LIMIT 5;

-- 5. Phân trang danh sách đơn hàng (Trang 2, mỗi trang 10 dòng)
SELECT * FROM orders 
ORDER BY order_date DESC 
LIMIT 10 OFFSET 10;

-- 6. Đếm số lượng các thành phố khác nhau có khách hàng
SELECT COUNT(DISTINCT city) AS so_thanh_pho 
FROM customers;

-- 7. Tìm đơn hàng trong khoảng thời gian cụ thể
SELECT * FROM orders 
WHERE order_date BETWEEN '2026-01-01' AND '2026-03-31';

-- 8. Tìm sản phẩm chưa bao giờ được bán (Sử dụng NOT EXISTS)
SELECT * FROM products p
WHERE NOT EXISTS (
    SELECT 1 
    FROM order_details od 
    WHERE od.product_id = p.product_id
);