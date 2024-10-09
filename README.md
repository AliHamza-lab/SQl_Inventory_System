# Inventory Management System

## Overview
This project is a **SQL-based Inventory Management System** designed to help businesses efficiently manage customer information, product details, and stock levels. It provides a relational database structure for storing and organizing essential data such as customer records, product descriptions, pricing, and inventory quantities. The system uses SQL queries for adding, updating, and retrieving data, making it easier for businesses to monitor and control their inventory across different locations and streamline daily operations.

This system is ideal for small to medium-sized businesses looking for a simple, scalable solution for real-time inventory tracking, without relying on complex software.

## Features

### 1. Customer Management
The system allows you to store and manage customer information, including:
- **Customer_ID**: Unique identifier for each customer.
- **C_Name**: Customer's full name.
- **Contact_Number**: Customer's phone number.
- **Email**: Customer's email address.

**Operations**:
- Insert new customer records.
- Retrieve customer information with SQL `SELECT` queries.
- Update or delete customer data to maintain up-to-date records.

### 2. Product Management
Track and manage product details such as:
- **Product_ID**: Unique identifier for each product.
- **Product_Name**: Name of the product.
- **P_Description**: Description of the product (e.g., category, usage).
- **Price**: Price of the product.
- **Quantity**: Available stock quantity.

**Operations**:
- Add new products using SQL `INSERT` queries.
- Update product details, including descriptions, pricing, and stock levels.
- Retrieve product information for inventory reports or customer orders.

### 3. Inventory Tracking
Efficiently manage and track stock levels with the following inventory details:
- **Inventory_ID**: Unique identifier for each inventory record.
- **Product_ID**: Foreign key reference to the Products table.
- **Quantity**: Current stock level of each product.
- **Location_**: Specific location where the product is stored.

**Operations**:
- Link products to inventory records via foreign keys.
- Track stock levels at various locations.
- Generate comprehensive inventory reports using SQL `JOIN` queries to combine product and inventory data.

## SQL Table Structure

### 1. Customer Table
Stores customer-related information.

```sql
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    C_Name VARCHAR(30),
    Contact_Number VARCHAR(15),
    Email VARCHAR(30)
);

