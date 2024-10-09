CREATE DATABASE project2;
USE project2;

-- Create Customer table
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    C_Name VARCHAR(30),
    Contact_Number VARCHAR(15),  -- Change to VARCHAR to include leading zeros
    Email VARCHAR(30)
);

-- Insert into Customer table
INSERT INTO Customer VALUES (1, 'Zain', '0309', 'zain@gmail.com');
INSERT INTO Customer VALUES (2, 'Hamais', '0300', 'hamais@gmail.com');
INSERT INTO Customer VALUES (3, 'Ali Hamza', '0301', 'ali@gmail.com');
INSERT INTO Customer VALUES (4, 'Swaira Baig', '0302', 'swaira@gmail.com');
INSERT INTO Customer VALUES (5, 'Abdul Moeez', '0303', 'moeez@gmail.com');
INSERT INTO Customer VALUES (6, 'Muhammad Luqman Asad', '0304', 'luqman@gmail.com');
INSERT INTO Customer VALUES (7, 'Muhammad Abdullah Khalid', '0305', 'abdullah@gmail.com');

-- Select from Customer table
SELECT * FROM Customer;

-- Drop Customer table
DROP TABLE Customer;

-- Create Products table
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(30),
    P_Description VARCHAR(50),
    Price INT,
    Quantity INT
);

-- Insert into Products table
INSERT INTO Products VALUES (101, 'Seat covers', 'Interior accessories', 10000, 20);
INSERT INTO Products VALUES (102, 'Car covers', 'Exterior accessories', 7000, 12);
INSERT INTO Products VALUES (103, 'LED lights', 'Lighting and electrical', 23000, 50);
INSERT INTO Products VALUES (104, 'Oil filters', 'Maintenance', 4000, 60);
INSERT INTO Products VALUES (105, 'Dash cams', 'Safety and security', 25000, 32);
INSERT INTO Products VALUES (106, 'Alloy wheels', 'Wheels', 150000, 9);
INSERT INTO Products VALUES (107, 'Car shampoo', 'Car care and cleaning', 1500, 100);

-- Select from Products table
SELECT * FROM Products;

-- Drop Products table
DROP TABLE Products;

-- Create Inventory table
CREATE TABLE Inventory (
    Inventory_ID INT PRIMARY KEY,
    Product_ID INT,
    Quantity INT,
    Location_ VARCHAR(30),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- Insert into Inventory table
INSERT INTO Inventory VALUES (1001, 101, 3, 'Lahore');
INSERT INTO Inventory VALUES (1002, 102, 2, 'Karachi');
INSERT INTO Inventory VALUES (1003, 103, 1, 'Islamabad');
INSERT INTO Inventory VALUES (1004, 104, 5, 'Peshawar');
INSERT INTO Inventory VALUES (1005, 105, 1, 'Multan');
INSERT INTO Inventory VALUES (1006, 106, 1, 'Lahore');
INSERT INTO Inventory VALUES (1007, 107, 10, 'Lahore');

-- Select from Inventory table
SELECT * FROM Inventory;

-- Create Orders table
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date VARCHAR(10),
    Total_Amount INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- Insert into Orders table
INSERT INTO Orders VALUES (10001, 1, '08/06/2024', 30000);
INSERT INTO Orders VALUES (10002, 2, '03/06/2024', 14000);
INSERT INTO Orders VALUES (10003, 3, '29/05/2024', 23000);
INSERT INTO Orders VALUES (10004, 4, '06/06/2024', 20000);
INSERT INTO Orders VALUES (10005, 5, '04/06/2024', 25000);
INSERT INTO Orders VALUES (10006, 6, '07/06/2024', 150000);
INSERT INTO Orders VALUES (10007, 7, '08/06/2024', 15000);

-- Select from Orders table
SELECT * FROM Orders;

-- Create Order_Details table
CREATE TABLE Order_Details (
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    Price INT,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- Insert into Order_Details table
INSERT INTO Order_Details VALUES (10001, 101, 3, 30000);
INSERT INTO Order_Details VALUES (10002, 102, 2, 14000);
INSERT INTO Order_Details VALUES (10003, 103, 1, 23000);
INSERT INTO Order_Details VALUES (10004, 104, 5, 20000);
INSERT INTO Order_Details VALUES (10005, 105, 1, 25000);
INSERT INTO Order_Details VALUES (10006, 106, 1, 150000);
INSERT INTO Order_Details VALUES (10007, 107, 10, 15000);

-- Select from Order_Details table
SELECT * FROM Order_Details;

-- Queries

-- 1. Select Customer by Customer_ID
SELECT * FROM Customer WHERE Customer_ID = 1;

-- 2. Select Product by Product_ID
SELECT * FROM Products WHERE Product_ID = 101;

-- 3. Select Quantity from Inventory for a given Product_ID and Location
SELECT Quantity FROM Inventory WHERE Product_ID = 101 AND Location_ = 'Lahore';

-- 4. Select Orders and Order_Details for a given Customer_ID
SELECT Orders., Order_Details.
FROM Orders
INNER JOIN Order_Details ON Orders.Order_ID = Order_Details.Order_ID
WHERE Orders.Customer_ID = 1;

-- 5. Select Product_Name and Quantity from Product and Inventory where Quantity > 0
SELECT Products.Product_Name, Inventory.Quantity
FROM Products
INNER JOIN Inventory ON Products.Product_ID = Inventory.Product_ID
WHERE Inventory.Quantity > 0;

-- 6. Select Total price for a given Order_ID
SELECT SUM(Order_Details.Price * Order_Details.Quantity) AS Total
FROM Order_Details
WHERE Order_Details.Order_ID = 10001;