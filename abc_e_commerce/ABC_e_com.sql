-- Step 1: Create the Schema
CREATE SCHEMA abc_e_commerce;

-- Step 2: Use the New Schema
USE abc_e_commerce;

-- Step 3: Create the Tables
-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    CreatedDate DATE
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Create OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Step 4: Insert the Sample Data
-- Insert data into Customers Table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, CreatedDate) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '2023-01-15'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2023-02-10'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '2023-03-05'),
(4, 'Bob', 'Brown', 'bob.brown@example.com', '2023-04-12'),
(5, 'Charlie', 'Davis', 'charlie.davis@example.com', '2023-05-20');

-- Insert data into Orders Table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2023-05-10', 150.50),
(102, 2, '2023-06-15', 220.00),
(103, 3, '2023-07-20', 340.75),
(104, 4, '2023-08-25', 175.00),
(105, 5, '2023-09-30', 280.50);

-- Insert data into Products Table
INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(201, 'Laptop', 'Electronics', 1000.00),
(202, 'Headphones', 'Electronics', 150.00),
(203, 'Office Chair', 'Furniture', 200.00),
(204, 'Water Bottle', 'Accessories', 25.00),
(205, 'Desk Lamp', 'Lighting', 45.00);

-- Insert data into OrderDetails Table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(301, 101, 201, 1),
(302, 101, 202, 2),
(303, 102, 203, 1),
(304, 103, 204, 4),
(305, 104, 205, 3),
(306, 105, 201, 1),
(307, 105, 204, 2);