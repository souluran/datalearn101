/* Script for inserting data into data mart tables based on the data from staging */

--delete rows
truncate table dw.dm_customer;

--populate customer dimension
insert into dw.dm_customer 
select 
100+row_number() over() as cust_id, 
o.customer_id, 
o.customer_name 
from (select distinct customer_id, customer_name from stg.orders) o;
----------------------------------------


--delete rows
truncate table dw.dm_shipping;

--populate shipping dimension
insert into dw.dm_shipping 
select 
100+row_number() over() as ship_id,  
o.ship_mode as ship_mode
from (select distinct ship_mode from stg.orders ) o;
----------------------------------------


--delete rows
truncate table dw.dm_product;

--populate product dimension
insert into dw.dm_product 
select 100+row_number() over () as prod_id,
product_id, 
product_name, 
category, 
subcategory, 
segment 
from (select distinct product_id, product_name, category, subcategory, segment 
      from stg.orders) o;
----------------------------------------


--delete rows
truncate table dw.dm_geo;

--generating geo_id and insert rows from orders
insert into dw.dm_geo 
select 100+row_number() over() as geo_id,
country, 
city, 
state, 
postal_code 
from (select distinct country, city, state, postal_code from stg.orders) o;

-- City Burlington, Vermont doesn't have postal code
update dw.dm_geo
set postal_code = '05401'
where city = 'Burlington' and postal_code is null;

--also update stage table
update stg.orders
set postal_code = '05401'
where city = 'Burlington' and postal_code is null;
----------------------------------------


--delete rows
truncate table dw.dm_calendar;

--generating and inserting calendar dimension
insert into dw.dm_calendar 
select 
to_char(date,'yyyymmdd')::int as date_id,  
       extract('year' from date)::int as year,
       extract('quarter' from date)::int as quarter,
       extract('month' from date)::int as month,
       extract('week' from date)::int as week,
       date::date,
       to_char(date, 'dy') as week_day,
       extract('day' from
               (date + interval '2 month - 1 day')
              ) = 29
       as leap
  from generate_series(date '2000-01-01',
                       date '2030-01-01',
                       interval '1 day')
       as t(date);
----------------------------------------


--delete rows
truncate table dw.fc_sales;

--insert data into fact table fc_sales by querying from staging table and dimension tables
insert into dw.fc_sales
select
 100+row_number() over() as sales_id
 ,c.cust_id
 ,to_char(o.order_date,'yyyymmdd')::int as order_date_id
 ,to_char(o.ship_date,'yyyymmdd')::int as ship_date_id
 ,p.prod_id
 ,s.ship_id
 ,g.geo_id
 ,o.order_id
 ,o.sales
 ,o.profit
 ,o.quantity
 ,o.discount
from stg.orders o 
inner join dw.dm_shipping s 
on o.ship_mode = s.shipping_mode
inner join dw.dm_geo g 
on o.postal_code = g.postal_code 
  and o.country = g.country 
  and o.city = g.city 
  and o.state = g.state
inner join dw.dm_product p 
on o.product_name = p.product_name 
  and o.segment = p.segment 
  and o.subcategory = p.sub_category 
  and o.category = p.category 
  and o.product_id = p.product_id 
inner join dw.dm_customer c 
on o.customer_id = c.customer_id 
  and o.customer_name = c.customer_name;
