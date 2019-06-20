SELECT ProductID, Name, ListPrice FROM SalesLT.Product WHERE ListPrice > (SELECT AVG(UnitPrice) 
from SalesLT.SalesOrderDetail) ORDER BY ProductID;

SELECT ProductID, Name, ListPrice FROM SalesLT.Product WHERE ProductID IN (SELECT ProductID from
SalesLT.SalesOrderDetail WHERE UnitPrice < 100) AND ListPrice >= 100 ORDER BY ProductID;

SELECT ProductID, Name, StandardCost, ListPrice, (SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail 
AS SOD WHERE P.ProductID = SOD.ProductID) AS AvgSellingPrice FROM SalesLT.Product AS P ORDER BY P.ProductID;

SELECT ProductID, Name, StandardCost, ListPrice, (SELECT AVG(UnitPrice) from SalesLT.SalesOrderDetail 
AS SOD WHERE P.ProductID = SOD.ProductID) AS AvgSellingPrice FROM SalesLT.Product AS P WHERE StandardCost >
(SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail AS SOD  WHERE P.ProductID = SOD.ProductID)
ORDER BY P.ProductID;

SELECT soh.SalesOrderID, soh.CustomerID, ci.FirstName, ci.LastName, soh.TotalDue from SalesLT.SalesOrderHeader
AS SOH CROSS APPLY dbo.ufnGetCustomerInformation(soh.CustomerID) AS CI ORDER BY SOH.SalesOrderID;

SELECT ca.CustomerID, ci.FirstName, ci.LastName, a.Addressline1, a.City FROM SalesLT.Address AS A
JOIN SalesLT.CustomerAddress AS CA ON A.AddressID = CA.AddressID CROSS APPLY 
dbo.ufnGetCustomerInformation(CA.CustomerID)  AS CI ORDER BY CA.CustomerID;



