E-commerce Database Schema
Description
This project provides a SQL script to create a basic e-commerce database schema. The schema includes tables for managing Customers, Products, Orders, and OrderDetails, ensuring data integrity and enforcing key constraints such as primary keys, foreign keys, and checks.

Features
Customers Table: Stores information about customers, including personal details and contact information.
Constraints:
CustomerID: Primary Key, Auto Increment
Email: Unique, Not Null
Products Table: Stores details of products available in the store, including pricing and stock information.
Constraints:
ProductID: Primary Key, Auto Increment
Price: Must be greater than or equal to 0
Stock: Defaults to 0, must be greater than or equal to 0
Orders Table: Tracks customer orders, including the date of the order and the total amount.
Constraints:
OrderID: Primary Key, Auto Increment
CustomerID: Foreign Key referencing Customers(CustomerID)
TotalAmount: Must be greater than or equal to 0
OrderDetails Table: Contains details of products included in an order, including quantity and price at the time of purchase.
Constraints:
OrderDetailID: Primary Key, Auto Increment
OrderID: Foreign Key referencing Orders(OrderID)
ProductID: Foreign Key referencing Products(ProductID)
Quantity: Must be greater than 0
PriceAtPurchase: Must be greater than or equal to 0
