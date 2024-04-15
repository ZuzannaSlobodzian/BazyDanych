--a

CREATE FUNCTION dbo.fibofunction(@n INT)
RETURNS @results TABLE(
val INT)
AS
BEGIN
	DECLARE @result INT;
	DECLARE @i INT, @iCurrent INT, @i0 INT, @i1 INT;
	SET @i = 2;
	SET @i0 = 0;
	SET @i1 = 1;
	INSERT INTO @results VALUES(@i0);
	INSERT INTO @results VALUES(@i1);

	WHILE(@n > @i )
		BEGIN 
		SET @iCurrent = @i0 + @i1;
		INSERT INTO @results VALUES(@iCurrent);
		SET @i0 = @i1;
		SET @i1 = @iCurrent;
		SET @i = @i + 1;
		END
RETURN
END;
GO

CREATE PROCEDURE dbo.fiboprint(@n INT)
AS
BEGIN
	SELECT * FROM dbo.fibofunction(@n)
END

EXEC dbo.fiboprint @n = 18
GO

--b

CREATE TRIGGER modifyLastName
ON AdventureWorks2019.Person.Person
AFTER INSERT
AS
UPDATE Person.Person
SET LastName = UPPER(LastName)


INSERT INTO Person.BusinessEntity(rowguid) VALUES(newID())

INSERT INTO Person.Person(BusinessEntityID, PersonType, NameStyle, Title, FirstName, MiddleName, LastName) 
VALUES(20778, 'IN', 0, NULL, 'Anna', 'Joanna', 'Kowalik')

SELECT * FROM Person.Person
GO
--c

CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
AFTER UPDATE
AS
DECLARE @old FLOAT, @new FLOAT
SELECT @old = TaxRate FROM deleted
SELECT @new = TaxRate FROM inserted
IF @new > 1.3 * @old OR @new < 0.7 * @old
PRINT 'zmiana wartoœci pola TaxRate o wiêcej ni¿ 30%'
GO

UPDATE Sales.SalesTaxRate 
SET TaxRate = 60
WHERE SalesTaxRateID = 2


SELECT * FROM Sales.SalesTaxRate

