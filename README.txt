================================================================================
  📊  CUSTOMER CHURN ANALYSIS & RETENTION DASHBOARD
================================================================================
  🛠️  Tools     :  Power BI  |  MySQL  |  Microsoft Excel  |  DAX
  🌐  Domain    :  Telecom   |  Business Intelligence  |  Data Analytics
  📦  Dataset   :  IBM Telco Customer Churn  --  Kaggle
  🔗  Source    :  https://www.kaggle.com/datasets/blastchar/telco-customer-churn

================================================================================
  💬  MY STORY BEHIND THIS PROJECT
================================================================================

  While exploring business analytics use cases, I came across a common but
  often ignored problem -- telecom companies losing thousands of customers
  silently every month, with no clear visibility into WHY it's happening or
  HOW MUCH it's truly costing them.

  I wanted to go beyond just "making a dashboard." I challenged myself to
  think like a business analyst -- starting from raw data, writing real SQL
  queries to uncover patterns, building DAX measures to calculate impact, and
  finally presenting it all in a way that a non-technical stakeholder could
  walk into and immediately understand.

  The result? A finding that 1 in 4 customers is churning, costing the company
  $2.86M -- and most of it could be prevented with the right retention strategy.

  This project taught me that data is only powerful when it drives decisions.
  Every chart, every KPI, every recommendation in this dashboard is built with
  one goal: to help a business ACT, not just observe.

================================================================================
  📌  TABLE OF CONTENTS
================================================================================

1️⃣  Project Overview
2️⃣  Business Problem
3️⃣  Tech Stack
4️⃣  Project Architecture
5️⃣  Key Business Questions
6️⃣  SQL Queries Used
7️⃣  DAX Measures Used
8️⃣  Dashboard KPIs
9️⃣  Key Insights
🔟  Business Recommendations
➡️  Dashboard Features
📁  Project Structure
🚀  How to Use

================================================================================
  🧩  1. PROJECT OVERVIEW
================================================================================

  Customer churn is one of the most critical challenges in the telecom industry.
  This project delivers a full-stack analytics solution -- from raw data
  ingestion and SQL-based transformation to a polished, interactive Power BI
  dashboard -- designed to help stakeholders understand WHY customers leave and
  WHAT can be done to retain them.

  ✅ The pipeline covers:

    📂  Data cleaning & preparation         --  Microsoft Excel
    🔍  Exploratory analysis & aggregation  --  MySQL
    🧮  Advanced KPI calculations           --  DAX Measures in Power BI
    📊  Executive-level dashboard           --  Power BI with dynamic slicers

================================================================================
  💼  2. BUSINESS PROBLEM
================================================================================

  A telecom company is experiencing significant customer attrition.
  Leadership needs clarity on:

    ❓  Which customer segments are most at risk
    ❓  What financial impact churn is creating
    ❓  Where to focus retention investment for maximum ROI

================================================================================
  🛠️  3. TECH STACK
================================================================================

  +----------------------+------------------------------------------------+
  |  🔧 Tool             |  📋 Purpose                                   |
  +----------------------+------------------------------------------------+
  |  Microsoft Excel     |  Data cleaning, formatting, exploratory checks |
  |  MySQL               |  Data storage, transformation, aggregations    |
  |  Power BI Desktop    |  Dashboard design, modeling, visualization     |
  |  DAX                 |  KPI measures, calculated columns              |
  +----------------------+------------------------------------------------+

================================================================================
  🏗️  4. PROJECT ARCHITECTURE
================================================================================

      📁 Raw Data -- Kaggle (IBM Telco Churn CSV)
           |
           ▼
      📊 Excel  -->  Data Cleaning & Preparation
           |
           ▼
      🗄️  MySQL  -->  Data Storage & SQL Analysis
           |
           ▼
      📈 Power BI  -->  Data Model + DAX Measures
           |
           ▼
      🖥️  Interactive Dashboard  -->  Business Insights & Recommendations

================================================================================
  ❓  5. KEY BUSINESS QUESTIONS
