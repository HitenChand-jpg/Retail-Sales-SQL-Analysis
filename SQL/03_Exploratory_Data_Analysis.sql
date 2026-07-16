
-- ============================================================
-- Question 1: Display all transactions from the Clothing category
-- ============================================================
SELECT *
FROM retail_sales
WHERE category = 'Clothing';


-- =====================================================
-- Question 2: Find customers older than 50 years.
-- =====================================================
SELECT * 
FROM retail_sales
WHERE age>50;


-- =====================================================
-- Question 3: Display transaction ID, category, and total sale
-- for transactions with sales greater than 1000.
-- =====================================================
SELECT transactions_id,category,total_sale
FROM retail_sales
WHERE total_sale>1000;


-- ============================================================
-- Question 4: Display all Beauty transactions with quantity
-- greater than or equal to 3.
-- ============================================================
SELECT * 
FROM retail_sales
WHERE category='Beauty' AND quantity>=3;


-- ============================================================
-- Question 5: Display the transaction ID, customer ID, and
-- price per unit for Electronics products priced above 100.
-- ============================================================
SELECT transactions_id,customer_id,price_per_unit
FROM retail_sales
WHERE category='Electronics' AND price_per_unit>100;


-- ============================================================
-- Question 6: Display the top 5 transactions with the highest
-- total sales.
-- ============================================================
SELECT TOP 5
    transactions_id,
    category,
    customer_id,
    total_sale
FROM retail_sales
ORDER BY total_sale DESC;


-- ============================================================
-- Question 7: Display the transaction ID, customer ID, age,
-- category, and total sale for customers aged between 25 and
-- 40 years with total sales greater than or equal to 500.
-- ============================================================
SELECT transactions_id,customer_id,age,category,total_sale
FROM retail_sales
where (age between 25 and 40) AND (total_sale>=500);


-- ============================================================
-- Question 8: Display the transaction ID, customer ID,
-- quantity, price per unit, and total sale for Electronics
-- transactions with a quantity greater than or equal to 2 and
-- a price per unit greater than or equal to 300.
-- ============================================================
SELECT Transactions_ID, Customer_ID, Quantity, Price_per_Unit,Total_Sale
FROM retail_sales
where category='Electronics' AND quantity>=2 AND price_per_unit>=300;


-- ============================================================
-- Question 9: Display all Electronics and Clothing
-- transactions with a quantity greater than or equal to 3 and
-- total sales between 500 and 1500, sorted by total sales and
-- quantity in descending order.
-- ============================================================
select * 
from retail_sales 
where Category in ('Electronics','Clothing')
AND quantity>=3 AND total_sale between 500 and 1500 
order by total_sale desc,quantity desc;


-- ============================================================
-- Question 10: Display the transaction ID, customer ID,
-- gender, category, and total sale for male customers who
-- purchased Beauty products with total sales greater than or
-- equal to 700, sorted by total sales in descending order.
-- ============================================================
SELECT Transactions_id,customer_id,gender,category,total_sale
from retail_sales
where category='Beauty' AND gender = 'Male'
AND total_sale>=700 
order by total_sale desc;


-- ============================================================
-- Question 11: Display the total number of transactions, total
-- quantity sold, total sales, average sales, and maximum sale
-- amount for each product category, sorted by total sales in
-- descending order.
-- ============================================================
SELECT  category,COUNT(transactions_id) as total_count,SUM(quantity) as total_quantity,
SUM(total_sale) as total_sales,AVG(total_sale) as Average_sales,MAX(total_sale) as maximum_amount
from retail_sales
group by category
order by total_sales desc;


-- ============================================================
-- Question 12: Display the total number of transactions,
-- total quantity sold, total sales, average sale, and highest
-- sale for product categories with total sales of at least
-- 300,000 and an average sale greater than 450, sorted by
-- total sales in descending order.
-- ============================================================
SELECT
    category,
    COUNT(transactions_id) AS total_transactions,
    SUM(quantity) AS total_quantity,
    SUM(total_sale) AS total_sales,
    AVG(total_sale) AS average_sale,
    MAX(total_sale) AS highest_sale
from retail_sales
group by category
having SUM(total_sale)>=300000 AND AVG(total_sale)>450
ORDER BY total_sales desc;


