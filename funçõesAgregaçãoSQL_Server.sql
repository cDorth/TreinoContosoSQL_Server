
-- CONTA QUANTIDADE DE LINHAS 
SELECT 
COUNT(CustomerKey) AS 'QTD. MULHERES'
FROM DimCustomer
WHERE Gender = 'F';

-- SOMA VALORES
SELECT 
SUM(SalesQuantity) AS 'TOTAL VENDIDO'
FROM FactSales
WHERE UnitPrice >= 100;

-- TIRA MEDIA DOS VALORES
SELECT 
AVG(SalesQuantity) AS 'TOTAL VENDIDO'
FROM FactSales
WHERE UnitPrice >= 100;

-- RETORNA O MENOR VALOR
SELECT 
MIN(SalesQuantity) AS 'MIN VENDIDO'
FROM FactSales;

-- RETORNA O MAIOR VALOR
SELECT 
MAX(SalesQuantity) AS 'MAX VENDIDO'
FROM FactSales;

-- EXERCICIOS

--EXERCICIO 1
SELECT 
COUNT(SalesQuantity) AS 'QUANTIDADE VENDIDA'
FROM FactSales;
SELECT 
COUNT(ReturnQuantity) AS 'RETORNO POR QUANTIDADE'
FROM FactSales;
--EXERCICIO 2
SELECT
AVG(YearlyIncome) AS 'MEDIA SALARIAL'
FROM DimCustomer
WHERE Occupation = 'Professional';
--EXERCICIO 3
SELECT TOP(1)
StoreName,
EmployeeCount
FROM DimStore
ORDER BY EmployeeCount DESC;

SELECT TOP(1)
StoreName,
EmployeeCount
FROM DimStore 
WHERE EmployeeCount IS NOT NULL
ORDER BY EmployeeCount ASC;
--EXERCICIO 4
SELECT 
COUNT(EmployeeKey) AS 'QTD. MULHERES'
FROM DimEmployee
WHERE Gender = 'F' AND EndDate IS NULL;

SELECT TOP(1)
FirstName AS 'NOME',EmailAddress AS 'E-MAIL',HireDate AS 'DATA DE CONTRATAÇÃO'
FROM DimEmployee
WHERE Gender = 'F' AND EndDate IS NULL
ORDER BY HireDate ASC;

SELECT 
COUNT(EmployeeKey) AS 'QTD. HOMENS'
FROM DimEmployee
WHERE Gender = 'M' AND EndDate IS NULL;

SELECT TOP(1)
FirstName AS 'NOME',EmailAddress AS 'E-MAIL',HireDate AS 'DATA DE CONTRATAÇÃO'
FROM DimEmployee
WHERE Gender = 'M' AND EndDate IS NULL
ORDER BY HireDate ASC;

--EXERCICIO 5
SELECT 
COUNT(DISTINCT ColorName) AS 'CORES DIFERENTES',
COUNT(DISTINCT BrandName) AS 'MARCAR DIFERENTES',
COUNT(DISTINCT ClassName) AS 'CLASSES DIFERENTES'

FROM DimProduct;


