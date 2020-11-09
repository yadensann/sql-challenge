-- Creating tables and importing CSV files into each.
---------------------------------------------------------
DROP TABLE departments cascade;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees cascade;
DROP TABLE salaries;
DROP TABLE titles cascade;

---------------------------------------------------------
-- departments table
CREATE TABLE departments (
  dept_no character varying(20) NOT NULL,
  dept_name character varying(50),
    CONSTRAINT "pk_departments" PRIMARY KEY("dept_no"));

-- dept_emp table
CREATE TABLE dept_emp (
  emp_no integer NOT NULL,
  dept_no character varying(20) NOT NULL);

-- dept_manager table
CREATE TABLE dept_manager (
  dept_no character varying(20) NOT NULL,
  emp_no integer NOT NULL);

-- employees table
CREATE TABLE employees (
	emp_no integer NOT NULL, 
	title_id character varying(20) NOT NULL, 
	birth_date timestamp without time zone DEFAULT now() NOT NULL,
	first_name character varying(45) NOT NULL,
  	last_name character varying(45) NOT NULL,
	sex character varying(5) NOT NULL, 
	hire_date timestamp without time zone DEFAULT now() NOT NULL,
    	CONSTRAINT pk_employees PRIMARY KEY (emp_no))

-- salaries table
CREATE TABLE salaries(
	emp_no integer NOT NULL,
	salary integer NOT NULL);

-- titles table 
CREATE TABLE titles(
	title_id character varying NOT NULL,
	title character varying NOT NULL)
	
---------------------------------------------------------
select*from departments
select*from dept_emp
select*from dept_manager
select*from employees
select*from salaries
select*from titles
---------------------------------------------------------
-- Create dependencies
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE titles ADD CONSTRAINT pk_titles_title_id PRIMARY KEY(title_id)

ALTER TABLE employees ADD CONSTRAINT fk_employees_title_id FOREIGN KEY(title_id)
REFERENCES titles (title_id)
