create database windows10db;


use windows10db;


CREATE TABLE employee_performance (
    employee_id INT,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    location VARCHAR(30),
    performance_year INT,
    performance_month INT,
    salary DECIMAL(10,2),
    sales_amount DECIMAL(12,2),
    rating DECIMAL(3,1)
);

INSERT INTO employee_performance
(employee_id, employee_name, department, location,
 performance_year, performance_month, salary, sales_amount, rating)
VALUES

(101, 'Amit',    'Sales', 'Jaipur',  2025, 1, 45000, 120000, 4.2),
(102, 'Priya',   'Sales', 'Delhi',   2025, 1, 48000, 135000, 4.5),
(103, 'Rahul',   'Sales', 'Jaipur',  2025, 1, 42000, 110000, 3.9),
(104, 'Neha',    'Sales', 'Mumbai',  2025, 1, 52000, 150000, 4.7),

(101, 'Amit',    'Sales', 'Jaipur',  2025, 2, 45000, 140000, 4.4),
(102, 'Priya',   'Sales', 'Delhi',   2025, 2, 48000, 125000, 4.1),
(103, 'Rahul',   'Sales', 'Jaipur',  2025, 2, 42000, 130000, 4.2),
(104, 'Neha',    'Sales', 'Mumbai',  2025, 2, 52000, 160000, 4.8),

(101, 'Amit',    'Sales', 'Jaipur',  2025, 3, 45000, 155000, 4.6),
(102, 'Priya',   'Sales', 'Delhi',   2025, 3, 48000, 145000, 4.4),
(103, 'Rahul',   'Sales', 'Jaipur',  2025, 3, 42000, 135000, 4.3),
(104, 'Neha',    'Sales', 'Mumbai',  2025, 3, 52000, 155000, 4.6),

(105, 'Karan',   'IT',    'Jaipur',  2025, 1, 65000,  90000, 4.1),
(106, 'Sneha',   'IT',    'Delhi',   2025, 1, 70000,  95000, 4.4),
(107, 'Vikas',   'IT',    'Mumbai',  2025, 1, 62000,  85000, 3.8),
(108, 'Pooja',   'IT',    'Jaipur',  2025, 1, 68000, 100000, 4.6),

(105, 'Karan',   'IT',    'Jaipur',  2025, 2, 65000, 105000, 4.3),
(106, 'Sneha',   'IT',    'Delhi',   2025, 2, 70000, 110000, 4.5),
(107, 'Vikas',   'IT',    'Mumbai',  2025, 2, 62000,  98000, 4.0),
(108, 'Pooja',   'IT',    'Jaipur',  2025, 2, 68000, 120000, 4.7),

(105, 'Karan',   'IT',    'Jaipur',  2025, 3, 65000, 115000, 4.5),
(106, 'Sneha',   'IT',    'Delhi',   2025, 3, 70000, 125000, 4.7),
(107, 'Vikas',   'IT',    'Mumbai',  2025, 3, 62000, 105000, 4.2),
(108, 'Pooja',   'IT',    'Jaipur',  2025, 3, 68000, 130000, 4.8),

(109, 'Ravi',    'HR',    'Delhi',   2025, 1, 40000,  60000, 3.9),
(110, 'Anjali',  'HR',    'Jaipur',  2025, 1, 43000,  65000, 4.2),
(111, 'Manish',  'HR',    'Mumbai',  2025, 1, 41000,  58000, 3.7),

(109, 'Ravi',    'HR',    'Delhi',   2025, 2, 40000,  70000, 4.1),
(110, 'Anjali',  'HR',    'Jaipur',  2025, 2, 43000,  72000, 4.4),
(111, 'Manish',  'HR',    'Mumbai',  2025, 2, 41000,  68000, 3.9),

(109, 'Ravi',    'HR',    'Delhi',   2025, 3, 40000,  75000, 4.3),
(110, 'Anjali',  'HR',    'Jaipur',  2025, 3,  43000,  78000, 4.5),
(111, 'Manish',  'HR',    'Mumbai',  2025, 3,  41000,  73000, 4.1);


select * from employee_performance;
-- total sales per location



