1-- Rank employees by salary from highest to lowest.
select employee_id,employee_name,salary , dense_rank() over (order by salary desc ) as rankk from employees ;

2-- Q2. Rank products by total revenue within each category.
select p.product_id , p.product_name,sum(o.amount) as total_revenue , dense_rank() over(partition by p.category order by sum(o.amount) desc ) as rankk
from products p
join orders o
on p.product_id=o.product_id 
group by p.product_id ,p.product_name;

3 -- Q3. Show each customer's total spending and their rank based on total spending.
select c.customer_id , c.customer_name, sum(o.amount ) as total_spending ,
dense_rank () over(order by sum(o.amount) desc )as rankk 
from customers c 
join 
orders o 
on c.customer_id=o.customer_id 
group by c.customer_id, c.customer_name ;

--Q4. Show each employee's salary along with the average salary of their department.
select e.employee_id, e.employee_name , e.salary , avg(e.salary) over (partition by d.department_id) average_dept_salary
from employees e 
join 
departments d 
on e.department_id =d.department_id ;

--Q5. Show each customer's orders along with their previous order amount. 

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.amount,
    LAG(o.amount) OVER (
        PARTITION BY o.customer_id
        ORDER BY o.order_id;
    ) AS previous_order_amount
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id;
