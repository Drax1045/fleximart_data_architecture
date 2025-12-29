# Star Schema Design – FlexiMart Data Warehouse

## Section 1: Schema Overview

### FACT TABLE: fact_sales

**Grain:** One row per product per order line item  
**Business Process:** Sales transactions

**Measures:**

- quantity_sold – Number of units sold
- unit_price – Price per unit at the time of sale
- discount_amount – Discount applied on the item
- total_amount – Final amount (quantity × unit_price − discount)

**Foreign Keys:**

- date_key → dim_date
- product_key → dim_product
- customer_key → dim_customer

---

### DIMENSION TABLE: dim_date

**Purpose:** Enables time-based analysis and reporting  
**Type:** Conformed dimension

**Attributes:**

- date_key (PK): Surrogate key in YYYYMMDD format
- full_date: Actual calendar date
- day_of_week: Name of the day
- day_of_month: Day number
- month: Month number (1–12)
- month_name: Month name
- quarter: Q1–Q4
- year: Calendar year
- is_weekend: Boolean indicator

---

### DIMENSION TABLE: dim_product

**Purpose:** Stores product-related descriptive information

**Attributes:**

- product_key (PK): Surrogate key
- product_id: Original product identifier
- product_name: Name of the product
- category: Product category
- subcategory: Product subcategory
- unit_price: Standard unit price

---

### DIMENSION TABLE: dim_customer

**Purpose:** Stores customer demographic details

**Attributes:**

- customer_key (PK): Surrogate key
- customer_id: Original customer identifier
- customer_name: Full name of the customer
- city: Customer city
- state: Customer state
- customer_segment: Segment classification

---

## Section 2: Design Decisions

The data warehouse uses a star schema with transaction-level granularity, where each record in the fact table represents a single product sold in an order. This grain allows detailed analysis at the lowest level while supporting aggregation for higher-level reporting.

Surrogate keys are used instead of natural keys to improve performance, simplify joins, and isolate the warehouse from changes in operational source systems. This also enables historical tracking and better scalability.

The design supports drill-down and roll-up operations by separating numeric measures in the fact table and descriptive attributes in dimension tables. Analysts can easily analyze sales by date, product, or customer and aggregate results across different levels such as month, quarter, category, or customer segment.

---

## Section 3: Sample Data Flow

**Source Transaction:**  
Order #101, Customer “John Doe”, Product “Laptop”, Quantity: 2, Price: ₹50,000

**Data Warehouse Representation:**

**fact_sales**

- date_key: 20240115
- product_key: 5
- customer_key: 12
- quantity_sold: 2
- unit_price: 50000
- total_amount: 100000

**dim_date**

- date_key: 20240115
- full_date: 2024-01-15
- month: 1
- quarter: Q1

**dim_product**

- product_key: 5
- product_name: Laptop
- category: Electronics

**dim_customer**

- customer_key: 12
- customer_name: John Doe
- city: Mumbai
