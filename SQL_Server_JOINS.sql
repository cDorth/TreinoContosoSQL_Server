-- EXERCICIO 1
SELECT 
		
		A.ProductSubcategoryKey,
		B.ProductName
FROM DimProductSubcategory  AS A
INNER JOIN DimProduct AS B
ON A.ProductSubcategoryKey = B.ProductSubcategoryKey;


SELECT * FROM DimProductSubcategory
SELECT * FROM DimProductcategory
SELECT * FROM DimStore
SELECT *FROM DimProductSubcategory
SELECT *FROM DimProduct

-- EXERCICIO 2
SELECT 
*
FROM DimProductSubcategory  AS A
RIGHT JOIN DimProductCategory AS B
ON A.ProductCategoryKey = B.ProductcategoryKey;

-- EXERCICIO 3

SELECT 
 StoreKey,
 StoreName,
EmployeeCount, 
ContinentName,
RegionCountryName
FROM DimStore AS A
LEFT JOIN DimGeography AS B
ON A.GeographyKey = B.GeographyKey;

--EXERCICIO 4

SELECT
	Productkey,
	ProductName,
	ProductDescription,
	C.productCategoryKey,
	ProductCategoryDescription
FROM DimProduct AS A
LEFT JOIN DimProductSubcategory AS B
	ON A.ProductSubcategoryKey = B.ProductSubcategoryKey
LEFT JOIN DimProductCategory AS C
	ON B.ProductCategoryKey = C.ProductCategorykey


--EXERCICIO 5-A
SELECT TOP(100) *
FROM FactStrategyPlan

--EXERCICIO 5-B
SELECT
	StrategyPlanKey,
	Datekey,
	AccountName,
	Amount
FROM FactStrategyPlan AS A
INNER JOIN DimAccount AS B
	ON A.AccountKey = B.AccountKey

	--EXERCICIO 6

SELECT
	StrategyPlanKey
	DateKey,
	ScenarioName,
	Amount
FROM FactStrategyPlan AS A
INNER JOIN DimScenario AS B
	ON A.ScenarioKey = B.ScenarioKey;

	--EXERCICIO 7 

SELECT 
	ProductKey,
	Productname,
	ProductSubcategoryName
FROM  DimProduct AS A 
RIGHT JOIN   DimProductSubcategory AS B
	ON A.Productsubcategorykey = B.ProductSubcategoryKey
	WHERE A.ProductName IS NULL

	--EXERCICIO 8
	
	SELECT
	DISTINCT A.BrandName,
	B.ChannelName
	FROM DimProduct AS A 
	CROSS JOIN DimChannel AS B
	WHERE BrandName IN('Contoso', 'Litware', 'Fabrikam')

	--EXERCICIO 9

SELECT TOP(1000)
	OnlineSalesKey,
	DateKey,
	PromotionName,
	SalesAmount
FROM FactOnlineSales AS A 
INNER JOIN DimPromotion AS B
	ON A.PromotionKey = B.PromotionKey
WHERE B.PromotionName <> 'No Discount'
ORDER BY DateKey ASC


--Questăo 10:
SELECT
	SalesKey,
	ChannelName,
	StoreName,
	ProductName,
	SalesAmount
FROM FactSales AS A
INNER JOIN DimChannel AS B
	ON 
	A.ChannelKey = B.ChannelKey
INNER JOIN DimStore AS C
	ON
	A.StoreKey = C.StoreKey
INNER JOIN DimProduct AS D
	ON 
	A.ProductKey = D.ProductKey
	ORDER BY SalesAmount DESC