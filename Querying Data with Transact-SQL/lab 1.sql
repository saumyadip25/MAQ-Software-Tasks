select * from SalesLT.Customer;

select Title, FirstName, MiddleName, LastName, Suffix 
from SalesLT.Customer;

select SalesPerson, Title + LastName as CustomerName, Phone
from SalesLT.Customer;

select convert(varchar(8), CustomerID) + ': ' + CompanyName from SalesLT.Customer;

select SalesOrderNumber + ' (' + convert(varchar(2), RevisionNumber) +')', convert(nvarchar(30), OrderDate, 102) as OrderDate 
from SalesLT.SalesOrderHeader;

select FirstName + ' ' + isnull(MiddleName + ' ', '') + LastName as CustomerName
from SalesLT.Customer;

update SalesLT.Customer
set EmailAddress = NULL
where CustomerID % 7 = 1;

select CustomerID, coalesce (EmailAddress, Phone) as PrimaryContact
from SalesLT.Customer;

update SalesLT.SalesOrderHeader
set ShipDate = NULL
where SalesOrderID > 71899;

select SalesOrderID, OrderDate, 
	case
	when ShipDate is null then 'Awaiting Shipment'
	else 'Shipped'
	end as ShippingStatus
from SalesLT.SalesOrderHeader;

