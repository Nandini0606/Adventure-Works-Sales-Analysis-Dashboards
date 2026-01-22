create database adventure_works_cycle;
use adventure_works_cycle;

#Q 0.Union of Fact Internet sales and Fact internet sales new
CREATE TABLE FactInternetSales_All AS
SELECT * FROM FactInternetSales
UNION ALL
SELECT * FROM Fact_Internet_Sales_New;

SELECT * FROM Fact_Internet_Sales_New;


# Q.1.Lookup the productname from the Product sheet to Sales sheet.
SELECT
    f.SalesOrderNumber,
    f.ProductKey,
    p.EnglishProductName AS ProductName,
    f.UnitPrice,
    f.OrderQuantity,
    f.SalesAmount
FROM FactInternetSales_All f
JOIN DimProduct p
    ON f.ProductKey = p.ProductKey;
    
CREATE VIEW vw_sales_with_product AS
SELECT
    f.SalesOrderNumber,
    p.EnglishProductName AS ProductName,
    f.UnitPrice,
    f.OrderQuantity,
    f.SalesAmount
FROM FactInternetSales_All f
JOIN DimProduct p
    ON f.ProductKey = p.ProductKey;
    select	* from vw_sales_with_product;

# Q.2.Lookup the Customerfullname from the Customer and Unit Price from Product sheet to Sales sheet.
SELECT
    f.SalesOrderNumber,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerFullName,
    p.EnglishProductName AS ProductName,
    f.UnitPrice,
    f.OrderQuantity,
    f.SalesAmount
FROM FactInternetSales_All f
JOIN DimCustomer c
    ON f.CustomerKey = c.CustomerKey
JOIN DimProduct p
    ON f.ProductKey = p.ProductKey;
    
CREATE VIEW vw_sales_customer AS
SELECT
    f.SalesOrderNumber,
    f.SalesOrderLineNumber,
    f.OrderDateKey,
-- Customer
    c.CustomerKey,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerFullName,
    c.Gender,
    c.EnglishOccupation,
-- Product
    p.ProductKey,
    p.EnglishProductName AS ProductName,
    p.ListPrice,
    -- Sales facts
    f.OrderQuantity,
    f.UnitPrice,
    f.SalesAmount
FROM FactInternetSales_All f
JOIN DimCustomer c
    ON f.CustomerKey = c.CustomerKey
JOIN DimProduct p
    ON f.ProductKey = p.ProductKey;

SELECT * 
FROM vw_sales_customer
LIMIT 10;

SELECT
    Gender,
    CONCAT(CAST(SUM(SalesAmount)/1000000
    AS DECIMAL(12,2)),' M')
    AS TotalSales
FROM vw_sales_customer
GROUP BY Gender;

select * from FactInternetSales_All;
# Q3 A)Year
SELECT
    STR_TO_DATE(f.OrderDateKey, '%Y%m%d') AS OrderDate,
    YEAR(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) AS Year
FROM FactInternetSales_All f
ORDER BY OrderDate;
# B. Monthno
SELECT
    STR_TO_DATE(f.OrderDateKey, '%Y%m%d') AS OrderDate,
    MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) AS MonthNo
FROM FactInternetSales_All f
ORDER BY OrderDate;
# C.MonthFullName
SELECT
    STR_TO_DATE(f.OrderDateKey, '%Y%m%d') AS OrderDate,
    MONTHNAME(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) AS MonthFullName
FROM FactInternetSales_All f
ORDER BY OrderDate;
# D. Quarter
SELECT
    STR_TO_DATE(f.OrderDateKey, '%Y%m%d') AS OrderDate,
    QUARTER(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) AS Quarter
FROM FactInternetSales_All f
ORDER BY OrderDate;
# E.YearMonth
SELECT
    STR_TO_DATE(f.OrderDateKey, '%Y%m%d') AS OrderDate,
    DATE_FORMAT(STR_TO_DATE(f.OrderDateKey, '%Y%m%d'), '%Y-%b') AS YearMonth
FROM FactInternetSales_All f
ORDER BY OrderDate;
# F.WeekdayNo
SELECT
    STR_TO_DATE(f.OrderDateKey, '%Y%m%d') AS OrderDate,
    WEEKDAY(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) + 1 AS WeekdayNo
