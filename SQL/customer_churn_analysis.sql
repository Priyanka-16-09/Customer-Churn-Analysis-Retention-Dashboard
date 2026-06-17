CREATE DATABASE customer_churn;
USE customer_churn;

CREATE TABLE customer_data (
    customerID VARCHAR(20),
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(5)
);
SHOW TABLES;
DESCRIBE customer_data;
select * from customer_data;

-- Total Customers
select count(*) as total_customer 
from customer_data;
SELECT count(DISTINCT customerID) as unique_customer
FROM customer_data;

-- Null Check
SELECT COUNT(*) as null_val
FROM customer_data
WHERE TotalCharges IS NULL;

-- Churn Distribution
select churn, count(*) as customer_count
from customer_data
group by churn;

-- Overall Churn Rate
select Round(sum(case
				when churn='Yes' then 1 else 0 end)*100.0/count(*),2) as churn_rate
from customer_data;
-- (Customer Segmentation Analysis)
-- Churn by Gender
select gender, churn, count(*) as customers
from customer_data
group by gender,churn;

SELECT gender, COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Churn_Rate
FROM customer_data
GROUP BY gender;

-- Churn by Senior Citizen
select seniorcitizen, churn, count(*) as customers
from customer_data
group by seniorcitizen, churn;

SELECT seniorcitizen, COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Churn_Rate
FROM customer_data
GROUP BY seniorcitizen;

-- Churn by Partner Status
SELECT Partner,Churn,COUNT(*) AS Customers
FROM customer_data
GROUP BY Partner, Churn;

SELECT Partner,COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Churn_Rate
FROM customer_data
GROUP BY Partner;

-- Churn by Dependents
SELECT Dependents,Churn,COUNT(*) AS Customers
FROM customer_data
GROUP BY Dependents, Churn;

select Dependents , count(*) as tota_customer,
	sum(case when churn='yes' then 1 else 0 end) as churn_customer,
    round(sum(case when churn='yes' then 1 else 0 end)*100/count(*),2) as churn_rate
from customer_data
group by dependents;

-- (Contract & Billing Analysis)
-- Churn by Contract Type
SELECT Contract,Churn,COUNT(*) AS Customers
FROM customer_data
GROUP BY Contract, Churn;

select contract , count(*) as tota_customer,
	sum(case when churn='yes' then 1 else 0 end) as churn_customer,
    round(sum(case when churn='yes' then 1 else 0 end)*100/count(*),2) as churn_rate
from customer_data
group by contract;

-- Average Monthly Charges by Churn
SELECT Churn,
       ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charge
FROM customer_data
GROUP BY Churn;
 
-- Average Tenure by Churn
SELECT Churn, ROUND(AVG(tenure),2) AS Avg_Tenure
FROM customer_data
GROUP BY Churn;

-- Churn by Payment Method
SELECT PaymentMethod, Churn,COUNT(*) AS Customers
FROM customer_data
GROUP BY PaymentMethod, Churn;

select PaymentMethod, count(*) as tota_customer,
	sum(case when churn='yes' then 1 else 0 end) as churn_customer,
    round(sum(case when churn='yes' then 1 else 0 end)*100/count(*),2) as churn_rate
from customer_data
group by PaymentMethod;

-- Churn by Paperless Billing
SELECT PaperlessBilling, Churn,COUNT(*) AS Customers
FROM customer_data
GROUP BY PaperlessBilling, Churn;

select PaperlessBilling, count(*) as tota_customer,
	sum(case when churn='yes' then 1 else 0 end) as churn_customer,
    round(sum(case when churn='yes' then 1 else 0 end)*100/count(*),2) as churn_rate
from customer_data
group by PaperlessBilling;

-- (Service Analysis)
-- Churn by Internet Service
select internetservice, churn, count(*) as total_customer
from customer_data
group by internetservice, churn;

select internetservice, count(*) as total_customer,
	sum(case when churn='yes' then 1 else 0 end) as churn_customer,
    round(sum(case when churn='yes' then 1 else 0 end)*100/count(*),2) as churn_rate
from customer_data
group by internetservice;
 
-- Churn by Online Security
SELECT OnlineSecurity,Churn,COUNT(*) AS Customers
FROM customer_data
GROUP BY OnlineSecurity, Churn;

select  OnlineSecurity, count(*) as total_customer,
	sum(case when churn='yes' then 1 else 0 end) as churn_customer,
    round(sum(case when churn='yes' then 1 else 0 end)*100/count(*),2) as churn_rate
from customer_data
group by  OnlineSecurity;

-- Churn by Tech Support
SELECT TechSupport,Churn,COUNT(*) AS Customers
FROM customer_data
GROUP BY TechSupport, Churn;

select  Techsupport, count(*) as total_customer,
	sum(case when churn='yes' then 1 else 0 end) as churn_customer,
    round(sum(case when churn='yes' then 1 else 0 end)*100/count(*),2) as churn_rate
from customer_data
group by  Techsupport;

-- Churn by Streaming TV
SELECT StreamingTV,Churn,COUNT(*) AS Customers
FROM customer_data
GROUP BY StreamingTV, Churn;

select StreamingTV, count(*) as total_customer,
	sum(case when churn='yes' then 1 else 0 end) as churn_customer,
    round(sum(case when churn='yes' then 1 else 0 end)*100/count(*),2) as churn_rate
from customer_data
group by StreamingTV;

-- Churn by Streaming Movies
SELECT StreamingMovies,Churn,COUNT(*) AS Customers
FROM customer_data
GROUP BY StreamingMovies, Churn;

select StreamingMovies, count(*) as total_customer,
	sum(case when churn='yes' then 1 else 0 end) as churn_customer,
    round(sum(case when churn='yes' then 1 else 0 end)*100/count(*),2) as churn_rate
from customer_data
group by StreamingMovies;

-- (Revenue Analysis)
-- Total Revenue
SELECT ROUND(SUM(TotalCharges),2) AS Total_Revenue
FROM customer_data;

-- Revenue Lost Due to Churn
SELECT ROUND(SUM(TotalCharges),2) AS Revenue_Lost
FROM customer_data
WHERE Churn='Yes';

SELECT ROUND(SUM(CASE WHEN Churn='Yes' THEN TotalCharges ELSE 0 END)*100/
SUM(TotalCharges),2) AS Revenue_Loss
FROM customer_data;

-- Revenue by Contract Type
SELECT Contract,ROUND(SUM(TotalCharges),2) AS Revenue
FROM customer_data
GROUP BY Contract;

SELECT contract, ROUND(SUM(CASE WHEN Churn='Yes' THEN TotalCharges ELSE 0 END)*100/
SUM(TotalCharges),2) AS Revenue_Loss
FROM customer_data
GROUP BY Contract;

-- Top 5 Highest Revenue Customers
SELECT customerID,TotalCharges
FROM customer_data
ORDER BY TotalCharges DESC
LIMIT 5;

-- Tenure Groups Analysis
SELECT
	CASE
		WHEN tenure <=12 THEN '0-12 Months'
		WHEN tenure <=24 THEN '13-24 Months'
		WHEN tenure <=48 THEN '25-48 Months'
	ELSE '49+ Months'
	END AS Tenure_Group,
COUNT(*) AS Customers
FROM customer_data
GROUP BY Tenure_Group;

-- Churn by Tenure Group
SELECT CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS Tenure_Group, COUNT(*) AS Total_Customers,
SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS Churn_Rate
FROM customer_data
GROUP BY CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49+ Months' END;


















