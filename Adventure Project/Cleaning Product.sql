-- Cleansed DIM_Products Table --
USE AdventureWorksDW2019

SELECT
	pro.[ProductKey], 
	pro.[ProductAlternateKey] AS ItemCode,
--	[ProductSubcategoryKey], 
--	[WeightUnitMeasureCode],
--	[SizeUnitMeasureCode], 
	pro.[EnglishProductName] AS [Product Name], 
	prosub.EnglishProductSubcategoryName AS [Sub Category], -- Joined in from Sub Category Table
	procat.EnglishProductCategoryName AS [Product Category], -- Joined in from Category Table
--	[SpanishProductName],
--	[FrenchProductName],
--	[StandardCost],
--	[FinishedGoodsFlag],
	pro.[Color] AS [Product Color],
--	[SafetyStockLevel],
--	[ReorderPoint],
--	[ListPrice],
	[Size] AS [Product Size],
--	[SizeRange]
--	[Weight],
--	[DaysToManufacture],
	pro.[ProductLine] AS [Product Line], 
--	[DealerPrice],
--	[Class],
--	[Style],
	pro.[ModelName] AS [Product Model Name], 
--	[LargePhoto],
	pro.[EnglishDescription] AS [Product Description], 
--	[FrenchDescription],
--	[ChineseDescription],
--	[ArabicDescription],
--	[HebrewDescription],
--	[ThaiDescription],
--	[GermanDescription],
--	[JapaneseDescription],
--	[TurkishDescription],
--	[StartDate], 
--	[EndDate], 
	ISNULL (pro.Status, 'Outdated') AS [Product Status] 
FROM
	[AdventureWorksDW2019].[dbo].[DimProduct] as pro
	LEFT JOIN dbo.DimProductSubcategory AS prosub
	ON prosub.ProductSubcategoryKey = pro.ProductSubcategoryKey 
	LEFT JOIN dbo.DimProductCategory AS procat
	ON prosub.ProductCategoryKey = procat.ProductCategoryKey
ORDER BY 
  pro.ProductKey ASC;