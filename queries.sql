-- Employee details: employee number, last name, first name, gender and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary from employees as e
	left join salaries as s
	on e.emp_no=s.emp_no;


-- List employees hired in 1986
select * from employees
where hire_date >='1986-01-01'
and hire_date <='1986-12-31';


-- List manager of each department showing: department #, department name, manager's employee #,
-- last name, first name, start & end employment dates. 
select m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
from departments as d
	join dept_manager as m
	on d.dept_no=m.dept_no
		join employees as e
		on e.emp_no=m.emp_no;

-- List department of each employee showing: employee #, last name, first name, & department #
select dept_emp.emp_no, e.last_name, e.first_name, d.dept_name
from departments as d
	join dept_emp
	on d.dept_no=dept_emp.dept_no
		join employees as e
		on e.emp_no=dept_emp.emp_no;


-- List all employees with the first name 'Hercules' and last names begin with 'B'
select * from employees
where first_name = 'Hercules'
and last_name like 'B%';


-- List all employees in Sales department showing: employee #, last name, first name
-- and department number
select e.emp_no, e.last_name, e.first_name, d.dept_name
from departments as d
	join dept_emp
	on d.dept_no=dept_emp.dept_no
		join employees as e
		on e.emp_no=dept_emp.emp_no
where dept_name='Sales';


-- List all employees in Sales & Development departments showing: employee #, last name, 
-- first name, and department number
select e.emp_no, e.last_name, e.first_name, d.dept_name
from departments as d
	join dept_emp
	on d.dept_no=dept_emp.dept_no
		join employees as e
		on e.emp_no=dept_emp.emp_no
where dept_name='Sales'
or dept_name = 'Development';


-- List frequency count of employee last names in descending order
select last_name, count(last_name) as "Last Name Count" from employees
group by last_name
order by "Last Name Count" DESC;

