/*=========================================================
Retail Sales Analysis Project
Section 1 : Data Validation
=========================================================*/

USE Retail_Sales_DB;
GO

-----------------------------------------------------------
-- 1. View first 10 records
-----------------------------------------------------------
SELECT TOP 10 *
FROM retail_sales;

-----------------------------------------------------------
-- 2. Count total records
-----------------------------------------------------------
SELECT COUNT(*) AS Total_Records
FROM retail_sales;

-----------------------------------------------------------
-- 3. Count total columns
-----------------------------------------------------------
SELECT COUNT(*) AS Total_Columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'retail_sales';

-----------------------------------------------------------
-- 4. Check for duplicate Transaction IDs
-----------------------------------------------------------
SELECT
    transactions_id,
    COUNT(*) AS Duplicate_Count
FROM retail_sales
GROUP BY transactions_id
HAVING COUNT(*) > 1;

-----------------------------------------------------------
-- 5. Check date range
-----------------------------------------------------------
SELECT
    MIN(sale_date) AS First_Sale_Date,
    MAX(sale_date) AS Last_Sale_Date
FROM retail_sales;

-----------------------------------------------------------
-- 6. Check distinct product categories
-----------------------------------------------------------
SELECT DISTINCT category
FROM retail_sales;

-----------------------------------------------------------
-- 7. Check distinct gender values
-----------------------------------------------------------
SELECT DISTINCT gender
FROM retail_sales;
