
Project overview 

This project focuses on analyzing transactional sales data from a coffee shop to uncover insights that support business growth and decision-making. 

As a Junior data analyst , the objective is to transform raw sales data into meaningful insights that help improve revenue, product performance, and customer engagement. 

 

Objectives 

The analysis aims to answer key business questions: 

Which products generate the most revenue 

What time of day the store performs best 

Sales trends across products and time intervals 

How to improve overall sales performance 

 

️ Tools & Technologies 

Databricks (Spark SQL) – Data processing & transformation 

Microsoft Excel / Google Sheets – Data analysis & pivot tables 

Power BI / Tableau – Data visualization 

Miro – Data architecture planning 

GitHub – Project submission & version control 

 

Data Source 

The dataset “Bright Coffee Shop Sales” contains daily transaction records including: 

Product details 

Transaction quantities 

Unit prices 

Transaction time 

The original dataset was provided in Excel format and converted to CSV for processing in Databricks. 

 

Data Processing (ETL Pipeline) 

1. Extract 

Data imported from Excel and converted to CSV 

2. Transform 

Performed in Databricks using databricks: 

Cleaned and formatted unit_price 

Created calculated field: 

total_amount = unit_price * transaction_qty 

Generated time-based grouping: 

transaction_time_bucket (30-minute or 3-hour intervals) 

Aggregated data by: 

Product category 

Time intervals 

3. Load 

Processed data stored in Databricks tables 

Exported to Excel / visualization tools for reporting 

 

Key Analysis Performed 

🔹 Sales Performance 

Total revenue per product category 

Best-selling and least-selling products 

🔹 Time-Based Analysis 

Peak sales hours 

Low-performance time slots 

🔹 Product Insights 

High-performing products driving revenue 

Underperforming products needing attention 

 

Key Calculations 

Total Revenue 

total_amount = unit_price * transaction_qty 

Time Bucketing 

Grouped transactions into 30-minute intervals (or 3-hour intervals) 

Aggregation 

Total units sold per product 

Revenue per product category 

 

Visualizations & Reporting 

The processed data was exported to Excel / BI tools to create: 

Revenue by product category (charts) 

Sales trends over time 

Peak vs low sales periods 

Product performance dashboards 

 
