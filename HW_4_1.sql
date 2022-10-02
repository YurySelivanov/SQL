-- Homework for Lesson #4 
-- Part #1 classicmodels database 

-- 1.which vendor sells 1966 Shelby Cobra?
select productVendor, productName from classicmodels.products where productName Like '%1966 Shelby Cobra%';

-- 2.which product is the most and least expensive?
select productName, MSRP from classicmodels.products where 
MSRP = (select min(MSRP) from classicmodels.products) 
or MSRP = (select max(MSRP) from classicmodels.products);

-- 3.which product has the most quantityInStock?
select productName, quantityInStock from classicmodels.products where 
quantityInStock = (select max(quantityInStock) from classicmodels.products);

-- 4.list all products that have quantity in stock less than 20
select * from classicmodels.products where quantityInStock < 20;

-- 5.which customer has the highest and lowest credit limit?
select * from  classicmodels.customers where 
creditLimit = (select min(creditLimit) from classicmodels.customers) 
or creditLimit = (select max(creditLimit) from classicmodels.customers);

-- 6.customers in what city are the most profitable to the company?
select c.city, p.amount, c.customerNumber from  classicmodels.customers c join classicmodels.payments p 
on c.customerNumber = p.customerNumber where amount = (select max(amount) from classicmodels.payments);

-- 7.who is the best customer?
select c.customerName as BestCustomer, p.amount as amountPayed from  classicmodels.customers c join classicmodels.payments p 
on c.customerNumber = p.customerNumber where amount = (select max(amount) from classicmodels.payments);

-- 8.customers without payment
select c.customerNumber, c.customerName, p.amount from  classicmodels.customers c left join classicmodels.payments p 
on c.customerNumber = p.customerNumber where p.amount is Null;

-- 9.list all employees by their (full name: first + last) in alpabetical order
select concat(lastName, ' ', firstName) as fullName from classicmodels.employees order by fullName;


-- Part #2  -- library_simple database
-- 1.find all information (query each table seporately for book_id = 252)
select * from library_simple.author_has_book a join  library_simple.book b 
on a.book_id = b.id where b.id = 252;

-- 2.which books did Van Parks write?
select * 
from library_simple.author_has_book  
left join library_simple.author on author_has_book.author_id = author.id 
left join library_simple.book on author_has_book.book_id = book.id
where first_name = 'Van' and last_name = 'Parks';

-- 3.which books where published in 2003?
select * from library_simple.book where pub_year = 2003;
