
create database anchalsingh;
use anchalsingh;
create table Department(id int primary key identity, name varchar(max))
create table Employees (id int primary key identity, 
name varchar(max),
email varchar (max),
gender varchar (20),
mobile varchar(15),
department_id int foreign key references department (id))
select *from Department;
select *from Employees;

create proc SP_department 
@action varchar(20),
@id int =null,
@name varchar(200)=null
as
begin
if(@action= 'CREATE')
begin

INSERT INTO Department(name)
values (@name)
select 1 as result
end
else if(@action ='DELETE')
begin
delete from department where id=@id
select 1 as result
end
else if(@action ='SELECT')
begin
select *from Department
end
else if(@action ='UPDATE')
begin
update department set name=@name where id= @id
select 1 as result
end
 end
 exec SP_department 'SELECT'
 exec SP_department 'create', 1, 'software'
 exec SP_department 'CREATE', 0,'ACCOUNT'
 exec SP_department 'UPDATE', 2, 'hr'

 create proc SP_Employees
 @action varchar (20),
 @id int =0,
 @name varchar (100) =null,
 @email varchar(120)=null,
 @mobile varchar(15)= null,
 @department_id int =0,
 @gender varchar (10)=null
 as
 begin
 if(@action ='CREATE')
 begin
 INSERT INTO Employees(name,email,mobile,department_id,gender)
 values(@name,@email,@mobile,@department_id,@gender)
 select 1 as result
 end
 else if(@action ='DELETE')
 begin
  delete from Employees where id=@id
  select 1 as result
  end
  else if(@action= 'SELECT')
  begin
  select*from Employees
  end
  else if(@action= 'SELECT JOIN')
  begin
  select e.id, e.name,e.email, e.mobile,e.gender , d.name from Employees e
  full outer join
  Department d
  on e.department_id=d.id
  end
  else if(@action= 'UPDATE')
  begin
  update Employees set name=@name, email=@email,mobile=@mobile, department_id=@department_id,
  gender=@gender where id=@id
  select 1 as result
  end
  end
  exec SP_Employees 'SELECT'
  exec SP_Employees 'CREATE', 0 ,'Anchal', 'anchal0096@gmail.com','123456789',1, 'female' 
   exec SP_Employees 'SELECT JOIN'
  


 


