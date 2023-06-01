--a
BEGIN TRANSACTION
UPDATE Production.Product 
SET ListPrice = 1.1 * ListPrice
WHERE ProductID = 680
COMMIT;

SELECT * FROM Production.Product

--b
EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'
BEGIN TRANSACTION
DELETE pp
FROM Production.Product pp
WHERE ProductID = 707
ROLLBACK;
EXEC sp_MSForEachTable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL'

SELECT * FROM Production.Product

--c
BEGIN TRANSACTION
SET IDENTITY_INSERT Production.Product ON
INSERT INTO Production.Product(ProductID, Name, ProductNumber, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate)
VALUES(1000, 'HH Bottom Bracket', 'BB-0101', 1, 1, 5, 78, 2, 7)
SET IDENTITY_INSERT Production.Product OFF
COMMIT;

SELECT * FROM Production.Product

--d
BEGIN TRANSACTION
UPDATE Production.Product 
SET StandardCost = 1.1 * StandardCost
IF (SELECT SUM(StandardCost) FROM Production.Product) < 50000
ROLLBACK;
ELSE
COMMIT;

SELECT * FROM Production.Product

--e
BEGIN TRANSACTION
IF NOT EXISTS(SELECT ProductNumber FROM Production.Product WHERE ProductNumber = 'AR-5380')
BEGIN
	SET IDENTITY_INSERT Production.Product ON
	INSERT INTO Production.Product(ProductID, Name, ProductNumber, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate)
	VALUES(1001, 'TT Bottom Bracket', 'AR-5380', 1, 1, 5, 90, 3, 8)
	SET IDENTITY_INSERT Production.Product OFF
	COMMIT
END
ELSE 
	ROLLBACK


SELECT * FROM Production.Product

--f
EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';
BEGIN TRANSACTION
UPDATE Sales.SalesOrderDetail
SET OrderQty = 3 * OrderQty
DECLARE @min INT 
SET @min = (SELECT TOP 1 OrderQty FROM Sales.SalesOrderDetail ORDER BY OrderQty)
IF @min = 0
	ROLLBACK;
ELSE
	COMMIT;
EXEC sp_MSForEachTable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL'


SELECT * FROM Sales.SalesOrderDetail

--g
EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'
BEGIN TRANSACTION
DECLARE @avg FLOAT, @d FLOAT
SET @avg = (SELECT AVG(StandardCost) FROM Production.Product)
SET @d = (SELECT COUNT (*) FROM Production.Product WHERE StandardCost > @avg)

DELETE FROM Production.Product
WHERE StandardCost > @avg

IF (@d > 10)
	ROLLBACK;
ELSE
	COMMIT;

SELECT * FROM Production.Product