-- ============================================================
-- Question 13: Display the total number of transactions,
-- total quantity sold, total sales, and average sale for
-- product categories with at least 650 transactions and
-- total sales greater than 300,000, sorted by total sales
-- in descending order.
-- ============================================================
SELECT
    category,
    COUNT(transactions_id) AS total_transactions,
    SUM(quantity) AS total_quantity,
    SUM(total_sale) AS total_sales,
    AVG(total_sale) AS average_sale
from retail_sales
group by category
having COUNT(transactions_id)>=650 AND SUM(total_sale)>300000
ORDER BY SUM(total_sale) desc;


-- ============================================================
-- Question 14: Display transaction details for Gold members
-- whose total sale is at least 1000, sorted by total sale
-- in descending order.
-- ============================================================
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    membership VARCHAR(20)
);

INSERT INTO customers (customer_id, customer_name, city, membership)
VALUES
(1,'Aarav','Delhi','Gold'),
(2,'Vivaan','Mumbai','Silver'),
(3,'Aditya','Pune','Gold'),
(4,'Krishna','Delhi','Platinum'),
(5,'Ishaan','Bengaluru','Silver'),
(10,'Ananya','Mumbai','Gold'),
(15,'Priya','Delhi','Silver'),
(20,'Rahul','Chennai','Gold'),
(25,'Sneha','Hyderabad','Platinum'),
(30,'Rohan','Pune','Gold'),
(37,'Neha','Delhi','Silver'),
(45,'Arjun','Mumbai','Gold'),
(50,'Karan','Jaipur','Silver'),
(57,'Meera','Chennai','Gold'),
(63,'Aisha','Lucknow','Platinum'),
(71,'Varun','Delhi','Gold'),
(75,'Nikita','Mumbai','Silver'),
(84,'Kabir','Pune','Gold'),
(96,'Simran','Hyderabad','Gold'),
(106,'Ritika','Delhi','Platinum');

SELECT
    rs.transactions_id,
    c.customer_name,
    c.city,
    rs.category,
    rs.total_sale
from retail_sales rs
join customers c 
on rs.customer_id=c.customer_id
where c.membership='gold' And rs.total_sale>=1000
order by rs.total_sale desc;


-- ============================================================
-- Question 15: Display the customer ID, customer name, city,
-- and membership details of customers who have never made a
-- purchase, sorted by customer ID.
-- ============================================================
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    c.membership
FROM customers c
LEFT JOIN retail_sales rs
ON c.customer_id = rs.customer_id
WHERE rs.customer_id IS NULL
ORDER BY c.customer_id;


-- ============================================================
-- Question 16: Display the transaction ID, customer ID,
-- category, and total sale for transactions with a total sale
-- greater than the average total sale across all transactions,
-- sorted by total sale in descending order.
-- ============================================================
SELECT
    transactions_id,
    customer_id,
    category,
    total_sale
FROM Retail_Sales
WHERE total_sale > (SELECT AVG(total_sale) FROM retail_sales)
ORDER BY total_sale DESC;


-- ============================================================
-- Question 17: Display the transaction with the highest total
-- sale in each product category.
-- ============================================================
with cte as(
SELECT
    transactions_id,
    customer_id,
    category,
    total_sale,row_number() over(partition by category order by total_sale desc) as rnk
    FROM RETAIL_sales

)

select transactions_id,
    customer_id,
    category,
    total_sale
    from cte 
where rnk=1;


-- ============================================================
-- Question 18: Compare each customer's current purchase with
-- their previous purchase and classify the purchase trend as
-- Increased, Decreased, Same, or First Purchase.
-- ============================================================
WITH cte AS
(
    SELECT
        customer_id,
        transactions_id,
        sale_date,
        total_sale,
        LAG(total_sale) OVER
        (
            PARTITION BY customer_id
            ORDER BY sale_date
        ) AS previous_sale
    FROM retail_sales
)

SELECT *,
CASE
    WHEN previous_sale IS NULL THEN 'First Purchase'
    WHEN total_sale > previous_sale THEN 'Increased'
    WHEN total_sale < previous_sale THEN 'Decreased'
    ELSE 'Same'
END AS purchase_trend
FROM cte;


