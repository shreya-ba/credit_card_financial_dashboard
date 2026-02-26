-- 1. Create cc_detail table

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);


-- 2. Create customer detail table

CREATE TABLE cust_det (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);


SELECT * FROM cc_detail;

SELECT * FROM customer;


-- Exploratory Data Analysis--

-- SECTION 1: CORE KPI METRICS

-- 1.1 Total Revenue 
SELECT 
    SUM(Interest_Earned + Annual_Fees) AS total_revenue
FROM cc_detail;

-- 1.2 Total Transaction Volume (Customer Spending)
SELECT 
    SUM(Total_Trans_Amt) AS total_transaction_volume
FROM cc_detail;

-- 1.3 Total Transaction Count
SELECT 
    SUM(Total_Trans_Ct) AS total_transactions
FROM cc_detail;

-- 1.4 Total Unique Customers
SELECT 
    COUNT(DISTINCT Client_Num) AS total_customers
FROM customer;


-- SECTION 2: CARD PERFORMANCE ANALYSIS

-- 2.1 Revenue by Card Category
SELECT 
    Card_Category,
    SUM(Interest_Earned + Annual_Fees) AS total_revenue
FROM cc_detail
GROUP BY Card_Category
ORDER BY total_revenue DESC;


-- SECTION 3: GEOGRAPHICAL ANALYSIS

-- 3.1 Revenue by State
SELECT 
    c.state_cd,
    SUM(t.Interest_Earned + t.Annual_Fees) AS total_revenue
FROM cc_detail t
JOIN customer c 
    ON t.Client_Num = c.Client_Num
GROUP BY c.state_cd
ORDER BY total_revenue DESC;

-- 3.2 Top 5 States by Revenue
SELECT 
    c.state_cd,
    SUM(t.Interest_Earned + t.Annual_Fees) AS total_revenue
FROM cc_detail t
JOIN customer c 
    ON t.Client_Num = c.Client_Num
GROUP BY c.state_cd
ORDER BY total_revenue DESC
LIMIT 5;


-- SECTION 4: CUSTOMER SEGMENTATION ANALYSIS

-- 4.1 Revenue by Customer Job
SELECT 
    c.Customer_Job,
    SUM(t.Interest_Earned + t.Annual_Fees) AS total_revenue
FROM cc_detail t
JOIN customer c 
    ON t.Client_Num = c.Client_Num
GROUP BY c.Customer_Job
ORDER BY total_revenue DESC;

-- 4.2 Revenue by Education Level
SELECT 
    c.Education_Level,
    SUM(t.Interest_Earned + t.Annual_Fees) AS total_revenue,
    COUNT(DISTINCT c.Client_Num) AS customer_count
FROM cc_detail t
JOIN customer c 
    ON t.Client_Num = c.Client_Num
GROUP BY c.Education_Level
ORDER BY total_revenue DESC;

-- 4.3 Revenue by Gender
SELECT 
    c.Gender,
    SUM(t.Interest_Earned + t.Annual_Fees) AS total_revenue
FROM cc_detail t
JOIN customer c 
    ON t.Client_Num = c.Client_Num
GROUP BY c.Gender;


-- SECTION 5: INCOME & AGE SEGMENTATION

-- 5.1 Revenue by Income Group
SELECT 
    CASE 
        WHEN c.Income < 30000 THEN 'Low Income'
        WHEN c.Income BETWEEN 30000 AND 70000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS income_group,
    SUM(t.Interest_Earned + t.Annual_Fees) AS total_revenue
FROM cc_detail t
JOIN customer c 
    ON t.Client_Num = c.Client_Num
GROUP BY income_group
ORDER BY total_revenue DESC;

-- 5.2 Revenue by Age Group
SELECT 
    CASE 
        WHEN c.Customer_Age BETWEEN 18 AND 30 THEN '18-30'
        WHEN c.Customer_Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN c.Customer_Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN c.Customer_Age BETWEEN 51 AND 60 THEN '51-60'
        ELSE '60+'
    END AS age_group,
    SUM(t.Interest_Earned + t.Annual_Fees) AS total_revenue
FROM cc_detail t
JOIN customer c 
    ON t.Client_Num = c.Client_Num
GROUP BY age_group
ORDER BY total_revenue DESC;


-- SECTION 6: TIME-BASED ANALYSIS

-- 6.1 Quarterly Revenue Trend
SELECT 
    Qtr,
    SUM(Interest_Earned + Annual_Fees) AS total_revenue,
    SUM(Total_Trans_Ct) AS transaction_count
FROM cc_detail
GROUP BY Qtr
ORDER BY Qtr;


-- SECTION 8: ADVANCED ANALYSIS

-- 8.1 Top 10 High-Value Customers (By Revenue)
SELECT 
    Client_Num,
    SUM(Interest_Earned + Annual_Fees) AS total_revenue
FROM cc_detail
GROUP BY Client_Num
ORDER BY total_revenue DESC
LIMIT 10;

-- 8.2 Customer Revenue Ranking
SELECT 
    Client_Num,
    SUM(Interest_Earned + Annual_Fees) AS total_revenue,
    RANK() OVER (ORDER BY SUM(Interest_Earned + Annual_Fees) DESC) AS revenue_rank
FROM cc_detail
GROUP BY Client_Num;