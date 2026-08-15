-- Q1. Find customers whose total spending is greater than the average customer spending.
with xyz as (select c.customer_name,sum(o.amount) as total_spend from customeers.c join orders o
  on c.customer_id = o.customer_id
  group by c.customer_name)
select customer_name,total_spend from xyz
where total_spend>(select avg(total_spend) from xyz)
  
-- Q2. Find employees whose salary is greater than the average employee salary.
select employee_name , salary from employees 
where salary>(select avg(salary) from employees)
  
-- Q3. Find products whose price is greater than the average product price.

-- Q4. Find the customer who placed the highest-value order.

-- Q5. Find employees whose salary is greater than the average salary of their own department.
