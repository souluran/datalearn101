--create schema for staging
create schema stg;

--create table orders in staging
DROP TABLE IF EXISTS stg.orders;
CREATE TABLE stg.orders(
  Row_ID        INTEGER  NOT NULL PRIMARY KEY,
  Order_ID      VARCHAR(14) NOT NULL,
  Order_Date    DATE  NOT NULL,
  Ship_Date     DATE  NOT NULL,
  Ship_Mode     VARCHAR(14) NOT NULL,
  Customer_ID   VARCHAR(8) NOT NULL,
  Customer_Name VARCHAR(22) NOT NULL,
  Segment       VARCHAR(11) NOT NULL,
  Country       VARCHAR(13) NOT NULL,
  City          VARCHAR(17) NOT NULL,
  State         VARCHAR(20) NOT NULL,
  Postal_Code   VARCHAR(50),
  Region        VARCHAR(7) NOT NULL,
  Product_ID    VARCHAR(15) NOT NULL,
  Category      VARCHAR(15) NOT NULL,
  SubCategory   VARCHAR(11) NOT NULL,
  Product_Name  VARCHAR(127) NOT NULL,
  Sales         NUMERIC(94) NOT NULL,
  Quantity      INTEGER  NOT NULL,
  Discount      NUMERIC(42) NOT NULL,
  Profit        NUMERIC(2116) NOT NULL
);
