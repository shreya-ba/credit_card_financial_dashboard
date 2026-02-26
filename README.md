# 💳 Credit Card Analytics Dashboard

## 📌 Overview
This project analyzes credit card transactions and customer demographics to uncover revenue trends, customer behavior patterns, and portfolio risk indicators.

An interactive Power BI dashboard is connected directly to a SQL database, enabling dynamic reporting. When new weekly transaction data is added to the database, the dashboard refreshes automatically to reflect updated insights.

---

## 🎯 Project Objective
The objective of this project is to build a data-driven credit card portfolio monitoring system that:

- Tracks revenue and interest performance  
- Identifies high-performing customer segments  
- Monitors activation and delinquency rates  
- Supports strategic decision-making through real-time insights  
- Enables automated weekly reporting via SQL–Power BI integration  

---

## 📂 Dataset

The analysis is based on two relational tables:

### 1️⃣ credit_card (Transaction Data)

- Card Category  
- Total Transaction Amount  
- Interest Earned  
- Quarter  
- Transaction Count  

### 2️⃣ customer (Customer Demographics)

- Client_Num (Primary Key)  
- Customer Age  
- Gender  
- Education Level  
- State  
- Income  
- Customer Job  
- Customer Satisfaction Score  

Both tables are connected using `Client_Num` as the primary key.

---

## 🗄 Data Preparation & SQL Analysis

- Created relational tables in SQL  
- Defined primary key relationships  
- Performed Exploratory Data Analysis (EDA) using:
  - `SUM()` and `COUNT()` aggregations  
  - `GROUP BY` analysis  
  - `CASE`-based segmentation (Age & Income groups)  
  - Revenue ranking using window functions  
- Validated KPIs before dashboard integration  

---

## 🛠 Tools & Technologies

- **SQL** – Table creation, EDA queries, KPI validation  
- **Power BI** – Data modeling, dashboard development  
- **DAX** – KPI calculations and dynamic metrics  

---

## ❓ Business Questions Solved

- What is the total revenue and interest earned?  
- Which card category generates the highest revenue?  
- Which states contribute the most revenue?  
- Do male or female customers contribute more revenue?  
- Which segments (age, income) drive performance?  
- What are the activation and delinquency rates?  
- Who are the top high-value customers?  

---

## 📊 Dashboard Highlights

- **11M** total revenue (YTD)  
- **8M** total interest earned  
- **46M** total transaction amount  
- Revenue distribution by gender  
- Card category performance  
- State-wise revenue contribution  
- Activation & delinquency monitoring  
- Revenue by expenditure type  

The dashboard updates dynamically when new weekly data is added to the SQL database.

---

## 📊 Project Insights – Week 53 (31st Dec)

### 🔄 Week-over-Week (WoW)

- Revenue increased by **4%**  
- Transaction amount increased by **33.51%**  
- Transaction count increased by **9%**  
- Customer count increased by **12.8%**  

### 📈 Year-to-Date (YTD)

- Overall revenue: **11M**  
- Total interest: **8M**  
- Total transaction amount: **46M**  
- Male customers contributed **6M**, female customers **5M**  
- Blue & Silver cards account for **93% of transactions**  
- TX, NY & CA contribute **68% of revenue**  
- Activation rate: **57.5%**  
- Delinquency rate: **6.06%**  
- Bills and Entertainment are the highest revenue-generating categories  

---

## 💡 Business Recommendations

- Sustain revenue growth through continued customer engagement and loyalty programs.  
- Leverage high-performing categories like **Bills and Entertainment** with targeted offers.  
- Upsell premium cards to Blue and Silver customers to increase revenue per user.  
- Expand marketing beyond TX, NY, and CA to diversify revenue sources.  
- Improve activation through better onboarding incentives.  
- Proactively monitor delinquency with early risk alerts and reminders.  

---

## ▶️ How to Run

1. Create tables in SQL and load datasets.  
2. Execute SQL queries for KPI validation and segmentation.  
3. Connect Power BI directly to the SQL database.  
4. Refresh the dashboard to reflect newly added weekly data.  

---

## 📎 Author
Shreya Ramola  
Data Analyst | SQL | Power BI | Business Intelligence
