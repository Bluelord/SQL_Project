USE SQLProject

-- Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine
--SELECT 
--	[cod].[continent],
--	[cod].[location],
--	[cod].[date],
--	[cod].[population],
----	[cov].[new_vaccinations],
--	[cov].[total_vaccinations]

--FROM [SQLProject]..[Covid_Death] AS [cod]
--JOIN [SQLProject]..[Covid_Vacccin] AS [cov]
--	On [cod].[location] = [cov].[location]
--	AND [cod].[date] = [cov].[date]
--WHERE [cod].[continent] IS NOT NULL 
--ORDER BY [cod].[location], [cod].[date]

-- Using new vaccination for getting total vaccination
SELECT 
	[cod].[continent],
	[cod].[location],
	[cod].[date],
	[cod].[population],
	[cov].[new_vaccinations],
	SUM(CONVERT(int,[cov].[new_vaccinations]))
		OVER (PARTITION BY [cod].[location]
		ORDER BY [cod].[location], [cod].[Date]
		) AS [Rolling Vaccination]
--	([Rolling Vaccination]/[population])*100 This can't be done without temp Table

FROM [SQLProject]..[Covid_Death] AS [cod]
JOIN [SQLProject]..[Covid_Vacccin] AS [cov]
	On [cod].[location] = [cov].[location]
	AND [cod].[date] = [cov].[date]
WHERE [cod].[continent] IS NOT NULL 
ORDER BY [cod].[location], [cod].[date]


-- Using CTE to perform Calculation on Partition By in previous query
WITH
	[popu Vac] ([Continent], [Location], [Date], [Population], [New_Vaccinations], [Rolling Vaccination])
AS (SELECT 
		[cod].[continent],
		[cod].[location],
		[cod].[date],
		[cod].[population],
		[cov].[new_vaccinations],
		SUM(CONVERT(int,[cov].[new_vaccinations]))
			OVER (PARTITION BY [cod].[location]
			ORDER BY [cod].[location], [cod].[Date]
			) AS [Rolling Vaccination]

	FROM [SQLProject]..[Covid_Death] AS [cod]
	JOIN [SQLProject]..[Covid_Vacccin] AS [cov]
		On [cod].[location] = [cov].[location]
		AND [cod].[date] = [cov].[date]
	WHERE [cod].[continent] IS NOT NULL 
--	ORDER BY [cod].[location], [cod].[date]
	)
SELECT
	*,
	[Rolling Vaccination]/[Population]*100 AS [Vaccination%]
FROM [popu Vac]
ORDER BY [location], [date]


-- Using Temp Table to perform Calculation on Partition By in previous query
DROP TABLE IF EXISTS #PopulationVaccinated
CREATE TABLE #PopulationVaccinated
	([Continent] nvarchar(255),
	[Location] nvarchar(255),
	[Date] datetime,
	[Population] numeric,
	[New_vaccinations] numeric,
	[Rolling Vaccination] numeric
	)
INSERT INTO #PopulationVaccinated
	SELECT 
		[cod].[continent],
		[cod].[location],
		[cod].[date],
		[cod].[population],
		[cov].[new_vaccinations],
		SUM(CONVERT(int,[cov].[new_vaccinations]))
			OVER (PARTITION BY [cod].[location]
			ORDER BY [cod].[location], [cod].[Date]
			) AS [Rolling Vaccination]

	FROM [SQLProject]..[Covid_Death] AS [cod]
	JOIN [SQLProject]..[Covid_Vacccin] AS [cov]
		On [cod].[location] = [cov].[location]
		AND [cod].[date] = [cov].[date]
	WHERE [cod].[continent] IS NOT NULL 
--	ORDER BY [cod].[location], [cod].[date]

SELECT
	*,
	[Rolling Vaccination]/[Population]*100 AS [Vaccination%]
FROM #PopulationVaccinated
ORDER BY [location], [date]
	