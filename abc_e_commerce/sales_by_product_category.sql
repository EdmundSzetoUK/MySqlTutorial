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
