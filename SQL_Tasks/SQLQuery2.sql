use Company_SD

select *
from Departments;

select *
from Employee;

select *
from Project;

select *
from Works_for

--Display the Department id, name and id and the name of its manager.
select 
	E.Fname+ ' '+E.Lname as name ,
	E.SSN,
	D.Dnum,
	D.Dname
from Employee as E 
inner join Departments as D 
on  E.SSN = D.MGRSSN 
--------------------------------------------------
--Display the name of the departments and the name of the projects under its control.
select 
	D.Dname,
	P.Pname
from Departments as D 
inner join Project as P
on D.Dnum = P.Dnum
----------------------------------------------------
--Display the full data about all the dependence associated with the name of the employee they depend on him/her.
select 
   E.Fname + ' '+ E.Lname as name,
   De.*
from Employee as E 
inner join Dependent as De
on E.SSN = De.ESSN
-------------------------------------------------------

--Display the Id, name and location of the projects in Cairo or Alex city.
select
	P.Pnumber,
	P.Pname,
	P.Plocation
from Project as P
where P.City in ( 'Cairo' , 'Alex')

-------------------------------------------------------
--Display the Projects full data of the projects with a name starts with "a" letter.
select
	P.*	
from Project as P
where P.Pname LIKE 'a%'
----------------------------------------------------
--display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
select *
from Employee as E 
where E.Dno = 30 and E.Salary between 1000 and 2000
--------------------------------------------------------------
--Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on "AL Rabwah" project.
select 
	E.Fname+ ' '+E.Lname as name 
from Employee as E 
inner join Works_for as W 
on E.SSN = W.ESSn
inner join Project as P 
on W.Pno =  P.Pnumber
where E.Dno=10 and  W.Hours >= 10 and P.Pname = 'AL Rabwah'

-------------------------------------------------
--Find the names of the employees who directly supervised with Kamel Mohamed.
select 
	Ee.Fname + ' ' +Ee.Lname as name 
from Employee as E 
join  Employee as Ee 
on E.SSN = Ee.Superssn
where E.Fname='Kamel' and E.Lname ='Mohamed'
------------------------------------------------------
--Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.
select DISTINCT
	E.Fname + ' ' +E.Lname as name ,
	P.Pname
from Employee as E 
left join Works_for as W 
on E.SSN = W.ESSn
left join Project as P 
on W.Pno =  P.Pnumber
order by P.Pname 
--------------------------------------------------------------
--For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.
select 
	P.Pnumber,
	D.Dname,
	E.Lname,
	E.Address,
	E.Bdate
from Project as P 
inner join Departments as D 
on P.Dnum = D.Dnum 
inner join Employee as E 
on D.MGRSSN= E.SSN
where P.City='Cairo'
-------------------------------------------------------------
--Display All Data of the managers
select
	E.*
from Employee as E 
inner join Departments as D 
on E.SSN = D.MGRSSN
-------------------------------------------
--Display All Employees data and the data of their dependents even if they have no dependents
select 
	E.*,
	D.Dependent_name,
	D.Sex,
	D.Bdate
From Employee as E
left join Dependent as D 
on E.SSN = D.ESSN