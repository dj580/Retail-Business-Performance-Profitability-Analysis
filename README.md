# Retail Business Performance & Profitability Analysis

## Project Overview
This project analyzes retail transactional data to uncover profit-draining categories, optimize inventory turnover, and identify seasonal trends in product performance. The analysis combines SQL, Python, and Tableau to provide actionable business insights and interactive visualizations.

## Objectives
- Identify profit-draining product categories and sub-categories.
- Assess the impact of discounts and delivery processing days on profitability.
- Analyze regional performance trends.
- Optimize inventory and provide strategic recommendations.

## Dataset
- Source: Sample Superstore dataset
- Records: ~9,994 transactions

## Tools & Technologies
- **SQL (MySQL):** Data import, cleaning, and aggregation.
- **Python (Pandas, Seaborn, Matplotlib):** Exploratory data analysis, correlation studies, and visualization.
- **Tableau:** Interactive dashboards with KPIs, trend charts, and filters.

## Project Steps
1. **Data Cleaning & Import**
   - Handle missing/null values and verify data types.
   - Import CSV into MySQL using `LOAD DATA INFILE`.
2. **SQL Analysis**
   - Calculate profit margins by category and sub-category.
   - Analyze regional profitability and discount impact.
3. **Python Analysis**
   - Correlation between processing days and profitability.
   - Detect outliers and visualize trends.
4. **Tableau Dashboard**
   - KPIs for Sales, Profit, Orders, Margin %.
   - Filters: Region, Product Type, Season.
   - Trend charts for actionable insights.

## Key Insights
- **Furniture:** Often a loss driver; reduce stock and avoid deep discounts.
- **Office Supplies & Technology:** High-margin categories; maintain or expand stock.
- **Discounting:** Margins collapse above 40% discount.
- **Processing Days:** Minimal impact on profitability.

## Deliverables
- SQL scripts (`.sql`)
- Python analysis notebooks (`.ipynb`)
- Tableau interactive dashboard
- PDF report with findings and recommendations

## Conclusion
This project demonstrates data-driven decision-making for retail business performance. Insights help optimize inventory, focus on high-margin categories, prevent margin erosion from deep discounting, and monitor regional trends through dashboards.

---

