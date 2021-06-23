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
