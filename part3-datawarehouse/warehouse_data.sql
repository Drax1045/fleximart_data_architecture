USE fleximart_dw;

-- =========================
-- dim_date (30 dates)
-- =========================
INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,false),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,false),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,false),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,false),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,false),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,true),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,true),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,false),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,false),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,false),
(20240111,'2024-01-11','Thursday',11,1,'January','Q1',2024,false),
(20240112,'2024-01-12','Friday',12,1,'January','Q1',2024,false),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,true),
(20240114,'2024-01-14','Sunday',14,1,'January','Q1',2024,true),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,false),
(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,false),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,false),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,true),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,true),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,false),
(20240206,'2024-02-06','Tuesday',6,2,'February','Q1',2024,false),
(20240207,'2024-02-07','Wednesday',7,2,'February','Q1',2024,false),
(20240208,'2024-02-08','Thursday',8,2,'February','Q1',2024,false),
(20240209,'2024-02-09','Friday',9,2,'February','Q1',2024,false),
(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,true),
(20240211,'2024-02-11','Sunday',11,2,'February','Q1',2024,true),
(20240212,'2024-02-12','Monday',12,2,'February','Q1',2024,false),
(20240213,'2024-02-13','Tuesday',13,2,'February','Q1',2024,false),
(20240214,'2024-02-14','Wednesday',14,2,'February','Q1',2024,false),
(20240215,'2024-02-15','Thursday',15,2,'February','Q1',2024,false);

-- =========================
-- dim_product (15 products, 3 categories)
-- =========================
INSERT INTO dim_product (product_id, product_name, category, subcategory, unit_price) VALUES
('P001','Laptop Pro','Electronics','Laptops',75000),
('P002','Smartphone X','Electronics','Mobiles',45000),
('P003','Bluetooth Headphones','Electronics','Audio',3500),
('P004','4K Smart TV','Electronics','Television',65000),
('P005','Tablet Plus','Electronics','Tablets',28000),
('P006','Office Chair','Furniture','Chairs',8500),
('P007','Wooden Table','Furniture','Tables',22000),
('P008','Sofa Set','Furniture','Sofas',55000),
('P009','Bookshelf','Furniture','Storage',9500),
('P010','T-Shirt','Fashion','Clothing',1200),
('P011','Jeans','Fashion','Clothing',2800),
('P012','Sneakers','Fashion','Footwear',4200),
('P013','Wrist Watch','Fashion','Accessories',7800),
('P014','Jacket','Fashion','Outerwear',6500),
('P015','Cap','Fashion','Accessories',600);

-- =========================
-- dim_customer (12 customers, 4+ cities)
-- =========================
INSERT INTO dim_customer (customer_id, customer_name, city, state, customer_segment) VALUES
('C001','Rahul Sharma','Bangalore','Karnataka','High Value'),
('C002','Priya Patel','Mumbai','Maharashtra','Medium Value'),
('C003','Amit Kumar','Delhi','Delhi','Low Value'),
('C004','Sneha Reddy','Hyderabad','Telangana','Medium Value'),
('C005','Vikram Singh','Chennai','Tamil Nadu','High Value'),
('C006','Anjali Mehta','Pune','Maharashtra','Low Value'),
('C007','Ravi Verma','Bangalore','Karnataka','Medium Value'),
('C008','Pooja Iyer','Chennai','Tamil Nadu','Low Value'),
('C009','Karthik Nair','Kochi','Kerala','Medium Value'),
('C010','Deepa Gupta','Delhi','Delhi','High Value'),
('C011','Arjun Rao','Hyderabad','Telangana','Medium Value'),
('C012','Neha Shah','Ahmedabad','Gujarat','Low Value');

-- =========================
-- fact_sales (40 transactions)
-- =========================
INSERT INTO fact_sales
(date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount) VALUES
(20240101,1,1,1,75000,5000,70000),
(20240102,2,2,2,45000,0,90000),
(20240103,3,3,3,3500,0,10500),
(20240104,4,4,1,65000,3000,62000),
(20240105,5,5,2,28000,0,56000),
(20240106,1,6,1,75000,7000,68000),
(20240106,8,7,1,55000,5000,50000),
(20240107,10,8,4,1200,0,4800),
(20240107,11,9,2,2800,0,5600),
(20240108,12,10,1,4200,0,4200),
(20240109,13,11,1,7800,0,7800),
(20240110,14,12,1,6500,0,6500),
(20240111,6,1,2,8500,0,17000),
(20240112,7,2,1,22000,2000,20000),
(20240113,8,3,1,55000,4000,51000),
(20240113,4,4,1,65000,5000,60000),
(20240114,5,5,2,28000,0,56000),
(20240114,9,6,1,9500,0,9500),
(20240115,15,7,3,600,0,1800),
(20240115,3,8,2,3500,0,7000),

(20240201,2,9,1,45000,0,45000),
(20240202,1,10,1,75000,5000,70000),
(20240203,4,11,1,65000,6000,59000),
(20240203,8,12,1,55000,4000,51000),
(20240204,10,1,5,1200,0,6000),
(20240204,11,2,3,2800,0,8400),
(20240205,6,3,1,8500,0,8500),
(20240206,7,4,1,22000,2000,20000),
(20240207,12,5,2,4200,0,8400),
(20240208,13,6,1,7800,0,7800),
(20240209,14,7,1,6500,0,6500),
(20240210,1,8,1,75000,8000,67000),
(20240210,4,9,1,65000,5000,60000),
(20240211,5,10,2,28000,0,56000),
(20240211,8,11,1,55000,3000,52000),
(20240212,3,12,4,3500,0,14000),
(20240213,15,1,5,600,0,3000),
(20240214,2,2,1,45000,0,45000),
(20240215,6,3,2,8500,0,17000);
