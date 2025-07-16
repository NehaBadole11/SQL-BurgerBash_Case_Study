# 🍔 Burger Bash - SQL Case Study

Welcome to the **Burger Bash** SQL project! This case study explores a burger delivery business by analyzing customer orders, delivery data, runner performance, and burger preferences using structured queries.

---

## 📁 Project Structure

- `Burger_bash_CS.sql`: Contains schema creation, data insertion, and SQL queries for insights and analysis.

---

## 🗃️ Database Schema

The database contains the following tables:

1. **burger_names**
   - `burger_id`, `burger_name`
2. **burger_runner**
   - `runner_id`, `registration_date`
3. **runner_orders**
   - `order_id`, `runner_id`, `pickup_time`, `distance`, `duration`, `cancellation`
4. **customer_orders**
   - `order_id`, `customer_id`, `burger_id`, `exclusions`, `extras`, `order_time`

---

## 🔍 Key Business Questions Answered

1. **How many burgers were ordered?**
2. **How many unique customer orders were placed?**
3. **How many successful deliveries were made by each runner?**
4. **How many of each type of burger were delivered?**
5. **How many burgers of each type were ordered by each customer?**
6. **Average distance traveled for each customer.**
7. **Maximum burgers delivered in a single order.**
8. **Burger orders with and without customizations (exclusions/extras).**
9. **Total burger volume ordered per hour of the day.**
10. **Weekly runner signup statistics.**

---

## 🧠 Insights & Analysis

- Delivered burgers are filtered using `WHERE cancellation IS NULL`.
- Joins between `customer_orders` and `runner_orders` are used for delivery-related questions.
- String manipulation and casting are considered for distance and duration fields.
- Use of `GROUP BY`, `HAVING`, `CTEs`, and aggregate functions like `COUNT`, `MAX`, `AVG` for insights.

---

## 🛠️ Tools Used

- **MySQL**

---




