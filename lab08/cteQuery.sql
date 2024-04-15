--a
WITH TempEmployeeInfo (firstName, lastName, rate)
AS (
SELECT FirstName, LastName, rate 
FROM Person.Person pp
INNER JOIN HumanResources.EmployeePayHistory eph ON pp.BusinessEntityID = eph.BusinessEntityID
)
SELECT * FROM TempEmployeeInfo

--b 
WITH TempCompanyRevenueInfo (CompanyContact, Revenue)
AS (
SELECT CompanyName + ' (' + FirstName + ' ' + LastName + ' )', TotalDue FROM SalesLT.Customer c
INNER JOIN SalesLT.SalesOrderHeader soh ON soh.CustomerID = c.CustomerID
)

SELECT * FROM TempCompanyRevenueInfo
ORDER BY CompanyContact

--c
WITH TempSalesValueInfo (Category, SalesValue)
AS (
SELECT pc.NAME, CAST(SUM(LineTotal) AS DECIMAL(8,2)) FROM SalesLT.ProductCategory pc
INNER JOIN SalesLT.Product p ON p.ProductCategoryID = pc.ProductCategoryID
INNER JOIN SalesLT.SalesOrderDetail sod ON sod.ProductID = p.ProductID
GROUP BY pc.Name
)

SELECT * FROM TempSalesValueInfo
