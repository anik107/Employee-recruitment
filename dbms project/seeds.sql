-- add department
INSERT INTO department (id,name)VALUES (1,'Boss');
INSERT INTO department (id,name)VALUES(2,'Sales');
INSERT INTO department (id,name)VALUES(3,'Engineering');
SELECT * FROM department;

-- add role
INSERT INTO role (id,title, salary, department_id)VALUES(1,'Boss',200000, 1);
INSERT INTO role (id,title, salary, department_id)VALUES(3,'Sales Lead', 100000, 2);
INSERT INTO role (id,title, salary, department_id)VALUES(2,'Lead Engineer', 150000, 3);
SELECT * FROM role;

-- add employee
INSERT INTO employee (id,first_name, last_name, role_id)
VALUES(1707107,'Anik', 'Mahmud', 1);
INSERT INTO employee (id,first_name, last_name, role_id)
VALUES (1707108,'Samir', 'Shahariar', 2);
INSERT INTO employee (id,first_name, last_name, role_id)
VALUES(1707109,'Sabbir', 'Hossain', 3);
SELECT * FROM employee;
Select (first_name || ' ' || last_name) as full_name from employee;

--add manager
INSERT INTO manager (manager_id)
VALUES (1707108);
INSERT INTO manager (manager_id)
VALUES(1707109);

-- View department
SELECT
	department.name AS Department,
	id
FROM department;

-- View role
SELECT
	role.id,
	role.title AS Title,
	department.name AS Department,
    role.salary AS Salary
FROM department
INNER JOIN role ON department.id = role.department_id;

--View employee
SELECT
	employee.id AS ID,
	employee.first_name AS First_Name,
        employee.last_name AS Last_Name,
	department.name AS Department,
        role.title AS Role,
        role.salary AS Salary
FROM department
INNER JOIN role ON department.id = role.department_id
INNER JOIN employee ON role.id = employee.role_id;

-- View employee and manager
SELECT
     c1.id AS ID,
     c1.first_name AS First_Name,
     c1.last_name AS Last_Name,
     (c1.first_name || ' ' || c1.last_name) AS Manager
FROM employee c1
INNER JOIN manager c2
ON  c1.id = c2.manager_id;

-- View employee by manager
SELECT
	employee.id AS ID,
	employee.first_name AS First_Name,
        employee.last_name AS Last_Name,
	department.name AS Department,
        role.title AS Role,
        role.salary AS Salary
FROM department
INNER JOIN role ON department.id = role.department_id
INNER JOIN employee ON role.id = employee.role_id
INNER JOIN manager ON employee.id=manager.manager_id;

-- view employee id by id

SELECT id,(first_name || ' ' || last_name) AS Full_name
    FROM employee
    WHERE id = 1707107;

-- view employee using left outer join

SELECT
	c1.id AS ID,
	c1.first_name AS First_Name,
    c1.last_name AS Last_Name,
	(first_name || ' ' || last_name) AS Manager
FROM employee c1
LEFT OUTER JOIN manager c2 ON  c1.id=c2.manager_id;

--view employee as manager using right outer join

SELECT
	c1.id AS ID,
	c1.first_name AS First_Name,
    c1.last_name AS Last_Name,
	(first_name || ' ' || last_name) AS Manager
FROM employee c1
RIGHT OUTER JOIN manager c2 ON  c1.id=c2.manager_id;

-- view employee with department and manager using Left outer join

SELECT
	c1.id AS ID,
	c1.first_name AS First_Name,
    c1.last_name AS Last_Name,
	department.name AS Department,
    role.title AS Role,
    role.salary AS Salary,
	(first_name || ' ' || last_name) AS Manager
FROM department
INNER JOIN role ON department.id = role.department_id
INNER JOIN employee c1 ON role.id = c1.role_id
RIGHT OUTER JOIN manager c2 ON  c1.id=c2.manager_id;
 
-- view employee with department and manager using Left outer join

SELECT
	c1.id AS ID,
	c1.first_name AS First_Name,
    c1.last_name AS Last_Name,
	department.name AS Department,
    role.title AS Role,
    role.salary AS Salary,
	(first_name || ' ' || last_name) AS Manager
FROM department
INNER JOIN role ON department.id = role.department_id
INNER JOIN employee c1 ON role.id = c1.role_id
LEFT OUTER JOIN manager c2 ON  c1.id=c2.manager_id;

-- group by 

SELECT id,(first_name || ' ' || last_name) AS Manager,role_id
FROM employee
INNER JOIN manager ON manager.manager_id=employee.id
GROUP BY id,first_name,last_name,role_id;

-- view employee with department and manager using Left outer join and group by
SELECT	
    c1.id AS ID,
    (first_name || ' ' || last_name) AS Manager,
    department.name AS Department,
    role.title AS Role,
    role.salary AS Salary
FROM department
INNER JOIN role ON department.id = role.department_id
INNER JOIN employee c1 ON role.id = c1.role_id
RIGHT OUTER JOIN manager c2 ON  c1.id=c2.manager_id
GROUP BY id,first_name,last_name,name,title,salary;

SELECT * FROM role;
DELETE FROM role WHERE id = 7;

-- View employee by department, manager

SELECT
	c1.id AS ID,
	c1.first_name AS First_Name,
    c1.last_name AS Last_Name,
	department.name AS Department,
    role.title AS Role,
    role.salary AS Salary,
   (c1.first_name || ' ' || c1.last_name) AS Manager
FROM department
INNER JOIN role ON department.id = role.department_id
LEFT JOIN employee c1 ON role.id = c1.role_id
LEFT JOIN manager c2 ON c1.id = c2.manager_id
WHERE department.id = 2;
-- WHERE c2.manager_id = 1;

SELECT SUM(role.salary) FROM role;
-- department budget

SELECT  
SUM(role.salary) AS Department_Budget
FROM department
INNER JOIN role ON department.id = role.department_id
LEFT OUTER JOIN employee c1 ON role.id = c1.role_id
LEFT OUTER JOIN manager c2 ON c1.id=c2.manager_id
GROUP BY department.id;

-- department budget for manager

SELECT  
SUM(role.salary) AS Department_Budget_For_Manager
FROM department
INNER JOIN role ON department.id = role.department_id
RIGHT OUTER JOIN employee c1 ON role.id = c1.role_id
RIGHT OUTER JOIN manager c2 ON c1.id=c2.manager_id
GROUP BY department.id;

SELECT
	SUM(role.salary)
FROM role
INNER JOIN department ON department.id = role.department_id
LEFT OUTER JOIN employee ON role.id = employee.role_id;


-- update employee role and manager
/*UPDATE employee
SET role_id = 2,
	manager_id = 1
WHERE id = 2;*/

-- delete employee, role, department
DELETE FROM employee WHERE id = 1707107;
DELETE FROM department WHERE id = 2;
DELETE FROM role WHERE id = 2;

SELECT id, title FROM role;
SELECT id,
    (first_name || ' ' || last_name) AS name
    FROM employee;