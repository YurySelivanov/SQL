-- Homework #5
-- Part #1
-- sql statement (classicmodels db): show products with buyPrice > 100 and <200
select * from classicmodels.products where buyPrice > 100 and buyPrice < 200;

-- sql statement (classicmodels db): show all customer names with employees in San Francisco office
select customerName from classicmodels.customers c
join classicmodels.employees e on c.salesRepEmployeeNumber = e.employeeNumber
join classicmodels.offices o on e.officeCode = o.officeCode
where o.city = 'San Francisco';

-- Part #2
-- Keep working on these queries

-- 1.how many vendors, product lines, and products exist in the database?
select
	count(distinct ProductVendor) as Vendors_count,
	count(distinct ProductLine) as Product_lines_count,
	count(distinct productCode) as Products_count
from classicmodels.products;

-- 2.what is the average price (buy price, MSRP) per vendor?
select productVendor, avg(buyPrice) , avg(MSRP) from classicmodels.products group by productVendor;

-- 3.what is the average price (buy price, MSRP) per customer?
select customerName, avg(buyPrice) , avg(MSRP) from classicmodels.customers c 
join classicmodels.orders o on c.customerNumber = o.customerNumber
join classicmodels.orderdetails od on o.orderNumber = od.orderNumber
join classicmodels.products p on od.productCode = p.productCode
group by customerName;

-- 4.what product was sold the most?
select count(p.productCode) as prod, max(o.quantityOrdered), p.productName from classicmodels.orderdetails o
join classicmodels.products p on p.productCode = o.productCode
group by p.productCode
order by prod desc
limit 1;

-- 5.which vendor sells 1966 Shelby Cobra?
select productVendor, productName from classicmodels.products
where productName like '%1966 Shelby Cobra%';

-- 6.which vendor sells more products?
select prod.productVendor, sum(det.quantityOrdered) as quantity, count(det.productcode) as quantity2
from classicmodels.products prod
join classicmodels.orderdetails det on prod.productCode = det.productCode
group by prod.productVendor
order by quantity desc
limit 1;


-- Part #3 library_simple database
-- Find all release dates for book 'Dog With Money'
select * from library_simple.book b 
left join library_simple.copy c
on b.id = c.book_id 
left join library_simple.issuance i
on c.id = i.copy_id
where b.name = 'Dog With Money';