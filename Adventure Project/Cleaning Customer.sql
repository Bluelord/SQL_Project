-- Cleansed DIM_Customers Table --
USE AdventureWorksDW2019

SELECT
	customer.customerkey AS CustomerKey,
--	[GeographyKey],
--	[CustomerAlternateKey],
--	[Title],
	customer.firstname AS [First Name],
--	[MiddleName],
	customer.lastname AS [Last Name],
--	Combined First and Last Name
	customer.firstname + ' ' + lastname AS [Full Name],
--	[NameStyle],
--	[BirthDate],
	YEAR(
		GETDATE()
	) - YEAR(BirthDate) AS Age,
--	[MaritalStatus],
--	[Suffix],
	CASE
		customer.gender
		WHEN 'M' THEN 'Male'
		WHEN 'F' THEN 'Female'
	END AS Gender,
--	[EmailAddress],
	customer.YearlyIncome,
--	[TotalChildren],
--	[NumberChildrenAtHome],
--	[EnglishEducation],
--	[SpanishEducation],
--	[FrenchEducation],
--	[EnglishOccupation],
--	[SpanishOccupation],
--	[FrenchOccupation],
--	[HouseOwnerFlag],
--	[NumberCarsOwned],
--	[AddressLine1],
--	[AddressLine2],
--	[Phone],
	customer.datefirstpurchase AS DateFirstPurchase, 
--	[CommuteDistance],
	demo.city AS [Customer City]

-- Joined in Customer City from Geography Table
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] as customer
  LEFT JOIN dbo.dimgeography AS demo
  ON demo.geographykey = customer.geographykey

-- Ordered List by CustomerKey
ORDER BY 
  CustomerKey ASC 