================================================================================

  1️⃣  What is the overall churn rate across the customer base?
  2️⃣  Which customer segments exhibit the highest churn propensity?
  3️⃣  How does contract type influence customer retention?
  4️⃣  Is there a relationship between monthly charges and churn behavior?
  5️⃣  Which internet service types are associated with elevated churn?
  6️⃣  What is the total revenue impact of customer churn?
  7️⃣  What targeted retention strategies can reduce attrition?

================================================================================
  🗄️  6. SQL QUERIES USED
================================================================================

  -----------------------------------------------------------------------
  📌 Query 1 -- Churn by Tenure Group (with Churn Rate Calculation)
  -----------------------------------------------------------------------

  -- Churn by Tenure Group
  SELECT CASE
          WHEN tenure <= 12 THEN '0-12 Months'
          WHEN tenure <= 24 THEN '13-24 Months'
          WHEN tenure <= 48 THEN '25-48 Months'
          ELSE '49+ Months'
       END AS Tenure_Group,
       COUNT(*) AS Total_Customers,
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
  ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2) AS Churn_Rate
  FROM customer_data
  GROUP BY CASE
          WHEN tenure <= 12 THEN '0-12 Months'
          WHEN tenure <= 24 THEN '13-24 Months'
          WHEN tenure <= 48 THEN '25-48 Months'
          ELSE '49+ Months' END;

  💡 Why this query?
     Identifies which tenure bands have the highest churn -- critical for
     targeting early retention campaigns in the first 12 months.

  -----------------------------------------------------------------------
  📌 Query 2 -- Tenure Groups Analysis (Customer Distribution)
  -----------------------------------------------------------------------

  -- Tenure Groups Analysis
  SELECT
      CASE
          WHEN tenure <= 12 THEN '0-12 Months'
          WHEN tenure <= 24 THEN '13-24 Months'
          WHEN tenure <= 48 THEN '25-48 Months'
          ELSE '49+ Months'
      END AS Tenure_Group,
  COUNT(*) AS Customers
  FROM customer_data
  GROUP BY Tenure_Group;

  💡 Why this query?
     Maps total customer volume per tenure segment to understand where
     the customer base is concentrated and most vulnerable.

================================================================================
  🧮  7. DAX MEASURES USED
================================================================================

  -----------------------------------------------------------------------
  📌 Measure 1 -- Total Customers
  -----------------------------------------------------------------------

  Total Customers = COUNT('customer_churn customer_data'[customerID])

  💡 Why this measure?
     Provides the base headcount KPI used across all churn rate
     calculations and dashboard visuals.

  -----------------------------------------------------------------------
  📌 Measure 2 -- Revenue Lost to Churn
  -----------------------------------------------------------------------

  Revenue Lost = CALCULATE(
      SUM('customer_churn customer_data'[TotalCharges]),
      'customer_churn customer_data'[Churn] = "Yes"
  )

  💡 Why this measure?
     Quantifies the exact financial impact of churned customers by
     summing TotalCharges only for Churn = "Yes" records -- translating
     a business problem into a hard dollar figure ($2.86M).

================================================================================
  📈  8. DASHBOARD KPIs
================================================================================

  +-----------------------------+----------------+
  |  📌 KPI                     |  💰 Value     |
  +-----------------------------+----------------+
  |  👥 Total Customers         |  7,000         |
  |  🚪 Churned Customers       |  ~2,000        |
  |  📉 Churn Rate %            |  26.58%        |
  |  💳 Avg Monthly Charges     |  $64.80        |
  |  💸 Revenue Lost to Churn   |  $2.86M        |
  +-----------------------------+----------------+

================================================================================
  💡  9. KEY INSIGHTS
================================================================================

  🔴  Overall churn rate is 26.58% -- more than 1 in 4 customers is leaving.

  📋  Month-to-Month contract customers churn at the highest rate compared
      to annual or two-year contract holders.

  🌐  Fiber Optic users churn significantly more than DSL customers,
      indicating a potential service quality or pricing issue.

  ⏰  Customers with tenure under 12 months are at the highest risk --
      the first year is the most critical retention window.

  💳  Electronic Check is the payment method associated with the highest
      churn volume across all payment types.

  💰  Revenue lost due to churn totals $2.86M -- a figure that justifies
      significant investment in dedicated retention initiatives.

  🔒  Long-term contract customers demonstrate strong retention, validating
      incentive-based contract migration as a proven strategy.

