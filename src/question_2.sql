-- Filtering Data: To create a targeted marketing campaign, we need a list of customers from 
-- Paris who have a valid email address. Can you provide their names and emails?

SELECT customer_name, email 
FROM dim_customers 
WHERE (email IS NOT NULL AND email != '') AND city = 'Paris';
