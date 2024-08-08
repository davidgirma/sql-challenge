-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
JOIN salaries as s
	ON e.emp_no = s.emp_no
ORDER BY e.emp_no;


-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY emp_no;


-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager as dm
JOIN departments as d
	ON dm.dept_no = d.dept_no
JOIN employees as e
	ON dm.emp_no = e.emp_no
ORDER BY dm.dept_no;


-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
JOIN departments as d
	ON de.dept_no = d.dept_no
JOIN employees as e
	ON de.emp_no = e.emp_no
ORDER BY de.emp_no;


-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY emp_no;


-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT de.emp_no, e.last_name, e.first_name
FROM dept_emp AS de
JOIN departments AS d
	ON de.dept_no = d.dept_no
JOIN employees AS e
	ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales'
ORDER BY de.emp_no;


-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
JOIN departments AS d
	ON de.dept_no = d.dept_no
JOIN employees AS e
	ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY de.emp_no;


-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT count(last_name) as frequency, last_name
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;