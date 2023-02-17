/* Script for creating tables in superstore data mart */

--create schema dw
create schema dw;


--create Customer dimension
CREATE TABLE dw.dm_customer
(
 cust_id       serial NOT NULL,
 customer_id   varchar(8) NOT NULL,
 customer_name varchar(22) NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY ( cust_id )
);


--create Shipping dimension
CREATE TABLE dw.dm_shipping
(
 ship_id       serial NOT NULL,
 shipping_mode varchar(14) NOT NULL,
 CONSTRAINT PK_dim_ship PRIMARY KEY ( ship_id )
);


--create Product dimension
CREATE TABLE dw.dm_product
(
 prod_id      serial NOT NULL,
 product_id   varchar(50) NOT NULL,
 product_name varchar(127) NOT NULL,
 category     varchar(15) NOT NULL,
 sub_category varchar(11) NOT NULL,
 segment      varchar(11) NOT NULL,
 CONSTRAINT PK_dim_prod PRIMARY KEY ( prod_id )
);


--create Geographic dimension
CREATE TABLE dw.dm_geo
(
 geo_id      serial NOT NULL,
 country     varchar(13) NOT NULL,
 city        varchar(17) NOT NULL,
 state       varchar(20) NOT NULL,
 postal_code varchar(20) NULL,
 CONSTRAINT PK_dim_geo PRIMARY KEY ( geo_id )
);


--create Calendar dimension
CREATE TABLE dw.dm_calendar
(
 dateid   serial NOT NULL,
 year     int NOT NULL,
 quarter  int NOT NULL,
 month    int NOT NULL,
 week     int NOT NULL,
 date     date NOT NULL,
 week_day varchar(20) NOT NULL,
 leap     varchar(20) NOT NULL,
 CONSTRAINT PK_dim_date PRIMARY KEY ( dateid )
);


--create Sales facts
CREATE TABLE dw.fc_sales
(
 sales_id      serial NOT NULL,
 cust_id       integer NOT NULL,
 order_date_id integer NOT NULL,
 ship_date_id  integer NOT NULL,
 prod_id       integer NOT NULL,
 ship_id       integer NOT NULL,
 geo_id        integer NOT NULL,
 order_id      varchar(25) NOT NULL,
 sales         numeric(9,4) NOT NULL,
 profit        numeric(21,16) NOT NULL,
 quantity      int4 NOT NULL,
 discount      numeric(4,2) NOT NULL,
 CONSTRAINT PK_fc_sales PRIMARY KEY ( sales_id ),
 CONSTRAINT FK_dim_product FOREIGN KEY ( prod_id ) REFERENCES dw.dm_product ( prod_id ),
 CONSTRAINT FK_dim_geo FOREIGN KEY ( geo_id ) REFERENCES dw.dm_geo ( geo_id ),
 CONSTRAINT FK_dim_shipping FOREIGN KEY ( ship_id ) REFERENCES dw.dm_shipping ( ship_id ),
 CONSTRAINT FK_dim_customer FOREIGN KEY ( cust_id ) REFERENCES dw.dm_customer ( cust_id ),
 CONSTRAINT FK_dim_calendar FOREIGN KEY ( order_date_id ) REFERENCES dw.dm_calendar ( dateid )
);

--create indexes for foreign keys
CREATE INDEX IDX_FK_dim_product ON dw.fc_sales
(
 prod_id
);

CREATE INDEX IDX_FK_dim_geo ON dw.fc_sales
(
 geo_id
);

CREATE INDEX IDX_FK_dim_shipping ON dw.fc_sales
(
 ship_id
);

CREATE INDEX IDX_FK_dim_customer ON dw.fc_sales
(
 cust_id
);

CREATE INDEX IDX_FK_dim_calendar ON dw.fc_sales
(
 order_date_id
);