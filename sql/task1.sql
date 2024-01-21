-- Problem 1: Retrieve all products in the Sports category
-- Write an SQL query to retrieve all products in a specific category.

-- select all products in the sports category, which has an id of 8
SELECT * 
FROM Products 
WHERE category_id = 8

-- Problem 2: Retrieve the total number of orders for each user
-- Write an SQL query to retrieve the total number of orders for each user.
-- The result should include the user ID, username, and the total number of orders.

-- join users and orders to obtain information about each user who has made orders
-- count the number of order ids (unique orders) for each user
SELECT 
    Users.user_id, 
    Users.username, 
    COUNT(Orders.order_id) AS total_orders 
FROM Users 
LEFT JOIN Orders 
ON Users.user_id = Orders.user_id 
GROUP BY 
    Users.user_id, 
    Users.username
-- Problem 3: Retrieve the average rating for each product
-- Write an SQL query to retrieve the average rating for each product.
-- The result should include the product ID, product name, and the average rating.

-- join products and reviews to obtain information about the reviews for each product
-- use average function to find average rating for each product
SELECT 
    Products.product_id, 
    Products.product_name, 
    AVG(Reviews.rating) AS average_rating
FROM Products 
LEFT JOIN Reviews 
ON Products.product_id = Reviews.product_id
GROUP BY
    Products.product_id, 
    Products.product_name
-- Problem 4: Retrieve the top 5 users with the highest total amount spent on orders
-- Write an SQL query to retrieve the top 5 users with the highest total amount spent on orders.
-- The result should include the user ID, username, and the total amount spent.

-- join users and orders to obtain information about each users orders
-- use the sum function to find the total amount each user has spent
-- order results in descending order and limit to top 5 
SELECT
    Users.user_id, 
    Users.username, 
    SUM(Orders.total_amount) AS total_spent 
FROM Users 
JOIN Orders 
ON Users.user_id = Orders.user_id
GROUP BY 
    Users.user_id, 
    Orders.order_id
ORDER BY total_spent DESC
LIMIT 5