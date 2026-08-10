Ques-1 Total number of orders
select count(order_id) as total_orders
  from orders;
Ques -2 total revenue
select sum(amount) as total_revenue 
  from orders;
Ques -3 Average order amount
select avg(amount) as avg_orders
  from orders;
Ques - 4 highest order
Select max(amount) as highest_order
  from orders;
ques- 5 total Quantity sold
select sum(quantity) as total_quantity
  from orders;
