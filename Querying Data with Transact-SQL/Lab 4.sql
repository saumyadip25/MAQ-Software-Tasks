SELECT c.CompanyName, a.AddressLine1, a.City, 'Billing' AS AddressType
from SalesLT.Customer AS C JOIN SalesLT.CustomerAddress AS CA
ON C.CustomerID = CA.CustomerID JOIN SalesLT.Address AS a
ON a.AddressID = CA.AddressID WHERE CA.AddressType = 'Main Office';

SELECT C.CompanyName, a.AddressLine1, a.City, 'Shipping' AS AddressType
from SalesLT.Customer AS c JOIN SalesLT.CustomerAddress AS CA
ON C.CustomerID = CA.CustomerID JOIN SalesLT.Address AS a
ON CA.AddressID = a.AddressID WHERE CA.AddressType = 'Shipping';

SELECT c.CompanyName, a.AddressLine1, a.City, 'Billing' AS AddressType
from SalesLT.Customer AS C JOIN SalesLT.CustomerAddress AS CA
ON C.CustomerID = CA.CustomerID JOIN SalesLT.Address AS a
ON a.AddressID = CA.AddressID WHERE CA.AddressType = 'Main Office'
UNION ALL
SELECT C.CompanyName, a.AddressLine1, a.City, 'Shipping' AS AddressType
from SalesLT.Customer AS c JOIN SalesLT.CustomerAddress AS CA
ON C.CustomerID = CA.CustomerID JOIN SalesLT.Address AS a
ON CA.AddressID = a.AddressID WHERE CA.AddressType = 'Shipping';

SELECT C.CompanyName FROM SalesLT.Customer AS C JOIN SalesLT.CustomerAddress AS CA
ON C.CustomerID = CA.CustomerID JOIN SalesLT.Address AS a ON CA.AddressID = a.AddressID
WHERE CA.AddressType = 'Main Office'
EXCEPT
SELECT C.CompanyName from SalesLT.Customer AS C JOIN SalesLT.CustomerAddress AS CA
ON CA.CustomerID = C.CustomerID JOIN SalesLT.Address AS a ON CA.AddressID = a.AddressID
WHERE CA.AddressType = 'Shipping' ORDER BY C.CompanyName;

SELECT C.CompanyName FROM SalesLT.Customer AS C JOIN SalesLT.CustomerAddress AS CA
ON C.CustomerID = CA.CustomerID JOIN SalesLT.Address AS a ON CA.AddressID = a.AddressID
WHERE CA.AddressType = 'Main Office'
INTERSECT
SELECT C.CompanyName from SalesLT.Customer AS C JOIN SalesLT.CustomerAddress AS CA
ON CA.CustomerID = C.CustomerID JOIN SalesLT.Address AS a ON CA.AddressID = a.AddressID
WHERE CA.AddressType = 'Shipping' ORDER BY C.CompanyName;

