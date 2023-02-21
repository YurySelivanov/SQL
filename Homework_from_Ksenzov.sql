--SQL_DDL

--Первая часть.

--1. Создать таблицу employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null
--2. Наполнить таблицу employee 70 строками.

create table employees (id serial primary key, employee_nam varchar(50) not null);

insert into employees (employee_nam)
values 	('John'), ('Emma'),	('Noah'),	('Olivia'), ('Mason'), ('Ava'), ('Ethan'), ('Sophia'),
		('Logan'), ('Isabella'), ('Lucas'), ('Mia'), ('Jackson'), ('Charlotte'), ('Aiden'),
		('Amelia'), ('Oliver'),	('Emily'), ('Madison'),	('Elijah'), ('Harper'),	('Alexander'),
		('Abigail'), ('James'), ('Avery'), ('Benjamin'), ('Lily'), ('Jack'), ('Ella'), ('Luke'),
		('Chloe'), ('William'),	('Evelyn'), ('Michael'), ('Sofia'), ('Owen'), ('Aria'),
		('Daniel'), ('Ellie'), ('Carter'), ('Aubrey'), ('Gabriel'), ('Scarlett'), ('Henry'),
		('Zoey'),	('Matthew'), ('Hannah'), ('Wyatt'), ('Audrey'),	('Caleb'), ('Grace'),
		('Jayden'), ('Addison'), ('Nathan'), ('Zoe'), ('Ryan'), ('Elizabeth'), ('Isaac'), ('Nora'),
		('John'), ('Emma'),	('Noah'),	('Olivia'), ('Mason'), ('Ava'), ('Ethan'), ('Sophia'),
		('Logan'), ('Isabella'), ('Lucas');
	

--3. Создать таблицу salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null
--4. Наполнить таблицу salary 15 строками:
	
create table salary (id serial primary key, monthly_salary Int not null);

insert into salary (monthly_salary)
values	(1000), (1100), (1200), (1300), (1400), (1500),
		(1600), (1700), (1800), (1900), (2000), (2100),
		(2200), (2300), (2400), (2500);
	
--5. Создать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null
--6. Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id
	
create table employee_salary (
	id serial  primary key,
	employee_id Int not null unique,
	salary_id Int not null);

insert into employee_salary(employee_id, salary_id)
values 	(1, 10), (2, 12), (3, 3), (4, 12), (8, 1), (14, 5), (87, 2), (17, 15),
		(99, 6), (23, 11), (44, 7), (18, 9), (77, 4), (12, 5), (37, 9), (48, 5),
		(72, 12), (56, 1), (47, 14), (79, 10), (22, 9), (66, 8), (69, 8), (100, 3),
		(33, 7), (42, 2), (54, 13), (46, 1), (88, 15), (19, 7), (7, 2), (67, 5),
		(15, 1), (29, 11), (34, 3), (49, 14), (83, 1), (64, 10), (96, 5), (43, 14);

	
--7. Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique
--8. Поменять тип столба role_name с int на varchar(30)
--9. Наполнить таблицу roles 20 строками:
	
create table roles (id Serial  primary key, role_name int not null unique);

alter table roles alter column role_name type varchar(30);

insert into roles (role_name)
values 	('Junior Python developer'), ('Middle Python developer'), ('Senior Python developer'),
		('Junior Java developer'), ('Middle Java developer'), ('Senior Java developer'),
		('Junior JavaScript developer'), ('Middle JavaScript developer'), ('Senior JavaScript developer'),
		('Junior Manual QA engineer'), ('Middle Manual QA engineer'), ('Senior Manual QA enginee'),
		('Project Manager'), ('Designer'), ('HR'), ('CEO'), ('Sales manager'),
		('Junior Automation QA engineer'), ('Middle Automation QA engineer'), ('Senior Automation QA engineer');
	
	
--10. Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
--11. Наполнить таблицу roles_employee 40 строками:
	
create table roles_employee (
	id Serial primary key,
	employee_id Int not null unique,
	role_id Int not null,
	foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)	
);

insert into roles_employee (employee_id, role_id)
values 	(1, 10), (2, 12), (3, 3), (4, 12), (8, 1), (14, 5), (70, 2), (17, 15),
		(21, 20), (23, 19), (44, 7), (18, 9), (66, 4), (12, 5), (37, 9), (48, 5),
		(55, 18), (56, 1), (47, 14), (52, 17), (22, 9), (61, 8), (69, 8), (63, 19),
		(33, 7), (42, 2), (54, 13), (46, 1), (11, 17), (19, 7), (7, 2), (67, 5),
		(15, 1), (29, 11), (34, 3), (49, 14), (27, 16), (64, 10), (5, 5), (43, 14);
	
		
