# MySqlTutorial

## E-Commerce Tutorial

### Exploring the Dataset
It is a e-commerce dataset:

#### 1. **Customers Table**
This table holds information about the customers who have registered on the e-commerce platform.
#### Fields:
- **CustomerID**: A unique identifier for each customer.
- **FirstName**: The first name of the customer.
- **LastName**: The last name of the customer.
- **Email**: The email address of the customer.
- **CreatedDate**: The date when the customer account was created.

#### 2. **Orders Table**
This table records all orders placed by customers on the e-commerce platform.
#### Fields:
- **OrderID**: A unique identifier for each order.
- **CustomerID**: The identifier of the customer who placed the order (foreign key referencing `Customers` table).
- **OrderDate**: The date when the order was placed.
- **TotalAmount**: The total amount of the order.

#### 3. **Products Table**
This table contains information about the products available for sale on the e-commerce platform.

#### Fields:
- **ProductID**: A unique identifier for each product.
- **ProductName**: The name of the product.
- **Category**: The category to which the product belongs (e.g., Electronics, Furniture).
- **Price**: The price of the product.

#### 4. **OrderDetails Table**
This table captures the details of each product included in an order. It serves as a junction table to manage the many-to-many relationship between `Orders` and `Products`.

#### Fields:
- **OrderDetailID**: A unique identifier for each record in the order details.
- **OrderID**: The identifier of the order to which the detail belongs (foreign key referencing `Orders` table).
- **ProductID**: The identifier of the product in the order (foreign key referencing `Products` table).
- **Quantity**: The quantity of the product ordered.

#### Relationships and Data Flow:
- **Customers** place **Orders**.
- Each **Order** can include multiple **Products** (through the **OrderDetails** table).
- The **OrderDetails** table links **Orders** and **Products**, specifying the quantity of each product in an order.


### Create Schema and Table

- [Schema and Table](/abc_e_commerce/ABC_e_com.sql)

### Analysis Data

1. Retrieving All Orders Placed by a Specific Customer
To retrieve all orders placed by a customer with CustomerID = 1:

A customer named John Doe registers on the platform. His details are recorded in the `Customers` table. John then places an order for a laptop and a pair of headphones. This order is recorded in the `Orders` table. The details of the products (laptop and headphones) in this order are recorded in the `OrderDetails` table, linking the order to the specific products in the `Products` table.

- [All Orders](/abc_e_commerce/all_orders.sql)

2. Analyzing Sales Trends by Product Category
To analyze total sales by product category:

- [All Orders](/abc_e_commerce/sales_by_product_category.sql)

3. Summarizing Total Sales for a Given Time Period
To summarize total sales for each month in 2023

- [All Orders](/abc_e_commerce/summarize_total_sales.sql)

### Visualizations

Python Code for Visualization: 
using a library like mysql-connector-python, you can use pandas and matplotlib to visualize the data. xecutes a query and returns the results as a pandas DataFrame.

Customer Orders Retrieval: Executes the query to retrieve orders placed by a specific customer and prints the DataFrame.

|OrderID |OrderDate |TotalAmount |FirstName |LastName |
|--------|----------|------------|----------|---------|
|101  	 |2023-05-10|      150.50|      John|      Doe|


Sales Trends by Category: Executes the query to analyze sales trends by product category and visualizes the data using a bar chart.
![Sales Trends by Category](/abc_e_commerce/sale_trends_by_product_category.png)



Total Sales for Each Month: Executes the query to summarize total sales for each month in 2023 and visualizes the data using a line plot.
![Total Sales for Each Month](/abc_e_commerce/total_sales_per_month.png)



