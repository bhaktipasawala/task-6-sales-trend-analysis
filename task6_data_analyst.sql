CREATE DATABASE salesdb;
CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);
INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1, '2024-01-05', 200.00, 101),
(2, '2024-01-15', 150.00, 102),
(3, '2024-02-10', 300.00, 103),
(4, '2024-02-20', 250.00, 104),
(5, '2024-03-01', 400.00, 105),
(6, '2024-03-15', 500.00, 106),
(7, '2024-04-05', 600.00, 107),
(8, '2024-04-10', 450.00, 108),
(9, '2024-05-01', 700.00, 109),
(10, '2024-05-20', 800.00, 110);

SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales
WHERE 
    order_date BETWEEN '2024-01-01' AND '2024-05-31'
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    order_year,
    order_month;


