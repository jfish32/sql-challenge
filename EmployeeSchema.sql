--Data Engineering
--Create the tables in order of relationships
--departments
--titles
--employees
--dept_emp
--salaries
--dept_managers



--Drop previously existing tables

DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_managers;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

--create departments table
CREATE TABLE departments(
		dept_no VARCHAR(30) NOT NULL,
		dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no));
select * from departments;

--create titles table
CREATE TABLE titles(
		title_id VARCHAR(30) NOT NULL,
		title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id));
select * from titles;

--create employees table
CREATE TABLE employees(
		emp_no INT NOT NULL,
		emp_title_id VARCHAR(30) NOT NULL,
		birth_date DATE NOT NULL,
		first_name VARCHAR(30) NOT NULL,
		last_name VARCHAR(30) NOT NULL,
		sex VARCHAR(3) NOT NULL,
		hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
	PRIMARY KEY (emp_no)
	);
	select * from employees;

--create dept_emp table
CREATE TABLE dept_emp(
		emp_no INT NOT NULL,
		dept_no VARCHAR(20) NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
		FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
		PRIMARY KEY (emp_no, dept_no)
);
select * from dept_emp;

--create salaries table
CREATE TABLE salaries(
		emp_no INT NOT NULL,
		salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);
select * from salaries;

--create dept_managers table
CREATE TABLE dept_managers(
		dept_no VARCHAR(30) NOT NULL,
		emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (dept_no, emp_no)
);
select * from dept_managers

--tables and columns have been created, now importing 
--CSV files into corresponding tables in the same order