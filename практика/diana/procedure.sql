-- Active: 1711818553436@@127.0.0.1@5432@diana@public
-- Эта процедура позволяет добавлять новый товар в базу данных, принимая название товара, тип спорта, характеристики, цену и количество на складе как параметры.
CREATE OR REPLACE PROCEDURE add_product(IN p_name VARCHAR, IN p_sportType VARCHAR, IN p_characteristics TEXT, IN p_price DECIMAL, IN p_quantityInStock INT)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Products (Name, SportType, Characteristics, Price, QuantityInStock)
    VALUES (p_name, p_sportType, p_characteristics, p_price, p_quantityInStock);
END;
$$;

-- Эта процедура обновляет статус конкретного заказа, идентифицируемого по OrderID, на новый статус, передаваемый как параметр.
CREATE OR REPLACE PROCEDURE update_order_status(IN p_orderID INT, IN p_status VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Orders
    SET Status = p_status
    WHERE OrderID = p_orderID;
END;
$$;

-- Процедура регистрирует продажу товара, добавляя запись в таблицу Sales и обновляя количество товара на складе в таблице Products.
CREATE OR REPLACE PROCEDURE register_sale(IN p_productID INT, IN p_quantitySold INT, IN p_saleDate DATE, IN p_customerID INT)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Добавление записи о продаже
    INSERT INTO Sales (ProductID, QuantitySold, SaleDate, CustomerID)
    VALUES (p_productID, p_quantitySold, p_saleDate, p_customerID);
    
    -- Обновление количества товара на складе
    UPDATE Products
    SET QuantityInStock = QuantityInStock - p_quantitySold
    WHERE ProductID = p_productID;
END;
$$;

CALL add_product('Тренажер для пресса', 'Фитнес', 'Вес: 25 кг, Размеры: 120x60x80 см', 15000, 10);
CALL update_order_status(1, 'Отправлен');
CALL register_sale(2, 3, CURRENT_DATE, 1);
