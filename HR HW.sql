--QST 1	
select E.first_name,e.last_name,d.department_id,d.department_name 
from employees E
join departments D
on D.department_id = E.department_id

--QST 2
select E.first_name,e.last_name,d.department_name,l.city,l.state_province
from employees E
join departments D
on D.department_id = E.department_id
join locations L
on L.location_id = D.location_id

--QST 3
select E.first_name,e.last_name,e.salary,j.job_id --We didnt have Job grade so i did job id instead
from employees E
join jobs J
on J.job_id = E.job_id

--QST 4
select E.first_name,e.last_name,d.department_id,d.department_name 
from employees E
join departments D
on D.department_id = E.department_id
where e.department_id = 4 OR e.department_id = 8

--QST 5
select E.first_name,e.last_name,d.department_name,L.city,L.state_province
from employees E
join departments D
on D.department_id = E.department_id
join locations L
on l.location_id = D.location_id
where e.first_name like '%z%' --There are none with Z

--QST 6
select E.first_name,e.last_name,d.department_id,d.department_name 
from employees E
right join departments D 
on D.department_id = E.department_id

--QST 7
select E.first_name,E.last_name,e.salary 
from employees E
join employees E2
on E.salary < e2.salary and e2.employee_id = 203 --changed it to 203 because there isnt 182

--QST 8
select E.first_name,e2.first_name
from employees E
join employees E2
on e.manager_id = e2.employee_id

--QST 9
select D.department_name,l.city,l.state_province 
from departments D
join locations L 
on l.location_id = d.location_id

--QST 10 
select E.first_name,e.last_name,d.department_id,d.department_name 
from employees E
left join departments D
on D.department_id = E.department_id

--QST 11
select E.first_name,e2.first_name 
from employees E
left join employees E2
on e.manager_id = e2.employee_id

--QST 12
select E.first_name,e.last_name,e.department_id
from employees E
join employees E2
on e.department_id = e2.department_id and e2.last_name = 'Taylor'

--QST 13

--QST 14
Select J.job_title,e.first_name+ ' ' + e.last_name as [Full Name], e.salary - j.max_salary as [Salary Diff] 
from employees E
join jobs J 
on e.job_id = j.job_id

--QST 15
select avg(e.salary) as [Avrage salary] ,COUNT(E.employee_id) as [num]
from employees E
join departments D
on D.department_id = e.department_id
group by d.department_id


--QST 16
select J.job_title,e.first_name+ ' '+e.last_name as [Employee Name], j.max_salary - e.salary as [Salary Diff]
from employees E
join jobs J
on J.job_id = e.job_id and e.department_id = 8


--QST 17
Select c.country_name,l.city,d.department_name
from countries C
join locations L
on l.country_id = c.country_id
join departments D
on d.location_id = l.location_id
order by c.country_name


--QST 18
select d.department_name,e.first_name+ ' '+ e.last_name
from departments D
join employees E
on d.Manager_Id = e.employee_id

--QST 19
select j.job_title,AVG(E.salary) as [AVG Salary] 
from employees E
join jobs J
on E.job_id = J.job_id
GROUP BY j.job_title

--QST 20
select e.employee_id,jh.Start_Date,jh.End_Date,e.job_id,jh.Department_Id
from employees E
join Job_History JH
on e.employee_id = jh.Employee_ID and e.salary > 12000

--QST 21
select c.country_name,l.city,COUNT(d.department_id) as [Number of Departments]
from departments D
join locations L
on l.location_id = d.location_id
join countries C
on c.country_id = l.country_id
where d.department_id in (select department_id
from employees 
group by department_id
having COUNT(department_id)>= 2)
group by c.country_name,l.city

--QST 22
select d.department_name,e.first_name +' '+ e.last_name as [Full_Name],l.city
from employees E
join departments D
on d.Manager_Id = e. employee_id
join locations L
on d.location_id = l.location_id

--QST 23
select jh.Employee_ID,j.job_title,datediff(DAY,jh.Start_Date,jh.End_Date) as [Number of days] 
from jobs J
join Job_History JH
on j.job_id = jh.Job_Id
where jh.Department_Id = 8

--QST 24
select e.first_name + ' ' + e.last_name as [Full Name], e.salary 
from employees E
join departments D 
on e.department_id = d.department_id
join locations L
on l.location_id = d.location_id
where l.city = 'London'


--QST 25
select e.first_name + ' ' + e. last_name as [Full name],j.job_title,jh.Start_Date,jh.End_Date,e.employee_id 
from employees E
join jobs J
ON J.job_id = E.job_id
JOIN Job_History jh
On jh.Employee_ID = e.employee_id
where E.Commission_Pct = 0.0

--QST 26
select d.department_name,d.department_id,COUNT(e.employee_id) as [Number of Employees]
from departments D
join employees E
on e.department_id = d.department_id
group by d.department_name,d.department_id

--QST 27
select e.first_name+ ' ' + e.last_name as [Full Name],e.employee_id,c.country_name 
from employees E
join departments D
on d.department_id = e.department_id
join locations l
ON L.location_id = D.location_id
join countries C
on l.country_id = c.country_id
