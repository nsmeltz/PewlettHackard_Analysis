-- Retirement eligibility
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT (first_name)
FROM retirement_info;

-- Display the table in data output
SELECT * FROM retirement_info ;

---------------------- Add emplpyee number to the retirement table ---------------------
-- Delete the retirement info table
DROP TABLE retirement_info

-- Create a new retirement eligibility table w/ employee number
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	
-- Check the table
SELECT * FROM retirement_info LIMIT 20;

------------------------------- Practice with Joins & Aliases --------------------------
-- Joining departments and dept_manager tables
SELECT departments.dept_name,
	dept_manager.emp_no,
	dept_manager.from_date,
	dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
	retirement_info.last_name,
    dept_employees.to_date
FROM retirement_info
LEFT JOIN dept_employees
ON retirement_info.emp_no = dept_employees.emp_no;

-- Joining retirement_info and dept_emp tables w/ aliases
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
FROM retirement_info as ri
LEFT JOIN dept_employees as de
ON ri.emp_no = de.emp_no;

