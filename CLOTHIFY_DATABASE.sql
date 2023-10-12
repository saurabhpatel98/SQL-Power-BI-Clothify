create database [Clothify]

---CUSTOMER TABLE-------
create table [customer]
(
CID INT NOT NULL PRIMARY KEY,
cname NVARCHAR(50) NOT NULL,
email NVARCHAR(50) NOT NULL,
phone NVARCHAR(20) NOT NULL,
address NVARCHAR(50) NOT NULL,
)

alter table [customer]
ADD age INT, gender NVARCHAR(10) 


---ORDER TABLE------------
create table [order]
(
OID INT NOT NULL PRIMARY KEY,
odate DATE NOT NULL,
CID INT FOREIGN KEY REFERENCES [customer](CID),
status NVARCHAR(20) NOT NULL,
order_no NVARCHAR(20) NOT NULL,
total_amount DECIMAL(10,2) NOT NULL
)

alter table [order]
alter column total_amount DECIMAL(10,2) 


---DISTRIBUTOR TABLE------------
create table [distributor]
(
DID INT NOT NULL PRIMARY KEY,
cname NVARCHAR(50) NOT NULL,
email NVARCHAR(50) NOT NULL,
phone NVARCHAR(20) NOT NULL,
address NVARCHAR(50) NOT NULL,
age INT,
gender NVARCHAR(10)
)

**************************************
alter table [distributor]
DROP column cname 

alter table [distributor]
ADD dname NVARCHAR(50) NOT NULL
****************************************

---PRODUCT CATEGORY TABLE------------
create table [product_category]
(
categoryID INT NOT NULL PRIMARY KEY,
category_name  NVARCHAR(50) NOT NULL,
)

---PRODUCT TABLE------------
create table [product]
(
PID INT NOT NULL PRIMARY KEY,
pname NVARCHAR(50) NOT NULL,
description TEXT NOT NULL, 
price DECIMAL(10,2) NOT NULL,
DID INT FOREIGN KEY REFERENCES [distributor](DID),
categoryID INT FOREIGN KEY REFERENCES [product_category](categoryID)
)

---INVENTORY TABLE------------
create table [inventory]
(
inventoryID INT NOT NULL PRIMARY KEY,
PID INT FOREIGN KEY REFERENCES [product](PID),
quantity INT NOT NULL,
)

---ORDER ITEM TABLE------------
create table [order_item]
(
order_itemID INT NOT NULL PRIMARY KEY,
order_item_quantity INT NOT NULL,
price DECIMAL(10,2) NOT NULL,
OID INT FOREIGN KEY REFERENCES [order](OID),
PID INT FOREIGN KEY REFERENCES [product](PID)
)

-----PAYMENT TABLE--------------
create table [payment]
(
paymentID INT NOT NULL PRIMARY KEY,
payment_date DATE NOT NULL,
amount DECIMAL(10,2) NOT NULL,
OID INT FOREIGN KEY REFERENCES [order](OID),
CID INT FOREIGN KEY REFERENCES [customer](CID),
)

alter table [payment]
alter column amount DECIMAL(10,2) 