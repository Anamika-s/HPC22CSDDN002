
create table batch(batchid int,
batchname char(4) check (length(batchname) = 4),
trainer varchar(20) not null,
start_date date ,
primary key(batchid));






drop table student;

 create table student (rn int ,
 name varchar(20) not null,
 address varchar(100) ,
 feesamount int,
batchid int,
primary key (rn),
foreign key (batchid) references batch(batchid));


create table fees (rn int,
amountpaid int,
datepaid date,
foreign key (rn) references student (rn));

DELIMITER $$
create procedure insertbatch(batchid int , batchname char(4), trainer varchar(20), startdate date)
Begin
insert into batch values(batchid, batchname, trainer, startdate);
End$$
DELIMITER ;


call insertbatch(100, 'B001','Ajay Kumar', '2022/12/12');
call insertbatch(101, 'B002','Deepak Kumar', '2022/10/09');
call insertbatch(102, 'B003','Sahil Kumar', '2022/02/19');
call insertbatch(103, 'B004','Sri Naresh', '2022/12/23');
call insertbatch(104, 'B005','Gagan Deepk', '2022/08/30');

select * from batch;

insert into student values(1, 'Karan','New Delhi', 12000, 103);
insert into student values(2, 'Farooq','Old Delhi', 14000, 101);
insert into student values(3, 'Karan','New Delhi', 22000, 102); 



insert into fees values(1, 12000,'2022/09/22');


select * from batch;
select * from student;
select * from fees;


-- JOINS
select rn, name , batchname, trainer from 
student inner join batch
on student.batchid = batch.batchid;

select student.rn, student.name , batch.batchname, batch.trainer from 
student inner join batch
on student.batchid = batch.batchid;


select a.rn, a.name , b.batchname, b.trainer from 
student a inner join batch b
on a.batchid = b.batchid;
 


select student.rn, student.name , batch.batchname, batch.trainer from 
student left join batch
on student.batchid = batch.batchid;

select student.rn, student.name , batch.batchname, batch.trainer from 
student right join batch
on student.batchid = batch.batchid; 

select a.* , b.* from student a cross join batch b;

-- self join
-- when a table joins to itself

create table empl (id int ,name varchar(20) , managerid int,
primary key (id));


alter table empl add foreign key (managerid) references empl(id);

insert into empl values(1,'Ajay', null);
insert into empl values(2,'Deepak', 1);
insert into empl values(3,'Sagar', 1);
insert into empl values(4,'Lalit', 3);
insert into empl values(5,'Mandeep', 4);
insert into empl values(6,'Priya', 2);

select * from empl;

update empl set managerid=4 where managerid is null and name='Ajay';




-- Display empl name alongwith their manager names

select a.name As "Employee Name" , b.name as "Manager Name" from empl a join empl b
on a.managerid = b.id; 

