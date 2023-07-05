create table student
(
usn varchar(10),
sname varchar(15),
address varchar(15),
phone int,
gender varchar(6),
primary key(usn)
);
create table semsec
(
ssid varchar(5),
sem int,
sec varchar(1),
primary key(ssid)
);
create table class
(
usn varchar(10),
ssid varchar(5),
primary key(usn,ssid),
foreign key(usn) references student (usn) on delete cascade,
foreign key(ssid) references semsec(ssid) on delete cascade
);
create table subject
(
subcode varchar(7),
title varchar(15),
sem int,
credits int,
primary key(subcode)
);
create table iamarks
(
usn varchar(10),
subcode varchar(7),
ssid varchar(5),
test1 int,
test2 int,
test3 int,
final_ia int,
primary key(usn,subcode,ssid),
foreign key(usn) references student (usn) on delete cascade,
foreign key(subcode) references subject (subcode),
foreign key(ssid) references semsec (ssid)
);

insert into student values('4vp14cs001','namitha','udupi','78506857','female');
insert into student values('4vp14cs021','mithun','virajpet','89576432','male');
insert into student values('4vp14cs053','kshama','puttur','90000654','female');
insert into student values('4vp14cs010','raghavendra','karwar','8705433','male');
insert into student values('4vp14cs025','sooraj','bangalore','7777467','male');
insert into student values('4vp14cs011','karthik','puttur','77998655','male');

insert into semsec values('a235','4','a');
insert into semsec values('a234','4','b');
insert into semsec values('a218','6','a');


insert into class values('4vp14cs001','a235');
insert into class values('4vp14cs021','a235');
insert into class values('4vp14cs053','a234');
insert into class values('4vp14cs010','a234');
insert into class values('4vp14cs025','a234');
insert into class values('4vp14cs011','a218');

insert into subject values('15cs41','algorithms','4','4');
insert into subject values('15cs462','graph theory','4','3');
insert into subject values('15cs44','processors','4','4');
insert into subject values('15cs45','oop with c++','4','4');
insert into subject values('15cs64','networks','6','4');


insert into iamarks values('4vp14cs001','15cs41','a235','19','18','20','');
insert into iamarks values('4vp14cs001','15cs44','a235','15','18','19','');
insert into iamarks values('4vp14cs021','15cs41','a235','15','17','14','');
insert into iamarks values('4vp14cs021','15cs44','a235','17','16','12','');
insert into iamarks values('4vp14cs053','15cs462','a234','13','17','15','');
insert into iamarks values('4vp14cs053','15cs45','a234','13','17','19','');
insert into iamarks values('4vp14cs010','15cs462','a234','12','19','13','');
insert into iamarks values('4vp14cs010','15cs45','a234','19','17','16','');
insert into iamarks values('4vp14cs025','15cs462','a234','19','17','18','');
insert into iamarks values('4vp14cs025','15cs45','a234','17','15','16','');
insert into iamarks values('4vp14cs011','15cs64','a218','17','18','19','');
insert into iamarks values('4vp14cs011','15cs45','a218','10','11','9','');


----1-------
select s.usn,sname,gender,address
from student s,semsec sc,class c
where s.usn=c.usn and c.ssid=sc.ssid and sc.sem=4 and sc.sec='a';

---2--------
select sem,sec,gender,count(*) as count
from student s,semsec sc,class c
where s.usn=c.usn and sc.ssid=c.ssid
group by sem,sec,gender;

---3-----
create view test2 as
(
select usn,test1,subcode
from iamarks where usn='4vp14cs025'
);
select * from test2;