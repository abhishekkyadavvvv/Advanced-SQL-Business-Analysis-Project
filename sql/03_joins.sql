-- Q1. Show each customer and the total amount they have spent.
select c.customer_name,sum(o.amount) as total_amount_spend
from customers c
LEFT join 
orders o 
on c.customer_id=o.customer_id
group by c.customer_name;
-- Q2. Show each product and the total quantity sold for that product.
select p.product_id,p.product_name,sum(quantity) as total_quantity
from products p
left join orders o
on p.product_id=o.product_id 
group by p.product_id,p.product_name;
-- Q3. Show each department and the number of employees in that department.
select d.department_name , count(e.employee_id) as numberOfemployee
from employees e
join 
departments d
on e.department_id=d.department_id
group by d.department_name;
-- Include departments with zero employees.
select d.department_name from departments d
left join
employees e
on 
d.department_id=e.department_id
where e.employee_id is null;
-- Q4. Show each employee and the total sales generated through their orders.
select e.employee_id,e.employee_name,sum(o.amount) as total_sales
from employees e
join 
orders o
on e.employee_id=o.employyee_id
group by e.employee_id,e.employee_name;

-- Q5. Show each product category and its total revenue.
select p.category , sum(o.amount) as total_revenue
from products p 
join 
orders o
on p.product_id=o.product_id
group by p.category;
