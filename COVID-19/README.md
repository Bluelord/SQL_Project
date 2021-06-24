# README 
 
## COVID-19 Data Exploration

Skills used: </br>
Joins, CTE's, Temp Tables, Windows Functions, </br>
Aggregate Functions, Creating Views, Converting Data Types.

1) #### [**Download COVID-19 Data**](https://ourworldindata.org/covid-cases)</br>
Downloaded File will be .csv File, before importing it to SSMS following changes are done.</br>
- Use the Original downloaded file, Shift the Population Column (col index: 'AS') to Col index: 'E'. 
- Select Col index AA to the end Column and Delete it, then save the file as Covid_Death.xlsx </br>
- Again use the Original, delete 'the col index E:Z', then save the file as Covid_vaccin.xlsx </br>
- Now this two Import to the SSMS Databases, Now it ready to quering.</br>

2) #### **Data Exploration Query**</br>
- Query done on Cases vs different attributes.</br>
- Query done Ordering location on Total Cases, Total Death, Infection % by population,</br>
Death % by population, Cases/million poulation, Death/Million population till (22/06/2021)/</br>
- Now joining both the tables finding vaccination vs population, Vaccination percentage.</br>

3) #### **Visualizations**
- CREATE VIEW (Tables) having all the columns needed for visulization,</br>
Different Grouped tables build while quering in the VIEWS.
- I'm using [Tablue Public](https://public.tableau.com/profile/nilesh.gupta1630#!/), I Don't have access to SQL through tablue,</br>
thus by Exicuting & saving the result of Queries which are needed for Visulization.
- Importing all the extracted files in tableau, Visulizing data and building the Dashboard.</br>