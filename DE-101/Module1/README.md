# Module1 - Role and responsibility of Data Analytics
[DataLearn DE-101 Module01](https://github.com/Data-Learn/data-engineering/blob/master/DE-101%20Modules/Module01).

`draw.io` `MS Excel`

## 1. Architecture of Data Analytics solution
I pictured the schema of the Data Analytics solution using [draw.io](https://app.diagrams.net/).
- Source layer - ERP, CRM, databases (Oralce, PsotgreSQL, MongoDB), flat files (txt, csv), spreadsheets (Excel files).
- Staging layer - optional layer which used for data source transformation by ETL tools.
- Storage layer - basically data warehouse for storing structured data coming from OLTP databases, ERP, CRM systems. Also, here is presented Data Lake for storing flat files, unstructure data (video, audio etc.) and any others.
- Business layer - different BI tools, ML and predection analytics system, Reporting system and other ones for connecting, analyzing and representing data from Storage layer.

<img src="https://github.com/souluran/datalearn101/blob/master/DE-101/Module1/image/Simple%20Data%20Analytics%20Architecture.drawio.svg" width=80% height=80%>

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
