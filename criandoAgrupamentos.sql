USE ContosoRetailDW
--EXERCICIO 1
SELECT channelKey AS 'CHAVE DO CANAL',
SUM(SalesQuantity) AS 'QUANTIDADE VENDIDA'
FROM FactSales 
GROUP BY channelKey

SELECT StoreKey AS 'CHAVE DA LOJA',
SUM(SalesQuantity) AS 'QUANTIDADE VENDIDA',
SUM(ReturnQuantity) AS 'QUANTIDADE RETORNADA'
FROM FactSales 
GROUP BY StoreKey

SELECT channelKey AS 'CHAVE DO CANAL',
SUM(SalesQuantity) AS 'QUANTIDADE VENDIDA'
FROM FactSales 
WHERE DateKey BETWEEN '01/01/2007' AND '31/12/2007'
GROUP BY channelKey


SELECT *
FROM FactSales
--EXERCICIO 2
--A
SELECT ProductKey AS 'CHAVE DO PRODUTO',
SUM(SalesAmount) AS 'TOTAL VENDIDO'
FROM FactSales 
GROUP BY ProductKey
HAVING SUM(SalesAmount) >= 5000000
ORDER BY SUM(SalesAmount) DESC;

--B
SELECT TOP(10)
ProductKey AS 'CHAVE DO PRODUTO',
SUM(SalesAmount) AS 'TOTAL VENDIDO'
FROM FactSales 
GROUP BY ProductKey
HAVING SUM(SalesAmount) >= 5000000
ORDER BY SUM(SalesAmount) DESC;

--EXERCICIO 3

SELECT * FROM FactOnlineSales

SELECT TOP(1)
CustomerKey AS 'CHAVE DO CLIENTE',
SUM(SalesQuantity) AS 'QUANTIDADE COMPRADA'
FROM FactOnlineSales
GROUP BY CustomerKey
ORDER BY COUNT(SalesQuantity) DESC;

SELECT TOP(3)
ProductKey AS 'CHAVE DO PRODUTO',
CustomerKey AS 'CHAVE DO CLIENTE',
SUM(SalesQuantity) AS 'QUANTIDADE COMPRADA'
FROM FactOnlineSales
WHERE CustomerKey = 19037
GROUP BY ProductKey,CustomerKey
ORDER BY COUNT(SalesQuantity) DESC;

-- EXERCICIO 4


SELECT BrandName AS 'NOME DA MARCA', 
COUNT(ProductName) AS 'QUANTIDADE DE PRODUTO'
FROM DimProduct
GROUP BY BrandName
ORDER BY COUNT(ProductName) DESC;


SELECT ClassName AS CLASSE,
AVG(UnitPrice) AS 'MEDIA PREÇO UNITARIO'
FROM DimProduct
GROUP BY ClassName;

SELECT ColorName,
SUM(Weight)
FROM DimProduct
GROUP BY ColorName
ORDER BY SUM(Weight) DESC;

SELECT * FROM DimProduct

--EXERCICIO 5

SELECT * FROM DimProduct

SELECT StockTypeName,
SUM(Weight)
FROM DimProduct
WHERE BrandName = 'Contoso'
GROUP BY StockTypeName
ORDER BY SUM(Weight) DESC;

--EXERCICIO 6

SELECT * FROM DimProduct

SELECT BrandName,
COUNT(DISTINCT ColorName)
FROM DimProduct
GROUP BY BrandName
ORDER BY COUNT(DISTINCT ColorName) DESC;

--EXERCICIO 7

SELECT * FROM DimCustomer

SELECT 
Gender AS 'GENERO',
AVG(YearlyIncome) AS 'MEDIA SALARIAL',
COUNT(CustomerKey) AS 'QUANTIDADE DE FUNCIONARIO'
FROM DimCustomer
WHERE Gender IS NOT NULL
GROUP BY Gender


--EXERCICIO 8

SELECT 
Education ,
COUNT(CustomerKey),
AVG(YearlyIncome) AS 'MEDIA SALARIAL'
FROM DimCustomer
WHERE Education IS NOT NULL
GROUP BY Education
ORDER BY COUNT(CustomerKey) DESC;

--EXERCICIO 9
SELECT * FROM DimCustomer

SELECT 
DepartmentName ,
COUNT(EmployeeKey) AS 'NUMERO DE FUNCIONARIOS'
FROM DimEmployee
WHERE EndDate IS NULL
GROUP BY DepartmentName
ORDER BY COUNT(EmployeeKey) DESC;

--EXERCICIO 10
SELECT * FROM DimEmployee

SELECT 
Title ,
SUM(VacationHours)
FROM DimEmployee
WHERE EndDate IS NULL AND
Gender ='F' AND
DepartmentName IN('Production','Marketing','Engineering','Finance') AND
HireDate LIKE('1999%') OR HireDate LIKE('2000%')
GROUP BY Title;

--OU

SELECT 
Title ,
SUM(VacationHours)
FROM DimEmployee
WHERE EndDate IS NULL AND
Gender ='F' AND
DepartmentName IN('Production','Marketing','Engineering','Finance') AND
HireDate BETWEEN ('1999/01/01') AND ('2000/12/31')
GROUP BY Title;

--O código 2 é mais preciso para filtrar os dados dentro do intervalo de 1999 e 2000, pois ele exclui qualquer data fora desse período.
--O código 1 pode incluir datas de outros anos que começam com "1999" ou "2000", o que pode resultar em um conjunto de dados diferente.
--codigo 1 aceita valores de froma errada, banco armazena sem as '/', entao o que seria 20/10/2010, ele vê como 20102010 e se em alguma data deste tipo tiver um dos valores filtrados ele conta