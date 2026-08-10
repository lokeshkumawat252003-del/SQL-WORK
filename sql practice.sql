show databases;
use world;
select * from city;
show tables;
select now();
select curdate();
select curtime();
use world;
select distinct(continent),name from country;
select continent,count(name) from country group by continent;
select * from country;
select count(name) from country where continent='north america';
select count(name) from country where continent='asia';
select count(name),count(distinct(name)) from country;
select name,count(name) from country group by name;
select * from city;
select count(name) from city where district='zuid-holland';
select district,count(name),sum(population)from city
 group by district;
 select * from city;
 select countrycode,count(name) from city group 
 by countrycode;
 select count(name),count(code),count(continent)
 ,count(indepyear)from country;
 select * from country;
 -- ques 1
 select count(name) from country where lifeexpectancy 
 between 0.1 and 83.5;
 -- ques 2
 select sum(population)from country where indepyear>1990;
 -- ques 3
 select count(name) from country where indepyear is null;
 -- ques 4
 select count(name),sum(SurfaceArea) from country group by 
 Region;
 -- ques 5
 select count(name),continent from country  group by continent;
 -- ques 6
 select count(name),continent,region from country 
 group by continent,region;
 select now();
 select curtime();
 show databases;
use world;
select * from city;
use sakila;
show tables;
select * from category;
select category_id,name from category where name='Action';
use world;
select * from country;
select COUNT(name),sum(SurfaceArea) from country group by Region;
select * from  country where GNP>=828.00;
select * from city;
select sum(population) from city;
show databases;
use sakila;
show tables;
select * from  city;
select city_id, count(city) from city group by city_id;
select now();
select current_date();
 -- natural join
 use world;
 select c.id,c.name,c.countrycode,city.code,city.name from city as c
 join country as city
 on c.countrycode=city.code;
 select c.id,c.name,c.countrycode, cty.code,cty.name
 from city as c natural join country as cty;
 -- city.name=country.name and city.population=
 -- country.population
 -- self join
 create database selfjoindb;
 use selfjoindb;
 create table employees(eid int,name varchar(20),
 manager_id int);
 insert into employees values (1,'tushar',null),(2,'abhinav',1),
 (3,'saksham',1), (4,'akshay',2);
 select * from employees;
 select emp.eid,emp.name,emp.manager_id,mngr.eid,mngr.name 
 from employees as emp left join
 employees as mngr
 on emp.manager_id=mngr.eid;
 select mngr.eid,mngr.name from employees as mngr;
 CREATE TABLE departments (     dept_id   INT PRIMARY KEY,     
 dept_name VARCHAR(50),     
 location  VARCHAR(50) ); 
 
 INSERT INTO departments VALUES 
 (10,'HR','Jaipur'), (20,'IT','Bangalore'),
 
 (30,'Finance','Mumbai'), (40,'Marketing','Delhi'),
 (50,'Legal','Pune'); 
 
 CREATE TABLE employees (     emp_id   INT PRIMARY KEY,  
 emp_name VARCHAR(50),     dept_id  INT,     salary   INT,     
 city     VARCHAR(50) ); 
 INSERT INTO employees VALUES
 (101,'Amit',10,45000,'Jaipur'),
 (102,'Bhavna',20,72000,'Bangalore'), 
 (103,'Chirag',20,68000,'Bangalore'), 
 (104,'Divya',30,55000,'Mumbai'), 
 (105,'Esha',NULL,39000,'Delhi'), 
 (106,'Farhan',40,61000,'Delhi'),
 (107,'Gaurav',60,50000,'Kolkata'), 
 (108,'Hina',30,83000,'Mumbai'); 
 select * from employees;
 CREATE TABLE projects (     proj_id  
 INT PRIMARY KEY,     proj_name VARCHAR(50),     dept_id
 INT,     budget    INT ); 
 INSERT INTO projects VALUES 
 (1,'Payroll Revamp',10,120000), 
 (2,'Cloud Migration',20,500000), 
 (3,'Mobile App',20,300000), 
 (4,'Audit Automation',30,250000), 
 (5,'Brand Refresh',40,180000), 
 (6,'Data Lake',70,400000);
 show databases;
 use world;
 show tables;
 select * from departments;
 select * from employees;
 select * from  projects;
 
 select p.proj_id,p.proj_name,d.dept_name,p.budget from 
 projects as p;
 use world;
 show tables;
 select * from departments;
 select p.proj_name,p.dept_id,p.budget,d.dept_id,d.dept_name
 from projects as p
 join departments as d
 on p.dept_id=d.dept_id;
 
 
 
 select d.dept_name,
 sum(budget)
 from projects as p
 join departments as d
 on p.dept_id=d.dept_id group by dept_name;
 -- you need to find dept_name and total working 
 -- in that department
 select d.dept_name,count(*)
 from employees as e
 join departments as d on e.dept_id=d.dept_id
 group by d.dept_name having count(*)>1;
 create database corr_db;
 use corr_db;
 show tables;
 
 
