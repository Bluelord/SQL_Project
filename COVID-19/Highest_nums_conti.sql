USE SQLProject

-- Continent with Highest Infection compared to Population
SELECT
	[location],
	[population],
	MAX([total_cases]) AS [Highest Cases],
	MAX([total_cases]/[population]*100) AS [Highest Infection%]

FROM [SQLProject]..[Covid_Death]
WHERE [continent] IS NULL
GROUP BY [location], [population] 
ORDER BY [Highest Cases] DESC, [Highest Infection%] DESC


-- Continent with Highest Infection/Million compared to Population
SELECT
	[location],
	[population],
	MAX([total_cases_per_million]) AS [Highest Cases per mil]

FROM [SQLProject]..[Covid_Death]
WHERE [continent] IS NULL
GROUP BY [location], [population] 
ORDER BY [Highest Cases per mil] DESC


-- Continent with Highest Death Count per Population
SELECT
	[location],
	[population],
	MAX(CAST([total_deaths] AS INT)) AS [Highest Death]

FROM [SQLProject]..[Covid_Death]
WHERE [continent] IS NULL
GROUP BY [location], [population] 
ORDER BY [Highest Death] DESC

-- Countries with Highest Death/mill Count
SELECT
	[location],
	[population],
	MAX(CAST([total_deaths_per_million] AS FLOAT)) AS [Highest Death per mil]

FROM [SQLProject]..[Covid_Death]
WHERE [continent] IS NULL
GROUP BY [location], [population] 
ORDER BY [Highest Death per mil] DESC

-- GLOBAL NUMBERS

SELECT 
	SUM([new_cases]) AS [total cases],
	SUM(CAST([new_deaths] AS INT)) AS [total deaths],
	SUM(CAST([new_deaths] AS INT))/SUM(New_Cases)*100 AS [Death%]

FROM [SQLProject]..[Covid_Death]
WHERE [continent] IS NOT NULL