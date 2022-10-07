drop trigger trigger1;
DELIMITER @@
create trigger trigger1
after insert
on emp for each row
Begin
 insert into log(comments) values ('new record has been inserted');
End@@

drop table  log;
create table log(logid int NOT NULL AUTO_INCREMENT, comments varchar(100), primary key(logid));
select * from log;