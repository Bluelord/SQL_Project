USE SQLProject

-- Countries with Highest Infection compared to Population
SELECT
	[location],
	[population],
	MAX([total_cases]) AS [Highest Cases],
	MAX([total_cases]/[population]*100) AS [Highest Infection%]

FROM [SQLProject]..[Covid_Death]
WHERE [continent] IS NOT NULL
GROUP BY [location], [population] 
ORDER BY [Highest Cases] DESC, [Highest Infection%] DESC


-- Countries with Highest Infection/Million compared to Population
SELECT
	[location],
	[population],
	MAX([total_cases_per_million]) AS [Highest Cases per mil]

FROM [SQLProject]..[Covid_Death]
WHERE [continent] IS NOT NULL
GROUP BY [location], [population] 
ORDER BY [Highest Cases per mil] DESC


-- Countries with Highest Death Count per Population
SELECT
	[location],
	[population],
	MAX(CAST([total_deaths] AS INT)) AS [Highest Death]

FROM [SQLProject]..[Covid_Death]
WHERE [continent] IS NOT NULL
GROUP BY [location], [population] 
ORDER BY [Highest Death] DESC

-- Countries with Highest Death/mill Count
SELECT
	[location],
	[population],
	MAX(CAST([total_deaths_per_million] AS FLOAT)) AS [Highest Death per mil]

FROM [SQLProject]..[Covid_Death]
WHERE [continent] IS NOT NULL
GROUP BY [location], [population] 
ORDER BY [Highest Death per mil] DESC