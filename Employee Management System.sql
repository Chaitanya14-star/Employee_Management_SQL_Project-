Create Database EmployeeDetailsProject;
CREATE TABLE EmployeeDetail (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10 , 2 ),
    HireDate DATE
);

SELECT 
    *
FROM
    EmployeeDetail;

Insert into EmployeeDetail values(1,'Amit', 'Sharma', 'HR',50000.00,'2015-05-02');
Insert into EmployeeDetail values(2,'Anjali','Singh','IT',60000.00,'2017-08-15');
Insert into EmployeeDetail values(3,'Rahul','Verma','Marketing',55000.00,'2020-01-10');
Insert into EmployeeDetail values(4,'Priya','Reddy','Finance',65000.00,'2017-04-25');
Insert into EmployeeDetail values(5,'Vikram','Patel','HR',52000.00,'2017-09-30');
Insert into EmployeeDetail values(6,'Amit','Mishra','IT',62000.00,'2021-11-18');
Insert into EmployeeDetail values(7,'Suresh','Iyer','Marketing',58000.00,'2024-02-06');
Insert into EmployeeDetail values(8,'Lakshmi','Menon','Finance',70000.00,'2022-07-12');
Insert into EmployeeDetail values(9,'Arjun','Menon','HR',53000.00,'2023-10-05');
Insert into EmployeeDetail values(10,'Nisha','Mehta','IT',64000.00,'2016-03-08');

 --- Retrieve only the FirstName and LastName of all employees.
 Select FirstName, LastName from EmployeeDetail;

 --- Retrieve distinct departments from the employeeDetails table.
 Select Distinct Department From EmployeeDetail;

 --- Retrieve employees whose salary is greater than 55000.
 Select * from EmployeeDetail where salary > 55000;

 --- Retrieve employees hired after 2019.
 Select * from EmployeeDetail where HireDate > '2019-12-31';

 --- Retrieve employees whose first name starts with ‘A’.
Select * from EmployeeDetail where  FirstName Like 'A%';

--- Retrieve employees whose last name ends with ‘non’.
Select * from EmployeeDetail where LastName Like '%non';

--- Retrieve employees whose First name do not have ‘a’.
Select * from EmployeeDetail where FirstName Not Like '%a%';

--- Retrieve employees sorted by their salary in descending order.
Select * from EmployeeDetail Order by salary DESC;

--- Retrieve the count of employees in each department.
Select Department, Count(*) as EmployeeCount From EmployeeDetail Group by Department;

--- Retrieve the average salary of employees in the Finance department.
Select Avg(Salary) as AvgerageSalary from EmployeeDetail where Department = 'Finance'; 

--- Retrieve the maximum salary among all employees.
Select Max(Salary) AS MaxSalary from EmployeeDetail;

--- Retrieve the total salary expense for the company.
Select Sum(Salary) as TotalSalaryExpense from EmployeeDetail;

--- Retrieve the oldest and newest hire date among all employees.
Select Min(HireDate) as OldestHireDate, max(HireDate) as NewestHireDate From EmployeeDetail;

Select * from EmployeeDetail;

--- Retrieve employees with a salary between 50000 and 60000.
Select * from EmployeeDetail where Salary Between 50000 AND 60000;

---
Use EmployeeDetailsProject;
--- Retrieve employees who are in the HR department and were hired before 2019.
Select * from EmployeeDetail where Department= 'HR' and HireDate < '2019-01-01';

--- Retrieve employees with a salary less than the average salary of all employees.
Select * from EmployeeDetail where Salary < (Select Avg(Salary) from EmployeeDetail);
Select * from EmployeeDetail where salary > (Select Avg(Salary) from EmployeeDetail);
Select max(salary) as HighestSalary from EmployeeDetail;
Select Min(salary) as LowestSalary from EmployeeDetail;

--- Second Hightest Salary
Select Max(salary) as SecondHighestSalary
From EmployeeDetail where salary < (Select Max(salary) from EmployeeDetail) ;

--- Retrieve the top 3 highest paid employees.
Select * from EmployeeDetail order by salary desc limit 3;
Select * from EmployeeDetail order by salary desc limit 5;

-- Retrieve employees whose hire date is not in 2017.
Select * from EmployeeDetail where Year(HireDate) <> 2017;

-- Retrieve employees who were hired in the same year as ‘Priya Reddy’.
SELECT * FROM employeeDetail WHERE 
YEAR(HireDate) = (SELECT YEAR(HireDate) 
FROM employeeDetail WHERE FirstName = 'Priya' AND LastName = 'Reddy');

--- Retrieve employees who have been hired on weekends (Saturday or Sunday).
SELECT * FROM employeeDetail WHERE DAYOFWEEK(HireDate) IN (1, 7);

--- Retrieve employees who have been hired in the last 6 years.
SELECT 
    *
FROM
    employeeDetail
WHERE
    HireDate >= DATE_SUB(CURDATE(), INTERVAL 6 YEAR);
