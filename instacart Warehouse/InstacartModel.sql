
CREATE DATABASE instaCart_Warehouse;
USE instaCart_Warehouse;


CREATE TABLE dim_products (
    product_id INT PRIMARY KEY,
    department_name VARCHAR(910),
	aisle_name VARCHAR(910),
    product_name VARCHAR(910),
    aisle_id INT,
    department_id INT
);

CREATE TABLE fact_orders (
    order_id INT,
    user_id INT,
    product_id INT,
    add_to_cart_order INT,
    reordered BIT,
    order_dow INT ,  -- Day of the week
    order_hour_of_day INT,
	is_holiday BIT,
    days_since_prior_order INT,
    order_number INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (product_id) REFERENCES dim_products(product_id),
);
