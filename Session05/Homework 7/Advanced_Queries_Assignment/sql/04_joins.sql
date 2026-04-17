-- 1) UNION Gộp email khách hàng và email nhà cung cấp để gửi NewsLetter.
SELECT email
FROM customers
WHERE email IS NOT NULL
UNION
SELECT email
FROM suppliers
WHERE email IS NOT NULL;

-- 2) INTERSECT Tìm customer_id vừa mua sản phẩm thuộc danh mục 'Electronics' vừa mua sản phẩm thuộc danh mục 'Books'.
SELECT o.customer_id
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
WHERE c.category_name = 'Điện tử'
INTERSECT
SELECT o.customer_id
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
WHERE c.category_name = 'Sách';

-- ) EXCEPT Tìm các sản phẩm có trong kho nhưng chưa từng xuất hiện trong bất kỳ đơn hàng nào.
SELECT product_id, product_name
FROM products
WHERE stock_quantity > 0

EXCEPT

SELECT p.product_id, p.product_name
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id;