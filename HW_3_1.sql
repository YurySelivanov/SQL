-- Homework #3  
-- Part 1 - mywork database
-- 	1. Create database mywork
CREATE DATABASE mywork;

-- 	2. Create table employee
CREATE TABLE mywork.employee (
empno INT (10) NOT NULL,
ename VARCHAR(10) DEFAULT NULL,
job VARCHAR(9) DEFAULT NULL,
mgr INT(10) DEFAULT NULL,
hiredate DATE,
sal NUMERIC(7,2),
comm NUMERIC(7,2) NULL,
dept INT (10),
 PRIMARY KEY (empno));
 
 -- 3. To see the structure of the table 
 desc mywork.employee;
 
 -- 4. Insert records in the table
insert into mywork.employee (empno,ename,job,mgr,hiredate,sal,comm,dept)
values (1,'JOHNSON','ADMIN',6,'1990-12-17',18000,NULL,4),
    (2,'HARDING','MANAGER',9,'1990-12-17',52000,300,3),
	(3,'TAFT','SALES I',2,'1995-12-17',25000,500,3),
    (4,'HOOVER','SALES I',2,'1990-04-02',27000,NULL,3),
    (5,'LINCOLN','TECH',6,'1994-06-23',22500,1400,4),
    (6,'GARFIELD','MANAGER',9,'1993-05-01',54000,NULL,4),
    (7,'POLK','TECH',6,'1997-09-22',25000,NULL,4),
    (8,'GRANT','ENGINEER',10,'1997-03-30',32000,NULL,2),
    (9,'JACKSON','CEO',NULL,'1990-01-01',75000,NULL,4),
    (10,'FILLMORE','MANAGER',9,'1994-08-09',56000,NULL,2),
    (11,'ADAMS','ENGINEER',10,'1996-03-15',34000,NULL,2),
    (12,'WASHINGTON','ADMIN',6,'1998-04-16',18000,NULL,4),
    (13,'MONROE','ENGINEER',10,'2000-12-03',30000,NULL,2),
    (14,'ROOSEVELT','CPA',9,'1995-10-12',35000,NULL,1);

-- 5. Update records
update mywork.employee set ename = 'SMITH' where ename = 'POLK';

-- 6. Delete records
delete from mywork.employee where ename = 'ROOSEVELT';

-- 	7. Create table dept
CREATE TABLE IF NOT EXISTS mywork.dept (
deptno INT NOT NULL,
dname VARCHAR(14),
loc VARCHAR(13),
 PRIMARY KEY (deptno));
 
  -- 8. Insert records in the table
insert into mywork.dept values (1,'ACCOUNTING','ST LOUIS'),
 (2,'RESEARCH','NEW YORK'),
 (3,'SALES','ATLANTA'),
 (4,'OPERATIONS','SEATTLE');
  
-- 	9. Add column 'country' to dept table in mywork database
alter table mywork.dept add column country VARCHAR(20) DEFAULT NULL;

-- 	10. Rename column 'loc' to 'city'
alter table mywork.dept rename column loc to city;

-- 	11. Add three more departments: HR, Engineering, Marketing
insert into mywork.dept values (5, 'HR', 'NEW YORK', 'USA'),
(6, 'Engineering', 'Los angeles', 'USA'),
(7, 'Marketing', 'Washington', 'USA');

-- 	12. Write sql statement to show which department is in Atlanta
select dname from mywork.dept where city = 'Atlanta';

-- Part 2  - library_simple database
-- 1. What is the first name of the author with the last name Swanson?
select first_name from library_simple.author where last_name = 'Swanson';

-- 2. How many pages are in Men Without Fear book?
select page_num from book where name = 'Men Without Fear';

-- 3. Show all book categories that start with with letter 'W'

select * from library_simple.book where name Like 'W%';