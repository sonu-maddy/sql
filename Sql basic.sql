

-- CREATE DATABASE ORG;
-- SHOW DATABASES;
  USE ORG;

-- CREATE TABLE Worker(
-- 		WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
--         FIRST_NAME CHAR(25),
--         LAST_NAME CHAR(25),
--         SALARY INT(15),
--         JOINING_DATE DATE,
--         DEPARTMENT CHAR(25)
-- );

-- INSERT INTO Worker 
--      ( WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUE
--      (001, 'Monika', 'Arora', 10000, '14-02-20', 'HR'),
--      (002, 'Deep', 'Sikha', 20000, '16-06-25', 'Sales'),
--      (003, 'Sonu', 'Maddheshiya', 25000, '11-06-22', 'SDE'),
--      (004, 'Vinit', 'Kumar', 23000, '12-02-22', 'SDE'),
--      (005, 'Shivam', 'Kumar', 243000, '16-03-20', 'Sales');
--      

-- INSERT INTO Worker VALUE (006, 'Sanidhya', 'Singh', 30000, '25-12-21', null);

-- SELECT * FROM Worker;

-- CREATE TABLE Bonus(
-- 		WORKER_REF_ID INT,
--         BONUS_AMT INT(15),
--         BONUS_DATE DATE,
--         FOREIGN KEY (WORKER_REF_ID)
--         REFERENCES Worker(WORKER_ID)
--         ON DELETE CASCADE
--         
-- );

-- INSERT INTO Bonus 
--      ( WORKER_REF_ID, BONUS_AMT, BONUS_DATE) VALUE
--      (001,1000, '14-02-24'),
--      (002,1300, '11-02-21'),
--      (003,1800, '14-02-20'),
--      (004,1800, '26-02-23'),
--      (005, 2000,'16-06-25');
--      



-- CREATE TABLE Title(
-- 		WORKER_REF_ID INT,
--         WORKER_TITLE CHAR(15),
--         AFFECTED_FROM DATE,
--         FOREIGN KEY (WORKER_REF_ID)
--         REFERENCES Worker(WORKER_ID)
--         ON DELETE CASCADE
--         
-- );
-- INSERT INTO Title 
--      ( WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUE
--      (001,'Maneger', '14-02-24'),
--      (002, 'Lead','16-06-25'),
-- 	 (003, 'AS.Maneger','16-06-25'),
--      (004, 'Lead','16-06-25'),
--      (005, 'Exicutive','16-06-25');


-- select *from Worker; 
-- select SALARY from Worker; 
-- select FIRST_NAME,SALARY from Worker; 
-- select *from bonus; 
-- select *from title; 

-- can be use select without using from keyword
-- yes, using DUAL TABLE, DUAL TABLE IS DUMMY TABLE created by mysql,  using without refering user define table.alter
-- select 11 + 55;
-- select ucase('sonu');
-- select now();

select *from Worker; 
select *from Worker where SALARY > 20000;
select *from Worker where DEPARTMENT = 'HR';

select *from Worker where SALARY between 20000 and 25000;

-- REDUCE OR STATMENT

select *from Worker where DEPARTMENT = 'HR' OR DEPARTMENT = 'SDE' OR 'Sales';

-- BETTER WAY
SELECT *FROM Worker WHERE DEPARTMENT IN ('HR', 'Sales');

SELECT *FROM Worker WHERE DEPARTMENT NOT IN ('SDE');
SELECT * FROM ORG.Worker; 

SELECT *FROM Worker WHERE DEPARTMENT IS NULL;

-- PATTERN SEARCHING "%" "_"; WILDCARD
select *from Worker; 
select *from Worker WHERE FIRST_NAME LIKE '%s%'; 
select *from Worker WHERE FIRST_NAME LIKE '_o%'; 

-- sorting 
select * from Worker order by SALARY;
select * from Worker order by SALARY DESC;

-- DISTINCT KEYWORD
SELECT distinct DEPARTMENT from Worker;

-- GROUP BY 
-- Same as the distinct ans without using aggreation function;
SELECT DEPARTMENT FROM Worker GROUP BY DEPARTMENT;

-- using aggreation function
SELECT DEPARTMENT , COUNT(*) FROM Worker GROUP BY DEPARTMENT;

-- AVERAGE salary per department
SELECT DEPARTMENT , avg(SALARY) FROM Worker GROUP BY DEPARTMENT; 

-- MIN SALARY
SELECT DEPARTMENT , MIN(SALARY) FROM Worker GROUP BY DEPARTMENT;

-- MAX SALARY
SELECT DEPARTMENT , MAX(SALARY) FROM Worker GROUP BY DEPARTMENT;

-- SUM FO DEPARTMENT SALARY...
SELECT DEPARTMENT , sum(SALARY) FROM Worker GROUP BY DEPARTMENT;

-- GROUP BY HAVING 
-- SELECT DEPARTMENT , COUNT(*) FROM Worker GROUP BY DEPARTMENT;
SELECT DEPARTMENT , COUNT(*) FROM Worker GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) >= 2;




-- new data base;
 
CREATE DATABASE temp;

INSERT INTO student VALUE(1,'sonu');
 SELECT * FROM student;
 
 -- for deleting database....
 DROP DATABASE IF EXISTS temp;

USE temp;

 CREATE TABLE Customer(
 id INT PRIMARY KEY,
 cname VARCHAR(255), 
 city VARCHAR(25),
 address VARCHAR(25),
 pincode INT,
 gender VARCHAR(25)
 );
 
 INSERT INTO Customer 
    ( id, cname, city, address, pincode, gender) VALUE
      (001, 'Monika', 'delhi', 'dilbag nagar', '274203', 'female'),
      (002, 'Deep', 'noida', 'suraj nagar', '252526', 'female'),
      (003, 'Sonu', 'gkp', 'lajpat nagar', '454327', 'male'),
      (004, 'Vinit', 'noida', 'dilbag nagar' , '274203', 'male'),
      (005, 'Shivam', 'gkp', 'mukharji nagar', '454327', 'male');

SHOW databases;
SELECT * FROM Customer;
SELECT id, cname, city, address, gender, pincode FROM Customer;


INSERT INTO Customer VALUE (006, 'priyanshi', 'LKO', 'dilbag nagar', null, 'female');

-- new table

CREATE TABLE Order_details(
  order_id INT PRIMARY KEY,
 delever_date DATE, 
 cust_id INT,
 FOREIGN KEY(cust_id) REFERENCES Customer(id)
 );
 
INSERT INTO Order_details 
      ( order_id, delever_date, cust_id) VALUE
      (001, '14-02-24', 001),
      (002, '16-06-25',002),
 	  (003, '16-06-25',003);
 
select * from Order_details;

SELECT * FROM Customer WHERE id IN (003, 002, 001);
use temp;




-- create table account (
-- id int,
-- name varchar(25) unique, 
-- balance  int,
-- constraint acc_balance check(balance > 1000)
-- ); 

-- insert into account(id, name, balance) value (001, 'sonu', 2000);

-- select * from account;

-- duplicate entry for name not allowed;
-- insert into account(id, name, balance) value (002, 'sonu', 3000);

-- check constraint are voilet for table account;
-- insert into account(id, name, balance) value (002, 'vint', 500);

drop table account;


-- create new table for new default practice
create table account (
id int,
name varchar(25) unique, 
balance  int not null  default 0
); 

insert into account(id, name, balance) value (001, 'sonu', 2000);
insert into account(id, name) value (002, 'vinit');

select * from account;

-- ALTER OPERATION

-- ADD NEW COLLOM
ALTER TABLE account ADD interest int not null default 0;  

DESC account;

-- MODIFY DATA ATTRIBUTES IN TABLE
ALTER TABLE account MODIFY interest double NOT NULL default 0;

-- change the collom -- rename the collom name;
alter table account change column interest saving_interest float NOT NULL default 0;

-- DROP COLLOMN
alter TABLE ACCOUNT DROP saving_interest;

-- change table name;
alter table account rename account_details;
select * from account_details;
alter table account_details rename account;
select * from account;

-- update multiple row

set sql_safe_updates =0;
update customer set pincode = 270431;

update customer set pincode = pincode +1;

-- delete commomd
delete from customer where id= 6;
delete from customer;





-- dml data manipulation languageV--- insert update delete replace

use TEMP;

select *FROM CUSTOMER;
-- insert DATA
insert INTO CUSTOMER VALUE
(id, cname),
(8, 'VISHAL');


-- on delete casacade  && on delete set null;

CREATE TABLE Customer2(
 id INT PRIMARY KEY,
 cname VARCHAR(255), 
 city VARCHAR(25),
 address VARCHAR(25),
 pincode INT,
 gender VARCHAR(25)
 );
 
 CREATE TABLE Order_details2(
  order_id INT PRIMARY KEY,
 delever_date DATE, 
 cust_id INT,
 -- FOREIGN KEY(cust_id) REFERENCES Customer2(id) on delete cascade 
 FOREIGN KEY(cust_id) REFERENCES Customer2(id) on delete set null
 -- delete reference data from another table.
 );
 
 INSERT INTO Customer2 VALUE (006, 'priyanshi', 'LKO', 'dilbag nagar', null, 'female');
 
 INSERT INTO order_details2
      ( order_id, delever_date, cust_id) VALUE
      (01, '14-02-24', 6);
      
select *from customer2;
select *from order_details2;

delete from customer2 where id = 006;


-- replace commond------
replace into customer (id, city) value ('2321' , 'kolkata') ;
replace into customer (id, cname, city) value ('2321' ,'sunil' 'kolkata') ;

replace into customer set id = '2321', city = 'kolkata';
replace into customer (id, cname, city) 
	select id, cname, city from customer where id = '2321';



    
 







