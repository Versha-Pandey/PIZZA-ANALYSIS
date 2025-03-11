SELECT * FROM cares.`data model - pizza sales.xlsx - pizza_sales`;

ALTER table cares.`data model - pizza sales.xlsx - pizza_sales`
rename to pizza_sales;

SELECT * FROM pizza_sales;

# 1Q. TOTAL REVENUE

SELECT 
    ROUND(SUM(total_price), 0) AS totalrevenue
FROM
    pizza_sales;
    
# 2Q. AVERAGE ORDER VALUES
    
SELECT 
    ROUND(SUM(total_price) / COUNT(DISTINCT order_id),
            2) AS avg_order_value
FROM
    pizza_sales;
    
# 3Q. TOTAL PIZZA SOLD
    
SELECT 
    SUM(quantity) AS total_pizza_sold
FROM
    pizza_sales;

# 4Q. TOTAL ORDERS

SELECT 
    COUNT(DISTINCT ORDER_ID) AS total_orders
FROM
    pizza_sales;
    
# 5Q. AVG PIZZA PER ORDER

SELECT 
    ROUND(SUM(quantity) / COUNT(DISTINCT order_id),
            2) AS avg_pizza_per_order
FROM
    pizza_sales;
    
# 6Q. HOURLY TREND FOR TOTAL ORDER.

SELECT 
    HOUR(order_time) AS hour,
    COUNT(DISTINCT order_id) AS total_order
FROM
    pizza_sales
GROUP BY hour
ORDER BY total_order DESC;


# 7Q. % OF SALES BY PIZZA CATEGORY
 
SELECT 
    pizza_category AS category,
    ROUND(SUM(total_price), 0) AS revenue,
    ROUND(SUM(total_price) * 100 / (SELECT 
                    SUM(total_price)
                FROM
                    pizza_sales),
            2) AS pct
FROM
    pizza_sales
GROUP BY category; 

# 8Q. % OF TOTAL PIZZA SOLD BY PIZZA CATEGORY.


SELECT 
    pizza_category,
    SUM(quantity) AS total_quantity_sold,
    ROUND(SUM(quantity) * 100 / (SELECT 
                    SUM(quantity)
                FROM
                    pizza_sales),
            2) AS pct
FROM
    pizza_sales
GROUP BY pizza_category;

 # 9Q. % OF SALES BY PIZZA SIZE.
 
SELECT 
    pizza_size,
    ROUND(SUM(total_price), 0) AS revenue,
    ROUND(SUM(total_price) * 100 / (SELECT 
                    SUM(total_price)
                FROM
                    pizza_sales),
            2) AS pct
FROM
    pizza_sales
GROUP BY pizza_size;

 # 10Q.  % OF TOTAL PIZZA SOLD BY SIZE
 
SELECT 
    pizza_size,
    ROUND(SUM(Quantity), 0) As total_order_sold,
    ROUND(SUM(Quantity) * 100 / (SELECT 
                    SUM(Quantity)
                FROM
                    pizza_sales),
            2) AS pct
FROM
    pizza_sales
GROUP BY pizza_size;

# 11. TOP 5 PIZZA BY REVENUE.

SELECT 
    pizza_name, SUM(total_price) AS revenue
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY revenue DESC
LIMIT 5;

#12. BOTTOM 5 PIZZA BY REVENUE

SELECT 
    pizza_name, SUM(total_price) AS revenue
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY revenue asc
LIMIT 5;

# 13.TOP 5 PIZZAS BY TOTAL ORDERS.

SELECT 
    pizza_name, COUNT(distinct order_id) orders
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY orders DESC
LIMIT 5;

# 14.BOTTOM 5 PIZZAS BY TOTAL ORDERS.

SELECT 
    pizza_name, COUNT(distinct order_id) orders
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY orders ASC
LIMIT 5;

#15. TOP 5 PIZZAS BY QUANTITY.
SELECT 
    pizza_name, SUM(quantity) AS total_order_sold
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY total_order_sold DESC
LIMIT 5;

#16. BOTTOM 5 PIZZAS BY QUANTITY.
SELECT 
    pizza_name, SUM(quantity) AS total_order_sold
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY total_order_sold 
LIMIT 5;