--Вторая часть.
--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
	select employee_nam, monthly_salary from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id;	
	
--2. Вывести всех работников у которых ЗП меньше 2000.
	select employee_nam, monthly_salary from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	where monthly_salary < 2000;
	
--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
	select employee_nam, monthly_salary from salary 
	left join employee_salary 
	on salary.id = employee_salary.salary_id
	left join employees on employees.id = employee_salary.employee_id
	where employee_nam is null;	
	
--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
	select employee_nam, monthly_salary from salary 
	left join employee_salary 
	on salary.id = employee_salary.salary_id
	left join employees on employees.id = employee_salary.employee_id
	where employee_nam is null and monthly_salary < 2000;
	
--5. Найти всех работников кому не начислена ЗП.
	select employee_nam, monthly_salary from employees 
	left join employee_salary 
	on employees.id = employee_salary.employee_id
	left join salary on salary.id = employee_salary.salary_id
	where monthly_salary is null;	
	
--6. Вывести всех работников с названиями их должности.
	select employee_nam, role_name from employees
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id;

--7. Вывести имена и должность только Java разработчиков.
	select employee_nam, role_name from employees
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%Java %';

--8. Вывести имена и должность только Python разработчиков.
	select employee_nam, role_name from employees
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%Python%';

--9. Вывести имена и должность всех QA инженеров.
	select employee_nam, role_name from employees
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%QA%';

--10. Вывести имена и должность ручных QA инженеров.
	select employee_nam, role_name from employees
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%Manual QA%';

--11. Вывести имена и должность автоматизаторов QA
	select employee_nam, role_name from employees
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%Automation QA%';

--12. Вывести имена и зарплаты Junior специалистов
	select employee_nam, monthly_salary, role_name from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов
	select employee_nam, monthly_salary, role_name from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%Middle%';

--14. Вывести имена и зарплаты Senior специалистов
	select employee_nam, monthly_salary, role_name from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков
	select employee_nam, monthly_salary, role_name from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%Java %';

--16. Вывести зарплаты Python разработчиков
	select employee_nam, monthly_salary, role_name from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%Python%';

--17. Вывести имена и зарплаты Junior Python разработчиков
	select employee_nam, monthly_salary, role_name from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%Junior Python%';

--18. Вывести имена и зарплаты Middle JS разработчиков
	select employee_nam, monthly_salary, role_name from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%Middle JavaS%';

--19. Вывести имена и зарплаты Senior Java разработчиков
	select employee_nam, monthly_salary, role_name from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%Senior Java %';

--20. Вывести зарплаты Junior QA инженеров
	select employee_nam, monthly_salary, role_name from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%Junior%QA%';

--21. Вывести среднюю зарплату всех Junior специалистов
	select avg (monthly_salary) as average_salary from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков
	select sum (monthly_salary) as sum_salary from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%JavaS%';

--23. Вывести минимальную ЗП QA инженеров
	select min (monthly_salary) as min_salary from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%QA%';

--24. Вывести максимальную ЗП QA инженеров
	select max (monthly_salary) as max_salary from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%QA%';

--25. Вывести количество QA инженеров
	select count (roles.id) as count_QA from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%QA%';

--26. Вывести количество Middle специалистов.
	select count (roles.id) as count_Middle from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%Middle%';

--27. Вывести количество разработчиков
	select count (roles.id) as count_developer from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%developer%';

--28. Вывести фонд (сумму) зарплаты разработчиков.
	select sum (monthly_salary) as sum_salary_dev from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	where role_name like '%developer%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
	select employee_nam, role_name, monthly_salary from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id
	order by monthly_salary;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
	select employee_nam, role_name, monthly_salary from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id	
	where monthly_salary between 1700 and 2300
	order by monthly_salary;


--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
	select employee_nam, role_name, monthly_salary from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id	
	where monthly_salary < 2300
	order by monthly_salary;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
	select employee_nam, role_name, monthly_salary from employees 
	join employee_salary on employees.id = employee_salary.employee_id
	join salary on salary.id = employee_salary.salary_id
	join roles_employee on employees.id = roles_employee.employee_id 
	join roles on roles_employee.role_id = roles.id	
	where monthly_salary in (1100, 1500, 2000)
	order by monthly_salary;