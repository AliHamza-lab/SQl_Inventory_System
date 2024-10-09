Inventory Management System Using SQL
Overview
This project is a SQL-based Inventory Management System designed to manage customer information, product details, and stock levels efficiently. It provides a relational database structure to store and organize data such as customer records, product descriptions, prices, and inventory quantities. The system uses SQL queries for adding, updating, and retrieving data, making it easy for businesses to monitor and control their inventory, manage stock across different locations, and streamline day-to-day operations.

The system is suitable for small to medium-sized businesses that need a simple and scalable solution for tracking their inventory in real-time, without relying on complex software.

Features
1. Customer Management
Store Customer Details: The system allows storing essential customer information such as:

Customer_ID: A unique identifier for each customer.
C_Name: Name of the customer.
Contact_Number: Customer's phone number.
Email: Customer's email address.
Operations:

Insert new customers into the system.
Retrieve customer information using SQL SELECT queries.
Modify or delete customer data to ensure the system is up-to-date.
2. Product Management
Track Product Information: The system allows you to maintain a catalog of products with relevant details like:

Product_ID: A unique identifier for each product.
Product_Name: Name of the product.
P_Description: Description of the product.
Price: Price of the product.
Quantity: The available stock quantity of the product.
Operations:

Add new products using INSERT queries.
Update product details such as changing descriptions, adjusting prices, or modifying quantities.
Retrieve product data for display in an inventory report or during customer orders.
3. Inventory Tracking
Manage Stock Levels: The inventory system is designed to track product stock levels and manage inventory in real-time. It includes:

Inventory_ID: A unique identifier for each inventory record.
Product_ID: A foreign key reference to the Products table.
Quantity: The quantity of each product available in stock.
Location_: The specific location where the product is stored.
Operations:

Link products to inventory records through foreign key relationships.
Track stock levels at various locations to ensure that inventory is balanced.
Use SQL JOIN queries to display comprehensive inventory reports, combining data from the Products and Inventory tables.
SQL Tables
1. Customer Table
The Customer table is used to store customer-related information. It includes the following fields:

Customer_ID: INT PRIMARY KEY – A unique identifier for each customer.
C_Name: VARCHAR(30) – Customer's name.
Contact_Number: VARCHAR(15) – Contact number of the customer. Using VARCHAR allows for flexibility with leading zeros.
Email: VARCHAR(30) – Email address of the customer.
Example:

sql
Copy code
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    C_Name VARCHAR(30),
    Contact_Number VARCHAR(15),
    Email VARCHAR(30)
);
2. Products Table
The Products table stores product-related data. The fields include:

Product_ID: INT PRIMARY KEY – A unique identifier for each product.
Product_Name: VARCHAR(30) – Name of the product.
P_Description: VARCHAR(50) – Description of the product (e.g., category or use).
Price: INT – Price of the product.
Quantity: INT – The number of products available in stock.
Example:

sql
Copy code
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(30),
    P_Description VARCHAR(50),
    Price INT,
    Quantity INT
);
3. Inventory Table
The Inventory table links products to specific locations and manages the stock quantity of each product. The fields include:

Inventory_ID: INT PRIMARY KEY – A unique identifier for each inventory record.
Product_ID: INT – A foreign key reference to the Products table.
Quantity: INT – The stock level of the product at a particular location.
Location_: VARCHAR(30) – The specific storage location of the product.
Example:

sql
Copy code
CREATE TABLE Inventory (
    Inventory_ID INT PRIMARY KEY,
    Product_ID INT,
    Quantity INT,
    Location_ VARCHAR(30),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);
How to Use
1. Clone the Repository
bash
Copy code
git clone https://github.com/your-username/inventory-system.git
2. Setting Up the Database
To set up the database, you need to execute the provided SQL script file.

Access your MySQL environment:

bash
Copy code
mysql -u your-username -p
Create the database and execute the script:

bash
Copy code
SOURCE path-to/project_code.sql;
This will set up the Customer, Products, and Inventory tables and insert some initial data for testing purposes.

3. Modifying the Database
You can modify the database structure or insert new records by editing the SQL script.
To insert new customers or products, use the following template:
sql
Copy code
INSERT INTO Customer (Customer_ID, C_Name, Contact_Number, Email) 
VALUES (8, 'John Doe', '555-1234', 'john.doe@example.com');
sql
Copy code
INSERT INTO Products (Product_ID, Product_Name, P_Description, Price, Quantity)
VALUES (108, 'New Product', 'Category', 5000, 25);
4. Generating Reports
Use the following SQL query to display inventory reports by combining the Products and Inventory tables:

sql
Copy code
SELECT p.Product_ID, p.Product_Name, i.Quantity, i.Location_
FROM Products p
JOIN Inventory i ON p.Product_ID = i.Product_ID;
This query will show product names, their stock levels, and storage locations.

Future Enhancements
User Authentication: Add login functionality to protect data and allow access to authorized users only.
Stock Alerts: Implement automated stock level alerts when product quantities fall below a specified threshold.
Sales and Order Tracking: Extend the system to include sales tracking, order processing, and purchase history for customers.
Multi-Location Inventory: Add support for managing inventory across multiple locations, including different branches or warehouses.
Advanced Reporting: Provide more detailed inventory and sales reports with custom filters, such as date ranges or specific product categories.
Contribution
Contributions are welcome! If you would like to improve this system, feel free to fork the repository and submit a pull request with your changes. You can also open issues for feature requests or bug reports.

License
This project is licensed under the MIT License. See the LICENSE file for more details.
