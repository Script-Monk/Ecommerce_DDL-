-- =========================================
-- E-commerce Database Schema
-- Author: [Ashish]
-- Description: This script creates a basic e-commerce database schema 
--              with tables for Customers, Products, Orders, and OrderDetails.
--              The schema is designed to ensure data integrity and enforce 
--              key constraints such as primary keys, foreign keys, and checks.
-- =========================================

-- =========================================

CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- =========================================

-- Table: Customers
-- Stores information about customers including personal details 
-- and contact information.
-- Constraints:
-- - CustomerID: Primary Key, Auto Increment
-- - Email: Unique, Not Null
-- =========================================
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,  -- Unique identifier for each customer
    FirstName VARCHAR(50) NOT NULL,             -- Customer's first name
    LastName VARCHAR(50) NOT NULL,              -- Customer's last name
    Email VARCHAR(100) UNIQUE NOT NULL,         -- Unique email address (cannot be null)
    Phone VARCHAR(15),                          -- Contact phone number
    Address VARCHAR(255),                       -- Street address
    City VARCHAR(50),                           -- City
    Country VARCHAR(50),                        -- Country
    PostalCode VARCHAR(10)                      -- Postal/ZIP code
);

-- =========================================
-- Table: Products
-- Stores details of products available in the store, including 
-- pricing and stock information.
-- Constraints:
-- - ProductID: Primary Key, Auto Increment
-- - Price: Must be greater than or equal to 0
-- - Stock: Defaults to 0, must be greater than or equal to 0
-- =========================================
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,   -- Unique identifier for each product
    ProductName VARCHAR(100) NOT NULL,          -- Name of the product
    Category VARCHAR(50),                       -- Category the product belongs to
    Price DECIMAL(10, 2) CHECK (Price >= 0),    -- Price of the product (must be >= 0)
    Stock INT DEFAULT 0 CHECK (Stock >= 0),     -- Stock level (defaults to 0, must be >= 0)
    Description TEXT                            -- Description of the product
);

-- =========================================
-- Table: Orders
-- Tracks customer orders including the date of the order and 
-- the total amount.
-- Constraints:
-- - OrderID: Primary Key, Auto Increment
-- - CustomerID: Foreign Key referencing Customers(CustomerID)
-- - TotalAmount: Must be greater than or equal to 0
-- =========================================
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,     -- Unique identifier for each order
    OrderDate DATE NOT NULL,                    -- Date the order was placed
    CustomerID INT,                             -- Foreign key linking to Customers table
    TotalAmount DECIMAL(10, 2) CHECK (TotalAmount >= 0),  -- Total order amount (must be >= 0)
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)  -- Links order to a customer
);

-- =========================================
-- Table: OrderDetails
-- Contains details of products included in an order, 
-- including quantity and price at the time of purchase.
-- Constraints:
-- - OrderDetailID: Primary Key, Auto Increment
-- - OrderID: Foreign Key referencing Orders(OrderID)
-- - ProductID: Foreign Key referencing Products(ProductID)
-- - Quantity: Must be greater than 0
-- - PriceAtPurchase: Must be greater than or equal to 0
-- =========================================
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,  -- Unique identifier for each order detail
    OrderID INT,                                   -- Foreign key linking to Orders table
    ProductID INT,                                 -- Foreign key linking to Products table
    Quantity INT CHECK (Quantity > 0),             -- Quantity of product ordered (must be > 0)
    PriceAtPurchase DECIMAL(10, 2) CHECK (PriceAtPurchase >= 0),  -- Price at the time of purchase
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),   -- Links to the specific order
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)  -- Links to the specific product
);
