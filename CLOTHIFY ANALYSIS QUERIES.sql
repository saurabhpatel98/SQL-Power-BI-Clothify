
----------------------------------------------------------------Analysis-----------------------------------------------------------------------------------------------

CUSTOMER 

---------------------How many customers are there in total?------------------------------------------------

select count(*) as total_customer from customer

-----------------------------How many customers are male and female?------------------------------------------
select gender, count(*) as customer_count
from customer
where gender is not null
group by gender

-------------------------------what is the average age of all the female customer-------------------------------------------------------------------------------------

select CID, avg(age) as average_age from customer where gender = 'female' group by CID having avg(age) between 20 and 50 

----------------------------------------------How many customer placed the order and among them which customer placed the maximum order---------------------------------------------

select CID, count(*) as order_count
from [order]
group by CID
order by order_count desc

-------------------------------------------------What is the distribution of customers by age group?------------------------------------------------------------------------------------

select 
case 
	 when age < 18 then 'under 18'
	 when age >= 18 and age < 25 then '18-24'
	 when age >= 25 and age < 35 then '25-34'
	 when age >=35 and age < 45 then '35-44'
	 when age >=45 and age < 55 then '45-54'
	 else '55+'
end as age_group,
count(*) as customer_count
from customer
group by age

-----------------------------what is the lifespan of customer gretaer than 5 months----------------------------------------------------------------

select CID, datediff(month, min(payment_date),max(payment_date)) as customer_lifespan from payment group by CID having datediff(month, min(payment_date),max(payment_date)) > 5

---------------purchase frequency-------------------------------

select CID, count(*) as purchase_count from payment where payment_date >= '2020-01-01' AND payment_date <= '2022-12-31' group by CID


DISTRIBUTOR

-------------------------------------------what is the distribution of distributors by gender-----------------------------------------------------------------------------------

select gender, count(*) as distributor_count
from distributor
where gender is not null 
group by gender

-----------------------------------------------------------which distributor have the highest number of product-------------------------------------------------------------

select d.dname, count(*) as product_count from distributor as d inner join product as p on d.DID = p.DID group by dname order by product_count desc

																	OR

select d.dname, count(PID) as product_count from distributor as d inner join product as p on d.DID = p.DID group by dname order by count(PID) desc



ORDERS

-----------------------------------How many orders have been placed in total?------------------------------------------------------------------------

select count(OID) as total_order from [order]  

------------------What is the total revenue generated from orders?--------------------------------------------------------------------------------------------------------
						
select sum(order_item.order_item_quantity * product.price) as total_revenue from order_item
join product on order_item.PID= product.PID 

------------------what is the Average Revenue Per order----------------------------------------------------------------------------------------------------------

select avg(order_item.order_item_quantity * product.price) AS avg_revenue, order_item.OID FROM order_item
join product ON order_item.PID= product.PID group by OID

-------------------------------------How many orders are in each status category?--------------------------------------------------------------------------

select status, count(OID) as order_status from [order] group by status

--------------------------------------------What is the revenue distribution by product category?--------------------------------------------------------------

select sum(oi.order_item_quantity * p.price) as total_revenue, p.categoryID from order_item as oi inner join product as p on oi.PID = p.PID group by p.categoryID 

--------------------------------------------------How many order have placed per date by customer detail?----------------------------------------------------------------------

select count(odate) as order_per_date, c.cname, c.age from [order] as o join customer as c on o.CID = c.CID  where age between 20 and 50 and gender = 'male' group by c.cname, c.age 

select count(odate) as order_per_date, c.cname, c.age from [order] as o join customer as c on o.CID = c.CID  where age between 20 and 50 and gender = 'female' group by c.cname, c.age 

PRODUCT

-----------------------------------------What is the average price of products?----------------------------------------------------------------------------------------

select avg(price) as avg_price from product 

------------------------------------------------what are the top selling product?----------------------------------------------------------------------

select top 5 p.pname, SUM(oi.order_item_quantity) as total_quantity_sold
from product as p
join order_item as oi on p.PID = oi.PID
group by p.pname
order by total_quantity_sold desc

--------------------------what is the product distribution by category---------------------------------------------------------------------------------

select count(PID) as product_distribution, category_name from product_category  as pc join product as p on pc.categoryID = p.categoryID group by category_name

----------------------------------------------How many products supplied by each distributor?-------------------------------------------------

select d.dname, count(PID) as product_count from product as p join distributor as d on p.DID = d.DID group by d.dname order by product_count desc

------------------------------------------------------------What is the total revenue generated per product-----------------------------------------------------------

select sum(oi.order_item_quantity * p.price) as total_revenue, p.pname from product as p join order_item as oi on p.PID = oi.PID group by p.pname


INVENTORY

---------------------------------------------How many items are in the inventory for each product?----------------------------------------------------

select p.pname, sum(quantity) as total_inventory from inventory as i join product as p on i.PID = p.PID group by p.pname

-----------------------------------------------Which products have low inventory quantities?---------------------------------------------------------------

select p.pname, i.quantity as low_quantity from inventory as i join product as p on i.PID = p.PID where i.quantity < 10 group by p.pname, i.quantity  


---------------------------------------------------------------How many items are in the inventory for each distributor?------------------------------------------------

select d.dname, COUNT(*) as inventory_count
from distributor as d
join product as p on d.DID = p.DID
join inventory as i on p.PID = i.PID
group by d.dname

-----------------------------------------------------------------How does the inventory quantity change over time?----------------------------------------------------

select payment_date, sum(quantity) as quantity_change from inventory as i join order_item as oi on i.PID = oi.PID join payment as p on oi.OID = p.OID group by payment_date

--------------------------------------------------------------------What is the average inventory quantity per product category?-------------------------------------------

select pc.category_name, avg(i.quantity) as average_quantity
from product as p 
join inventory as i on p.PID = i.PID 
join product_category as pc on p.categoryID = pc.categoryID
group by pc.category_name

---------------------------------------------------------------------What is the total value of inventory for each product?------------------------------------------------

select p.pname, SUM(p.price * i.quantity) AS total_value
FROM product AS p
JOIN inventory AS i ON p.PID = i.PID
GROUP BY p.pname


ORDER-ITEM 

----------------------------------------------------------what is the average price of items per order and product?----------------------------------------------------------------

select avg(price) as avg_price, OID, PID from order_item group by OID, PID

--------------------------------------------------------------How many items are in each order?---------------------------------------------------------------------------------

select OID, sum(order_item_quantity) as total_items
from order_item
group by OID

----------------------------------------------------------Which products have the highest quantity ordered?----------------------------------------------------

select oi.PID, p.pname, sum(oi.order_item_quantity) as total_quantity_order from order_item as oi 
join product as p on oi.PID = p.PID group by oi.PID, p.pname order by total_quantity_order desc

--------------------------------------------------------How does the price of items vary across different orders?----------------------------------------------------------
select oi.OID, oi.PID, p.pname, oi.price 
from order_item as oi join product as p on oi.PID = p.PID


PAYMENT

-----------------------what is the total amount after 10% Tax?-----------------------------------------------------------

select amount from payment

-------------------how many payment made on each payemnt date?------------------------------------

select payment_date, count(*) as Payment_count from payment group by payment_date


