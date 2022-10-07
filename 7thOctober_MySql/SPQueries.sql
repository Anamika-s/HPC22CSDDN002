DELIMITER &&  
CREATE PROCEDURE get_students ()  
BEGIN  
    SELECT * FROM employee;  
END &&  
DELIMITER ;

call get_students();

drop procedure insert_employee
DELIMITER &&  
create  procedure insert_employee()
Begin
	insert into employee(id,name,address,salary)  values(10,'Karan', 'Old Delhi', 23000);
End &&
DELIMITER ;
    
  call insert_employee();  

DELIMITER !!   
create procedure insert_emp(  id int ,   name varchar(20), IN address varchar(20), IN salary int)
Begin
	insert into employee(id,name , address, salary) values(id, name,address,salary);
end !!
DELIMITER ;

call insert_emp(11,'Om','New Delhi-2', 25000)

-- Create a procedure , pass ID , retur all details of that employee

Drop procedure getemoloyeedetails;
DELIMITER @@
create procedure getemoloyeedetails(id int , out count int)
Begin
	select count(name) into count  from employee where id=1;
    select count;
End@@
DELIMITER ;


call getemoloyeedetails(1, @count);
select @count;

create table Orders (id int , address varchar(20), status varchar(20), qty int);
insert into Orders values(100, 'Delhi', 'under process',90), (101, 'N Delhi', 'processed',70),(102, 'Delhi', 'under process',82),(103, 'ODelhi', 'under process',10); 

DELIMITER !!
create procedure getOrders()
Begin
  select * from Orders;
End!!

drop procedure getorderdeatils;
DELIMITER ;


call getOrders();

DELIMITER !!
create procedure getorderdeatils(orderStatus varchar(20), out total int) 
 Begin
    select count(id) into total from orders where  status=orderStatus;
 End!!
DELIMITER ;
 
call getorderdeatils('processed', @total);
select @total; 


-- INOUT , yu pass some para and that is updated in the proc

DELIMITER @@
create procedure SetCounter(INOUT counter int, inc int)
begin 
	set counter = counter + inc;
end@@
DELIMITER ;
-- Calling part
set @counter=1;
Call SetCounter(@counter,1);
Call SetCounter(@counter,2);
Call SetCounter(@counter,5);
select @counter;


