-- -------------Droping tables-----------
DROP TABLE IF EXISTS Order_Info;      -- smallest table first
DROP TABLE IF EXISTS Customer_Info;   -- bigger table
DROP TABLE IF EXISTS Product_Info;    -- then product table

-- Creating data base
CREATE DATABASE IF NOT EXISTS WandW;

-- Using database
USE WandW;


--  ---------------Costumer Table---------------------

-- Creating table for customer informantion 
CREATE TABLE Customer_Info (
    Customer_ID_No INT NOT NULL,
    Customer_Name VARCHAR(50),
    Email VARCHAR(50),
    Phone_Number VARCHAR(15) NOT NULL,
    PRIMARY KEY (Customer_ID_No,Email)
);

-- Inserting Header row of customer id table
INSERT INTO Customer_Info
(Customer_ID_No,  Customer_Name, Email, Phone_Number)
VALUES
(2, 'Uswa', 'uswa@gmail.com', '03123456789'),
(1, 'Ayesha', 'ayesha@gmail.com', '03123456788'),
(3, 'Hamna', 'hamna@gmail.com', '03123456787');

-- Checkind data in customer table
SELECT * FROM Customer_Info
ORDER BY Customer_ID_No ASC;


--   ----------Product Table---------------

-- Creating table for product informantion 
CREATE TABLE Product_Info (
    Product_ID_No INT NOT NULL,
    Product_Name VARCHAR(50),
    Price INT NOT NULL,
    Flavor VARCHAR(50),
	Category VARCHAR(50),
    PRIMARY KEY (Product_ID_No)
);

-- Inserting Header row of Product id table
INSERT INTO Product_Info
(Product_ID_No, Product_Name, Price, Flavor, Category)
VALUES
(8, 'Cake',5000, 'Chocolate', 'Custom Cake'),
(19, 'Donut', 400 , 'Vanilla', 'Filled'),
(15, 'Cookies',1000, 'Vanilla', 'Cashew Nuts');

-- Checkind data in Product table
SELECT * FROM Product_Info
ORDER BY Product_ID_No ASC;


--     ---------------Order Table---------------

-- Creating table for Order informantion 
CREATE TABLE Order_Info (
    Order_ID INT NOT NULL,
    Order_Date DATE NOT NULL,
	Customer_ID INT,
    Order_Customer_Name varchar(50),
    Quantity INT NOT NULL,
    Product_ID INT,
    Order_Product_Name VARCHAR(50) NOT NULL, 
	Total INT NOT NULL,
    PRIMARY KEY(Order_ID),
    FOREIGN KEY(Customer_ID) references Customer_Info(Customer_ID_No),
    FOREIGN KEY(Product_ID) references Product_Info( Product_ID_No)

);

-- Inserting Header row of  Order id table
INSERT INTO  Order_Info
( Order_ID, Order_Date, Customer_ID,Order_Customer_Name, Quantity, Product_ID, Order_Product_Name, Total)
VALUES
(51, '2026-01-06', 2,'Uswa', 3, 19, 'Donut',400*3),
(23, '2026-01-03', 1,'Ayesha', 2, 8, 'Cake',5000*2),
(31, '2026-01-04', 1,'Ayesha', 1, 8, 'Cake',5000*1);

SET SQL_SAFE_UPDATES =0; -- turning off the safe mode

--  ---------Updating order id-------------
UPDATE Order_Info
SET  Order_ID = "35"
Where Order_ID = "51";

--  ---------Deleting order---------------
DELETE FROM Order_Info
where Order_ID=23;

-- Checkind data in  Order table
SELECT * FROM  Order_Info
ORDER BY Order_Date ASC;
