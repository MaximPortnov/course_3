-- Active: 1711818553436@@127.0.0.1@5432@diana@public
-- 1. Выборка всех товаров, отсортированных по цене в порядке убывания
SELECT * FROM Products
ORDER BY Price DESC;

-- 2. Список всех заказов с информацией о клиентах
SELECT Orders.OrderID, Orders.OrderDate, Customers.FullName, Customers.ContactInfo
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- 3. Количество проданных товаров каждого вида спорта
SELECT Products.SportType, SUM(Sales.QuantitySold) AS TotalSold
FROM Sales
JOIN Products ON Sales.ProductID = Products.ProductID
GROUP BY Products.SportType;

-- 4. Товары, количество на складе которых меньше 5
SELECT Name, QuantityInStock
FROM Products
WHERE QuantityInStock < 50;

-- 5. Поставщики и количество поставленных ими товаров, отсортированные по количеству в порядке убывания
SELECT Suppliers.CompanyName, SUM(SupplierProducts.QuantitySupplied) AS TotalSupplied
FROM SupplierProducts
JOIN Suppliers ON SupplierProducts.SupplierID = Suppliers.SupplierID
GROUP BY Suppliers.CompanyName
ORDER BY TotalSupplied DESC;

-- 6. Общая сумма продаж по каждому клиенту
SELECT Customers.FullName, SUM(Finances.Amount) AS TotalSpent
FROM FinanceSales
JOIN Finances ON FinanceSales.FinanceID = Finances.FinanceID
JOIN Sales ON FinanceSales.SaleID = Sales.SaleID
JOIN Customers ON Sales.CustomerID = Customers.CustomerID
GROUP BY Customers.FullName;

-- 7. Заказы, которые должны были быть доставлены, но еще не были обработаны
SELECT OrderID, OrderDate, Status
FROM Orders
WHERE Status != 'Pending' AND DeliveryDate < '2024-04-10';

-- 8. Товары, цена которых выше средней по всем товарам, и количество на складе меньше 10
SELECT Name, Price, QuantityInStock
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products) AND QuantityInStock < 10;

-- 9. Список всех продаж, включая название товара и информацию о клиенте, для товаров, название которых начинается на "А"
SELECT Sales.SaleID, Products.Name, Customers.FullName
FROM Sales
JOIN Products ON Sales.ProductID = Products.ProductID
JOIN Customers ON Sales.CustomerID = Customers.CustomerID
WHERE Products.Name LIKE 'D%';

-- 10. Сумма расходов компании на закупку товаров по каждому поставщику
SELECT Suppliers.CompanyName, SUM(SupplierProducts.SupplyPrice * SupplierProducts.QuantitySupplied) AS TotalCost
FROM SupplierProducts
JOIN Suppliers ON SupplierProducts.SupplierID = Suppliers.SupplierID
GROUP BY Suppliers.CompanyName;

-- 11. Склады с их текущим заполнением (количество товаров) отсортированные по заполнению
SELECT Warehouses.Name, SUM(Stock.Quantity) AS TotalQuantity
FROM Stock
JOIN Warehouses ON Stock.WarehouseID = Warehouses.WarehouseID
GROUP BY Warehouses.Name
ORDER BY TotalQuantity DESC;

-- 12. Список товаров с указанием, сколько раз каждый товар был заказан
SELECT Products.Name, COUNT(OrderDetails.OrderID) AS TimesOrdered
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.Name;

-- 13. Поставщики, которые поставили товары на сумму больше определенной
SELECT Suppliers.CompanyName, SUM(SupplierProducts.SupplyPrice * SupplierProducts.QuantitySupplied) AS TotalSupplyCost
FROM SupplierProducts
JOIN Suppliers ON SupplierProducts.SupplierID = Suppliers.SupplierID
GROUP BY Suppliers.CompanyName
HAVING SUM(SupplierProducts.SupplyPrice * SupplierProducts.QuantitySupplied) > 10000;

-- 14. Вывод клиентов, которые сделали заказы на сумму выше среднего по всем заказам
SELECT Customers.FullName, SUM(Finances.Amount) AS TotalAmount
FROM FinanceSales
JOIN Finances ON FinanceSales.FinanceID = Finances.FinanceID
JOIN Sales ON FinanceSales.SaleID = Sales.SaleID
JOIN Customers ON Sales.CustomerID = Customers.CustomerID
GROUP BY Customers.FullName
HAVING SUM(Finances.Amount) > (SELECT AVG(Amount) FROM Finances WHERE OperationType = 'Income');

-- 15. Показать все продажи с деталями заказа, где количество проданного товара больше 3
SELECT Sales.SaleID, Products.Name, Sales.QuantitySold
FROM Sales
JOIN Products ON Sales.ProductID = Products.ProductID
WHERE Sales.QuantitySold > 3;
