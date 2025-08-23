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

.mode csv
.import --skip 1 C:\Users\user\OneDrive\Documentos\GitHub\data-engineering-sandbox\data\dim_customers.csv dim_customers
.import --skip 1 C:\Users\user\OneDrive\Documentos\GitHub\data-engineering-sandbox\data\dim_dates.csv dim_dates
.import --skip 1 C:\Users\user\OneDrive\Documentos\GitHub\data-engineering-sandbox\data\dim_products.csv dim_products
.import --skip 1 C:\Users\user\OneDrive\Documentos\GitHub\data-engineering-sandbox\data\dim_stores.csv dim_stores
.import --skip 1 C:\Users\user\OneDrive\Documentos\GitHub\data-engineering-sandbox\data\fact_sales.csv fact_sales