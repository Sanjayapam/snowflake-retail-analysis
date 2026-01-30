## 🛒 Retail Sales Performance & Double Pareto Analysis (Snowflake SQL)

## 📋 Project Description
This project analyzes large-scale retail sales performance using the **Corporación Favorita** dataset. The analysis focuses on identifying key revenue contributors using the **Pareto Principle (80/20 rule)**, evaluating operational efficiency through normalized KPIs, and uncovering consumer behavior patterns based on temporal trends.

The entire analysis was performed using **Snowflake SQL**, processing millions of transaction rows to generate actionable business insights.

---

## 🚀 Analytical Methodology

The project is structured into four strategic phases:

### 1. KPI Normalization & Store Efficiency
Beyond absolute sales, this phase evaluates daily store efficiency using three core metrics:
* **Productivity:** Sales per active day.
* **Traffic:** Number of transactions per day.
* **Basket Size:** Average transaction value.

### 2. Pareto Analysis (Top 80% Stores)
Identifying the "backbone" stores of the company.
* **Findings:** Approximately 57% of stores (31 out of 54) contribute to 80% of the total company revenue.

### 3. Double Pareto Analysis (Top 80% Product Families)
Analyzing the most dominant product categories (*Families*) within high-performance stores (Top 80% Stores).
* **The Big Five:** Grocery I, Beverages, Produce, Cleaning, and Dairy account for nearly 80% of turnover in elite stores.

### 4. Temporal & Seasonality Analysis
Examining daily shopping patterns to optimize logistics, staffing, and inventory management.

---

## 📈 Key Insights

* **Regional Dominance:** The city of **Quito** dominates the top 7 highest-selling stores; however, stores in **Guayaquil** exhibit a more competitive average *Basket Size*.
* **"Wednesday Fresh" Strategy:** For the **PRODUCE** category, peak sales occur on **Wednesday (17.96%)**, surpassing weekend figures. This indicates the success of "Fresh Day" mid-week marketing campaigns.
* **Weekend Surge:** The **BEVERAGES** category is highly sensitive to weekends, with Sunday alone contributing **20%** of the weekly volume.
* **Thursday Slump:** Thursday consistently represents the lowest activity point across all product categories, making it the ideal window for store maintenance or major restocking operations.

---

## 🛠️ Tech Stack
* **Database:** Snowflake
* **Language:** SQL (Window Functions, CTEs, Aggregate Functions, Temporal Data Handling)

---

## 📂 Folder Structure
```text
├── scripts/
│   ├── 01_store_efficiency_kpi.sql
│   ├── 02_pareto_store_analysis.sql
│   ├── 03_double_pareto_product_family.sql
│   └── 04_daily_temporal_trends.sql
└── README.md
