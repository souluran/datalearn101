# Module 2 - Database and SQL
[DataLearn DE-101 Module02](https://github.com/Data-Learn/data-engineering/tree/master/DE-101%20Modules/Module02)

`PostgreSQL` `psql` `DBeaver` `Amazon RDS` `SQLDBM` `Google Looker` `Amazon QuickSight`

Content:
1. [PostgreSQL Database setup](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2#1-postgresql-database-setup)
2. [Create tables and importing data](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2#2-create-tables-and-importing-data)
3. [Analyzing superstore dataset using SQL-queries](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2#3-analyzing-superstore-dataset-using-sql-queries)
4. [Staging area setup](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2#4-staging-area-setup)
5. [Modeling DWH using SQLDBM](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2#5-modeling-dwh-using-sqldbm)
6. [DWH setup](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2#6-dwh-setup)
7. [PostgreSQL on Amazon RDS setup](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2#7-postgresql-on-amazon-rds-setup)
8. [Superstore Dashboard in Google Looker](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/README.md#8-superstore-dashboard-in-google-looker)
9. [Superstore Dashboard in Amazon QuickSight](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/README.md#9-superstore-dashboard-in-amazon-quicksight)


## 1. PostgreSQL Database setup
1. Downloaded [PostgreSQL](https://www.postgresql.org/download/) and installed on your machine.
2. Downloaded and installed [DBeaver](https://dbeaver.io/download/) client tool for connecting to PostgreSQL and performing any commands.
3. Created and established a connection to Postgres in DBeaver.
4. Created a new database `postgres`.
```
CREATE DATABASE postgres;
```

## 2. Create tables and importing data
1. Created tables `orders`, `people` and `returns` in the database.
- [orders.sql](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/orders.sql)
- [people.sql](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/people.sql)
- [returns.sql](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/returns.sql)
3. Imported [superstore data](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2/data) into the tables using the following commands:
```
copy orders from 'your_path_to_file/orders.txt' with delimiter '|' header;
copy people from 'your_path_to_file/people.txt' with delimiter '|' header;
copy returns from 'your_path_to_file/returns.txt' with delimiter '|' header;
```

## 3. Analyzing superstore dataset using SQL-queries
Wrote SQL-queries to superstore data [SQL-queries](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/superstore_queries.sql) to get some metrics and insigths about orders, returns, sales, profit, products and customer.
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

<img src="https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/postgres/Querying%20data%20from%20tables.JPG" width=60% height=60%>

## 4. Staging area setup
1. Created staging schema `stg` and table `orders` [staging_setup.sql](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/staging_setup.sql).
2. Imported data from [orders.txt](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/data/orders.txt) into table `stg.orders`.
```
copy stg.orders from 'your_path_to_file/orders.txt' with delimiter '|' header;
```

<img src="https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/postgres/Staging%20schema.JPG" width=50% height=50%>

## 5. Modeling DWH using SQLDBM
Desinged conceptual, logical and physical models of superstore data warehouse using [SQLDBM](https://sqldbm.com/Home/).

1. Conceptual model is very simple and it consists of six entities. It designed in Star schema (by Kimball model).
<img src="https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/Conceptual%20model.PNG" width=60% height=60%>

2. Logical model shows the entities including attributes.
<img src="https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/Logical%20model.PNG" width=60% height=60%>

3. Physical model describes the tables and their relationships on database level including column names, data types, PK and FK keys etc.
<img src="https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/Physical%20model.PNG" width=80% height=80%>

## 6. DWH setup
1. In the SQLDBM application using Forward engineer, generated DDL scripts for each table on the diagram. All DDL code saved into the single script [datamart_setup.sql](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/datamart_setup.sql). 
2. Deployed script to my local Postgres database for creating schema `dw` and the corresponded tables.
3. Then inserted data into the tables [datamart_inserting.sql](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/datamart_inserting.sql).

<img src="https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/postgres/DWH%20schema.PNG" width=50% height=50%>

## 7. PostgreSQL on Amazon RDS setup
1. Created [AWS Free Tire account](https://aws.amazon.com/free/?nc1=h_ls).
2. Loged into [AWS management console](https://console.aws.amazon.com/console/home).
3. Then in menu tab went to Amazon RDS for creating Postgres DB Instance.
  Read and used this guide [how to create RDS Postgres](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_GettingStarted.CreatingConnecting.PostgreSQL.html).
4. Created Postgres DB instance (used v12 because this last actual version which Goolgel Looker supports).
  - set Template as Free Tier. 
  - disabled Monitoring and Backup options, because they are charged.
  - allowed Public Access to connect to DB instance through my local, otherwise, I would be needed to configure EC2 Instance as Bastion for using SSH tunnel [rds-connection-using-bastion](https://aws.amazon.com/premiumsupport/knowledge-center/rds-connect-using-bastion-host-linux/).
  - other settings were set by default.

<img src="https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/postgres/Postgres%20in%20Amazon%20RDS.JPG" width=70% height=70%>

5. Connected to Postgres hosted in Amazon RDS through DBeaver in my local.
6. Created staging schema and table [staging table](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/staging_setup.sql). Inserted data into the table.
> Note, `copy` command cannot supported for AWS RDS Postgres from DBeaver.
But it works via `psql` cli. Note, you must delete a header line from [orders.txt](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/data/orders.txt).
```
psql ^
   --host=<AWS DB instance endpoint> ^
   --port=<port> ^
   --username=<master username> ^
   --password ^
   --dbname=<database name> ^
   --command="\copy stg.orders from 'your_path_to_file/orders.txt' with delimiter '|';"
```
7. Next, created `dw` schema and tables [datamart_setup](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/datamart_setup.sql), and populated data
[datamart_inserting](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/datamart_inserting.sql).

<img src="https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/postgres/DWH%20schema%20in%20Amazon%20RDS%20Postgres.PNG" width=50% height=50%>

> Note: save your money, terminate Amazon RDS Instance if you are not going to use it at all

## 8. Superstore Dashboard in Google Looker
I was very new in [Goolge Looker](https://lookerstudio.google.com), but after a few hours, I managed to design my first Dashboard here.
I want to share some thoughts and notices about this tool:
- Looker works on a cloud only.
- As Looker is Google service you log into it with your google account.
- You can easy to share Dashboards with other user who have google account (most people have).
- Looker supports the PostgreSQL version prior v12 only.
- You can move visual and control objects by pixel in the page.
- There are many settings for tuning visual elements.
- Header name doesn't exist in Charts, it should be added separately like a text label.
- Control element can be applied on the page level or report level only. No way to assign it to a single chart or another object.
- When you apply control element on the report level then it will be duplicated on each pages. No simple way to control dashboard from one page.
- Working with the map element you cannot do more contrast color of the highlighted sections on the map because your geographical labels will disappear.

My example of dashboard designed in Googel Looker.

<img src="https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/looker/looker-dashboard.PNG" width=80% height=80%>

## 9. Superstore Dashboard in Amazon QuickSight
[Amazon QuickSight](https://aws.amazon.com/quicksight/) is one of Cloud services provided by Amazon. As I'm a certified AWS developer I'm good with most AWS services, but I haven't had experience with QuickSight. But after some hours working in QuickSight, I found out the tool is intuitively clear and simple to use.
There are some points I'd wanted to share about this tool:
- QuickSight works on a cloud only as Looker.
- You need to have AWS Account.
- In Standard Free tier, you cannot share Dashboards with external users out of your Amazon account. Instead, you need to share it for IAM users.
- You can add filters (like control elements in Looker) and assigned it for individual visual or for all on the page sheet.
- Also you can pin filters on the top of the page (a special place on the page allocated for controls).
- All objects are very editable and customized (including Header Name).
- There are two modes to add and place elements in the dashboard grid: tiled (visuals snap to a grid layout), free-form (visuals can be placed anywhere).

My example of dashboard designed in QuickSight.

<img src="https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/image/quicksight/quicksight-dashboard.PNG" width=80% height=80%>
