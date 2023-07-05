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
select * from dlocation;select * from project;select * from works_on;drop table departmentdrop table employeedrop table dlocationdrop table projectdrop table works_onINSERT INTO department VALUES('1','networks',NULL,'10-JUN-13'),('2','data mining',NULL,'17-OCT-10');INSERT INTO employee VALUES('555','brian a smith','texas ','male',700000,'222','2'),('666','alicia zelaya ','colarado ','female ',500000 ,'333','1'),('777', 'julian smith' ,'las vegas','female',700000,'333','2'),('111','john b smith','nevada','male',650000,null,'1'),('222','ramesh narayan','nebraska','male',800000,'111','2'),('333','ahmad jabbar','san jose','male' ,750000 ,'111','1'),('444','joyce a english' ,'los angeles', 'female', 650000, '222', '1') ;update department set mgrssn='111' where dno='1';update department set mgrssn='333' where dno='2';INSERT INTO dlocation VALUES('1','stanford'),('2','houston'),('1','vegas'),('2','texas');INSERT INTO project VALUES(11, 'iot', 'texas', 1),(12, 'webmining', 'texas', 2),(13, 'sensors', 'vegas', 1),(14, 'routing', 'stanford', 1),(15, 'cluster', 'houston', 2);INSERT INTO works_on
VALUES 
    (555, 11, 4),
    (666, 12, 4),
    (666, 15, 3),
    (666, 13, 3),
    (777, 14, 2),
    (222, 11, 4),
    (444, 15, 3),
    (777, 15, 3);