# 🛒 Retail Sales SQL Analysis

## 📌 Project Overview

This project analyzes a retail sales dataset using Microsoft SQL Server. It demonstrates SQL skills ranging from basic filtering and aggregation to advanced analytical queries using Joins, Correlated Subqueries, Common Table Expressions (CTEs), and Window Functions.

The objective of this project is to answer real-world business questions and extract meaningful insights from retail sales data.

---

## 📂 Dataset

The project uses a retail sales dataset containing transaction-level information.

### Main Table: `retail_sales`

| Column | Description |
|--------|-------------|
| transactions_id | Unique transaction ID |
| sale_date | Date of purchase |
| sale_time | Time of purchase |
| customer_id | Customer identifier |
| gender | Customer gender |
| age | Customer age |
| category | Product category |
| quantity | Quantity purchased |
| price_per_unit | Price per unit |
| cogs | Cost of goods sold |
| total_sale | Total sale amount |

---

## 📁 Project Structure

```
Retail-Sales-SQL-Analysis/
│
├── Dataset/
│   └── retail_sales.csv
│
├── SQL/
│   ├── 01_Data_Validation.sql
│   ├── 02_Data_Cleaning.sql
│   └── 03_Exploratory_Data_Analysis.sql
│
└── README.md
```

---

## 📊 SQL Concepts Used

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- Aggregate Functions
- CASE WHEN
- INNER JOIN
- LEFT JOIN
- Correlated Subqueries
- Common Table Expressions (CTEs)
- Window Functions
  - ROW_NUMBER()
  - DENSE_RANK()
  - LAG()
  - LEAD()
  - Running Totals

---

## 📈 Business Problems Solved

- Data validation and cleaning
- Category-wise sales analysis
- Customer purchasing behavior
- High-value customer identification
- Sales trend analysis
- Running sales calculations
- Top-performing customers
- Ranking customers within each category
- Ranking customers within each city
- Correlated subquery analysis
- Consecutive purchase analysis using CTEs
- Window function based business insights

---

## 🛠 Additional Work

To perform JOIN operations and advanced SQL analysis, I created a separate **Customers** table and populated it with sample customer data. This allowed me to practice real-world relational database queries involving customer details and sales transactions.

---

## 🛠 Tools Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- GitHub

---

## 🎯 Skills Demonstrated

- SQL Query Writing
- Data Validation
- Data Cleaning
- Data Aggregation
- Business Analysis
- Relational Database Design
- Joins
- Window Functions
- Common Table Expressions (CTEs)
- Correlated Subqueries
- GitHub Project Documentation

---

## 📌 Author

**Hiten Chand**

B.Tech Student | Delhi Technological University (DTU)
