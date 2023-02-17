# Module 2 - Database and SQL

## PostgreSQL Database setup
1. Download [PostgreSQL](https://www.postgresql.org/download/) and install on your machine.
2. Download and install [DBeaver](https://dbeaver.io/download/) client tool for connecting to PostgreSQL and performing any commands.
3. Create and establish a connection to Postgres in DBeaver.
4. Create new database 'postgres' or with another name you want.
```
CREATE DATABASE postgres;
```

## Create tables and upload superstore
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

## Write SQL for analyzing the superstore data
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

## Staging schema setup
1. Use the script [staging_setup.sql](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/staging_setup.sql) to create schema 'stg' and table 'orders' in the schema.
2. Then import data from [orders.txt](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/data/orders.txt) into table stg.orders.
```
copy stg.orders from 'your_path_to_file/orders.txt' with delimiter '|' header;
```

## Data Mart modeling
Desinged conceptual, logical and physical models of the Data Mart in [SQLDMB](https://sqldbm.com/Home/) web application.

1. Conceptual model is very simple and it consists of six entities. It designed in Star schema (by Kimball model).
![cover](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/Conceptual%20model.JPG)

2. Logical model shows the entities including attributes.
![cover](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/Logical%20model.JPG)

3. Physical model shows the tables and their relationships on database level with describing all columns, data types, PK and FK keys etc. 
Based on this model will be created DDL code for creating tables in the schema.
![cover](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/Physical%20model.JPG)

## Data Mart setup
1. In the SQLDBM application using Forward engineer generating DDL code for each tables on the schema. All DDL commands were stored in the single script [datamart_setup.sql](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/datamart_setup.sql). 
2. Then running the script in your Postgres database.
