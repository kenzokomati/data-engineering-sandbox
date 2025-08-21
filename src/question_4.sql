-- Aggregation and Grouping: Management wants to understand regional performance. 
-- What is the average sale price for each product category specifically within the 'North' region?

SELECT product.category, AVG(sale.total_price) as avg_sale
FROM dim_products as product
JOIN fact_sales as sale
ON (product.product_id = sale.product_id) 
JOIN dim_stores as store
ON (store.store_id = sale.store_id)
WHERE store.region = 'North'
GROUP BY product.category;