SELECT DISTINCT City, StateProvince from SalesLT.Address;

SELECT TOP 10 PERCENT Name from SalesLT.Product ORDER BY Weight DESC;

SELECT Name from SalesLT.Product ORDER BY Weight DESC OFFSET 10 ROWS FETCH NEXT 100 ROWS ONLY;

SELECT Name, Color, Size from SalesLT.Product WHERE ProductModelID = 1;

SELECT ProductNumber, Name from SalesLT.Product WHERE Color IN ('Black', 'Red', 'White') AND Size IN ('S', 'M');

SELECT ProductNumber, Name, ListPrice from SalesLT.Product WHERE ProductNumber LIKE 'BK-%';

SELECT ProductNumber, Name, ListPrice from SalesLT.Product WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';