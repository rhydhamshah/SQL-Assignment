-- SQL ASSIGNMENT 

-- 1. Display all information in the tables EMP and DEPT. 
SELECT * FROM EMPLOYEES ;
SELECT * FROM DEPARTMENTS;

-- 2. Display only the hire date and employee name for each employee. 
SELECT HIRE_DATE , FIRST_NAME FROM EMPLOYEES;

-- 3. Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title 
SELECT CONCAT(FIRST_NAME , ', ' , JOB_ID) AS EMPLOYEE FROM EMPLOYEES;

-- 4. Display the hire date, name and department number for all clerks. 
select * from employees;
SELECT HIRE_DATE,first_name , department_id from employees where job_id = 'PU_CLERK' or job_id = 'SH_CLERK'; 

-- 5. Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT .
SELECT CONCAT(EMPLOYEE_ID , ' , ' , FIRST_NAME , ' , ' , LAST_NAME , ' , ' , EMAIL , ' , ', PHONE_NUMBER , ' , ' , HIRE_DATE ,' , ', JOB_ID , ' , ' , SALARY , ' , ' , MANAGER_ID , ' , ' , DEPARTMENT_ID) AS 'THE OUTPUT' FROM EMPLOYEES;

-- 6. Display the names and salaries of all employees with a salary greater than 2000.
SELECT FIRST_NAME , SALARY FROM EMPLOYEES WHERE SALARY > 2000;

-- 7. Display the names and dates of employees with the column headers "Name" and "Start Date" 
Select first_name as Name, HIRE_DATE AS START_DATE from employees;

-- 8. Display the names and hire dates of all employees in the order they were hired. 
select first_name , hire_date from employees order by hire_date;

-- 9. Display the names and salaries of all employees in reverse salary order. 
select first_name , salary from employees order by salary desc;

-- 10. Display 'ename" and "deptno" who are all earned commission and display salary in reverse order. 
select first_name , department_id from employees where commission_pct is not null order by salary desc;

-- 11. Display the last name and job title of all employees who do not have a manager 
select * from employees;
select last_name , job_id from employees where manager_id is null;

-- 12. Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
select last_name , job_id , salary from employees where job_id = 'SA_REP' or job_id = 'ST_CLERK' and salary not in (2500,3500,5000);

-- 13. Display the maximum, minimum and average salary and commission earned. 
select MIN(salary) as min_salary , MAX(salary) as max_salary , AVG(salary) as avg_salary from employees;

-- 14. Display the department number, total salary payout and total commission payout for each department. 
select * from employees;
select department_id , SUM(salary) , SUM(commission_pct) from employees group by department_id;

-- 15. Display the department number and number of employees in each department. 
select department_id , COUNT(employee_id) as number_of_employees from employees group by department_id;

-- 16. Display the department number and total salary of employees in each department.
 select department_id , SUM(salary) as total_salary from employees group by department_id;
 
-- 17. Display the employee's name who doesn't earn a commission. Order the result set without using the column name.
select first_name from employees where commission_pct is null order by 1;

-- 18. Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately
select CONCAT(first_name , ' ' , last_name) as employee_name , department_id , commission_pct ,
	CASE
		WHEN commission_pct is null then 'No commission'
        ELSE commission_pct
	END AS commission
from employees;


-- 19 Display the employee's name, salary and commission multiplied by 2. If an Employee
-- doesn't earn the commission, then display as 'No commission. Name the columns
-- appropriately
select first_name as employee_name , salary ,
	case
		when commission_pct is null then 'No commission'
        else commission_pct * 2
	end as commission
from employees;

-- 20. Display the employee's name, department id who have the first name same as another
-- employee in the same department
select * from employees;
select concat(first_name , ' ' , last_name) as employee_name , department_id from employees where first_name = first_name;

-- 21. Display the sum of salaries of the employees working under each Manager. 
select SUM(salary), manager_id from employees group by manager_id;

-- 22. Select the Managers name, the count of employees working under and the department
-- ID of the manager. 
select manager_id , COUNT(employee_id) , department_id from employees group by manager_id, department_id;

-- 23. Select the employee name, department id, and the salary. Group the result with the
-- manager name and the employee last name should have second letter 'a! 
select first_name as employee_name , department_id , salary from employees group by manager_id and last_name like '_a%';

-- 24. Display the average of sum of the salaries and group the result with the department id.
-- Order the result with the department id. 
select AVG(salary) , department_id from employees group by department_id order by department_id;

-- 25.Select the maximum salary of each department along with the department id 
select MAX(salary) , department_id from employees group by department_id;

-- 26. Display the commission, if not null display 10% of salary, if null display a default value 1
select commission_pct,
	CASE
		when commission_pct is not null then 0.10 * Salary
        else 1
	end as commission
from employees;

-- 27.Write a query that displays the employee's last names only from the string's 2-5th
-- position with the first letter capitalized and all other letters lowercase, Give each column an
-- appropriate label. 
Select CONCAT(UPPER(SUBSTRING(last_name,1,1)) , LOWER(SUBSTRING(last_name,2,4))) as LAST_NAME from employees;

-- 28. Write a query that displays the employee's first name and last name along with a " in
-- between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
-- month on which the employee has joined.
select CONCAT(first_name , '-' , last_name) as full_name , month(hire_date) as month_of_joining from employees;