create table orders1(order_id int,name varchar(20),
 amount int);
 insert into orders1 values(1,'a',100),
 (2,'a',200),(3,'a',300),(4,'b',400),(5,'b',300);
 select * from orders1;
 
 select order_id,name,amount from
 orders1 where name='a' and amount=(select max(amount)
 from orders1 where name='a');
 
 create database newdb;

use newdb;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    gender CHAR(1),
    salary DECIMAL(10,2),
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);


INSERT INTO Department VALUES
(101, 'HR', 'Delhi'),
(102, 'IT', 'Bangalore'),
(103, 'Finance', 'Mumbai'),
(104, 'Sales', 'Pune'),
(105, 'Marketing', 'Hyderabad');



INSERT INTO Employee VALUES
(1, 'Amit',    'M', 55000, 101, NULL),
(2, 'Neha',    'F', 48000, 101, 1),
(3, 'Raj',     'M', 62000, 101, 1),
(4, 'Priya',   'F', 70000, 102, NULL),
(5, 'Arjun',   'M', 68000, 102, 4),
(6, 'Kiran',   'F', 72000, 102, 4),
(7, 'Rohit',   'M', 61000, 102, 4),
(8, 'Sneha',   'F', 80000, 103, NULL),
(9, 'Vikas',   'M', 75000, 103, 8),
(10,'Anjali',  'F', 78000, 103, 8),
(11,'Mohit',   'M', 50000, 104, NULL),
(12,'Pooja',   'F', 45000, 104, 11),
(13,'Deepak',  'M', 53000, 104, 11),
(14,'Riya',    'F', 60000, 104, 11),
(15,'Kunal',   'M', 65000, 105, NULL),
(16,'Nisha',   'F', 62000, 105, 15),
(17,'Varun',   'M', 59000, 105, 15),
(18,'Isha',    'F', 67000, 105, 15),
(19,'Manish',  'M', 64000, 105, 15),
(20,'Kavya',   'F', 52000, 101, 15);

select * from employee;
select * from department;
select * from employee where dept_id=104 and salary=
(select max(salary) from employee where dept_id=104);

select * from employee where dept_id=104 and salary>=all
(select salary from employee where dept_id =104);

select * from employee as eout where salary>(select 
avg(salary) from employee where dept_id=eout.dept_id);

-- Ques 1 employee whose salary is greater than the average salary
-- of their own department =

select e.emp_id,e.emp_name,d.dept_name,e.salary from employee 
as e join department as d on e.dept_id=d.dept_id
where salary>(select avg(salary) from employee where
dept_id =e.dept_id);

-- Ques 2 employee who earn more than every other employee
-- in their department
select * from employee as e where salary >all(
select salary from employee where
 dept_id =e.dept_id and emp_id !=e.emp_id);
 
 -- ques 3 employee who are not the highest paid 
 -- employee in their department
 select emp_name from employee as eout where 
 salary !=(select max(salary) from employee where
 dept_id = eout.dept_id);
 
 -- ques 4 Departments having at least one enmployee
 -- earning more than 70000
 
 
 select dept_id,dept_name from department where dept_id=any
 (select dept_id from employee where salary>70000);
 
 -- second highest paid employee in each department
select * from department where dept_id=any(
 select max(salary) from employee
 where salary<(
 select max(salary) from employee));
 
 select emp_name,dept_id,salary from 
 employee as e1 where salary =(select max(salary) from 
 employee as e2 where dept_id=e1.dept_id and
 salary<(select max(salary)
 from employee where dept_id=e.dept_id));
 
 
 drop database if exists newdb2;
