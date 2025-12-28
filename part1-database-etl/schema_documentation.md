Entity–Relationship Description

ENTITY: customers

Purpose:
Stores information about customers registered on the FlexiMart platform.

Attributes:

customer_id – Unique identifier for each customer (Primary Key, auto-increment)

first_name – Customer’s first name

last_name – Customer’s last name

email – Unique email address of the customer

phone – Customer’s contact number

city – City where the customer resides

registration_date – Date on which the customer registered

Relationships:

One customer can place many orders

Relationship type: One-to-Many (customers → orders)

ENTITY: products

Purpose:
Stores details of products available for sale on FlexiMart.

Attributes:

product_id – Unique identifier for each product (Primary Key, auto-increment)

product_name – Name of the product

category – Category to which the product belongs

price – Selling price of the product

stock_quantity – Number of units available in stock

Relationships:

One product can appear in many order items

Relationship type: One-to-Many (products → order_items)

ENTITY: orders

Purpose:
Stores order-level transaction information.

Attributes:

order_id – Unique identifier for each order (Primary Key, auto-increment)

customer_id – References the customer who placed the order (Foreign Key)

order_date – Date when the order was placed

total_amount – Total value of the order

status – Current status of the order (e.g., Pending, Completed)

Relationships:

Each order is placed by one customer

Each order can contain many order items

ENTITY: order_items

Purpose:
Stores line-item level details for each order.

Attributes:

order_item_id – Unique identifier for each order item (Primary Key, auto-increment)

order_id – References the related order (Foreign Key)

product_id – References the product sold (Foreign Key)

quantity – Number of units ordered

unit_price – Price per unit at the time of purchase

subtotal – Total price for the item (quantity × unit_price)

Relationships:

Each order item belongs to one order

Each order item refers to one product

2. Normalization Explanation (3NF)

The FlexiMart database schema follows Third Normal Form (3NF) to ensure data consistency and eliminate redundancy.
Each table has a clearly defined primary key, and all non-key attributes are fully functionally dependent on that primary key.
In the customers table, attributes such as email, phone, and city depend only on customer_id. There are no partial dependencies since the primary key is a single attribute. Similarly, there are no transitive dependencies, as customer-related details are not stored in the orders table and product-related details are not stored in order_items.
The orders table contains only order-specific information and references the customer through a foreign key. Line-item details such as product quantity and pricing are stored separately in the order_items table, ensuring proper separation of concerns.

This design avoids:

Update anomalies: Customer or product details can be updated in one place without affecting order records.

Insert anomalies: New customers or products can be added independently of orders.

Delete anomalies: Deleting an order does not remove customer or product information.

Hence, the database schema is normalized to 3NF, making it scalable, efficient, and reliable.

3. Sample Data Representation

customers

| customer_id | first_name | last_name | email                  | city      | registration_date |
| ----------- | ---------- | --------- | ---------------------- | --------- | ----------------- |
| 1           | Rahul      | Sharma    | rahul.sharma@gmail.com | Bangalore | 2023-01-15        |
| 2           | Priya      | Patel     | priya.patel@yahoo.com  | Mumbai    | 2023-02-20        |

products

| product_id | product_name | category    | price | stock_quantity |
| ---------- | ------------ | ----------- | ----- | -------------- |
| 1          | Laptop       | Electronics | 55000 | 20             |
| 2          | Headphones   | Electronics | 3000  | 50             |

orders

| order_id | customer_id | order_date | total_amount | status    |
| -------- | ----------- | ---------- | ------------ | --------- |
| 101      | 1           | 2024-01-15 | 58000        | Completed |

order_items
| order_item_id | order_id | product_id | quantity | unit_price | subtotal |
|---------------|----------|------------|----------|------------|----------|
| 1 | 101 | 1 | 1 | 55000 | 55000 |
