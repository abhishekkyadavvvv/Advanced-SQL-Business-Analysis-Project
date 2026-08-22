-- Q1. Customer Performance
-- Identify the top 10 customers based on their total spending.
-- Show customer name, total orders, total quantity purchased,
-- and total spending.
select c.customer_name,sum(o.quantity) as total_quantity ,sum(o.amount) as total_spending,count(order_id) as total_orders
from customers c
join 
orders o
on c.customer_id=o.customer_id
group by c.customer_name
order by total_spending desc
  limit 10;
-- Q2. Product Performance
-- Identify the top 10 products based on total revenue.
-- Show product name, category, units sold, and total revenue.

select p.product_id,p.product_name,p.category,sum(p.quantity) as total_unit_sold, sum(o.amount) as total_revenue
from products p
join orders o
on p.product_id=o.product_id
group by p.product_id,p.product_name,p.category
order by total_revenue desc 
limit 10 ;
 

-- Q3. Employee Performance
-- Identify the top-performing employees based on the total
-- sales generated through their orders.
-- Show employee name, department, total orders, and total sales.

select e.employee_id,e.employee_name,d.department_name,count(o.order_id) as total_orders , sum(o.amount) as total_sales from employees e 
join orders o 
on e.employee_id=o.employee_id 
join departments d
on
e.department_id=d.department_id 
group by e.employee_id,e.employee_name,d.department_name
order by total_sales desc limit 1;

-- Q4. Department Performance
-- Compare departments based on employee count, total sales,
-- and average employee salary.
-- Identify which department generates the highest sales.
select d.department_id,d.department_name,count(e.employee_id) as total_number_of_employees ,sum(o.amount) as total_sales,avg(e.salary) as avg_salary
from employees e 
join 
departments d 
on e.department_id=d.department_id
join orders o
on
e.employee_id=o.employee_id 
group by d.department_id,d.department_name 
order by total_sales desc limit 1;


-- Q5. Customer Retention
-- Identify customers who have placed more than one order.
-- Show customer name, number of orders, and total spending.
-- Sort them by number of orders from highest to lowest.
select c.customer_id ,c.customer_name,count(o.order_id) as total_number_of_orders , sum(o.amount) as total_spending 
from customers c
join
orders o
on 
c.customer_id=o.customer_id 
group by c.customer_id ,c.customer_name
having count(o.order_id)>1
order by total_number_of_orders desc;
