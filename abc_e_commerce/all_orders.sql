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
