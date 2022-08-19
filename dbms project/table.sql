CREATE TABLE department (
    id number(7) NOT NULL,
    PRIMARY KEY (id),
    name VARCHAR (30) NOT NULL
);

CREATE TABLE role (
    id number(7) NOT NULL,
    PRIMARY KEY (id),
    title VARCHAR(30) NOT NULL,
    salary number(10) NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE employee (
    id number(7) NOT NULL,
    PRIMARY KEY (id),
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES role(id)
);
CREATE TABLE manager(
    manager_id number(7) NOT NULL,
    FOREIGN KEY(manager_id) REFERENCES employee(id)
);