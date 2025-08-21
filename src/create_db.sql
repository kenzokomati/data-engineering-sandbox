DROP TABLE IF EXISTS dim_customers;
DROP TABLE IF EXISTS dim_dates;
DROP TABLE IF EXISTS dim_products;
DROP TABLE IF EXISTS dim_stores;
DROP TABLE IF EXISTS fact_sales;

CREATE TABLE IF NOT EXISTS dim_customers (
  customer_id INTEGER PRIMARY KEY,
  customer_name TEXT NOT NULL,
  email TEXT NULL,
  city TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS dim_dates (
  date_id INTEGER PRIMARY KEY,
  full_date DATE NOT NULL,
  timestamp_utc DATETIME NOT NULL,
  month_name TEXT,
  year INTEGER
);

CREATE TABLE IF NOT EXISTS dim_products (
  product_id INTEGER PRIMARY KEY,
  product_name TEXT NOT NULL,
  category TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS dim_stores (
  store_id INTEGER PRIMARY KEY,
  store_name TEXT NOT NULL,
  region TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS fact_sales (
  sale_id INTEGER PRIMARY KEY,
  date_id INTEGER,
  customer_id INTEGER,
  product_id INTEGER,
  store_id INTEGER,
  units_sold INTEGER NOT NULL,
  total_price DECIMAL(19,4),
  FOREIGN KEY (date_id) REFERENCES dim_dates(date_id),
  FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES dim_products(product_id),
  FOREIGN KEY (store_id) REFERENCES dim_stores(store_id)
);

INSERT INTO dim_customers(customer_id,customer_name,email,city) 
VALUES(101,'Alice Dubois','alice.d@email.com','Paris'),
(102,'Bob Martin','bob.m@email.com','Lyon'),
(103,'Charlie Girard','','Paris'),
(104,'Diana Morel','diana.m@email.com','Marseille'),
(105,'Eva Petit','eva.p@email.com','Lyon');

SELECT * FROM dim_customers;

INSERT INTO dim_dates(date_id,full_date,timestamp_utc,month_name,year)
VALUES(20250812,'2025-08-12','2025-08-12 10:30:00','August',2025),
(20250813,'2025-08-13','2025-08-13 14:45:15','August',2025),
(20250814,'2025-08-14','2025-08-14 11:05:30','August',2025),
(20250815,'2025-08-15','2025-08-15 18:20:00','August',2025),
(20250816,'2025-08-16','2025-08-16 16:00:45','August',2025),
(20250817,'2025-08-17','2025-08-17 10:00:00','August',2025);

SELECT * FROM dim_dates;

INSERT INTO dim_products(product_id,product_name,category)
VALUES(1,'Laptop Pro','Electronics'),
(2,'USB-C Cable','Accessories'),
(3,'Coffee Machine','Home Goods'),
(4,'Wireless Mouse','Electronics'),
(5,'T-Shirt','Apparel'),
(6,'Running Shoes','Apparel');

SELECT * FROM dim_products;

INSERT INTO dim_stores(store_id,store_name,region)
VALUES(1,'Bastille Central','North'),
(2,'Vieux Port Outlet','South'),
(3,'Part-Dieu Mall','North');

SELECT * FROM dim_stores;

INSERT INTO fact_sales(sale_id,date_id,customer_id,product_id,store_id,units_sold,total_price)
VALUES(1,20250812,101,1,1,2,2400.00),
(2,20250812,102,3,2,1,80.00),
(3,20250813,101,2,1,1,25.50),
(4,20250813,103,4,3,1,150.00),
(5,20250814,104,5,2,3,45.00),
(6,20250814,102,1,1,1,1200.00),
(7,20250815,105,6,3,1,70.00),
(8,20250815,103,2,1,2,51.00),
(9,20250816,101,4,2,1,150.00),
(10,20250816,104,3,1,1,80.00),
(11,20250817,102,5,3,2,30.00),
(12,20250817,105,1,2,1,1200.00);

SELECT * FROM fact_sales;