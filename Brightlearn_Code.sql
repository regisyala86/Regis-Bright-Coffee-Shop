-- I want to see my table in the coding to start exploryting each column
SELECT *
FROM workspace.default.bright_coffee_shop_analysis
LIMIT 10;

------------------------------------------------
-- 1. Checking the Date Range
-------------------------------------------------
-- They started collecting the data 2023-01-01
SELECT MIN(transaction_date) AS min_date 
FROM workspace.default.bright_coffee_shop_analysis;

-- the duration of the data is 6 months
--  They last collected the data 2023-06-30

SELECT MAX(transaction_date) AS latest_date 
FROM workspace.default.bright_coffee_shop_analysis;

-------------------------------------------------
-- 2. Checking the names of the different stores
------------------------------------------------
-- we have 3 stores and their names are Lower Manhattan, Hell's Kitchen, Astoria
SELECT DISTINCT store_location
FROM workspace.default.bright_coffee_shop_analysis;
-- Counting the number of stores 
SELECT COUNT(DISTINCT store_id) AS number_of_stores
FROM workspace.default.bright_coffee_shop_analysis;
-------------------------------------------------
-- 3. Checking products sold at our stores 
------------------------------------------------
SELECT DISTINCT product_category
FROM workspace.default.bright_coffee_shop_analysis;

SELECT DISTINCT product_detail
FROM workspace.default.bright_coffee_shop_analysis;

SELECT DISTINCT product_type
FROM workspace.default.bright_coffee_shop_analysis;

SELECT DISTINCT product_category AS category,
                product_detail AS product_name
FROM workspace.default.bright_coffee_shop_analysis;

-------------------------------------------------
-- 1. Checking product prices
------------------------------------------------
SELECT MIN(unit_price) As cheapest_price
FROM workspace.default.bright_coffee_shop_analysis;

SELECT MAX(unit_price) As expensive_price
FROM workspace.default.bright_coffee_shop_analysis;

------------------------------------------------
SELECT 
COUNT(*) AS number_of_rows,
      COUNT(DISTINCT transaction_id) AS number_of_sales,
      COUNT(DISTINCT product_id) AS number_of_products,
      COUNT(DISTINCT store_id) AS number_of_stores
FROM workspace.default.bright_coffee_shop_analysis;
------------------------------------------------
SELECT *
FROM workspace.default.bright_coffee_shop_analysis
LIMIT 10;


SELECT
      transaction_date,
      date_format(transaction_date, 'E') AS Day_name,
      date_format(transaction_date, 'MMMM') AS Month_name,

      transaction_qty*unit_price AS revenue_per_tnx
FROM workspace.default.bright_coffee_shop_analysis;
-----------------------------------------------------
SELECT COUNT(*)
FROM workspace.default.bright_coffee_shop_analysis;

SELECT 
      transaction_date,
      date_format(transaction_date, 'E') AS Day_name,
      date_format(transaction_date, 'MMMM') AS Month_name,
      --DATE_FORMAT(transaction_time, 'HH:mm:ss') AS purchase_time,
      dayofmonth(transaction_date) AS day_of_month,
      

      CASE WHEN date_format(transaction_date, 'E') IN ('Sun', 'Sat') THEN 'Weekend'
           ELSE 'Weekday'
      END AS day_Classification,

      CASE 
          WHEN DATE_FORMAT(transaction_time, 'HH:mm:ss') BETWEEN '00:00:00' AND '11:59:59' THEN '01. Morning'
          WHEN DATE_FORMAT(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN '02. Afternoon'
          WHEN DATE_FORMAT(transaction_time, 'HH:mm:ss') >= '17:00:00' THEN '03. Evening'
      END AS Time_Buckets,
  
      COUNT(DISTINCT transaction_id) AS Number_of_sales,
      COUNT(DISTINCT product_id) AS Number_of_products,
      COUNT(DISTINCT store_id) AS Number_of_stores,
      SUM(transaction_qty*unit_price) AS revenue_per_day,

      CASE WHEN revenue_per_day <=50 THEN '01. Low Spend'
           WHEN revenue_per_day BETWEEN 51 AND 100 THEN '02. Medium Spend'
           ELSE 'High Spend'
      END AS Spend_Buckets,

       Store_location,
      product_category
      --product_detail
FROM workspace.default.bright_coffee_shop_analysis
GROUP BY transaction_date,
         date_format(transaction_date, 'E'),
          Time_Buckets,
          product_category,
            Store_location,
         day_Classification,
         date_format(transaction_date, 'MMMM');
       --product_detail,
         --DATE_FORMAT(transaction_time, 'HH:mm:ss');
