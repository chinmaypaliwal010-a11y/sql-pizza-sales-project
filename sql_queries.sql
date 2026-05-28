-- Retrieve the total number of orders placed.

select count(order_id) as total_orders from orders;


-- Calculate the total revenue generated from pizza sales.


SELECT 
    round(SUM(orders_details.quantity * pizzas.price) )AS total_sales
FROM
    orders_details
        JOIN
    pizzas ON pizzas.pizza_id = orders_details.pizza_id;
    
    
    -- Identify the highest-priced pizza.

SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;

-- Identify the most common pizza size ordered.

SELECT 
    pizzas.size,
    COUNT(orders_details.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC; 

-- List the top 5 most ordered pizza
 -- types along with their quantities.
 
 
SELECT 
    pizza_types.name,
    SUM(orders_details.quantity) AS total_quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY total_quantity DESC
LIMIT 5;


-- Join the necessary tables to find the total quantity of each pizza category ordered.

select pizza_types. category,
sum(orders_details.quantity) as quantity
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types. category
order by quantity desc; 


-- Determine the distribution of orders by hour of the day.

select hour(order_time), count(order_id) as order_count from orders
group by hour (order_time);


-- Group the orders by date and calculate the average number of pizzas ordered per day.

select
round (avg(quantity),0)from 
(select orders.order_date, sum(orders_details.quantity) as quantity
from orders join orders_details
on orders.order_id = orders_details.order_id
group by orders.order_date) as order_quantity; 


-- Determine the top 3 most ordered pizza types based on revenue.

select pizza_types.name,
sum(orders_details.quantity * pizzas.price) as revenue
from pizza_types join pizzas
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.name order by revenue desc limit 3;
 
 
 -- Calculate the percentage contribution of each pizza type to total revenue.

select pizza_types.category, 
(sum(orders_details.quantity * pizzas.price) / (
SELECT 
    round(SUM(orders_details.quantity * pizzas.price) )AS total_sales
FROM
    orders_details
        JOIN
    pizzas ON pizzas.pizza_id = orders_details.pizza_id) * 100)  as revenue
        from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.category order by revenue desc ; 


