-- Active: 1712235013311@@localhost@5432@diana@public
SELECT
    u.userid,
    u.login,
    u.password,
    s.supplierid,
    c.customerid
FROM Users u
LEFT JOIN Suppliers s ON s.userid = u.userid
LEFT JOIN Customers c ON c.userid = u.userid
WHERE u.login = '2' AND u.password = '2'
ORDER BY u.userid

SELECT productid,name,sporttype,characteristics,price quantityinstock
FROM products 
WHERE quantityinstock != 0 AND productid IN (1,2,3,4,5);

INSERT INTO Orders (OrderDate, Status, CustomerID) 
        VALUES (CURRENT_DATE, 'Processing', 1) RETURNING OrderID;


SELECT sp.SupplierProductID, p.Name as ProductName, sp.QuantitySupplied, sp.SupplyPrice, sp.SupplyDate
FROM SupplierProducts sp
JOIN Products p ON sp.ProductID = p.ProductID
WHERE sp.supplierid = 1;


SELECT     u.userid,     u.login,     u.password,     s.supplierid,     c.customerid FROM Users u LEFT JOIN Suppliers s ON s.userid = u.userid LEFT JOIN Customers c ON c.userid = u.userid WHERE u.login = '1' AND u.password = '1' ORDER BY u.userid

DELETE FROM SupplierProducts WHERE SupplierProductID = 1;
