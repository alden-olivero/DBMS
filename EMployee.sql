use [4nm21ai010employee]

create table DEPARTMENT
(
dno varchar(5),
dname varchar(15),
mgrssn varchar(10),
mgrstartdate date,
primary key(dno)
);
create table EMPLOYEE
(
ssn varchar(10),
name varchar(15),
address varchar(20),
sex varchar(10),
salary int,
superssn varchar(10),
dno varchar(5),
primary key(ssn)
);

insert into DEPARTMENT values('1','networks',null,'02-jan-2017'),('2','datamining',null,'02-feb-2017');
insert into EMPLOYEE values
('555','brian a smith','texas','male',70000,'222','2'),
('666','alicia zelaya','colarado','female',50000,'333','1'),
('777','julian smith','las vegas','female',70000,'333','2'),
('111','john b smith','nevada','male',65000,NULL,'1'),
('222','ramesh narayan','nebraska','male',80000,'111','2'),
('333','ahmad jabbar','san jose','male',75000,null,'1'),
('444','joyce a english','los angeles','female',65000,'222','1')
alter table EMPLOYEE add constraint fk1 foreign key(dno) references DEPARTMENT(dno) on delete cascade;
alter table EMPLOYEE add constraint fk2 foreign key(superssn) references EMPLOYEE(ssn) on delete no action;
alter table DEPARTMENT add constraint fk3 foreign key(mgrssn) references EMPLOYEE(ssn) on delete no action;
update department set mgrssn='111' where dno=1;
update department set mgrssn='222' where dno=2;
create table DLOCATION
(
dno varchar(5),
dloc varchar(15),
primary key(dno,dloc),
foreign key(dno) references DEPARTMENT(dno) on delete cascade
); 
create table PROJECT
(
pno varchar(5) PRIMARY KEY,
pname varchar(15),
plocation varchar(15),
dno varchar(5),
foreign key(dno) references DEPARTMENT(dno) on delete cascade
);
create table WORKS_ON
(
ssn varchar(10),
pno varchar(5),
hours int,
primary key(ssn,pno),
foreign key(ssn) references EMPLOYEE(ssn) on delete cascade,
foreign key(pno) references PROJECT(pno) on delete no action
);


