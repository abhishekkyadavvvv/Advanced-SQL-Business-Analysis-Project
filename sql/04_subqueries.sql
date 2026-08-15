-- Q1. Find customers whose total spending is greater than the average customer spending.
with xyz as (select c.customer_name,sum(o.amount) as total_spend
  from customeers.c
  join orders o
  on c.customer_id = o.customer_id
  group by c.customer_name)
select customer_name,total_spend
  from xyz
where total_spend > (select avg(total_spend) from xyz);
  
-- Q2. Find employees whose salary is greater than the average employee salary.
select employee_name , salary 
  
from employees 
where salary>(select avg(salary) from employees)
  
-- Q3. Find products whose price is greater than the average product price.
select product_name
  from products
where price > (select avg(price) as avg_price from products)
-- Q4. Find the customer who placed the highest-value order.
with customer_spend as (select c.customer_name,c.customer_id , max(o.amount) as total_value
  from customers c 
  join
  orders o on c.customer_id=o.customer_id
  group by c.customer_name ,c.customer_id)
select customer_name ,customer_id,total_value
  from customer_spend 
order by total_value desc
  limit 1
-- Q5. Find employees whose salary is greater than the average salary of their own department.
with 