FROM FactInternetSales_All f
ORDER BY OrderDate;
# G. WeekdayName
SELECT
    STR_TO_DATE(f.OrderDateKey, '%Y%m%d') AS OrderDate,
    DAYNAME(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) AS WeekdayName
FROM FactInternetSales_All f
ORDER BY OrderDate;
# H. Financial Month
SELECT
    STR_TO_DATE(f.OrderDateKey, '%Y%m%d') AS OrderDate,
    CONCAT(
        'FM',
        CASE
            WHEN MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) >= 4
                THEN MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) - 3
            ELSE MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) + 9
        END
    ) AS FinancialMonth
FROM FactInternetSales_All f
ORDER BY OrderDate;

# I. Financial Quarter
SELECT
    STR_TO_DATE(f.OrderDateKey, '%Y%m%d') AS OrderDate,
    CASE
        WHEN MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) BETWEEN 4 AND 6 THEN 'FQ1'
        WHEN MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) BETWEEN 7 AND 9 THEN 'FQ2'
        WHEN MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) BETWEEN 10 AND 12 THEN 'FQ3'
        ELSE 'FQ4'
    END AS FinancialQuarter
FROM FactInternetSales_All f
ORDER BY OrderDate;

CREATE VIEW vw_sales_with_datefields AS
SELECT
    STR_TO_DATE(f.OrderDateKey, '%Y%m%d') AS OrderDate,

    YEAR(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) AS Year,
    MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) AS MonthNo,
    MONTHNAME(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) AS MonthFullName,
    QUARTER(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) AS Quarter,
    DATE_FORMAT(STR_TO_DATE(f.OrderDateKey, '%Y%m%d'), '%Y-%b') AS YearMonth,

    WEEKDAY(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) + 1 AS WeekdayNo,
    DAYNAME(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) AS WeekdayName,

    CONCAT(
        'FM',
        CASE
            WHEN MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) >= 4
                THEN MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) - 3
            ELSE MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) + 9
        END
    ) AS FinancialMonth,

    CASE
        WHEN MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) BETWEEN 4 AND 6 THEN 'FQ1'
        WHEN MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) BETWEEN 7 AND 9 THEN 'FQ2'
        WHEN MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) BETWEEN 10 AND 12 THEN 'FQ3'
        ELSE 'FQ4'
    END AS FinancialQuarter

    FROM FactInternetSales_All f

GROUP BY
    STR_TO_DATE(f.OrderDateKey, '%Y%m%d'),
    YEAR(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')),
    MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')),
    MONTHNAME(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')),
    QUARTER(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')),
    DATE_FORMAT(STR_TO_DATE(f.OrderDateKey, '%Y%m%d'), '%Y-%b'),
    WEEKDAY(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) + 1,
    DAYNAME(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')),
    CONCAT(
        'FM',
        CASE
            WHEN MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) >= 4
                THEN MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) - 3
            ELSE MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) + 9
        END
    ),
    CASE
        WHEN MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) BETWEEN 4 AND 6 THEN 'FQ1'
        WHEN MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) BETWEEN 7 AND 9 THEN 'FQ2'
        WHEN MONTH(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) BETWEEN 10 AND 12 THEN 'FQ3'
        ELSE 'FQ4'
    END;

SELECT *
FROM vw_sales_with_datefields;


# Q.4.Calculate the Sales amount uning the columns(unit price,order quantity,unit discount)
SELECT
    f.UnitPrice,
    f.OrderQuantity,
    f.UnitPriceDiscountPct AS UnitDiscount,
    (f.UnitPrice * f.OrderQuantity)
      - (f.UnitPrice * f.OrderQuantity * f.UnitPriceDiscountPct)
      AS SalesAmount
FROM FactInternetSales_All f;

# Total Sales
SELECT
    concat(cast(SUM((f.UnitPrice * f.OrderQuantity)
            - (f.UnitPrice * f.OrderQuantity * f.UnitPriceDiscountPct)) / 1000000
        AS DECIMAL(12,2)),' M'
    ) AS TotalSales_Million
FROM FactInternetSales_All f;

# Q.5.Calculate the Productioncost uning the columns(unit cost ,order quantity)
SELECT
    f.SalesOrderNumber,
    f.ProductKey,
    f.OrderQuantity,
    p.StandardCost AS UnitCost,
    (p.StandardCost * f.OrderQuantity) AS ProductionCost
FROM FactInternetSales_All f
JOIN DimProduct p
    ON f.ProductKey = p.ProductKey;
    
