import mysql.connector 
import pandas as pd
import matplotlib.pyplot as plt

# Establish a connection to the MySQL database
db_connection = mysql.connector.connect(
    host='your_host',
    user='your_user',
    password='your_password',
    database='abc_e_commerce'
)

# Create a cursor object
cursor = db_connection.cursor()

# Function to execute query and return dataframe
def query_to_dataframe(query):
    cursor.execute(query)
    columns = [col[0] for col in cursor.description]
    return pd.DataFrame(cursor.fetchall(), columns=columns)

# 1. Retrieving All Orders Placed by a Specific Customer
customer_orders_query = """
SELECT 
    Orders.OrderID, 
    Orders.OrderDate, 
    Orders.TotalAmount, 
    Customers.FirstName, 
    Customers.LastName 
FROM 
    Orders
JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
WHERE 
    Customers.CustomerID = 1;
"""

customer_orders_df = query_to_dataframe(customer_orders_query)
print("Customer Orders:")
print(customer_orders_df)

# 2. Analyzing Sales Trends by Product Category
sales_trends_query = """
SELECT 
    Products.Category, 
    SUM(OrderDetails.Quantity * Products.Price) AS TotalSales 
FROM 
    OrderDetails
JOIN 
    Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY 
    Products.Category
ORDER BY 
    TotalSales DESC;
"""

sales_trends_df = query_to_dataframe(sales_trends_query)

# Plotting Sales Trends by Product Category
plt.figure(figsize=(10, 6))
plt.bar(sales_trends_df['Category'], sales_trends_df['TotalSales'])
plt.xlabel('Category')
plt.ylabel('Total Sales')
plt.title('Sales Trends by Product Category')
plt.xticks(rotation=45)
plt.show()

# 3. Summarizing Total Sales for a Given Time Period
total_sales_query = """
SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month, 
    SUM(TotalAmount) AS TotalSales 
FROM 
    Orders
WHERE 
    OrderDate BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY 
    Month
ORDER BY 
    Month;
"""

total_sales_df = query_to_dataframe(total_sales_query)

# Plotting Total Sales for Each Month in 2023
plt.figure(figsize=(10, 6))
plt.plot(total_sales_df['Month'], total_sales_df['TotalSales'], marker='o')
plt.xlabel('Month')
plt.ylabel('Total Sales')
plt.title('Total Sales for Each Month in 2023')
plt.xticks(rotation=45)
plt.grid(True)
plt.show()

# Close the cursor and database connection
cursor.close()
db_connection.close()
