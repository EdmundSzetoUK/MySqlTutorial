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
