-- Multi-Table Query Practice --
-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select p."ProductName", c."CategoryName"
from "Category" as c
join "Product" as p on c."Id" = p."CategoryId"

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select o."Id", s."CompanyName"
from "Shipper" as s
join "Order" as o on o."ShipVia" = s."Id"
where o."OrderDate" < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select o."Quantity", p."ProductName"
from "OrderDetail" as o
join "Product" as p on o."ProductId" = p."Id"
where o."OrderId" = 10251
order by p."ProductName" desc

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select
  o."Id" as OrderId,
  c."CompanyName" as CompanyName,
  e."LastName" as EmployeeLastName
from "Order" as o
join "Employee" as e on o."EmployeeId" = e."Id"
join "Customer" as c on o."CustomerId" = c."Id"

-- STRETCH
-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records
SELECT DISTINCT c."CategoryName", COUNT(p."CategoryID") as Count
FROM "Products" as p
JOIN "Categories" as c ON p."CategoryID" = c."CategoryID"
GROUP BY c."CategoryName"

-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records
SELECT DISTINCT o."OrderID", SUM(o."Quantity") as ItemCount
FROM "OrderDEtails" as o
JOIN "Products" as p ON o."ProductID" = p."ProductID"
GROUP BY o."OrderID"