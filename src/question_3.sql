-- Joining and Sorting: The sales team wants to review all transactions from the 'Electronics' category.
-- Can you list each sale, showing the product name and its total price, ordered from most expensive to least?

SELECT product.product_name, sale.total_price 
FROM dim_products as product
JOIN fact_sales as sale
ON (product.product_id = sale.product_id)
WHERE product.category = 'Electronics'
ORDER BY sale.total_price DESC;