-- ============================================================
-- Question 19: Compare each customer's current purchase with
-- their next purchase and classify the future purchase trend
-- as Will Increase, Will Decrease, Same, or Last Purchase.
-- ============================================================
with cte as(
SELECT
    customer_id,
    transactions_id,
    sale_date,
    total_sale,LEAD(total_sale,1) over(partition by customer_id order by sale_date) as next_sale
FROM retail_sales
)
SELECT
    customer_id,
    transactions_id,
    sale_date,
    total_sale,
    next_sale,
    case when next_sale>total_sale then 'Will Increase'
    when next_sale<total_sale then 'Will Decrease'
    when next_sale is null then 'Last Purchase'
    else 'Same' END as future_trend
FROM cte;


-- ============================================================
-- Question 20: Display the customer IDs of customers whose
-- transaction amount is greater than their own average
-- transaction amount.
-- ============================================================
SELECT DISTINCT
    customer_id
FROM retail_sales rs1
where total_sale > (select AVG(total_sale) from retail_sales rs2 
where rs1.customer_id=rs2.customer_id);


-- ============================================================
-- Question 21: Calculate the running total of sales for each
-- customer based on the sale date.
-- ============================================================
SELECT
    customer_id,
    transactions_id,
    sale_date,
    total_sale,
    SUM(total_sale) OVER(partition by customer_id order by sale_date rows between unbounded preceding and current row)as running_total
FROM retail_sales;


-- ============================================================
-- Question 22: Find customers who made purchases on at least
-- three consecutive days.
-- ============================================================
WITH cte AS
(
    SELECT
        customer_id,
        sale_date,
        ROW_NUMBER() OVER
        (
            PARTITION BY customer_id
            ORDER BY sale_date
        ) AS rn
    FROM retail_sales
),
cte2 AS
(
    SELECT
        customer_id,
        sale_date,
        DATEADD(day, -rn, sale_date) AS grp
    FROM cte
)
SELECT
    customer_id
FROM cte2
GROUP BY
    customer_id,
    grp
HAVING COUNT(*) >= 3;


-- ============================================================
-- Question 23: Display the customer with the highest total
-- sales in each city. Include all customers tied for the
-- highest total sales within their city.
-- ============================================================
with cte as(
SELECT
    c.customer_id,
    c.customer_name,
    c.city,SUM(rs.total_sale) as total_sales ,dense_rank() over(partition by city order by SUM(rs.total_sale) desc) as rnk
    from customers c
    inner join retail_sales rs
    on c.customer_id=rs.customer_id
    group by c.city,c.customer_id,c.customer_name
)
select customer_id,
    customer_name,total_sales,
    city from cte where rnk=1
    order by total_sales desc,city;


-- ============================================================
-- Question 24: Display the top two customers with the highest
-- total sales in each product category. Include ties in the
-- ranking and sort the results by category and total sales.
-- ============================================================
with cte as(
SELECT c.customer_id,c.customer_name,category,SUM(rs.total_sale) as total_sales,
DENSE_RANK() over(partition by category order by SUM(rs.total_sale) desc )as rnk
from customers c
join retail_sales rs
on c.customer_id=rs.customer_id
group by c.customer_id,c.customer_name,category
)
select customer_id,customer_name,category,total_sales,rnk
from cte 
where rnk<=2
order by category,total_sales desc,rnk;


-- ============================================================
-- Question 25: Identify the customer(s) contributing the
-- highest percentage of total sales in each city. Display the
-- customer's total sales, city total sales, and contribution
-- percentage.
-- ============================================================
WITH customer_sales AS
(
    SELECT
        c.customer_id,
        c.customer_name,
        c.city,
        SUM(rs.total_sale) AS customer_sales
    FROM customers c
    JOIN retail_sales rs
        ON c.customer_id = rs.customer_id
    GROUP BY
        c.customer_id,
        c.customer_name,
        c.city
),
city_sales as(
    SELECT city,SUM(customer_sales) as city_total_sales
    from customer_sales
    group by city
),
final_cte AS
(
    SELECT
        cs.customer_id,
        cs.customer_name,
        cs.city,
        cs.customer_sales,
        ct.city_total_sales,
        ROUND(
            (cs.customer_sales * 100.0) / ct.city_total_sales,
            2
        ) AS contribution_percentage,

        DENSE_RANK() OVER
        (
            PARTITION BY cs.city
            ORDER BY
                (cs.customer_sales * 100.0) / ct.city_total_sales DESC
        ) AS rnk

    FROM customer_sales cs
    JOIN city_sales ct
        ON cs.city = ct.city
)
SELECT *
FROM final_cte
WHERE rnk = 1;



