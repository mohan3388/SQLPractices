insert into users values('ffghh','kjsag@gmail.com');
select * from users
select * from Details
delete from Details where id=2
--Innerr join--
select users.name, users.Email, Details.City from users Inner join Details ON users.Id= Details.Id;

--Left join--
select users.name, users.Id, Details.City from users left join Details ON users.Id=Details.Id;

--Right join--
select users.name, users.Id, Details.City from users Right join Details ON users.Id=Details.Id;

--Full join--
select users.name, users.Id, Details.City from users Full join Details ON users.Id=Details.Id;


drop procedure SpInsert

---Insert Procedure---
create procedure SpInsert(
@Name varchar(50),
@City varchar(50),
@Dist varchar(50),
@Price int
)
as
begin
Insert into Details(Name,City,Dist,Price) values('mks','cy','er',1245);
end

Select * From Details Where Dist Like 'B%';
Select * From Details Where Name Like 'M%';

alter PROCEDURE spAddNewPersons
(
@Name varchar(50),
@City varchar(50),
@Dist varchar(50),
@Price int
)
as
begin
Insert into Details(Name,City,Dist,Price) values(@Name,@City,@Dist,@Price);
end

exec spAddNewPersons 'mks','trs','red',245

--select procedure--
create procedure SpSelect
as
begin
select *from Details;
end

exec SpSelect


--Update procedure--
alter procedure SpUpdate
(
@Id int,
@Name varchar(55),
@Price int
 )
 as
 begin
 update Details set Name=@Name,Price=@Price where ID=@Id
 end

 exec SpUpdate 1,'Raj thakur',6005
create procedure SpDelete
(
@Id int
)
as
begin
delete from Details where @Id=ID
end

exec SpDelete 3


select*from UserTable
 update UserTable set EmailId='wwe@gmail.com', Password='62547' where UserId=1
drop data
delete from UserTable where UserId=1


--Trigger--




CREATE TABLE tblemployee(Emp_ID INT Identity,Emp_name Varchar(100),Emp_Sal Decimal (10,2))

INSERT INTO tblemployee VALUES ('Anand',15000);
INSERT INTO tblemployee VALUES ('Neha',12400);
INSERT INTO tblemployee VALUES ('Sohan',11500);
INSERT INTO tblemployee  VALUES ('Vijay',15500);
INSERT INTO tblemployee VALUES ('Sapna',14000);

CREATE TABLE Employee_Log
(Emp_ID int,Emp_name varchar(100),Emp_Sal decimal (10,2),Log_Action varchar(100),log_Timestamp datetime)

insert into tblemployee values('Ram',10500);

select*from tblemployee
select*from Employee_Log

CREATE TRIGGER inser On hhd
Afetr Insert
--Insert in trigger--
CREATE TRIGGER trgAfterInsert ON tblemployee 
After  INSERT
AS
 declare @empid int
 declare @empname varchar(100)
 declare @empsal decimal(10,2)
 declare @log_action varchar(100)

 select @empid=i.Emp_ID, @empname=i.Emp_Name, @empsal=i.Emp_Sal from inserted i; 
 set @log_action='Inserted Record -- After Insert Trigger.';

 insert into Employee_log
           (Emp_ID,Emp_Name,Emp_Sal,Log_Action,Log_Timestamp) 
 values(@empid,@empname,@empsal,@log_action,getdate());

 PRINT 'AFTER INSERT trigger fired.'
GO

--Update in trigger--
Alter TRIGGER trgAfterUpdate ON tblemployee
After UPDATE
AS
 declare @empid int;
 declare @empname varchar(100);
 declare @empsal decimal(10,2);
 declare @log_action varchar(100);

 select @empid=i.Emp_ID,@empname=i.Emp_Name, @empsal=i.Emp_Sal from inserted i; 
 
 if update(Emp_Name)
  set @log_action='Updated Record -- After Update Trigger.';
 if update(Emp_Sal)
  set @log_action='Updated Record -- After Update Trigger.';

 insert into Employee_Log(Emp_ID,Emp_Name,Emp_Sal,Log_Action,Log_Timestamp) 
 values(@empid,@empname,@empsal,@log_action,getdate());

 PRINT 'AFTER UPDATE Trigger fired.'
GO

update tblemployee set Emp_Sal=15000 where Emp_ID=6

--Delete trigger--
CREATE TRIGGER trgAfterDelete ON tblemployee 
AFTER DELETE
AS
 declare @empid int;
 declare @empname varchar(100);
 declare @empsal decimal(10,2);
 declare @log_action varchar(100);

 select @empid=d.Emp_ID, @empname=d.Emp_Name, @empsal=d.Emp_Sal from deleted d;  
 set @log_action='Deleted -- After Delete Trigger.';

 insert into Employee_log
(Emp_ID,Emp_Name,Emp_Sal,Log_Action,Log_Timestamp) 
 values(@empid,@empname,@empsal,@Log_action,getdate());

 PRINT 'AFTER DELETE TRIGGER fired.'
GO

delete from tblemployee where Emp_ID=6

--view--
create view spdetail as 
select Name,Price from Details 
where City='Bhilai'


select * from spdetail


--Cursor--
Declare MyCursor Cursor Scroll For Select * From Details
Open MyCursor
Fetch First From MyCursor
Fetch Last From MyCursor
Fetch Next From MyCursor
Fetch PRIOR From MyCursor 