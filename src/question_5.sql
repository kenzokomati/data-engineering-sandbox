-- Advanced Analysis (Window Functions): To optimize our inventory, we need to know our top-performing products.
-- Can you identify the top 2 products by total sales revenue within each product category?

WITH sales_category AS (
  SELECT product.product_name, product.category, SUM(sale.total_price) AS product_revenue, 
    ROW_NUMBER() OVER(
    PARTITION BY product.category
    ORDER BY SUM(sale.total_price)) AS top_sellers
  FROM fact_sales as sale
  JOIN dim_products as product
  ON sale.product_id = product.product_id
  GROUP BY product.product_id, product.product_name, product.category
)

SELECT * FROM sales_category WHERE top_sellers < 3;