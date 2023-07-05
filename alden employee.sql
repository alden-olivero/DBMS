use [4nm21ai010emplyee]
create table department 
( 
dno varchar(5), 
dname varchar(15), 
mgrssn varchar(5), 
mgrstartdate date, 
primary key(dno),
); 
create table employee 
( 
ssn varchar(5), 
name varchar(15), 
address varchar(15), 
sex varchar(6), 
salary int, 
superssn varchar(5), 
dno varchar(5), 
primary key(ssn), 
);
alter table employee add constraint fk1 foreign key(dno) references department(dno) ;
ALTER TABLE employee ADD CONSTRAINT fk_employee_supervisor FOREIGN KEY (superssn) REFERENCES employee(ssn) ; 
ALTER TABLE department ADD CONSTRAINT fk_department_manager FOREIGN KEY (mgrssn) REFERENCES employee(ssn);

create table dlocation 
( 
dno varchar(5), 
dloc varchar(15), 
primary key (dno,dloc), 
foreign key(dno) references department(dno) on delete cascade 
); 
create table project 
( 
pno varchar(5), 
pname varchar(10), 
plocation varchar(10), 
dno varchar(5), 
primary key(pno), 
foreign key(dno) references department(dno) on delete cascade 
); 
create table works_on 
( 
ssn varchar(5), 
pno varchar(5), 
hours int, 
primary key(ssn,pno), 
foreign key(ssn) references employee(ssn) on delete no action, 
foreign key(pno) references project(pno) on delete no action
); 


select * from department;
select * from employee;
select * from dlocation;
VALUES 
    (555, 11, 4),
    (666, 12, 4),
    (666, 15, 3),
    (666, 13, 3),
    (777, 14, 2),
    (222, 11, 4),
    (444, 15, 3),
    (777, 15, 3);