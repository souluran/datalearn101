# Module 3 - Business Intelligence
For more details refer to [DataLearn DE-101 Module03](https://github.com/Data-Learn/data-engineering/tree/master/DE-101%20Modules/Module03).

`Tableau` `Power BI`

Passed training courses:
- [Tableau Essential Training](https://www.linkedin.com/learning/tableau-essential-training-14959992)
- [Creating Interactive Tableau Dashboards](https://www.linkedin.com/learning/creating-interactive-tableau-dashboards/design-dashboards-in-tableau)
- [Power BI Essential Training](https://www.linkedin.com/learning/power-bi-essential-training-2020)

Content:
1. [Tableau Desktop](https://github.com/souluran/datalearn101/tree/dev/DE-101/Module3#1-tableau-desktop) \
1.1. [Connection to Postgres](https://github.com/souluran/datalearn101/tree/dev/DE-101/Module3#11-setup-connection-to-postgres) \
1.2. [Tableau Data Sources](https://github.com/souluran/datalearn101/tree/dev/DE-101/Module3#12-tableau-data-sources)

## 1. Tableau Desktop
### 1.1. Setup connection to Postgres
Configured connection to the same Amazon RDS Postgres DB Instance created in the module 2 [PostgreSQL on Amazon RDS setup](https://github.com/souluran/datalearn101/tree/master/DE-101/Module2#7-postgresql-on-amazon-rds-setup).

<img src="https://github.com/souluran/datalearn101/blob/dev/DE-101/Module3/image/tableau/tableau_data-source_amazon-rds-postgres.PNG" width=30% height=30%>

Once connection was established I created custom query for extracting data from DB in the relevant format. Used the similar [dashboard_query](https://github.com/souluran/datalearn101/blob/master/DE-101/Module2/dashboard_query.sql).

<img src="https://github.com/souluran/datalearn101/blob/dev/DE-101/Module3/image/tableau/tableau_data-source_custom-query.PNG" width=70% height=70%>

### 1.2. Tableau Data Sources
A Tableau data source is the link between your source data and Tableau. It is essentially the sum of your data (either as a live connection or an extract), the connection information, the names of tables or sheets containing data, and the customizations that you make on top of data to work with it in Tableau.
Tableau can connect to various type of data sources such as databases, applications, file systems and etc. ([exampleconnections_overview](https://help.tableau.com/current/pro/desktop/en-us/exampleconnections_overview.htm)).

### 1.3. Data Live vs Data Extract

<img src="https://github.com/souluran/datalearn101/blob/dev/DE-101/Module3/image/tableau/tableau_data-source_extract-connection.PNG" width=30% height=30%>


<img src="https://github.com/souluran/datalearn101/blob/dev/DE-101/Module3/image/tableau/profit-sale-switcher_in-action.gif" width=70% height=70%>

<img src="https://github.com/souluran/datalearn101/blob/dev/DE-101/Module3/image/tableau/top-items_in_action.gif" width=50% height=50%>
