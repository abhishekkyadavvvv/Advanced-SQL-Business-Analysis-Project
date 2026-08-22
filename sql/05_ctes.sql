-- Q1. Find total sales for each department using a CTE.
with total as(select d.department_name ,sum(o.amount) as total_sales
  
  from employees e
  join orders o
  on 
  e.employee_id=o.employee_id
  join departments d
  on e.department_id=d.department_id
  group by d.department_name)
select department_name,total_sales from total;
  
-- Q2. Find customers whose total spending is above the average customer spending using a CTE.
with total_spending as (select c.customer_id,c.customer_name,sum(o.amount) as total_spend
  from customers c
  join 
  orders o
  on c.customer_id=o.customer_id
  group by c.customer_id,c.customer_name
  )
select customer_id,customer_name,total_spend from total_spending
where total_spend> (select avg(total_spend) as avg_customer_spend from total_spending);
-- Q3. Find the top 3 products by total revenue using a CTE.
with product_revenue as(select p.product_id ,p.product_name,sum(o.amount) as total_revenue
  from products p
  join orders o
  on p.product_id=o.product_id
  group by product_id,product_name)
select product_id,product_name,total_revenue from product_revenue
order by total_revenue desc 
  limit 3;
-- Q4. Find each employee's total sales and rank them within their department using a CTE.
with employee_sales as (select e.employee_id,e.employee_name,d.department_id ,d.department_name,sum(o.amount) as total_employees_sales,
  dense_rank() over(partition by d.department_id 
  order by sum(o.amount) desc)as rankk
  from employees e
  join orders o
  on e.employee_id=o.employee_id
  join departments d
  on d.department_id=e.department_id
  group by e.employee_id,e.employee_name,d.department_id ,d.department_name)
select employee_id,employee_name,department_id ,department_name,total_employees_sales from employee_sales;
  
-- Q5. Find the department with the highest total sales using a CTE.
with dept_sales as (select d.department_id,d.department_name,sum(o.amount) as total_sales,
    dense_rank() over( order by sum(o.amount) desc )as rankk
  from employees e
  join orders o
  on 
  e.employee_id=o.employee_id
  join departments d
  on e.department_id=d.department_id;
 group by   d.department_id,d.department_name)
select department_id,department_name ,total_sales from dept_sales 
where rankk=1
  
