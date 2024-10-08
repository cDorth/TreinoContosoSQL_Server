USE ContosoRetailDW;

--WHERE E LIKE
SELECT * 
FROM DimProduct 
WHERE ProductName
LIKE '%_P3%';

-- WHERE

SELECT * FROM DimProduct
WHERE BrandName = 'Contoso' AND ColorName = 'Silver';

SELECT * FROM DimProduct
WHERE ColorName = 'Blue' OR ColorName = 'Silver' OR ColorName = 'Red';

SELECT * FROM DimProduct
WHERE NOT Size = ''; 
--TIRAR VALOR NULO? GAMBIARRA

SELECT * FROM DimProduct
WHERE ColorName IN('Blue','Silver','Red');

SELECT TOP(1000) * FROM FactSales 
WHERE SalesQuantity BETWEEN 10 AND 100;

SELECT  *
FROM DimCustomer
WHERE MiddleName  IS NOT NULL;

SELECT  *
FROM DimCustomer
WHERE MiddleName  IS NULL;

-- EXERCICIOS PARA FIXAÇÃO

-- EXERCICIOS 1
SELECT TOP(100) SalesAmount 
FROM FactSales
ORDER BY SalesAmount DESC;
-- EXERCICIOS 2
--SELECT TOP(10) * FROM DimProduct ORDER BY UnitPrice DESC,ProductKey ASC,Weight DESC;
SELECT TOP(10) *
FROM DimProduct
ORDER BY UnitPrice DESC,
AvailableForSaleDate ASC,
Weight DESC;
-- EXERCICIOS 3
SELECT ProductName AS 'NOME',
Weight AS 'PESO' 
FROM DimProduct 
WHERE Weight > 219
ORDER BY Weight DESC;

-- EXERCICIOS 4
	SELECT 
StoreName AS 'NOME DA LOJA',
OpenDate AS 'DATA DE ABERTURA',
EmployeeCount AS 'NUMERO DE FUNCIONARIOS'
	FROM 
DimStore 
	WHERE Status='On' AND StoreType = 'Store';

-- EXERCICIOS 4 CONSULTA
SELECT *
FROM DimStore ;


-- EXERCICIOS 5
	SELECT 
ProductKey,
ProductName,
AvailableForSaleDate
	FROM 
DimProduct 
	WHERE 
BrandName = 'Litware' AND  AvailableForSaleDate = '15/03/2009';
-- EXERCICIOS 6
	SELECT 
StoreName AS 'NOME DA LOJA',
OpenDate AS 'DATA DE ABERTURA',
EmployeeCount AS 'NUMERO DE FUNCIONARIOS'
	FROM 
DimStore 
WHERE CloseDate IS NOT NULL AND StoreType = 'Store';

-- EXERCICIOS 7
SELECT StoreName AS 'NOME DA LOJA',
EmployeeCount AS 'NUMERO DE FUNCIONARIOS'
FROM DimStore 
WHERE EmployeeCount BETWEEN 1 AND 20;

SELECT StoreName AS 'NOME DA LOJA',
EmployeeCount AS 'NUMERO DE FUNCIONARIOS'
FROM DimStore 
WHERE EmployeeCount BETWEEN 21 AND 50;

SELECT StoreName AS 'NOME DA LOJA',
EmployeeCount AS 'NUMERO DE FUNCIONARIOS'
FROM DimStore 
WHERE EmployeeCount >= 51;

-- EXERCICIOS 8
SELECT ProductKey,ProductName,UnitPrice 
FROM DimProduct 
WHERE ProductDescription
LIKE '%LCD%';

-- EXERCICIOS 9
SELECT * 
FROM DimProduct
WHERE ColorName IN('Green','Orange','Black','Silver','Pink')
AND 
BrandName IN('Contoso','Litware','Fabrikam');


-- EXERCICIOS 10
SELECT * 
FROM
DimProduct
WHERE ColorName = 'Silver'
AND 
BrandName = 'Contoso'
AND 
UnitPrice BETWEEN 10 AND 30
ORDER BY UnitPrice DESC;