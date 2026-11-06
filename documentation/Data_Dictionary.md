# Data Dictionary
## Credit Card & Financial Transaction Analytics

This document describes the datasets, columns, business meanings and relationships used in the project.

## 1. Users Table

Contains customer demographic and financial information.

| Column Name | Description |
|---|---|
| customer_id | Unique customer identifier |
| current_age | Customer's current age |
| retirement_age | Customer's retirement age |
| birth_year | Customer's birth year |
| birth_month | Customer's birth month |
| gender | Customer gender |
| address | Customer residential address |
| latitude | Customer location latitude |
| longitude | Customer location longitude |
| per_capita_income | Income per capita |
| yearly_income | Customer's annual income |
| total_debt | Customer's total debt |
| credit_score | Customer's credit score |
| num_credit_cards | Number of credit cards held by the customer |

## 2. Cards Table

Contains credit and debit card information associated with customers.

| Column Name | Description |
|---|---|
| card_id | Unique card identifier |
| customer_id | Customer associated with the card |
| card_brand | Card network or brand |
| card_type | Type of card (Credit, Debit or Debit Prepaid) |
| expiry_date | Card expiration date |
| has_chip | Indicates whether the card has a chip |
| num_cards_issued | Number of cards issued |
| credit_limit | Credit limit associated with the card |
| acct_open_date | Date the card account was opened |
| year_pin_last_changed | Year the PIN was last changed |
| card_on_dark_web | Indicates whether the card was found on the dark web |
| expire_Year | Card expiration year |

## 3. Transactions Table

Contains financial transaction records and merchant-related information.

| Column Name | Description |
|---|---|
| transaction_id | Unique transaction identifier |
| customer_id | Customer who performed the transaction |
| card_id | Card used for the transaction |
| amount | Transaction amount |
| payment_method | Transaction payment method (Online or Swipe) |
| merchant_id | Unique merchant identifier |
| merchant_city | City associated with the merchant |
| merchant_state | State associated with the merchant |
| zip | Merchant ZIP code |
| mcc | Merchant Category Code |
| transaction_date | Date and time of the transaction |

## 4. Data Relationships

The project uses the following table relationships:

| Primary Table | Primary Key | Related Table | Foreign Key |
|---|---|---|---|
| users | customer_id | cards | customer_id |
| users | customer_id | transactions | customer_id |
| cards | card_id | transactions | card_id |

**Relationship Overview:**

- One customer can own multiple cards.
- One customer can perform multiple transactions.
- One card can be associated with multiple transactions.
- Customer and card ownership can be validated using both customer_id and card_id.

## 5. Dataset Overview

| Dataset | Records |
|---|---:|
| Users | 2,000 |
| Cards | 6,146 |
| Transactions | 100,000 |

**Transaction Date Range:** January 1, 2010 – January 31, 2010.

## 6. Data Quality and Preparation

The project includes:

- Data profiling using Microsoft Excel.
- Data cleaning and transformation using Python and Pandas.
- SQL-based data analysis and validation using MySQL.
- Data modelling and DAX calculations using Power BI.

## 7. Important Notes

- customer_id, card_id and transaction_id are identifiers and should not be summed.
- credit_limit and amount are numerical financial fields.
- card_on_dark_web contains only "No" in the validated dataset.
- Merchant location fields should be checked for missing or non-geographical values before geographical analysis.
- Currency should be confirmed from the original dataset documentation before assigning a currency symbol.
