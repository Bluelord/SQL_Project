USE SQLProject

-- Selecting Specific columns from the Data 

SELECT
--	[iso_code],
--	[continent],
	[location],
	[date],
	[population],
	[total_cases],
	[new_cases],
--	[new_cases_smoothed],
	[total_deaths],
	[new_deaths]
--	[new_deaths_smoothed],
--	[total_cases_per_million],
--	[new_cases_per_million],
--	[new_cases_smoothed_per_million],
--	[total_deaths_per_million],
--	[new_deaths_per_million],
--	[new_deaths_smoothed_per_million]
--	[reproduction_rate],
--	[icu_patients],
--	[icu_patients_per_million],
--	[hosp_patients],
--	[hosp_patients_per_million],
--	[weekly_icu_admissions],
--	[weekly_icu_admissions_per_million],
--	[weekly_hosp_admissions],
--	[weekly_hosp_admissions_per_million]

FROM [SQLProject]..[Covid_Death]
WHERE continent IS NOT NULL 
order by 1,2


-- Total Cases vs Total Deaths
SELECT
	[location],
	[date],
	[total_cases],
	[total_deaths],
	[total_deaths]/[total_cases]*100 AS [Death%]

FROM [SQLProject]..[Covid_Death]
WHERE continent IS NOT NULL 
order by 1,2

---- Total Cases vs Total Deaths in perticular Countary
--SELECT
--	[location],
--	[date],
--	[total_cases],
--	[total_deaths],
--	[total_deaths]/[total_cases]*100 AS [Death%]

--FROM [SQLProject]..[Covid_Death]
--WHERE location LIKE 'India'
--order by 1,2


-- Total Cases vs Population
SELECT
	[location],
	[date],
	[population],
	[total_cases],
	[total_deaths],
	[total_cases]/[population]*100 AS [Infected%]

FROM [SQLProject]..[Covid_Death]
WHERE continent IS NOT NULL 
order by 1,2

---- Total Cases vs Population in Perticular Countary
--SELECT
--	[location],
--	[date],
--	[population],
--	[total_cases],
--	[total_deaths],
--	[total_cases]/[population]*100 AS [Infected%]

--FROM [SQLProject]..[Covid_Death]
--WHERE location LIKE 'India'
--order by 1,2