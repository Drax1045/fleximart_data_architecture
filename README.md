🛒 FlexiMart – Data Architecture Design & Implementation
End-to-End Data Engineering Project

<p align="center"> <img src="https://img.shields.io/badge/Data%20Engineering-ETL-blue?style=for-the-badge"/> <img src="https://img.shields.io/badge/Database-MySQL-orange?style=for-the-badge"/> <img src="https://img.shields.io/badge/NoSQL-MongoDB-green?style=for-the-badge"/> <img src="https://img.shields.io/badge/Data%20Warehouse-Star%20Schema-purple?style=for-the-badge"/> </p>

🚀 Project Overview

FlexiMart is a simulated e-commerce platform.
This project demonstrates how raw, messy business data can be transformed into a robust analytics-ready architecture using:

ETL pipelines

Relational databases

NoSQL systems

Data warehousing

OLAP analytics

The project is built to closely reflect real-world data engineering workflows used in production systems.

# FlexiMart Data Architecture

## Architecture at a Glance

- Raw CSV Files  
- ETL Pipeline (Python + Pandas)  
- MySQL Operational Database  
- Business Queries (SQL)  
- MongoDB (Flexible Product Catalog)  
- Data Warehouse (Star Schema)  
- OLAP Analytics & Reports  

---

## Repository Structure



fleximart_data_architecture/
│
├── data/
│   ├── customers_raw.csv
│   ├── products_raw.csv
│   └── sales_raw.csv
│
├── part1-database-etl/
│   ├── etl_pipeline.py
│   ├── schema_documentation.md
│   ├── business_queries.sql
│   ├── data_quality_report.txt
│   └── requirements.txt
│
├── part2-nosql/
│   ├── nosql_analysis.md
│   ├── mongodb_operations.js
│   └── products_catalog.json
│
├── part3-datawarehouse/
│   ├── star_schema_design.md
│   ├── warehouse_schema.sql
│   ├── warehouse_data.sql
│   └── analytics_queries.sql
│
└── README.md


🧪 Part 1: ETL Pipeline & Relational Database
🔹 Key Features

Reads raw CSV files with data quality issues

Removes duplicates

Handles missing values intelligently

Standardizes:

Phone numbers

Categories

Date formats

Loads clean data into MySQL

Generates a data quality report

🔹 Database Design

Fully normalized (3NF)

Tables:

customers

products

orders

order_items

Enforced primary & foreign keys

🔹 Business Queries

Customer purchase history

Product sales analysis

Monthly sales trends with running totals

🧩 Part 2: NoSQL (MongoDB) Analysis
📌 Why MongoDB?

Supports highly diverse product attributes

No rigid schema

Nested documents for reviews

Easy horizontal scalability

🛠 Implemented Operations

Import product catalog JSON

Filter electronics under price limits

Review aggregation (average ratings)

Update operations (add new reviews)

Category-level analytics

🏢 Part 3: Data Warehouse & Analytics
⭐ Star Schema Design

Fact Table: fact_sales

Dimensions:

dim_date

dim_product

dim_customer

📊 Analytics Performed

Time-based drill-down (Year → Quarter → Month)

Top-performing products by revenue

Customer segmentation:

High Value

Medium Value

Low Value

This enables fast, scalable analytical reporting for business decision-making.
| Category | Technology |
| -------------------- | --------------------------------- |
| Programming Language | **Python 3.x** |
| Data Processing | **Pandas** |
| Relational Database | **MySQL 8.x** |
| NoSQL Database | **MongoDB 7.x** |
| Data Warehouse | **Star Schema Design** |
| Query Language | **SQL** |
| NoSQL Queries | **MongoDB Aggregation Framework** |
| Version Control | **Git** |
| Code Hosting | **GitHub** |
| Operating System | **macOS** |

⚙️ Setup Instructions
🐬 MySQL
CREATE DATABASE fleximart;
CREATE DATABASE fleximart_dw;

python part1-database-etl/etl_pipeline.py

🍃 MongoDB
brew services start mongodb-community
mongoimport --db fleximart_nosql \
 --collection products \
 --file part2-nosql/products_catalog.json \
 --jsonArray

🏢 Data Warehouse
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql

🎯 Key Learnings

Designing production-ready ETL pipelines

Handling real-world data quality issues

Choosing between SQL and NoSQL databases

Building star schemas for analytics

Writing efficient OLAP queries

End-to-end data architecture thinking

🚧 Challenges Faced

Handling inconsistent data formats across CSV files

Debugging MySQL & MongoDB environment issues

Designing realistic warehouse data distributions

Ensuring analytical queries matched business intent

Each challenge was resolved using industry-standard best practices.

🌟 Final Note

This project represents a complete data engineering lifecycle — from raw data ingestion to executive-level analytics.