-- 29.Write a query to display the employee's last name and if half of the salary is greater than
-- ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of
-- 1500 each. Provide each column an appropriate label. 
select last_name, salary,
	case
		when salary/2 > 10000 then salary + 0.10* salary
        else salary + 0.115* salary + 1500
	end as new_salary
from employees;

-- 30. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end,
-- department id, salary and the manager name all in Upper case, if the Manager name
-- consists of 'z' replace it with '$! 
select employee_id like '__00%E%' , UPPER(department_id), UPPER(salary) , UPPER(manager_id) , concat(first_name , ' ' , last_name) as manager_name,
	CASE
		when manager_name like '%z%' then
        Replace(manager_name, 'z' , '$')
        else manager_name
	end as updated_manager_name
from employees;
       
-- 31. Write a query that displays the employee's last names with the first letter capitalized and
-- all other letters lowercase, and the length of the names, for all employees whose name
-- starts with J, A, or M. Give each column an appropriate label. Sort the results by the
-- employees' last names 
select CONCAT(UPPER(left(last_name,1)), LOWER(SUBSTRING(last_name,2))) as modified_name , length(last_name)  as length from employees
where last_name like 'J%' or last_name like 'A%' or last_name like 'M%' order by last_name;

-- 32. Create a query to display the last name and salary for all employees. Format the salary to
-- be 15 characters long, left-padded with $. Label the column SALARY 
select last_name, lpad(salary, 15, '$') as salary from employees;

-- 33. Display the employee's name if it is a palindrome 
update employees
set first_name = 'rhr'
where employee_id = 100;
select first_name as palindrome from employees where first_name = REVERSE(first_name);

-- 34.  Display First names of all employees with initcaps. 
SELECT CONCAT(UPPER(SUBSTRING(first_name, 1, 1)), LOWER(SUBSTRING(first_name, 2))) AS Name FROM employees;

-- 35.From LOCATIONS table, extract the word between first and second space from the
-- STREET ADDRESS column.

-- 36. Extract first letter from First Name column and append it with the Last Name. Also add
-- "@systechusa.com" at the end. Name the column as e-mail address. All characters should
-- be in lower case. Display this along with their First Name. 
select lower(concat(left(first_name,1), last_name, ' @systechusa.com')) as email_address from employees;

-- 37.Display the names and job titles of all employees with the same job as Trenna.
select*from employees;
select employee_id from employees where first_name = 'Trenna' or last_name= 'Trenna';
select CONCAT(first_name, ' ' , last_name) as NAME , job_id from employees where job_id = (select job_id from employees where first_name ='Trenna');

-- 38.Display the names and department name of all employees working in the same city as Trenna. 
select * from employees;
select * from locations;
select * from departments;
select e.first_name , d.department_name , l.city from employees as e join departments as d using (department_id) join locations as l using (location_id) where 
city = (select city from locations where e.first_name = 'Trenna');

-- 39. Display the name of the employee whose salary is the lowest. 
select first_name , salary from employees order by salary asc limit 1;

-- 40. Display the names of all employees except the lowest paid.
select first_name, salary from employees where salary > (select MIN(salary) from employees);

-- 41. Write a query to display the last name, department number, department name for all employees
select e.last_name , e.department_id , d.department_name from employees as e join departments as d using(department_id);

-- 42. Create a unique list of all jobs that are in department 4. Include the location of the department in the output. 
select distinct e.job_id , d.location_id from employees as e join departments as d on e.department_id = d.department_id and d.department_id = 40;

-- 43. Write a query to display the employee last name,department name,location id and city of
-- all employees who earn commission.
select last_name , department_name , location_id , city from employees as e join departments using (department_id) join locations as l using (location_id) where commission_pct is not null;

-- 44.Display the employee last name and department name of all employees who have an 'a' in their last name 
select last_name , department_name from employees as e join departments as d using (department_id) where last_name like '%a%';

-- 45. Write a query to display the last name,job,department number and department name for
-- all employees who work in ATLANTA. 
select * from employees;
select * from departments;
select * from locations;
select * from countries;
select * from job_history;

-- 46. Display the employee last name and employee number along with their manager's last
-- name and manager number. 
select e.last_name , e.employee_id , d.department_name , d.manager_id from employees as e join departments as d using (department_id);

-- 47.Display the employee last name and employee number along with their manager's last
-- name and manager number (including the employees who have no manager). 
select last_name , employee_id , manager_id from employees where manager_id is null;

-- 48. Create a query that displays employees last name,department number,and all the
-- employees who work in the same department as a given employee. 
-- Question Incomplete 

-- 49.Create a query that displays the name,job,department name,salary,grade for all
-- employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) 
select first_name , job_id , department_name , salary,
	CASE
		WHEN SALARY > 50000 THEN 'A'
        WHEN SALARY > 30000 THEN 'B'
        ELSE 'C'
	END AS GRADE 
FROM EMPLOYEES AS E JOIN DEPARTMENTS AS D USING (DEPARTMENT_ID) ;
        
-- 50. Display the names and hire date for all employees who were hired before their
-- managers along withe their manager names and hire date. Label the columns as Employee
-- name, emp_hire_date,manager name,man_hire_date
select e.first_name , e.hire_date , m.first_name , m.hire_date from employees as e join employees as m using (manager_id) where e.hire_date < m.hire_date;
