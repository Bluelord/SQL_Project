-- Creating View for Visualization

CREATE VIEW [BI View 01]
AS	(SELECT 
		[cod].[continent],
		[cod].[location],
		[cod].[date],
		[cod].[population],
	--	[cov].[new_vaccinations],
		[cov].[total_vaccinations]

	FROM [SQLProject]..[Covid_Death] AS [cod]
	JOIN [SQLProject]..[Covid_Vacccin] AS [cov]
		On [cod].[location] = [cov].[location]
		AND [cod].[date] = [cov].[date]
	WHERE [cod].[continent] IS NOT NULL
)


---


--CREATE VIEW [BI View 02]
--AS	(SELECT 
--		[cod].[continent],
--		[cod].[location],
--		[cod].[date],
--		[cod].[population],
--		[cov].[new_vaccinations],
--		SUM(CONVERT(int,[cov].[new_vaccinations]))
--			OVER (PARTITION BY [cod].[location]
--			ORDER BY [cod].[location], [cod].[Date]
--			) AS [Rolling Vaccination]
--	--	([Rolling Vaccination]/[population])*100 This can't be done without temp Table

--	FROM [SQLProject]..[Covid_Death] AS [cod]
--	JOIN [SQLProject]..[Covid_Vacccin] AS [cov]
--		On [cod].[location] = [cov].[location]
--		AND [cod].[date] = [cov].[date]
--	WHERE [cod].[continent] IS NOT NULL) 