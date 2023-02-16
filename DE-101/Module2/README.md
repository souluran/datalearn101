# Module 2 - Database and SQL

## PostgreSQL Database
1. Download [PostgreSQL](https://www.postgresql.org/download/) and install on your machine.
2. Download and install [DBeaver](https://dbeaver.io/download/) client tool for connecting to PostgreSQL and performing any commands.
3. Create and establish a connection to Postgres in DBeaver.
4. Create new database 'postgres' or with another name you want.
```
CREATE DATABASE postgres;
```
5. Create tables orders, people and returns in the database.
- [orders.sql](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/orders.sql)
- [people.sql](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/people.sql)
- [returns.sql](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/returns.sql)
6. Copy [datasets](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2/data) to you local machine.
7. Import datasets to the tables using the following commands:
```
copy orders from 'your_path_to_file/orders.txt' with delimiter '|' header;
copy people from 'your_path_to_file/people.txt' with delimiter '|' header;
copy returns from 'your_path_to_file/returns.txt' with delimiter '|' header;
```
8. 
