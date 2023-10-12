# SQL-Power-BI-Clothify

# PROJECT PROPOSAL

The objective of this project is to gain insights into the Clothify business by quering and analysing the database using SQl and creating interactive visualizations with power BI. The project aims to answer questions related to customer behaviour, distributor performance, inventory management, order trends, and payment analysis. Clothify is an imaginary clothing database that I created, and the database contains several key tables, including customer, distributor, order, order item, product, product category, inventory, and payment. 

# TOOL USED:

  Microsoft SQL Server Management Studio
  POWER BI

# METHODOLOGY: 

#### DATABASE - Clothify

#### CREATED TABLES :

  1. Customer - it contains customer details including customerID, name, email, address, phone-no, gender, age <br>
  2. Distributor - it contains distributor details including DistributorID, Name, Email, Address, Phone-No, Gender, Age <br>
  3. Order Table - it contains order details including orderID, order date, customerID, status, order-no, total amount <br>
  4. Product Category - it contains details of product category which includes categoryID, name <br>
  5. Product - it contains details of product which includes productID, product name, description, price, distributorID, categoryID <br>
  6. Inventory - it contains inventory details including InventoryID, ProductID, Quantity <br>
  7. Order Item - it contains details of all order items which includes orderitemID, orderitem quantity, price, orderID, productID <br>
  8. Payment - it contains details of payment made by customer inculding tax amount which includes paymentID, payment date, amount, orderID, customerID <br>

#### INSERTED RECORDS 

#### PERFORMED ANALYSIS:

CUSTOMER <br>

  1. How many customers are there in total? <br>
  2. How many customers are male and female? <br>
  3. What is the average age of all the female customer? <br>
  4. How many customer placed the order and among them which customer placed the maximum order? <br>
  5. What is the distribution of customers by age group? <br>
  6. What is the lifespan of customer gretaer than 5 months? <br>
       
DISTRIBUTOR <br>

  1. What is the distribution of distributors by gender? <br>
  2. Which distributor have the highest number of product? <br>
       
ORDER <br>

  1. How many orders have been placed in total? <br>
  2. What is the total revenue generated from orders? <br>
  3. What is the Average Revenue Per order? <br>
  4. How many orders are in each status category? <br>
  5. What is the revenue distribution by product category? <br>
  6. How many order have placed per date by customer detail? <br>
     
PRODUCT <br>

  1. What is the average price of products? <br>
  2. What are the top selling product? <br>
  3. What is the product distribution by category? <br>
  4. How many products supplied by each distributor? <br>
  5. What is the total revenue generated per product? <br>
     
INVENTORY <br>

  1. How many items are in the inventory for each product? <br>
  2. Which products have low inventory quantities? <br>
  3. How many items are in the inventory for each distributor? <br>
  4. How does the inventory quantity change over time? <br>
  5. What is the average inventory quantity per product category? <br>
  6. What is the total value of inventory for each product? <br>
      
ORDER ITEM <br>

  1. What is the average price of items per order and product? <br>
  2. How many items are in each order? <br>
  3. Which products have the highest quantity ordered? <br>
  4. How does the price of items vary across different orders? <br>
      
PAYMENT <br>

  1. What is the total amount after 10% Tax? <br>
  2. how many payment made on each payemnt date? <br>
      
#### DATA INJECTION INTO POWER BI USING DIRECT QUERY 
 
#### DATA MODELLING

![Data model](https://github.com/jhanvikamani/SQL-Power-BI-Clothify/assets/49193372/bf0f6d8a-6761-4561-8839-2e7204c75c91)


#### CREATED DASHBOARD USING DIFFERENT FEATURES AND VISUALIING CHARTS OF POWER BI

![C D dashboard](https://github.com/jhanvikamani/SQL-Power-BI-Clothify/assets/49193372/9f1a89c5-3ef8-4505-bfe0-8457054de461)

  
# SQL-Power-BI-Clothify
