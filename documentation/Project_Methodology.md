# Project Methodology
## Credit Card & Financial Transaction Analytics

## 1. Project Overview

This project follows an end-to-end data analytics workflow to analyze customer profiles, credit card information and financial transaction activities.

The workflow combines Microsoft Excel, Python, Pandas, MySQL and Power BI to transform raw financial datasets into meaningful business insights.

## 2. Data Profiling – Microsoft Excel

Microsoft Excel was used for initial data profiling and inspection.

Key activities:
- Examining dataset structure and column names.
- Checking record counts and data types.
- Identifying missing values and inconsistencies.
- Reviewing unique values and categorical distributions.
- Understanding relationships between datasets.

## 3. Data Cleaning – Python & Pandas

Python and Pandas were used to clean and prepare the datasets.

Separate scripts were maintained for:

- Users dataset cleaning.
- Cards dataset cleaning.
- Transactions dataset cleaning.

The cleaned datasets were prepared for subsequent SQL analysis and reporting.

## 4. SQL Analysis & Validation – MySQL

MySQL was used to perform analytical queries and validate the datasets.

### SQL Analysis
- Customer and card analysis.
- Transaction volume and value analysis.
- Payment method analysis.
- Merchant and geographical analysis.
- Customer financial profile analysis.

### SQL Validation
- Record count verification.
- Duplicate identification.
- Missing value checks.
- Primary and foreign key relationship checks.
- Transaction amount and aggregation validation.
- Data consistency checks.

## 5. Data Modelling – Power BI

The cleaned datasets were imported into Power BI and organized into a relational data model.

The model consists of three primary tables:

- Users
- Cards
- Transactions

Key relationships:
- Users to Cards through customer_id.
- Users to Transactions through customer_id.
- Cards to Transactions through card_id.

## 6. DAX Development

DAX was used to create calculated measures and calculated columns for business analysis.

Key analytical metrics include:

- Total Customers.
- Total Credit Cards.
- Total Transactions.
- Total Transaction Amount.
- Average Credit Score.
- Average Customer Debt.
- Average Annual Income.
- High Credit-Risk Customers.
- Online Transaction Rate.
- Average Transaction Value.

Additional calculations support customer segmentation, income grouping, age grouping and transaction analysis.

## 7. Power BI Dashboard Development

Three interactive dashboard pages were developed.

### Dashboard 1 – Executive Overview
Focus:
- Overall business performance.
- Customer activity.
- Card distribution.
- Payment method analysis.
- Transaction performance.

### Dashboard 2 – Customer & Credit Analysis
Focus:
- Customer credit score distribution.
- Income segmentation.
- Customer debt analysis.
- Debt-to-income analysis.
- Customer financial profiling.

### Dashboard 3 – Transaction & Merchant Analysis
Focus:
- Merchant performance.
- Transaction volume and value.
- Regional transaction analysis.
- Daily transaction trends.
- Payment method behaviour.

## 8. Data Visualisation & Interactivity

Power BI visualizations were designed using:

- KPI cards.
- Bar and column charts.
- Donut charts.
- Line charts.
- Matrix and table visuals.
- Interactive slicers.
- Conditional formatting.

A consistent dark-themed design was applied across all three dashboards.

## 9. Tools & Technologies

| Technology | Purpose |
|---|---|
| Microsoft Excel | Data Profiling |
| Python | Data Cleaning |
| Pandas | Data Manipulation |
| MySQL | SQL Analysis & Validation |
| Power BI | Data Modelling & Visualization |
| DAX | Measures & Calculations |

## 10. Final Deliverables

- Cleaned datasets.
- Python data-cleaning scripts.
- SQL analysis and validation scripts.
- Power BI data model.
- DAX measures and calculated columns.
- Three interactive Power BI dashboards.
- Dashboard screenshots and PDF preview.
- Project documentation.

## 11. Dataset Access

Due to the large dataset size, raw and cleaned datasets are hosted externally on Google Drive.

Dataset access links and download instructions are available in `data/README.md`.

---

**Project:** Credit Card & Financial Transaction Analytics  
**Approach:** End-to-End Data Analytics  
**Tools:** Excel, Python, Pandas, MySQL, Power BI and DAX