create database newdb2;

use newdb2;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

INSERT INTO Customers VALUES
(101, 'Alice', 'New York'),
(102, 'Bob', 'Chicago'),
(103, 'Charlie', 'Dallas'),
(104, 'David', 'Seattle'),
(105, 'Emma', 'Boston'),
(106, 'Frank', 'Chicago'),
(107, 'Grace', 'Dallas'),
(108, 'Henry', 'Miami');



CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(20)
);


INSERT INTO Orders VALUES
(1001, 101, '2025-01-05', 1200, 'Delivered'),
(1002, 101, '2025-02-15', 800, 'Cancelled'),
(1003, 102, '2025-01-20', 3500, 'Delivered'),
(1004, 102, '2025-03-10', 600, 'Pending'),
(1005, 103, '2025-02-18', 900, 'Delivered'),
(1006, 104, '2025-03-05', 4500, 'Delivered'),
(1007, 104, '2025-04-01', 700, 'Pending'),
(1008, 105, '2025-01-11', 1500, 'Cancelled'),
(1009, 105, '2025-04-12', 2200, 'Delivered'),
(1010, 107, '2025-05-01', 1800, 'Pending');

select * from customers;
select * from orders;


-- exists and in
select * from customers where customer_id in
(select customer_id from orders);
select * from customers where exists
(select 1 from orders where orders.customer_id
=customers.customer_id);



-- find customers who have never placed an order
select * from customers where  not exists
(select 1 from orders where orders.customer_id=
customers.customer_id );

-- find the customers who have at least one delivered order.
select * from 
customers where exists
(select 1 from orders where orders.customer_id=
customers.customer_id and orders.status='Delivered');

-- find customers who have both delivered and pending order


use newdb2;
create table test1( rollno int);-- create=>DDL statement
insert into test1 values(10);-- DML statement
insert into test1 values(30);-- DML statement
insert into test1 values('aman');-- error bcz of aman

select * from test1;
-- tinyint [1byte memory]
-- 1 byte =>8 bit
-- 2**8=>256
-- -128to 127
create table test2 ( rollno tinyint);-- create=>DDL statement
insert into test2 values(129);
insert into test2 values(-128);
insert into test2 values(True);
select * from test2;





-- string datatype
-- varchar
-- char=> fixed size of character
create table test4(gender char(10) );-- create =>DDL statement
insert into test4 values('Male');
select * from test4;



create table test6(gender varchar(20) );-- create =>DDL statement
insert into test6 values('OM');-- 18 character block
-- that can be use at any place
select * from test6;
-- space, ' ,",1,2,A'-- These all are characters

create table test7(name  char(10),name2 varchar(10) );
insert into test7 values('abc','abc');
insert into test7 values('def','def  ');
-- char will remove the trailing whitespace
insert into test7 values('aman',null);

select name,char_length(name) ,name2,char_length(name2)
from test7;

select table_name,data_length
from information_schema.tables
where table_schema=database()
and table_name in('test6','test4');

-- set of rules that we apply on the column is known
-- as constraints
-- to prevent invalid data entry
-- mela= entry securtiy guard

-- not null 
create table test9(id int,name varchar(20));
insert into test9 values(10,'abhishek');
insert into test9 values(10,null);-- constraint worked
select * from test9;

create table test9(id int,name varchar(20));
insert into test9 values(10,'abhishek');
insert into test9 values(10,null);-- constraint worked
select * from test9;

create table test12(id int,name varchar(20) default 'regex');
insert into test12 values(10,'abhishek');
insert into test12(id) values(11);-- default is regex
insert into test12(name) values('lokesh');-- default in
-- id is null
select * from test12;


create table test13(id int unique,name varchar(20));
insert into test13 values(10,'abhishek');
insert into test13 values(10,'ujjwal');-- error
insert into test13 values(11,'abhishek');-- works
insert into test13 values(null,'happy');-- works
insert into test13 values(null,'isha');-- works

select * from test13;


-- 1 table only 1
-- primary key => unique + not null
create table test14(id int primary key,name varchar(20));
insert into test14 values(10,'abhishek');


insert into test14 values(10,'ads');-- duplicate value
insert into test14 values(10,'ads');-- not null constraint
select * from test14;



 










 
 




 
 
 
 
 
 
 
 
 
 
 

	