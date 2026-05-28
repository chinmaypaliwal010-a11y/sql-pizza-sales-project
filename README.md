
# SQL Pizza Sales Project

## Project Objective
Analyze pizza sales data using SQL queries to find sales trends, best-selling pizzas, and revenue insights.

---

## Tools Used
- MySQL
- SQL
- Excel
- GitHub

---

## Dataset Information
The dataset contains:
- Orders
- Pizza types
- Revenue
- Quantity sold

---

## SQL Concepts Used
- SELECT
- GROUP BY
- ORDER BY
- JOIN
- Aggregate Functions
- Subqueries

---

## Project Files
- datasets/
- sql_queries/
- screenshots/

---

## Sample Query

```sql
SELECT pizza_name,
       SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY revenue DESC;
```

---

## Results
- Identified top-selling pizzas
- Found highest revenue categories
- Analyzed monthly sales trends


