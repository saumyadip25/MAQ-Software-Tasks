SELECT a.CountryRegion, a.StateProvince, SUM(soh.TotalDue) AS Revenue from SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID JOIN SalesLT.Customer AS c
ON ca.CustomerID = c.CustomerID JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID 
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince) ORDER BY a.CountryRegion, a.StateProvince;

SELECT a.CountryRegion, a.StateProvince,
IIF(GROUPING_ID(a.CountryRegion) = 1 AND GROUPING_ID(a.StateProvince) = 1, 'Total', 
IIF(GROUPING_ID(a.StateProvince) = 1, a.CountryRegion + ' Subtotal', a.StateProvince + ' Subtotal')) 
AS Level, SUM(soh.TotalDue) AS Revenue from SalesLT.Address AS a JOIN SalesLT.CustomerAddress AS ca
ON a.AddressID = ca.AddressID JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID GROUP BY ROLLUP(a.CountryRegion, a.StateProvince)
ORDER BY a.CountryRegion, a.StateProvince;

SELECT a.CountryRegion, a.StateProvince, a.City,
CHOOSE (1 + GROUPING_ID(a.CountryRegion) + GROUPING_ID(a.StateProvince) + GROUPING_ID(a.City),
a.City + ' Subtotal', a.StateProvince + ' Subtotal', a.CountryRegion + ' Subtotal', 'Total') AS Level,
SUM(soh.TotalDue) AS Revenue from SalesLT.Address AS a JOIN SalesLT.CustomerAddress AS ca
ON a.AddressID = ca.AddressID JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID GROUP BY 
ROLLUP(a.CountryRegion, a.StateProvince, a.City) ORDER BY a.CountryRegion, a.StateProvince, a.City;

SELECT * from
(SELECT cat.ParentProductCategoryName, cust.CompanyName, sod.LineTotal
FROM SalesLT.SalesOrderDetail AS sod JOIN SalesLT.SalesOrderHeader AS soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN SalesLT.Customer AS cust ON cust.CustomerID = soh.CustomerID
JOIN SalesLT.Product AS prod ON prod.ProductID = sod.ProductID
JOIN SalesLT.vGetAllCategories AS cat ON prod.ProductcategoryID = cat.ProductCategoryID) AS catsales
PIVOT (SUM(LineTotal) FOR ParentProductCategoryName
IN ([Accessories], [Bikes], [Clothing], [Components])) AS pivotedsales ORDER BY CompanyName;


