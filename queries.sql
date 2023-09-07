--q1. emp no, last name, first name, sex, and salary for all employees

select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
inner join salaries on (employees.emp_no = salaries.emp_no);
	
--q2. first name, last name, and hire date for employees hired in '86
select first_name, last_name, hire_date
from employees
where hire_date >='1986-01-01' and hire_date <='1986-12-31';

--q3. dept mgr with dept name, no, emp no, last name, and first name
select departments.dept_name, departments.dept_no, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager
inner join departments on (dept_manager.dept_no = departments.dept_no)
inner join employees on (dept_manager.emp_no = employees.emp_no);
	
--q4. dept no for each employee with emp no, last name, first name, and dept name
select departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
inner join departments on (dept_emp.dept_no = departments.dept_no)
inner join employees on (dept_emp.emp_no = employees.emp_no);
	
--q5. first name, last name, and sex for each employee with first name Hercules and last name beginning with B
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

--q6. employees in sales dept with emp no, last name, and first name
select employees.emp_no, employees.last_name, employees.first_name
from dept_emp
inner join employees on (dept_emp.emp_no = employees.emp_no)
inner join departments on (dept_emp.dept_no = departments.dept_no)
where departments.dept_name = 'Sales';

--q7. employees from sales and development with emp_no, last name, first name, and dept name
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
inner join employees on (dept_emp.emp_no = employees.emp_no)
inner join departments on (dept_emp.dept_no = departments.dept_no)
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

--q8. frequency in desc order of all last names
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;