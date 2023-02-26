# Module1 - Role and responsibility of Data Analytics
[DataLearn DE-101 Module01](https://github.com/Data-Learn/data-engineering/blob/master/DE-101%20Modules/Module01).

`draw.io` `MS Excel`

## 1. Architecture of Data Analytics solution
I pictured the schema of the Data Analytics solution using [draw.io](https://app.diagrams.net/).
- Source layer - here is presented all data sources required for business to get insights, build reporting and analytics, and make decisions. It can be sources such as Operational systems (ERP, CRM etc.), databases (Oracle, PostgreSQL, MongoDB etc.), flat files (txt, CSV), spreadsheets (Excel files), and semi-structured data (XML, JSON, parquet etc.).
- Source data is transferred to Staging Layer by ETL or directly to DWH or Data Lake by ELT.
- Staging layer -usually serve for temporary storing data, the data transform and validate before uploading to persistent storage (DWH). In most modern architecrure this layer is optional.
- Storage layer - persistance data storage called Data Warehouse, basically it's a relational database (on-premis or cloud). DWH is mostly used for structured data, like transactions. Also, DWH can includes or consists of Data Marts, which provided the data for certain business departments. Additionally, as you might know that data sources can be semi-structured or flat files, so for this needs is Data Lake. The Data Lake is usually cost-effective and fast-accessing storage for storing data in raw format.
- Business layer - is for data represntation, visualization, data analytics, prediction and many more. On this Layer is placed different BI tools, ML and prediction systems, Reporting tools, data mining tools and others. All these tools have access to DWH, Data Marts, and Data Lakes to query data.

<img src="https://github.com/souluran/datalearn101/blob/master/DE-101/Module1/image/data-analytics-architecture.drawio.svg" width=80% height=80%>

## 2. Analytics using MS Excel
I designed [Dashboard](https://github.com/souluran/datalearn101/blob/master/DE-101/Module1/Superstore%20-%20Dashboard.xlsx) for Superstore dataset in MS Excel.
The dashboard consists of several charts and metrics which reflect Sales by various dimensions, including sales change dynamics by time.

Metrics:
- Total sales
- Total Profit
- Profit Ratio
- Avg. Discount
- Number of Orders

Charts:
- Sales by Region
- Sales by Segment
- Sales by Shipping
- Sales by Category
- Sales by Sub-Category
- Sales by States
- Sales/Profit Dynamic by month/year

<img src="https://github.com/souluran/datalearn101/blob/master/DE-101/Module1/image/excel-dashboard.PNG" width=80% height=80%>
