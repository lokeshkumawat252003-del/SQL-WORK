create database testdb;
create table testdb.employee(id int);
select * from testdb.employee;


-- DDL [ALTER]
alter table testdb.employee add column name varchar(20);-- added a column
alter table testdb.employee drop column id;-- dropped a specific column

select * from testdb.employee;
desc testdb.employee;
alter table testdb.employee modify column name int;-- changed the datatype

alter table testdb.employee add column empid int;-- add a columnmalter table testdb.employee modify column empid int NOT NULL;-- not null on a table column 


desc testdb.employee;
alter table testdb.employee add constraint unique(name);-- unique constraint
alter table testdb.employee modify column empid int NOT NULL;-- not null on a table column 
desc testdb.employee;

alter table testdb.employee modify column empid int primary key;
alter table testdb.employee rename column empid to id;-- column rename
alter table testdb.employee rename to emp2;-- table rename
desc testdb.employee;

-- truncate
select * from testdb.employee;
insert into testdb.employee values  (100,80);

truncate testdb.employee;-- first it drop the table then recreate the table again-- truncate is also ddl
select * from testdb.employee;
desc testdb.employee;
alter table testdb.employee drop constraint name;-- remove unique constraint

select * from testdb.employee;
SET SQL_SAFE_UPDATES=0;

INSERT into testdb.employee values(10,199),(13,200),(11,899),(12,5738),(10,10910);
update testdb.employee set name='899';-- will makle changes to every row

update testdb.employee set name ='7123' where id=199;-- condition
select * from testdb.employee;

delete from testdb.employee;

select * from testdb.employee where name=899;
select * from testdb.employee;










