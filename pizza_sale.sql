select * from pizza_sales

--Total_Revenue
select sum(total_price)as Total_Revenue from pizza_sales

--Average Order Value
select (sum(total_price) / count(distinct order_id)) as Avg_order_Value from pizza_sales

--Total pizza sold
select sum(quantity) as Total_Pizza_sold from pizza_sales

--Total Order
select count(distinct order_id) as Total_Order from pizza_sales

--Average Pizza Per Order
select cast(cast(sum(quantity)as decimal(10,2))/cast(count(distinct order_id)as decimal(10,2))as decimal(10,2)) 
as Avg_Pize_Order from pizza_sales


-- Daily Trend for total Order
select DATENAME(DW, order_date) as order_day, count(distinct order_id) as total_order_day from pizza_sales
group by DATENAME(DW, order_date)

--Month Trend for Order
select DATENAME(MONTH, order_date) as Month_Name, count(distinct order_id) as Total_Orders_month from pizza_sales
group by DATENAME(MONTH, order_date)

-- % of sales by Pizza Category
SELECT pizza_category, 
CAST(sum(total_price) as decimal(10,2)) as total_revenue,
cast(sum(total_price)*100/ (select sum(total_price) from pizza_sales ) as decimal(10,2)) as percent_sales_category
from pizza_sales
group by pizza_category

--% of sales by pizza size
select pizza_size,
CAST(SUM(total_price) as decimal(10,2)) as total_revenue,
CAST(SUM(total_price)*100/ (SELECT SUM(total_price) FROM pizza_sales) AS decimal(10,2)) AS percent_sales_size
from pizza_sales
GROUP BY pizza_size ORDER BY pizza_size

-- Total Pizza Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

--Top 5 pizza by Revenue
SELECT TOP 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
ORDER BY total_revenue DESC

-- Bottom 5 pizza by revenue
SELECT TOP 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
ORDER BY total_revenue asc

--Top 5 Pizza by Quantity
SELECT TOP 5 pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
ORDER BY total_quantity desc

-- Bottom 5 pizza by quantity
SELECT TOP 5 pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
ORDER BY total_quantity asc

-- Top 5 Pizza by total Order
SELECT TOP 5 pizza_name, count(distinct order_id) as total_order from pizza_sales
group by pizza_name
ORDER BY total_Order desc

-- Bottom 5 Pizza by total Order
SELECT TOP 5 pizza_name, count(distinct order_id) as total_order from pizza_sales
group by pizza_name
ORDER BY total_Order asc


SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders ASC
