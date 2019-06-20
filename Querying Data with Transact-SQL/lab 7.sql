SELECT p.ProductID, p.Name AS ProductName, pm.Name AS ProductModel, pm.Summary from SalesLT.Product
AS P JOIN SalesLT.vProductModelCatalogDescription AS PM ON p.ProductModelID = pm.ProductModelID 
ORDER BY ProductID;


DECLARE @Colors AS TABLE (Color NVARCHAR(15));

INSERT INTO @Colors
SELECT DISTINCT Color from SalesLT.Product;

SELECT ProductID, Name, Color
FROM SalesLT.Product
WHERE Color IN (SELECT Color from @Colors);


SELECT C.ParentProductCategoryName AS ParentCategory, C.ProductCategoryName AS Category,
P.ProductID, P.Name AS ProductName from SalesLT.Product AS P JOIN dbo.ufnGetAllCategories() AS C
ON P.ProductCategoryID = C.ProductCategoryID ORDER BY ParentCategory, Category, ProductName;

SELECT CompanyContact, SUM(TotalDue) AS Revenue
from  (SELECT CONCAT(c.CompanyName, CONCAT(' (' + c.FirstName + ' ' , c.LastName + ')'))
AS CompanyContact, soh.TotalDue from SalesLT.Customer AS c JOIN SalesLT.SalesOrderHeader AS soh
ON c.CustomerID = soh.CustomerID)  AS CustomerSales(CompanyContact, TotalDue) GROUP BY CompanyContact
ORDER BY CompanyContact;
