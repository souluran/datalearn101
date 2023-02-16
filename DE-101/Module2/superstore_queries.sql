--to call the crosstab function, you must first enable the tablefunc extension
CREATE extension tablefunc;


--Total Sales, Total Profit, Profit Ratio, Avg. Discount
select 
sum(sales) as sales,
sum(profit) as profit,
round((sum(profit)/sum(sales))*100) as profit_ratio,
avg(discount) as avg_discount
from orders;


--Profit per Order
select 
order_id,
sum(profit) as profit
from orders
group by order_id;


--Sales and Profit per Customer
select 
customer_name,
sum(sales) as sales,
sum(profit) as profit
from orders
group by customer_name;


--Monthly Sales by Segment
SELECT *
FROM crosstab(
'select
to_char(o.order_date, ''yyyy-mm'') as month,
segment,
sum(sales) as sales
from orders o
group by to_char(o.order_date, ''yyyy-mm''),
segment
order by 1'
)
AS final_result(month text, Consumer numeric, Corporate numeric, "Home Office" numeric);


--Monthly Sales by Product Category
SELECT *
FROM crosstab(
'select
to_char(order_date, ''yyyy-mm'') as month,
category,
sum(sales) as sales
from orders
group by to_char(order_date, ''yyyy-mm''),
category
order by 1'
)
AS final_result(month text, Furniture numeric, "Office Supplies" numeric, Technology numeric);


--Sales by Product Category over time
select
segment,
sum(sales) as sales
from orders o
group by segment
order by 1;


--Sales per region
select
region,
sum(sales) as sales
from orders o
group by region
order by 1;


--Customer Ranking
with customers as (
select
customer_name,
sum(sales) as sales
from orders
group by customer_name
)
select
customer_name,
sales,
rank() over(order by sales desc) as sales_rank
from customers
;


--percent to total sales by regions
with regions as (
select
region,
sum(sales) as sales
from orders o
group by region
)
select region,
round((sales/sum(sales) over()) * 100, 2) as percent
from regions
order by 1;


--returns
with rets as (
select
r.returned,
count(distinct o.order_id) as count_return
from orders o 
left join (select distinct order_id, returned from returns) r 
on r.order_id = o.order_id 
group by r.returned 
)
select coalesce(returned, 'No') as returned,
round((count_return/sum(count_return) over()) * 100, 2) as percent
from rets
order by 1;