select *,sum(sales_amount) over (partition by 
 location) from employee_performance;
 
 
 select *, sum(sales_amount)
 over(order by sales_amount) from
 employee_performance;
 
 select employee_id,employee_name,location
 ,sales_amount ,sum(sales_amount)
 over(),
 sum(sales_amount)over (partition by location),
 sum(sales_amount)over (partition by location
 order by sales_amount)from
 employee_performance;
 
 -- window= set of rows
 -- over use for full table
 -- max(amount) over()
 -- agar m over(partition by city)likh du
 -- cities ke according alag alag ho jaynge
 -- sum(amount) over(partition by dept) to sum ho jata sabhi
 -- values ka or har ek row ke samne aa jata
 -- over(order by amount) to sbse chota amount pehle aayga
 -- sum(amount) over (order by emp_id)
 
 -- to study
 -- 1.rank function
 -- 2.dense rank function and row number
 show databases;
 create database windowsdb;

use windowsdb;

CREATE TABLE orders (
    order_id INT,
    order_date DATE,
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    category VARCHAR(30),
    product VARCHAR(50),
    quantity INT,
    amount DECIMAL(10,2)
);


INSERT INTO orders
(order_id, order_date, customer_id, customer_name, city, category, product, quantity, amount)
VALUES
(1001, '2026-01-05', 201, 'Amit',   'Jaipur',  'Electronics', 'Laptop',       1, 65000),
(1002, '2026-01-10', 202, 'Neha',   'Delhi',   'Electronics', 'Mobile',       2, 50000),
(1003, '2026-01-15', 201, 'Amit',   'Jaipur',  'Furniture',   'Chair',        4, 12000),
(1004, '2026-01-20', 203, 'Rahul',  'Mumbai',  'Electronics', 'Headphones',   3, 9000),
(1005, '2026-01-25', 204, 'Priya',  'Delhi',   'Clothing',    'Jacket',       2, 8000),

(1006, '2026-02-03', 201, 'Amit',   'Jaipur',  'Electronics', 'Mobile',       1, 28000),
(1007, '2026-02-08', 202, 'Neha',   'Delhi',   'Furniture',   'Table',        1, 15000),
(1008, '2026-02-12', 203, 'Rahul',  'Mumbai',  'Clothing',    'Shoes',        2, 10000),
(1009, '2026-02-18', 205, 'Vikas',  'Pune',    'Electronics', 'Laptop',       1, 70000),
(1010, '2026-02-25', 204, 'Priya',  'Delhi',   'Furniture',   'Sofa',         1, 35000),

(1011, '2026-03-02', 201, 'Amit',   'Jaipur',  'Clothing',    'Shirt',        5, 7500),
(1012, '2026-03-07', 202, 'Neha',   'Delhi',   'Electronics', 'Headphones',   2, 6000),
(1013, '2026-03-11', 203, 'Rahul',  'Mumbai',  'Electronics', 'Laptop',       1, 68000),
(1014, '2026-03-16', 205, 'Vikas',  'Pune',    'Furniture',   'Chair',        6, 18000),
(1015, '2026-03-21', 204, 'Priya',  'Delhi',   'Clothing',    'Shoes',        1, 5500),

(1016, '2026-04-04', 201, 'Amit',   'Jaipur',  'Electronics', 'Tablet',       1, 22000),
(1017, '2026-04-09', 202, 'Neha',   'Delhi',   'Clothing',    'Jacket',       1, 4500),
(1018, '2026-04-14', 203, 'Rahul',  'Mumbai',  'Furniture',   'Table',        2, 30000),
(1019, '2026-04-20', 205, 'Vikas',  'Pune',    'Electronics', 'Mobile',       2, 52000),
(1020, '2026-04-27', 204, 'Priya',  'Delhi',   'Electronics', 'Laptop',       1, 72000);

select * from orders;

select customer_id,customer_name,
order_id,order_date,row_number()
 over(partition by customer_id order by order_date
) from orders;

select order_id,customer_id,amount,row_number()
 over(order by amount desc) from orders; 
 
 select category,order_id,amount,
 rank() over(partition by category order by amount desc)
 from orders;
 
 select order_id,category,amount,
 
 avg(amount)over(partition by category),
 round(amount-avg(amount) 
 over(partition by category)) as
 amount_difference
 
 from orders;
 
 select * from
 (select customer_id,customer_name,order_id,amount, 
 max(amount) over(partition by customer_id)
 as customer_max from orders) as t 
 where amount=customer_max;
 
 select * from
 (select customer_id,customer_name,order_id,amount, 
 rank() over(partition by customer_id order by amount desc)
 as customer_rank from orders) as t
 where customer_rank=1;
 
 select * from
(select customer_name, order_id, rank()
over(partition by customer_id order by amount 
desc) as rank1 from orders) as t2
where rank1<=2;






-- lag,lead,ntile,row number[important
-- running sum/running average,last 3 orders]

 
 

 

