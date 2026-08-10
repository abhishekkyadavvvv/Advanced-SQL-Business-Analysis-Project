CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10,2)
);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    product_id INT,
    quantity INT,
    amount DECIMAL(10,2)
);
select * from departments
select * from employees
select * from customers
select * from products
select * from orders
