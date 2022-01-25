----------------------------- Generate requested lists ----------------------------------------List 1 Employee Information -----
-- A list of employees containing their unique employee number, their last name, first name, gender, and salary
-- Data Needed --> Employee number, First name, Last name, Gender, to_date, Salary

SELECT * FROM employees;

SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT * FROM dept_employees;

---- Make a new table for employee info
-- Employees table --> emp_no,first_name,last_name, gender filtered by birth & hire date
-- Salaries table --> salary
-- Dept_employees table --> to_date filtered by to_dates= '9999-01-01'
SELECT e.emp_no,
	e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no) 
INNER JOIN dept_employees as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');
	 
SELECT * FROM emp_info;

----- List 2 Management ------
-- A list of managers for each department, including the department number, name, and the manager's employee number, last name, first name, and the starting and ending employment dates
-- Data Needed --> dept_no, dept_name, emp_no, first_name, last_name, from_date, to _date

SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM current_emp;

-- Make a new table for management info
-- Departments table --> dept_no, dept_name
-- Dept_manager --> emp_no, from_date, to _date
-- Employees --> first_name, last_name
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
		
SELECT * FROM manager_info;

----- List 3 Department Retirees -----
-- An updated current_emp list that includes everything it currently has, but also the employee's departments
--Data Needed --> emp_no, first_name, last_name, to_date, dept_name

SELECT * FROM current_emp;
SELECT * FROM dept_employees;
SELECT * FROM departments;

-- Make a new table for management info
-- Current_emp --> emp_no, first_name, last_name, to_date
-- Dept_employees --> dept_no
-- Departments --> dept_name
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_employees AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

SELECT * FROM dept_info;


--------- List 4 Sales Team ---------------
-- will contain everything in the retirement_info table, only tailored for the Sales team.
-- Data Needed --> emp_no, first_name, last_name, dept_name

SELECT * FROM retirement_info;
SELECT * FROM dept_employees;
SELECT * FROM departments;

-- Make a new table for sales
-- retirement_info --> emp_no, first_name, last_name
-- Dept_employees --> dept_no
-- Departments --> dept_name
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.dept_no,
	d.dept_name
INTO retirement_info_sales
FROM retirement_info as ri
INNER JOIN dept_employees AS de
ON (ri.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE (d.dept_name = 'Sales');

SELECT * FROM retirement_info_sales;

------------------------List 5: Sales & Development Teams Retirement Info -------------------
-- will contain everything in the retirement_info_sales table
-- Data Needed --> emp_no, first_name, last_name, dept_name (sales or development)

SELECT * FROM retirement_info;
SELECT * FROM dept_employees;
SELECT * FROM departments;

-- Make a new table for sales
-- retirement_info --> emp_no, first_name, last_name
-- Dept_employees --> dept_no
-- Departments --> dept_name
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.dept_no,
	d.dept_name
--INTO retirement_info_sales_development
FROM retirement_info as ri
INNER JOIN dept_employees AS de
ON (ri.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales','Development');

-- SELECT * FROM retirement_info_sales_development;