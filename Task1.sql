create database Task4 
use Task4

-- Part 1
create table Employees
(
Id int identity ,
FirstName varchar(20),
LastName varchar(20),
Salary decimal 
)



-- 1- Create a stored procedure named GetAllEmployees that selects all rows from Employees
go
create procedure GetAllEmployees
as
begin
select * from Employees

end

execute GetAllEmployees

--2- Create a stored procedure GetHighSalaryEmployees with one input parameter @MinSalary which Select all employees with Salary > @MinSalary
go
create procedure GetHighSalaryEmployees (@MinSalary int)
as 
begin 
select * 
from Employees e
where e.Salary > @MinSalary
end

execute GetHighSalaryEmployees 13000

--3- Create AddEmployee SP with @FirstName, @LastName, @Salary which Insert a new row into Employees
go
create procedure AddEmployee (@FirstName varchar(20),@LastName varchar(20),@Salary decimal)
as
begin 
insert into Employees (FirstName,LastName,Salary)
values (@FirstName,@LastName,@Salary)
end

execute AddEmployee 'Mahmoud','Fangary','12000'



-- Part 2
create table EmployeeLog
(
Id int identity ,
EmployeeId int ,
[Action] varchar(50),
ActionDate datetime2 default(getdate())
)

go
create trigger First_Trigger
on Employees 
after insert 
as 
begin 
insert into EmployeeLog(EmployeeId,[Action])
select i.Id , 'New employee is added'
from inserted i 
end

insert into Employees
values ('Mostafa','Abdelmonsef',20000)