================================================================================
  ✅  10. BUSINESS RECOMMENDATIONS
================================================================================

  🔴  PRIORITY : HIGH
  ---------------------------------------------------------------------------
  🎯  Launch targeted campaigns to migrate Month-to-Month customers to
      annual contracts via discounts, loyalty perks, or bundled service offers.

  🎯  Implement a structured new customer onboarding program for the first
      12 months to reduce early-stage churn significantly.

  🟡  PRIORITY : MEDIUM
  ---------------------------------------------------------------------------
  🔎  Conduct a dedicated investigation into Fiber Optic churn drivers --
      pricing, speed reliability, or competitive offers in the market.

  🔎  Build a high-risk segment alert system to proactively flag customers
      whose profile matches previously churned users.

  🟢  PRIORITY : LOW
  ---------------------------------------------------------------------------
  💡  Offer payment method incentives (e.g., auto-pay discounts) to migrate
      customers away from Electronic Check to automated payment options.

================================================================================
  🖥️  11. DASHBOARD FEATURES
================================================================================

  📊  Churn Rate by Contract Type
  🌐  Churn Rate by Internet Service
  💳  Churn by Payment Method
  ⏰  Churn by Tenure Group
  👥  Churn by Gender
  💵  Revenue by Contract Type
  🎛️  Interactive Slicers  (Contract | Internet Service | Gender | Tenure)
  🔍  Dynamic Tooltips

================================================================================
  📁  12. PROJECT STRUCTURE
================================================================================

  📦 Customer-Churn-Analysis/
  |
  |-- 📂 Dataset/
  |        WA_Fn-UseC_-Telco-Customer-Churn.csv           (Raw dataset from Kaggle)
  |
  |-- 📂 Excel/
  |        Customer_Churn_Data_Audit.xlsx     (Cleaned & formatted data file)
  |
  |-- 📂 SQL/
  |        Customer_Churn_Analysis_SQL.sql       (MySQL queries & aggregations)
  |
  |-- 📂 PowerBI/
  |        Customer-Churn-Analysis-&-Retention-Dashboard.pbix      (Power BI report file)
  |
  |-- 📂 Screenshots/
  |        Dashboard-Screenshot.png         (Dashboard preview image)
  |
  |-- 📄 README.md
  |-- 📄 README.txt

================================================================================
  🚀  13. HOW TO USE
================================================================================

  📌 STEP 1  --  Clone the Repository
  ---------------------------------------------------------------------------
      git clone https://github.com/Priyanka-16-09/Customer-Churn-Analysis-Retention-Dashboard.git
      cd customer-churn-analysis

  📌 STEP 2  --  Get the Dataset
  ---------------------------------------------------------------------------
      📥  Download from Kaggle:
          https://www.kaggle.com/datasets/blastchar/telco-customer-churn
      📥  Place CSV in the  Dataset/  folder

  📌 STEP 3  --  Set Up the Database
  ---------------------------------------------------------------------------
      📥  Import  Dataset/WA_Fn-UseC_-Telco-Customer-Churn.csv    into MySQL
      ▶️   Run  SQL/Customer_Churn_Analysis_SQL.sql  to create the analysis views

  📌 STEP 4  --  Open the Dashboard
  ---------------------------------------------------------------------------
      📂  Open  PowerBI/Customer-Churn-Analysis-&-Retention-Dashboard.pbix  in Power BI Desktop
      🔄  Refresh the data source connection to your MySQL instance

  📌 STEP 5  --  Explore the Dashboard
  ---------------------------------------------------------------------------
      🎛️  Use slicers (Contract Type, Internet Service, Gender, Tenure Group)
          to filter all visuals dynamically

================================================================================
  🤝  CONNECT WITH ME
================================================================================

  💼  LinkedIn  :  https://linkedin.com/in/priyanka-5b1651222/
  🐙  GitHub    :  https://github.com/Priyanka-16-09

  🌟  If you found this project helpful, please consider giving it a Star!

================================================================================
  ✨  Built with passion using Power BI | MySQL | Microsoft Excel | DAX  ✨
================================================================================
