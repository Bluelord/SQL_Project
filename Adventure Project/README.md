# README

## Adventure Work Dataset

[**Download Adventure Works data**](https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms)</br>
Download backup files, use the links to download the appropriate sample databases</br>

    OLTP data is for most typical online transaction processing workloads.
    Data Warehouse (DW) data is for data warehousing workloads.
    Lightweight (LT) data is a lightweight and pared down version of the OLTP sample.
Go with the DW and LT files and doenload it, we will be working on DW file.</br>
-   Move the .bak file to your SQL Server backup location.</br>
-   Open SQL Server Management Studio (SSMS) and connect to your SQL Server in.</br>
-   Right-click Databases in Object Explorer > Restore Database.</br>
-   Update SQL Data by Creating new query then Copy and Paste the [Update SQL Data Script](https://github.com/techtalkcorner/SampleDemoFiles/blob/master/Database/AdventureWorks/Update_AdventureWorksDW_Data.sql)</br>
-   Execute it,  then the data will be updatated

Now We have the Database set up for the project.

Sappost the Business Request is provided through E-Mail:</br>

    Rahul  - Sales Manager:
    Hi Nilesh!
    I hope you are doing well. Here is hte following request for you,
    We need to improve our internet sales reports and want to move from our static reports to visual dashboards.
    Essentially, we want to focus it on how much we have sold of what products, to which clients and how it has been over time.
    Seeing as each sales person works on different products and customers it would be beneficial to be able to filter them also.
    We measure our numbers against budget so I added that in a spreadsheet so we can compare our values against performance. 
    The budget is for 2021 and we usually look 2 years back in time when we do analysis of sales.
    Let me know if you need anything else!
    Regards,


Now overviewing this Business Demand:
-	Request is made by: Rahul – Sales Manager
-	Change may occure after completing the Request: Visual dashboards & improved Sales reporting or follow up.
-	Necessary Systems: Power BI, CRM System
-	Other Relevant Info: Budgets have been delivered in Excel for 2021

User Stories:
| No #  | As a (role) | I want (request) | So that I (user value)  | Acceptance Criteria |
| ----- | ----------- | ---------------  |  ---------------------  | ------------------  |
| 1 | Sales Manager | To get a dashboard overview of internet sales | Can follow better which customers and products sells the best | A Dashboard which updates data once a day
| 2 |	Sales Representative  | To get a overview of Internet Sales per Customers |	Can follow up my customers that buys the most and who we can sell ore to  | A Dashboard which allows me to filter data for each customer
| 3 |	Sales Representative  |	To get a overview of Internet Sales per Products  |	Can follow up my Products that sells the most |	A Dashboard which allows me to filter data for each Product
| 4 |	Sales Manager |	A dashboard overview of internet sales	| Follow sales over time against budget | A Dashboard with graphs and KPIs comparing against budget.

AS we have the data so we don't have to look for it at different sector of the company.</br>
After Summarizing the request, Using what we have, considering Internet Sales Fact table and relared dimension tables</br>
following are the tables we may be looking at:</br>
Customer/Clints, Demographics, Product, Category/Subcategory, Calender etc. </br>
Then select required columns for visualization and Analysis </br>
- Formated the Calender/Date Table for last 2 years for the dashboard with necessary Columns & Extracted the Result in CSV.</br>
- Formated Customer detailes, from two tables Customer and Demographic swith necessary Columns & Extracted the Result in CSV.</br>
- Formated Product details, from prducts, Category & Subcategory tabels with necessary Columns & Extracted the Result in CSV.</br>
- Formating Fact Internet Sale Tables, according to the problem statement with necessary Columns & Extracted the Result in CSV.</br>
- Made a Sales Budgets xlsx file.</br>

Next,</br>
Importing the extracted files to Visualization Tool, (Tableau Public)</br>
Joining the Excel files for connections, visualizing and building a Dashboards of requrements.</br>
The [Tableau File](https://github.com/Bluelord/SQL_Practice/blob/1408b6ea76ead4b6ff0abb92afdce0a2cf28bb4d/SQL%20Projects/Adventure_Work/Adventure%20Work%201.twbx) uploaded in the repository, if you like to visit [Tableau Public Profile](https://public.tableau.com/profile/nilesh.gupta1630#!/).

### Insights

- **Sales Overview Dashboard**:
    - Sales are linearly increasing in last 2 year, thus we can increase our Budget for next year.</br>
    - Shows Top 10 Sales by Customer & by Product. </br>
    - Monthly insight can be viewed by using the Month Filter.</br>

![](https://github.com/Bluelord/SQL_Project/blob/b892068afd8a65a270243fd7417275088c6a3b32/Adventure%20Project/DB1.JPG)

- **Customer Overview Dashboard**:
    - Shows Detailed sales by Customer, it shows top 1000 Customer as top rated customer.</br>
    - The sales for the last 2 years has least Gender Inequality on product sales.</br>
    - The customer age between 40-50 has most of the contribution to the sales.</br>
    - Similarly customer who has Income of around $40,000 & $70,000 Spend more on our products.</br>

![](https://github.com/Bluelord/SQL_Project/blob/b892068afd8a65a270243fd7417275088c6a3b32/Adventure%20Project/DB2.JPG)

- Product Overview Dashboard:
    - Sales of Bikes are the Highest.</br>
    - It shows the Top 10 Sub Category product sales exluding the Bike Category.</br>
    - We also insight of product sales by its Size.</br>
    - Shows the detailed sales number by Product Name & by Subcategory.</br>

![](https://github.com/Bluelord/SQL_Project/blob/b892068afd8a65a270243fd7417275088c6a3b32/Adventure%20Project/DB3.JPG)
