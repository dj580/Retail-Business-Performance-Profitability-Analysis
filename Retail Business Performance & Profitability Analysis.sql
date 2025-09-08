-- Create a database

CREATE DATABASE retail_project;
USE retail_project;
--- Create a table

CREATE TABLE superstore (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);
--- Load CSV into this table
SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sample - Superstore.csv'
INTO TABLE superstore
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Row_ID, Order_ID, Order_Date, Ship_Date, Ship_Mode, Customer_ID, Customer_Name, Segment, Country, City, State, Postal_Code, Region, Product_ID, Category, Sub_Category, Product_Name, Sales, Quantity, Discount, Profit);

SELECT COUNT(*) FROM superstore;

TRUNCATE TABLE superstore;

select * from superstore;
LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sample - Superstore.csv'
INTO TABLE superstore
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Row_ID, Order_ID, Order_Date, Ship_Date, Ship_Mode, Customer_ID, Customer_Name, Segment, Country, City, State, Postal_Code, Region, Product_ID, Category, Sub_Category, Product_Name, Sales, Quantity, Discount, Profit);
---- Row Count
SELECT COUNT(*) FROM superstore;

---  Nulls / blanks quick scan
SELECT 
  SUM(Order_ID IS NULL OR Order_ID='') AS null_orderid,
  SUM(Order_Date IS NULL)              AS null_orderdate,
  SUM(Sales IS NULL)                   AS null_sales,
  SUM(Profit IS NULL)                  AS null_profit,
  SUM(Category IS NULL)                AS null_category,
  SUM(Sub_category IS NULL)             AS null_sub_category
FROM superstore;

---- Duplicates by Row_ID (or full row if Row_ID isn’t unique)
SELECT Row_ID, COUNT(*) c
FROM superstore
GROUP BY Row_ID
HAVING c>1;

--- Core profitability (category / sub-category / region)

--  Category P&L
SELECT
  Category,
  ROUND(SUM(Sales),2)  AS Sales,
  ROUND(SUM(Profit),2) AS Profit,
  ROUND(SUM(Profit)/NULLIF(SUM(Sales),0)*100,2) AS MarginPct
FROM superstore
GROUP BY Category
ORDER BY MarginPct ASC;  -- lowest margin first (profit-drainers)

--  Sub-Category P&L (with rank)
SELECT
  Category, Sub_Category,
  ROUND(SUM(Sales),2)  AS Sales,
  ROUND(SUM(Profit),2) AS Profit,
  ROUND(SUM(Profit)/NULLIF(SUM(Sales),0)*100,2) AS MarginPct,
  RANK() OVER (PARTITION BY Category ORDER BY SUM(Profit)/NULLIF(SUM(Sales),0)) AS MarginRankInCat
FROM superstore
GROUP BY Category, Sub_Category
ORDER BY MarginPct ASC;

--  Region x Category matrix
SELECT
  Region, Category,
  ROUND(SUM(Sales),2) AS Sales,
  ROUND(SUM(Profit),2) AS Profit,
  ROUND(SUM(Profit)/NULLIF(SUM(Sales),0)*100,2) AS MarginPct
FROM superstore
GROUP BY Region, Category
ORDER BY Region, Category;