# Q.6.Calculate the profit.
    SELECT
    f.SalesOrderNumber,
    f.OrderQuantity,
    f.UnitPrice,
    p.standardcost,
CAST(((f.UnitPrice * f.OrderQuantity)
            - (f.UnitPrice * f.OrderQuantity * f.UnitPriceDiscountPct)
            - (p.StandardCost * f.OrderQuantity))
        AS DECIMAL(12,2)
    ) AS Profit
    FROM FactInternetSales_All f
	JOIN DimProduct p
    ON f.ProductKey = p.ProductKey;
    
# Total Profit
    SELECT
    CONCAT(CAST(SUM((f.UnitPrice * f.OrderQuantity)
                - (f.UnitPrice * f.OrderQuantity * f.UnitPriceDiscountPct)
                - (p.StandardCost * f.OrderQuantity)) / 1000000 AS DECIMAL(12,2)),' M'
				 ) AS TotalProfit
FROM FactInternetSales_All f
JOIN DimProduct p
    ON f.ProductKey = p.ProductKey;

# Q.8 Yearwise Sales
SELECT
    YEAR(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) AS Year,
    concat(CAST(SUM((f.UnitPrice * f.OrderQuantity)
            - (f.UnitPrice * f.OrderQuantity * f.UnitPriceDiscountPct))/1000000 AS DECIMAL (12,2)),' M'
    ) AS YearwiseSales
FROM FactInternetSales_All f
GROUP BY Year
ORDER BY Year;

# Q.9. Monthwise Sales
SELECT
    MONTHNAME(order_date) AS MonthFullName,
    CONCAT(CAST(SUM(UnitPrice * OrderQuantity * (1 - UnitPriceDiscountPct)) / 1000000
            AS DECIMAL(12,2)),' M'
    ) AS MonthwiseSales
FROM (
    SELECT
        *,
        STR_TO_DATE(OrderDateKey, '%Y%m%d') AS order_date
    FROM FactInternetSales_All) f
GROUP BY
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY
    MONTH(order_date);


# Q.10. Quarterwise Sales
    SELECT
    CONCAT('Q', qtr) AS Quarter,
    CONCAT(CAST(
            SUM(UnitPrice * OrderQuantity * (1 - UnitPriceDiscountPct)) / 1000000
            AS DECIMAL(12,2)
        ),' M'
    ) AS QuarterwiseSales
FROM (
    SELECT
        UnitPrice,
        OrderQuantity,
        UnitPriceDiscountPct,
        QUARTER(STR_TO_DATE(OrderDateKey, '%Y%m%d')) AS qtr
    FROM FactInternetSales_All
) f
GROUP BY qtr
ORDER BY qtr;

#Q.11. Yearwise Sales and ProductionCost
SELECT
    YEAR(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) AS Year,
    -- Sales Amount 
    CONCAT(ROUND(SUM((f.UnitPrice * f.OrderQuantity)
                - (f.UnitPrice * f.OrderQuantity * f.UnitPriceDiscountPct)
            ) / 1000000,2),' M'
    ) AS SalesAmount,
    -- Production 
    CONCAT(ROUND(SUM(p.StandardCost * f.OrderQuantity) / 
    1000000,2),' M'
    ) AS ProductionCost
FROM FactInternetSales_All f
JOIN DimProduct p
    ON f.ProductKey = p.ProductKey

GROUP BY YEAR(STR_TO_DATE(f.OrderDateKey, '%Y%m%d'))
ORDER BY Year;

# Q.12 Build KPI's
SELECT
    -- Total Customers
    COUNT(DISTINCT CustomerKey) AS TotalCustomers,
    -- Total Orders
    COUNT(SalesOrderNumber) AS TotalOrders,
    -- Total Sales 
    CONCAT(ROUND(SUM((UnitPrice * OrderQuantity)
                - (UnitPrice * OrderQuantity * UnitPriceDiscountPct)
            ) / 1000000,2),' M'
    ) AS TotalSales,
    -- Total Profit (Million with M)
    CONCAT(ROUND(SUM((UnitPrice * OrderQuantity)
                - (UnitPrice * OrderQuantity * UnitPriceDiscountPct)
                - (StandardCost * OrderQuantity)
            ) / 1000000,2),' M'
    ) AS TotalProfit
FROM FactInternetSales_All f
JOIN DimProduct p
    ON f.ProductKey = p.ProductKey;










