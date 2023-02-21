# Module 2 - Database and SQL
Content:
1. [PostgreSQL Database setup](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2#1-postgresql-database-setup)
2. [Create tables and importing data](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2#2-create-tables-and-importing-data)
3. [Analyzing superstore dataset using SQL-queries](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2#3-analyzing-superstore-dataset-using-sql-queries)
4. [Staging area setup](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2#4-staging-area-setup)
5. [Modeling DWH using SQLDBM](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2#5-modeling-dwh-using-sqldbm)
6. [DWH setup](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2#6-dwh-setup)
7. [PostgreSQL on Amazon RDS setup](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2#7-postgresql-on-amazon-rds-setup)


## 1. PostgreSQL Database setup
1. Download [PostgreSQL](https://www.postgresql.org/download/) and install on your machine.
2. Download and install [DBeaver](https://dbeaver.io/download/) client tool for connecting to PostgreSQL and performing any commands.
3. Create and establish a connection to Postgres in DBeaver.
4. Create new database 'postgres' or with another name you want.
```
CREATE DATABASE postgres;
```

## 2. Create tables and importing data
1. Create tables orders, people and returns in the database.
- [orders.sql](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/orders.sql)
- [people.sql](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/people.sql)
- [returns.sql](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/returns.sql)
2. Copy [datasets](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2/data) to you local machine.
3. Import superstore data to the tables using the following commands:
```
copy orders from 'your_path_to_file/orders.txt' with delimiter '|' header;
copy people from 'your_path_to_file/people.txt' with delimiter '|' header;
copy returns from 'your_path_to_file/returns.txt' with delimiter '|' header;
```

## 3. Analyzing superstore dataset using SQL-queries
This [SQL script](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/superstore_queries.sql) includes some metrics and insigths about orders, returns, sales, profit, products and customer.
- Total Sales
- Total Profit
- Profit Ratio
- Avg. Discount
- Profit per Order
- Sales and Profit per Customer
- Monthly Sales by Segment
- Monthly Sales by Product Category
- Sales by Product Category over time
- Sales per region
- Sales per country and city
- Percent to total sales by regions
- Number of Returns, Total amount
- Percent returns to orders

## 4. Staging area setup
1. Use the script [staging_setup.sql](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/staging_setup.sql) to create schema 'stg' and table 'orders' in the schema.
2. Then import data from [orders.txt](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/data/orders.txt) into table stg.orders.
```
copy stg.orders from 'your_path_to_file/orders.txt' with delimiter '|' header;
```

## 5. Modeling DWH using SQLDBM
Desinged conceptual, logical and physical models of DWH [SQLDBM](https://sqldbm.com/Home/) web application.

1. Conceptual model is very simple and it consists of six entities. It designed in Star schema (by Kimball model).
![cover](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/Conceptual%20model.JPG)

2. Logical model shows the entities including attributes.
![cover](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/Logical%20model.JPG)

3. Physical model shows the tables and their relationships on database level with describing all columns, data types, PK and FK keys etc. 
![cover](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/Physical%20model.JPG)

## 6. DWH setup
1. In the SQLDBM application using Forward engineer, generate DDL scripts for each table on the diagram. All DDL code is already stored in the single script [datamart_setup.sql](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/datamart_setup.sql). 
2. Now running the script in your Postgres database.
3. Then insert data into DWH tables. Just use and run the script [datamart_inserting.sql](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/datamart_inserting.sql).
4. Datamart is setup. Let's execute a query to check that's all OK.
```
select 
dc.customer_name ,
dp.product_name ,
dp.category ,
dg.country ,
ds.shipping_mode ,
s.quantity ,
s.sales 
from dw.fc_sales s
inner join dw.dm_customer dc 
on s.cust_id = dc.cust_id 
inner join dw.dm_product dp 
on s.prod_id = dp.prod_id 
inner join dw.dm_geo dg 
on s.geo_id = dg.geo_id 
inner join dw.dm_shipping ds 
on s.ship_id = ds.ship_id 
inner join dw.dm_calendar dt 
on s.order_date_id = dt.dateid
  and dt.year = 2019
  and dt.quarter = 4
;
```

## 7. PostgreSQL on Amazon RDS setup
1. Create [AWS Free Tire account](https://aws.amazon.com/free/?nc1=h_ls).
2. After you create AWS account, you will login into [AWS management console](https://console.aws.amazon.com/console/home).
3. Then in the Search type RDS and click on it.
  Read and use this guide [how to create RDS Postgres](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_GettingStarted.CreatingConnecting.PostgreSQL.html).
4. In the RDS page you can find many different things, but you need click Create Database.
5. For this module we will create Postgres DB instance, so choose it (Postgres version you choose on your own).
  - set Template as Free Tier. 
  - disable Monitoring and Backup options, because they are charged.
  - allow Public Access to connect to DB instance through your local, otherwise, you will need to configure Bastion EC2 Instance for using SSH tunnel [rds-connection-using-bastion](https://aws.amazon.com/premiumsupport/knowledge-center/rds-connect-using-bastion-host-linux/).
  - other settings can be left by default.
9. Once DB instance is created, let's connect to it, for example using DBeaver tool. 
  Note, you might need to download and install [Postgres JDBC driver](https://jdbc.postgresql.org/download/).
  Also, here you can read more about [connection to RDS Postgres](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ConnectToPostgreSQLInstance.html).
10. Now, the time to creta [staging table](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/staging_setup.sql). Note, 'copy' command cannot supported for AWS RDS Postgres from DBeaver.
  But you run it in pslq command line like below. Note, you must delete a header line from [orders.txt](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/data/orders.txt).
```
psql ^
   --host=<AWS DB instance endpoint> ^
   --port=<port> ^
   --username=<master username> ^
   --password ^
   --dbname=<database name> ^
   --command="\copy stg.orders from 'your_path_to_file/orders.txt' with delimiter '|';"
```
11. Next, we create datamart schema and tables using the script [datamart_setup](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/datamart_setup.sql).
12. Inserting datmart table using the script [datamart_inserting](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/datamart_inserting.sql).
13. Just run a simple query to check fc_orders table.
```
select * from dw.fc_sales limit 100;
```
14. Done. (Save your money! Don't forget to stop or terminate AWS DB Instance if you are not planning to use it further).

## 8. Superstore Dashboard in Google Looker
My first experience in Goolge Looker, and I've managed to design my first dashboard here. Despite the tool being intuitively clear and easy to work with, I'd like  to highlight some interesting points:
- Looker works on a cloud only.
- Looker supports the PostgreSQL version prior v12 only.
- Diagrams and control elemnts don't have an editable Header name, it should be added separately like a text label.
- Control element can be applied on the page level or report level only. No way to assign it to a single chart or another object.
- When you apply control elemnt on the report level then it will duplicate on each pages. No simple way to control dashboard from one page.

My example of dashboard designed in Looker.
![cover](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/looker/looke-dashboard-page1.JPG)
![cover](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/looker/looke-dashboard-page2.JPG)
![cover](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/looker/looke-dashboard-page3.JPG)

## 9. Superstore Dashboard in Amazon QuickSight
