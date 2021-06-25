/*
Queries used for Tableau Project
*/
USE SQLProject

-- 1. 
SELECT
	SUM([new_cases]) AS [Total Cases],
	SUM(CAST([new_deaths] AS INT)) AS [Total Deaths],
	SUM(CAST([new_deaths] AS INT))/SUM([New_Cases])*100 AS [Death Percentage]

FROM [SQLProject]..[Covid_Death]
WHERE [continent] IS NOT NULL
ORDER BY 1,2

-- 2. 
SELECT
	[location],
	SUM(CAST([new_deaths] AS INT)) AS [Total Deaths]

FROM [SQLProject]..[Covid_Death]
WHERE [continent] IS NULL
	AND [location] NOT IN ('World', 'European Union', 'International')
GROUP BY [location]
ORDER BY [Total Deaths] DESC


-- 3.
SELECT
	[location],
	[population],
	MAX([total_cases]) AS [Highest Count],
	MAX([total_cases]/[population]*100) AS [Infection Percentage]

FROM [SQLProject]..[Covid_Death]
WHERE [continent] IS NOT NULL
GROUP BY [location], [population] 
ORDER BY [Infection Percentage] DESC


-- 4.
SELECT
	[location],
	[population],
	[date],
	MAX([total_cases]) AS [Highest Count],
	MAX([total_cases]/[population]*100) AS [Infection Percentage]

FROM [SQLProject]..[Covid_Death]
WHERE [continent] IS NOT NULL
GROUP BY [location], [population], [date]
ORDER BY [Infection Percentage] DESC


-- 5
SELECT 
	[continent],
	[location],
	[date],
	[population],
	[new_cases],
	[total_cases],
	[new_deaths],
	[total_deaths]

FROM [SQLProject]..[Covid_Death]
WHERE [continent] IS NOT NULL
ORDER BY [continent], [location]