/*1. List the following details of each employee: employee number, last name, first name, sex, and salary.*/
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees emp
JOIN salaries sal ON emp.emp_no = sal.emp_no

/*2. List first name, last name, and hire date for employees who were hired in 1986.*/
SELECT emp.first_name, emp.last_name, emp.hire_date
FROM employees emp
WHERE emp.hire_date BETWEEN '1986-01-01' AND '1986-12-31'

/*3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.*/
SELECT dman.dept_no, dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM dept_manager dman
JOIN departments dept ON dman.dept_no = dept.dept_no
JOIN employees emp ON dman.emp_no = emp.emp_no

/*4. List the department of each employee with the following information: employee number, last name, first name, and department name.*/
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees emp
JOIN dept_emp joiner on emp.emp_no = joiner.emp_no
JOIN departments dept on joiner.dept_no = dept.dept_no

/*5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."*/
SELECT emp.first_name, emp.last_name, emp.sex
FROM employees emp
WHERE emp.first_name = 'Hercules'
AND emp.last_name LIKE 'B%'

/*6. List all employees in the Sales department, including their employee number, last name, first name, and department name.*/
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM departments dept
JOIN dept_emp joiner ON dept.dept_no = joiner.dept_no
JOIN employees emp ON joiner.emp_no = emp.emp_no
WHERE dept.dept_name = 'Sales'

/*7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.*/
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM departments dept
JOIN dept_emp joiner ON dept.dept_no = joiner.dept_no
JOIN employees emp ON joiner.emp_no = emp.emp_no
WHERE dept.dept_name IN ('Sales','Development')

/*8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.*/
SELECT emp.last_name, COUNT(emp.last_name)
FROM employees emp
GROUP BY emp.last_name
ORDER BY COUNT(emp.last_name) DESC