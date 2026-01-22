# 🚴‍♂️ Adventure Works Cycle - Multi-Platform Analytics Dashboard

<div align="center">

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Tableau](https://img.shields.io/badge/Tableau-E97627?style=for-the-badge&logo=tableau&logoColor=white)
![Excel](https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Complete-success?style=for-the-badge)

**A comprehensive business intelligence solution showcasing sales, product, and customer analytics across Excel, Power BI, and Tableau**

[View Dashboards](#-dashboard-gallery) • [SQL Queries](#-data-transformation--sql) • [Key Insights](#-key-business-insights)

</div>

---

## 📋 Table of Contents
- [Project Overview]
- [Dashboard Platforms]
- [Key Metrics]
- [Dashboard Gallery]
- [Technical Implementation]
- [Data Transformation & SQL]
- [Key Business Insights]
- [Project Structure]
- [Getting Started]
- [Features]
- [Technologies Used]

---

## 📊 Project Overview

This project demonstrates end-to-end business intelligence capabilities by creating interactive dashboards across three major platforms: **Excel**, **Power BI**, and **Tableau**. The dashboards analyze Adventure Works Cycle's sales performance, product analytics, and customer demographics from 2010-2014.

**Project Highlights:**
- 📈 Multi-platform dashboard development (Excel, Power BI, Tableau)
- 🗄️ Advanced SQL queries for data transformation
- 📊 Interactive visualizations with drill-down capabilities
- 🎨 Professional dashboard design with consistent branding
- 📉 Comprehensive business insights across sales, products, and customers

---

## 🛠️ Dashboard Platforms

### 1. 📊 Power BI Dashboard
**Features:**
- Advanced DAX calculations for KPIs
- Interactive slicers and filters
- Cross-page filtering and drill-through
- Custom color themes and branding
- Mobile-optimized layout

**Pages:**
- Overview Analysis
- Product Performance
- Customer Demographics

### 2. 📈 Tableau Dashboard
**Features:**
- Parameter controls for dynamic analysis
- Advanced calculated fields
- Interactive maps and geographic analysis
- Custom color palettes
- Dashboard actions and filters

**Workbooks:**
- Business Insights Dashboard
- Product Performance Dashboard
- Customer Performance Dashboard

### 3. 📑 Excel Dashboard
**Features:**
- Advanced Excel formulas and functions
- Pivot Tables and Pivot Charts
- Slicers for interactive filtering
- Conditional formatting
- VBA macros for automation (if applicable)

---

## 🎯 Key Metrics (KPIs)

<table>
<tr>
<td align="center"><b>💰 Total Sales</b><br/>₹29M</td>
<td align="center"><b>📈 Total Profit</b><br/>₹12M</td>
<td align="center"><b>🚚 Freight Cost</b><br/>₹734K</td>
</tr>
<tr>
<td align="center"><b>👥 Customers</b><br/>18.48K</td>
<td align="center"><b>📦 Quantity Sold</b><br/>60.40K</td>
<td align="center"><b>💹 Profit Margin</b><br/>41%</td>
</tr>
<tr>
<td align="center"><b>📋 Total Orders</b><br/>27.66K</td>
<td align="center"><b>🏆 Peak Year</b><br/>2013 (₹16.35M)</td>
<td align="center"><b>🌍 Top Market</b><br/>Australia</td>
</tr>
</table>

---

## 🖼️ Dashboard Gallery

### Power BI Dashboards

<details>
<summary><b>📊 Overview Analysis Page</b></summary>

![Overview Page](https://github.com/Nandini0606/Adventure-Works-Sales-Analysis-Dashboards/blob/main/Screenshot%20of%20Overview%20Analysis%20Dashboard.png)

**Key Visualizations:**
- Year-wise Sales Trends (2010-2014)
- Quarter-wise Sales Distribution
- Category-wise Sales Breakdown
- Sales vs Production Cost Analysis
- Monthly Sales Trends with Line Chart

</details>

<details>
<summary><b>📦 Product Analysis Page</b></summary>

![Product Page](https://github.com/Nandini0606/Adventure-Works-Sales-Analysis-Dashboards/blob/main/Screenshot%20of%20Product%20Analysis%20Dashboard.png)

**Key Visualizations:**
- Country-wise Sales Distribution
- Top & Bottom Products by Sales
- Sub-category Performance
- Product Color Analysis
- Sales by Product Category

</details>

<details>
<summary><b>👥 Customer Analysis Page</b></summary>

![Customer Page](https://github.com/Nandini0606/Adventure-Works-Sales-Analysis-Dashboards/blob/main/Screenshot%20of%20Customer%20Analysis%20Dashboard.png)

**Key Visualizations:**
- Occupation-wise Sales
- Education-wise Customer Distribution
- Gender Demographics (51% M, 49% F)
- Top 10 Customers by Sales
- Country-wise Customer Base

</details>

---

### Tableau Dashboards

<details>
<summary><b>📊 Business Insights Dashboard</b></summary>

![Tableau Overview](images/tableau_overview_light.png)

**Features:**
- Top 10 Products by Sales
- Quarter-wise Sales Donut Chart
- Region-wise Performance
- Year-wise Sales Trends
- Month-wise Sales & Production Cost

</details>

<details>
<summary><b>📦 Product Performance Dashboard</b></summary>

![Tableau Product](images/tableau_product_light.png)

**Features:**
- Color-wise Product Analysis
- Top 5 Sub-categories
- Country-wise Sales
- Top & Bottom 10 Products
- Product Category Distribution

</details>

<details>
<summary><b>👥 Customer Performance Dashboard</b></summary>

![Tableau Customer](images/tableau_customer_light.png)

**Features:**
- Gender Distribution Analysis
- Education-wise Customer Count
- Occupation-wise Customer Breakdown
- Top 5 Sub-category Preferences
- Top 10 Customers by Sales

</details>

---

### Excel Dashboards

<details>
<summary><b>📊 Excel Interactive Dashboard</b></summary>

![Excel Dashboard](images/excel_dashboard.png)

**Features:**
- Pivot Tables for dynamic analysis
- Slicers for Year, Quarter, Country, and Category
- Multiple chart types (Bar, Line, Donut)
- Conditional formatting for KPIs
- Interactive filtering across all visuals

</details>

---

## 🔧 Technical Implementation

### Power BI Development

**Data Modeling:**
```dax
// Star Schema Implementation
Fact Table: FactInternetSales_All
Dimension Tables: DimProduct, DimCustomer, DimDate (Custom), DimGeography
```

**Key DAX Measures:**
```dax
Total Sales = 
SUM(FactInternetSales_All[SalesAmount])

Total Profit = 
SUMX(
    FactInternetSales_All,
    (FactInternetSales_All[UnitPrice] * FactInternetSales_All[OrderQuantity])
    - (FactInternetSales_All[UnitPrice] * FactInternetSales_All[OrderQuantity] * FactInternetSales_All[UnitPriceDiscountPct])
    - (RELATED(DimProduct[StandardCost]) * FactInternetSales_All[OrderQuantity])
)

Profit Margin % = 
DIVIDE([Total Profit], [Total Sales], 0)

YoY Growth = 
VAR CurrentYearSales = [Total Sales]
VAR PreviousYearSales = CALCULATE([Total Sales], SAMEPERIODLASTYEAR(DimDate[Date]))
RETURN
DIVIDE(CurrentYearSales - PreviousYearSales, PreviousYearSales, 0)

Total Customers = 
DISTINCTCOUNT(FactInternetSales_All[CustomerKey])

Average Order Value = 
DIVIDE([Total Sales], [Total Orders], 0)
```

**Power Query Transformations:**
- Merged FactInternetSales and Fact_Internet_Sales_New
- Created custom Date dimension with fiscal calendar
- Lookup transformations for Product and Customer names
- Data type standardization
- Removed duplicates and handled null values

---

### Tableau Development

**Calculated Fields:**
```tableau
// Total Sales
SUM([SalesAmount])

// Profit Calculation
SUM([UnitPrice] * [OrderQuantity] * (1 - [UnitPriceDiscountPct])) - SUM([StandardCost] * [OrderQuantity])

// Profit Margin
SUM([Profit]) / SUM([SalesAmount])

// Rank Products
RANK_UNIQUE(SUM([SalesAmount]))
```

**Parameters:**
- Date Range Selection
- Top N Products Filter
- Category Selection

**Dashboard Actions:**
- Filter actions across worksheets
- Highlight actions for emphasis
- URL actions for drill-through (if applicable)

---

### Excel Development

**Advanced Formulas:**
```excel
=SUMIFS() - Multi-criteria sales calculations
=VLOOKUP() / INDEX-MATCH - Product and customer lookups
=PIVOT TABLES - Dynamic aggregations
=GETPIVOTDATA() - Extract specific pivot values
=CONDITIONAL FORMATTING - KPI visualization
```

**Features Implemented:**
- Dynamic named ranges
- Pivot Table slicers
- Custom chart templates
- Data validation for filters

---

## 💾 Data Transformation & SQL

### Database Setup
```sql
-- Create database
CREATE DATABASE adventure_works_cycle;
USE adventure_works_cycle;

-- Union of Fact Tables
CREATE TABLE FactInternetSales_All AS
SELECT * FROM FactInternetSales
UNION ALL
SELECT * FROM Fact_Internet_Sales_New;
```

### Key SQL Queries

<details>
<summary><b>📊 Sales Analysis Queries</b></summary>

**1. Product Lookup with Sales Data**
```sql
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
```

**2. Customer Full Name and Product Details**
```sql
SELECT
    f.SalesOrderNumber,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerFullName,
    p.EnglishProductName AS ProductName,
    f.UnitPrice,
    f.OrderQuantity,
    f.SalesAmount
FROM FactInternetSales_All f
JOIN DimCustomer c ON f.CustomerKey = c.CustomerKey
JOIN DimProduct p ON f.ProductKey = p.ProductKey;
```

**3. Calculate Sales Amount**
```sql
SELECT
    f.UnitPrice,
    f.OrderQuantity,
    f.UnitPriceDiscountPct AS UnitDiscount,
    (f.UnitPrice * f.OrderQuantity) - 
    (f.UnitPrice * f.OrderQuantity * f.UnitPriceDiscountPct) AS SalesAmount
FROM FactInternetSales_All f;
```

**4. Calculate Production Cost**
```sql
SELECT
    f.SalesOrderNumber,
    f.ProductKey,
    f.OrderQuantity,
    p.StandardCost AS UnitCost,
    (p.StandardCost * f.OrderQuantity) AS ProductionCost
FROM FactInternetSales_All f
JOIN DimProduct p ON f.ProductKey = p.ProductKey;
```

**5. Calculate Profit**
```sql
SELECT
    f.SalesOrderNumber,
    f.OrderQuantity,
    f.UnitPrice,
    p.StandardCost,
    CAST(((f.UnitPrice * f.OrderQuantity) - 
          (f.UnitPrice * f.OrderQuantity * f.UnitPriceDiscountPct) - 
          (p.StandardCost * f.OrderQuantity)) AS DECIMAL(12,2)) AS Profit
FROM FactInternetSales_All f
JOIN DimProduct p ON f.ProductKey = p.ProductKey;
```

</details>

<details>
<summary><b>📅 Date Dimension Queries</b></summary>

**Creating Date Fields from OrderDateKey**
```sql
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
    
    -- Financial Calendar
    CONCAT('FM',
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
FROM FactInternetSales_All f;
```

</details>

<details>
<summary><b>📈 Time-Series Analysis Queries</b></summary>

**Year-wise Sales**
```sql
SELECT
    YEAR(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) AS Year,
    CONCAT(CAST(SUM((f.UnitPrice * f.OrderQuantity) - 
           (f.UnitPrice * f.OrderQuantity * f.UnitPriceDiscountPct))/1000000 
           AS DECIMAL(12,2)), ' M') AS YearwiseSales
FROM FactInternetSales_All f
GROUP BY Year
ORDER BY Year;
```

**Quarter-wise Sales**
```sql
SELECT
    CONCAT('Q', qtr) AS Quarter,
    CONCAT(CAST(SUM(UnitPrice * OrderQuantity * (1 - UnitPriceDiscountPct)) / 1000000
           AS DECIMAL(12,2)), ' M') AS QuarterwiseSales
FROM (
    SELECT
        UnitPrice, OrderQuantity, UnitPriceDiscountPct,
        QUARTER(STR_TO_DATE(OrderDateKey, '%Y%m%d')) AS qtr
    FROM FactInternetSales_All
) f
GROUP BY qtr
ORDER BY qtr;
```

**Month-wise Sales**
```sql
SELECT
    MONTHNAME(order_date) AS MonthFullName,
    CONCAT(CAST(SUM(UnitPrice * OrderQuantity * (1 - UnitPriceDiscountPct)) / 1000000
           AS DECIMAL(12,2)), ' M') AS MonthwiseSales
FROM (
    SELECT *, STR_TO_DATE(OrderDateKey, '%Y%m%d') AS order_date
    FROM FactInternetSales_All
) f
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY MONTH(order_date);
```

**Year-wise Sales & Production Cost**
```sql
SELECT
    YEAR(STR_TO_DATE(f.OrderDateKey, '%Y%m%d')) AS Year,
    CONCAT(ROUND(SUM((f.UnitPrice * f.OrderQuantity) - 
           (f.UnitPrice * f.OrderQuantity * f.UnitPriceDiscountPct)) / 1000000, 2), ' M') AS SalesAmount,
    CONCAT(ROUND(SUM(p.StandardCost * f.OrderQuantity) / 1000000, 2), ' M') AS ProductionCost
FROM FactInternetSales_All f
JOIN DimProduct p ON f.ProductKey = p.ProductKey
GROUP BY YEAR(STR_TO_DATE(f.OrderDateKey, '%Y%m%d'))
ORDER BY Year;
```

</details>

<details>
<summary><b>📊 KPI Calculations</b></summary>

```sql
SELECT
    COUNT(DISTINCT CustomerKey) AS TotalCustomers,
    COUNT(SalesOrderNumber) AS TotalOrders,
    CONCAT(ROUND(SUM((UnitPrice * OrderQuantity) - 
           (UnitPrice * OrderQuantity * UnitPriceDiscountPct)) / 1000000, 2), ' M') AS TotalSales,
    CONCAT(ROUND(SUM((UnitPrice * OrderQuantity) - 
           (UnitPrice * OrderQuantity * UnitPriceDiscountPct) - 
           (StandardCost * OrderQuantity)) / 1000000, 2), ' M') AS TotalProfit
FROM FactInternetSales_All f
JOIN DimProduct p ON f.ProductKey = p.ProductKey;
```

</details>

---

## 💡 Key Business Insights

### Sales Performance
- 📈 **Peak Performance**: 2013 recorded highest sales at ₹16.35M (55% of total)
- 📉 **Declining Trend**: Sales dropped significantly in 2014 to ₹0.05M
- 📊 **Seasonal Pattern**: Q4 consistently outperforms other quarters (31% of annual sales)
- 🚴 **Product Dominance**: Bikes category accounts for 97% of revenue (₹28.3M)

### Product Analysis
- 🏆 **Top Product**: Mountain-200 Black, 46 generated ₹1.37M in sales
- 🎨 **Color Preference**: Black color variants lead with ₹8.84K in sales
- 🚵 **Sub-category Leader**: Road Bikes (₹14.52M) outperform Mountain Bikes (₹9.95M)
- 🌍 **Geographic Focus**: Australia and United States are top markets

### Customer Demographics
- 👥 **Gender Split**: Nearly balanced - Male (51%), Female (49%)
- 👔 **Occupation**: Professional occupation drives ₹9.9M in sales
- 🎓 **Education**: Bachelor's degree holders are primary customer segment
- 🌎 **Top Markets**: United States (21.34K customers), Australia (13.35K customers)

### Profitability
- 💰 **Profit Margin**: Strong 41% profit margin maintained
- 📊 **Cost Control**: Production costs well-managed at ₹4.59M in peak year
- 💹 **ROI**: High return on investment across all product categories

---

## 📁 Project Structure

```
Adventure-Works-Multi-Platform-Dashboard/
│
├── 📊 PowerBI/
│   ├── Adventure_Works_Dashboard.pbix
│   └── Images/
│       ├── Overview_Page.png
│       ├── Product_Page.png
│       └── Customer_Page.png
│
├── 📈 Tableau/
│   ├── Adventure_Works_Business_Insights.twbx
│   ├── Adventure_Works_Product_Performance.twbx
│   ├── Adventure_Works_Customer_Performance.twbx
│   └── Images/
│       ├── Business_Insights.png
│       ├── Product_Dashboard.png
│       └── Customer_Dashboard.png
│
├── 📑 Excel/
│   ├── Adventure_Works_Dashboard.xlsx
│   └── Images/
│       └── Excel_Dashboard.png
│
├── 💾 Data/
│   ├── FactInternetSales.csv
│   ├── Fact_Internet_Sales_New.csv
│   ├── DimProduct.csv
│   ├── DimCustomer.csv
│   └── DimGeography.csv
│
├── 🗄️ SQL/
│   ├── AdventureWorksCycle_SQL_Queries.sql
│   ├── Database_Setup.sql
│   └── Views_Creation.sql
│
├── 📚 Documentation/
│   ├── Data_Dictionary.md
│   ├── Dashboard_User_Guide.pdf
│   └── Technical_Documentation.md
│
└── README.md
```
---

## ✨ Features

### Power BI Features
- 🔄 **Auto-refresh** data connections
- 📱 **Mobile-optimized** layouts
- 🎨 **Custom themes** with brand colors
- 🔍 **Drill-through** capabilities
- 📊 **Bookmarks** for saved views
- 🎯 **Tooltips** with additional context

### Tableau Features
- 📊 **Interactive parameters** for dynamic analysis
- 🗺️ **Geographic mapping** with custom territories
- 📈 **Story points** for guided analysis
- 🎨 **Custom color palettes** 
- 🔗 **Dashboard actions** for interactivity
- 📱 **Device-specific** layouts

### Excel Features
- 🎛️ **Slicers** for multi-dimensional filtering
- 📊 **Pivot tables** with drill-down
- 📈 **Dynamic charts** that update automatically
- 🎨 **Conditional formatting** for KPIs
- 🔗 **Linked workbooks** for modular design
- 📱 **Print-friendly** layouts

---

## 🔧 Technologies Used

<table>
<tr>
<td><b>Category</b></td>
<td><b>Technologies</b></td>
</tr>
<tr>
<td><b>BI Tools</b></td>
<td>Power BI Desktop, Tableau Desktop, Microsoft Excel</td>
</tr>
<tr>
<td><b>Database</b></td>
<td>MySQL 8.0</td>
</tr>
<tr>
<td><b>Languages</b></td>
<td>DAX, SQL, M (Power Query), Tableau Calculated Fields</td>
</tr>
<tr>
<td><b>Data Processing</b></td>
<td>Power Query, SQL Views, Excel Power Query</td>
</tr>
<tr>
<td><b>Visualization</b></td>
<td>Custom visuals, Chart types, Geographic maps</td>
</tr>
</table>

---

## 📊 Dashboard Comparison

| Feature | Power BI | Tableau | Excel |
|---------|----------|---------|-------|
| **Interactivity** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| **Data Capacity** | High | High | Medium |
| **Ease of Use** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Customization** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| **Mobile Support** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| **Learning Curve** | Medium | Medium-High | Low |
| **Cost** | Free Desktop | Free Public | License Required |

---

## 📈 Future Enhancements

- [ ] Add real-time data refresh capabilities
- [ ] Implement predictive analytics using machine learning
- [ ] Create Python/R integration for advanced analytics
- [ ] Add more granular product category analysis
- [ ] Implement customer segmentation using clustering
- [ ] Create automated email reports
- [ ] Add mobile-first responsive design
- [ ] Integrate with cloud data warehouses

---

## 🙏 Acknowledgments

- 📊 Adventure Works sample database by Microsoft
- 🎨 Dashboard design inspiration from the BI community
- 💡 SQL query optimization techniques from MySQL documentation
- 🎓 Data visualization best practices from Tableau and Power BI communities
- 🌟 Special thanks to the open-source community

*"Transforming data into actionable insights, one dashboard at a time"*

</div>
