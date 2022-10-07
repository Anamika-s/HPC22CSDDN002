

select Lcase('AJAY');
select UCase('ajay');
select concat(name, ' ', address) from employee

SELECT CURTIME() ;
SELECT CURTIME() + 1;

DELIMITER @@
create function AddNumbers(no1 int, no2 int)
returns int
deterministic
Begin
   declare sum int;
   set sum =  no1+ no2;
   return sum;
End@@
DELIMITER ;
 
 select AddNumbers(10,20);
 

DELIMITER $$
CREATE FUNCTION Func_Calculate_Age
(
 Age date
)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE TodayDate DATE;
    SELECT CURRENT_DATE() INTO TodayDate;
    RETURN YEAR(TodayDate) - YEAR(Age);
END$$
DELIMITER ;

-- Create Employee Table
CREATE TABLE Emp
(
  EmployeeId INT PRIMARY KEY,
  Name VARCHAR(50),
  Salary INT,
  DOB Date
);

-- Populate Employee table
INSERT INTO Emp(EmployeeId, Name, Salary, DOB) VALUES(1001, 'Pranaya', 10000, '1988-02-29');
INSERT INTO Emp(EmployeeId, Name, Salary, DOB) VALUES(1002, 'Anurag', 20000, '1992-06-22');
INSERT INTO Emp(EmployeeId, Name, Salary, DOB) VALUES(1003, 'Sambit', 30000, '1978-04-12');


SELECT EmployeeId, Name, Salary, DOB, Func_Calculate_Age(DOB) AS Age FROM Emp;

