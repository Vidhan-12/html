-- DDL
-- CREATE
CREATE DATABASE store;
USE store;
CREATE TABLE employee(emp_id INT,emp_name VARCHAR(20),salary INT,LOCATION VARCHAR(20));
DESC employee;
ALTER TABLE employee ADD COLUMN department VARCHAR(20);
ALTER TABLE employee ADD COLUMN company VARCHAR(20) FIRST;
ALTER TABLE employee ADD COLUMN full_name VARCHAR(20) AFTER emp_name;
ALTER TABLE employee MODIFY COLUMN full_name char(20);
ALTER TABLE employee RENAME COLUMN emp_name to first_name;
ALTER TABLE employee DROP COLUMN company;
INSERT INTO employee (emp_id,emp_name,salary,LOCATION) VALUES (101,"VIDHAN",50000,"USA");
SELECT * FROM employee;
INSERT INTO employee (emp_id,emp_name,salary,LOCATION) VALUES (102,"atul",40000,"pune"),(103,"yash",70000,"mumbai"),(104,"abhi",80000,"pune"),(105,"harsh",43000,"delhi");





DROP TABLE employee;
CREATE TABLE student(rool_no INT NOT NULL ,stud_name VARCHAR(20),last_name VARCHAR(20)NOT NULL);
DESC student;
INSERT INTO student(rool_no,stud_name,last_name)VALUE("101","Hrushi","joshi");
drop table student;
CREATE TABLE student(rool_no INT unique ,stud_name VARCHAR(20),address VARCHAR(20)NOT NULL);
INSERT INTO student values(101,"hrushi","satara");
INSERT INTO student VALUES(102,"SHIV","PUNE");
INSERT INTO student(stud_name,address)values("hrushi","satara");
SELECT* FROM student;
CREATE TABLE student(rool_no INT  ,stud_name VARCHAR(20),address VARCHAR(20)default "pune");
INSERT INTO student(rool_no,stud_name) values(101,"hrushi");
INSERT INTO student(rool_no,stud_name,address)value(101,"hrushi","ujjain");
alter table student alter address drop default;
create table course(course_id int,course_name varchar(20),address int,
             foreign key (address) REFERENCES student(address)
             on delete cascade
             on update cascade);
                    
                    

-- where clause

desc employee;
select *from employee;
insert into employee values(101,"vidhan",500,"ujjain"),(102,"atul",600,"pune"),(103,"yash",700,"mumbai");
SELECT emp_name from employee where salary>600;
select emp_name from employee where location="pune";

select * from employee where salary is not null;
delete from employee where location="pune"and emp_id=102;
select*from employee where location="pune" and emp_id=102;
select*from employee where location="pune"or emp_id=101 or location="ujjain";
select * from employee where emp_name like "a%L";
select * from employee where emp_name in ("vidhan","yash","tanmay");
select * from employee where emp_name not in ("vidhan","yash","tanmay");
select * from employee where salary between 500 and 600;
select * from employee where salary not between 500 and 600;
select * from employee limit 2;
select * from employee limit 1,2;
select * from employee order by salary;
select * from employee order by salary desc;


select * from employee;
drop table employee;
select location,
 count(emp_id)as total_id,
 sum(salary)as total_salary,
 avg(salary)as average_salary
 ,max(salary)as max_salary,
 min(salary)as min_salary from employee group by location having min(salary)>50000;
 
 select emp_name from employee
 union all
 select emp_id from  employee ;
 -- string function

drop table employee ;
desc student;
insert into student  values (101,"vidhan","bhardwaj"),(102,"atul","thakur");
select concat(stud_name,"  ",last_name) as full_name from student;
select length(stud_name) from student;
select upper(stud_name),lower(last_name) from student;
select concat(upper(substring(stud_name,1,1)),lower(substring(stud_name,2))) from student;
select concat(trim(stud_name),"  ",trim(last_name)) as full_name from student;
